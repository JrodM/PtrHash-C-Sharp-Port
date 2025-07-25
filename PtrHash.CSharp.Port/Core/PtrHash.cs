using System;
using System.Buffers;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics.X86;
using System.Threading;
using System.Threading.Tasks;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.Storage;
using PtrHash.CSharp.Port.RNG;
using PtrHash.CSharp.Port.Computation;
using PtrHash.CSharp.Port.Construction;
using PtrHash.CSharp.Port.BucketFunctions;

namespace PtrHash.CSharp.Port.Core
{
    /// <summary>
    /// PtrHash: Minimal Perfect Hashing at RAM Throughput
    /// 
    /// Implements the PtrHash algorithm from Ragnar Groot Koerkamp (ETH Zurich).
    /// Maps n distinct keys bijectively to {0,...,n-1} using hash-evict construction
    /// with fixed-width 8-bit pilots and cuckoo-style eviction for collision resolution.
    /// 
    /// Provides O(1) query time with streaming support for high throughput.
    /// 
    /// Current limitations compared to full paper implementation:
    /// - No external-memory construction (sharding for >10^10 keys)
    /// - No CacheLineEF remapping compression
    /// </summary>
    /// <typeparam name="TKey">Type of keys</typeparam>
    /// <typeparam name="THasher">Hash function implementation</typeparam>
    /// <typeparam name="TBucketFunction">Bucket function implementation</typeparam>
    /// <typeparam name="TRemappingStorage">Remapping storage type for minimal mode</typeparam>
    public sealed unsafe class PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage> : IPtrHash<TKey>, IDisposable
        where THasher : struct, IKeyHasher<TKey>
        where TBucketFunction : struct, IBucketFunction
        where TRemappingStorage : struct, IRemappingStorage<TRemappingStorage>
    {

        // Debug feature flags - set to false for production
        public static bool DEBUG_CONSTRUCTION = false;

        private static void DebugConstruction(string message)
        {
            if (DEBUG_CONSTRUCTION)
                Console.WriteLine(message);
        }

        // Cap parallelism to prevent thread explosion
        private static readonly int MaxParallelism = Environment.ProcessorCount;

        private TBucketFunction _bucketFunction;

        private TRemappingStorage _remapStorage;

        private byte* _pilots;

        // Multi-part support fields
        private readonly nuint _parts;
        private readonly nuint _slotsPerPart;
        private readonly nuint _slotsTotal;
        private readonly nuint _bucketsPerPart;
        private readonly nuint _bucketsTotal;

        // Pre-computed reduction structures (rem_* fields)
        private readonly FastReduce _remParts; // rem_parts: Rp::new(parts)
        private readonly FastReduce _remBuckets; // rem_buckets: Rb::new(buckets_per_part)
        private readonly FastReduce _remBucketsTotal; // rem_buckets_total: Rb::new(buckets_total)
        private readonly FM32 _remSlots; // rem_slots: RemSlots::new(slots_per_part.max(1))

        private readonly nuint _numKeys;
        private readonly bool _minimal;
        private readonly bool _isSinglePart;
        private readonly double _bitsPerKey;
        private readonly RemappingStorageType _storageType;
        private ulong _seed;

        /// <summary>
        /// Construct a PtrHash from a collection of keys
        /// </summary>
        public PtrHash(ReadOnlySpan<TKey> keys, PtrHashParams parameters)
        {
            if (keys.Length == 0)
                throw new ArgumentException("Keys collection cannot be empty", nameof(keys));

            try
            {
                _numKeys = (nuint)keys.Length;
                _minimal = parameters.Minimal;
                _isSinglePart = parameters.SinglePart;
                _storageType = parameters.StorageType;

                // Calculate parts and structure sizes (PtrHash paper Section 3.1)
                if (_isSinglePart)
                {
                    // Single part mode: all keys in one partition for faster queries (Section 3.1)
                    _parts = 1;
                    _slotsPerPart = CalculateNumSlots(_numKeys, parameters.Alpha);
                    _slotsTotal = _slotsPerPart;
                    _bucketsPerPart = CalculateNumBuckets(_numKeys, parameters.Lambda);
                    _bucketsTotal = _bucketsPerPart;
                }
                else
                {
                    // Multi-part mode: partition keys for better cache locality and parallelism (Section 3.1)
                    var shards = 1; // Sharding::None => 1

                    // Formula of Vigna, eps-cost-sharding: https://arxiv.org/abs/2503.18397
                    // (1-alpha)/2, so that on average we still have some room to play with.
                    var eps = (1.0 - parameters.Alpha) / 2.0;
                    var x = (double)_numKeys * eps * eps / 2.0;
                    var targetParts = x / Math.Log(x);

                    // In Rust, negative float as usize becomes 0. In C#, we need to handle this explicitly (Section 3.1 formula)
                    var partsPerShard = targetParts > 0 ? (nuint)Math.Floor(targetParts) / (nuint)shards : 0;
                    _parts = Math.Max(1, partsPerShard) * (nuint)shards;
                    _isSinglePart = _parts == 1;

                    var keysPerPart = _numKeys / _parts;
                    partsPerShard = _parts / (nuint)shards; // Recalculate after adjustment
                    var slotsPerPart = (nuint)((double)keysPerPart / parameters.Alpha);

                    // Avoid powers of two, since then %S does not depend on all bits
                    if (IsPowerOfTwo((int)slotsPerPart))
                    {
                        slotsPerPart += 1;
                    }

                    _slotsPerPart = slotsPerPart;
                    _slotsTotal = _parts * _slotsPerPart;
                    // Add a few extra buckets to avoid collisions for small n.
                    _bucketsPerPart = (nuint)Math.Ceiling((double)keysPerPart / parameters.Lambda) + 3;
                    _bucketsTotal = _parts * _bucketsPerPart;
                }

                // Allocate unmanaged memory for pilots
                var pilotsPtr = (byte*)System.Runtime.InteropServices.NativeMemory.AlignedAlloc((nuint)_bucketsTotal, 64);
                System.Runtime.InteropServices.NativeMemory.Clear(pilotsPtr, (nuint)_bucketsTotal);
                _pilots = pilotsPtr;

                // Will allocate remap storage later if minimal=true
                _remapStorage = default;


                // Initialize reduction structures
                _remParts = new FastReduce(_parts);
                _remBuckets = new FastReduce(_bucketsPerPart);
                _remBucketsTotal = new FastReduce(_bucketsTotal);
                _remSlots = new FM32(Math.Max(1, _slotsPerPart));

                // Initialize bucket function and set buckets per part
                _bucketFunction = new TBucketFunction();
                _bucketFunction.SetBucketsPerPart(_bucketsPerPart);


                // Construct the hash function using hash-evict algorithm
                if (!ComputePilots(keys, out _seed, out var constructionStats))
                {
                    throw new PtrHashException("Failed to construct minimal perfect hash function. Try different parameters or check for duplicate keys.");
                }

                // Remap table will be created during construction if needed

                // Calculate bits per key
                var pilotBits = (ulong)(_bucketsTotal * 8);
                var remapBits = (ulong)(TRemappingStorage.GetSizeInBytes(_remapStorage) * 8);
                var totalBits = pilotBits + remapBits;
                _bitsPerKey = (double)totalBits / (double)_numKeys;

                DebugConstruction($"PtrHash constructed with seed: {_seed}");
                DebugConstruction($"Parts: {_parts}, Slots per part: {_slotsPerPart}, Buckets per part: {_bucketsPerPart}");
                DebugConstruction($"Total slots: {_slotsTotal}, Total buckets: {_bucketsTotal}");
                DebugConstruction($"Bits per key: {_bitsPerKey:F2}");
                DebugConstruction(constructionStats?.ToString() ?? "");
            }
            catch
            {
                // Clean up if construction failed
                if (_pilots != null)
                {
                    System.Runtime.InteropServices.NativeMemory.AlignedFree(_pilots);
                }
                _remapStorage.Dispose();
                throw;
            }
        }

        public PtrHashInfo GetInfo()
        {
            // MaxIndex is always slots_total - this is the upper bound for GetIndexNoRemapMultiPart()
            // GetIndex() with minimal=true will remap values >= numKeys, but MaxIndex represents the theoretical maximum
            return new PtrHashInfo(_numKeys, _bitsPerKey, _slotsTotal);
        }

        #region Multi-Part Index Methods

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexMultiPart(TKey key)
        {
            var slot = GetIndexNoRemapMultiPart(key);
            return slot < _numKeys ? slot : (nuint)TRemappingStorage.Index(_remapStorage, (int)(slot - _numKeys));
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexNoRemapMultiPart(TKey key)
        {
            var hx = THasher.Hash(key, _seed);
            var bucket = Bucket(hx); // Use global bucket calculation
            var pilot = (ulong)_pilots[bucket];
            return Slot(hx, pilot);
        }

        #endregion

        #region Single-Part Index Methods

        /// <summary>
        /// Faster version of GetIndex for when there is only a single part.
        /// Use only when there is indeed a single part, i.e., after constructing
        /// with PtrHashParams.SinglePart set to true.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexSinglePart(TKey key)
        {
            var slot = GetIndexNoRemapSinglePart(key);
            return slot < _numKeys ? slot : (nuint)TRemappingStorage.Index(_remapStorage, (int)(slot - _numKeys));
        }

        /// <summary>
        /// Faster version of GetIndexNoRemap for when there is only a single part, without remapping.
        /// Use only when there is indeed a single part, i.e., after constructing
        /// with PtrHashParams.SinglePart set to true.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexNoRemapSinglePart(TKey key)
        {
            var hx = THasher.Hash(key, _seed);
            var bucket = BucketInPart(hx.High()); // Use bucket function for single part
            var pilot = (ulong)_pilots[bucket];
            return SlotInPart(hx, pilot); // Direct slot calculation without part offset
        }

        #endregion

        #region Unified Index Methods

        /// <summary>
        /// True if this instance was constructed with single part optimization
        /// </summary>
        public bool IsSinglePart => _isSinglePart;

        /// <summary>
        /// Optimized GetIndex that automatically chooses single-part or multi-part implementation
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndex(TKey key)
        {
            return _isSinglePart ? GetIndexSinglePart(key) : GetIndexMultiPart(key);
        }

        /// <summary>
        /// Optimized GetIndexNoRemap that automatically chooses single-part or multi-part implementation
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexNoRemap(TKey key)
        {
            return _isSinglePart ? GetIndexNoRemapSinglePart(key) : GetIndexNoRemapMultiPart(key);
        }

        #endregion

        #region Core Hash Functions

        // Global bucket calculation - returns global bucket index (PtrHash paper Equation 1)
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint Bucket(HashValue hx)
        {
            // If using linear bucket function, use total buckets reduction
            // Otherwise, extract high bits for part selection and compute bucket within part

            if (_bucketFunction.IsLinear)
            {
                return _remBucketsTotal.Reduce(hx.High());
            }

            // Extract the high bits for part selection; do normal bucket
            // computation within the part using the remaining bits.
            var (part, remainder) = _remParts.ReduceWithRemainder(hx.High());
            var bucket = BucketInPart(remainder);
            return part * _bucketsPerPart + bucket;
        }

        // Bucket calculation within a part - returns bucket index within a part (PtrHash paper Equation 1)
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint BucketInPart(ulong x)
        {
            // Linear: reduce directly; B_OUTPUT: use bucket function result;
            // Otherwise: reduce the bucket function result

            if (_bucketFunction.IsLinear)
            {
                return _remBuckets.Reduce(x);
            }
            else if (_bucketFunction.BOutput)
            {
                return (nuint)_bucketFunction.Call(x);
            }
            else
            {
                return _remBuckets.Reduce(_bucketFunction.Call(x));
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint Slot(HashValue hx, ulong pilot)
        {
            // Algorithm: (part * slots_per_part) + slot_in_part (PtrHash paper Equation 2)
            return (GetPart(hx) * _slotsPerPart) + SlotInPart(hx, pilot);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint SlotInPart(HashValue hx, ulong pilot)
        {
            // self.slot_in_part_hp(hx, self.hash_pilot(pilot))
            return SlotInPartHp(hx, HashPilot(pilot));
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint SlotInPartHp(HashValue hx, ulong hp)
        {
            // Use low 64 bits XORed with hash pilot, reduced to [0, S)

            return _remSlots.Reduce(hx.Low() ^ hp);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint GetPart(HashValue hx)
        {
            // Use high 64 bits to determine part index [0, P)
            return _remParts.Reduce(hx.High());
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private ulong HashPilot(ulong pilot)
        {
            const ulong C = 0x51_7c_c1_b7_27_22_0a_95UL; // FxHash mixing constant from Firefox
            return C * (pilot ^ _seed); // Hash pilot with seed using FxHash multiplication
        }

        #endregion

        #region Streaming Methods

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void GetIndicesStream(ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal = true)
        {
            if (_isSinglePart)
                GetIndicesStreamSinglePart(keys, results, minimal);
            else
                GetIndicesStreamMultiPart(keys, results, minimal);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void GetIndicesStreamSinglePart(ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal = true)
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            var useMinimal = minimal && _minimal;
            var numKeys = _numKeys; // Cache field access

            unsafe
            {
                fixed (TKey* keysPtr = keys)
                fixed (nuint* resultsPtr = results)
                {
                    if (useMinimal)
                    {
                        // Direct implementation - no generic dispatch overhead
                        for (int i = 0; i < keys.Length; i++)
                        {
                            var slot = GetIndexNoRemapSinglePart(keysPtr[i]);
                            if (slot >= numKeys)
                            {
                                var remapIndex = (int)(slot - numKeys);
                                slot = (nuint)TRemappingStorage.Index(_remapStorage, remapIndex);
                            }
                            resultsPtr[i] = slot;
                        }
                    }
                    else
                    {
                        // No remapping needed - direct copy
                        for (int i = 0; i < keys.Length; i++)
                        {
                            resultsPtr[i] = GetIndexNoRemapSinglePart(keysPtr[i]);
                        }
                    }
                }
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void GetIndicesStreamMultiPart(ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal = true)
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            var useMinimal = minimal && _minimal;
            var numKeys = _numKeys; // Cache field access

            unsafe
            {
                fixed (TKey* keysPtr = keys)
                fixed (nuint* resultsPtr = results)
                {
                    if (useMinimal)
                    {
                        // Direct implementation - no generic dispatch overhead
                        for (int i = 0; i < keys.Length; i++)
                        {
                            var slot = GetIndexNoRemapMultiPart(keysPtr[i]);
                            if (slot >= numKeys)
                            {
                                var remapIndex = (int)(slot - numKeys);
                                slot = (nuint)TRemappingStorage.Index(_remapStorage, remapIndex);
                            }
                            resultsPtr[i] = slot;
                        }
                    }
                    else
                    {
                        // No remapping needed - direct copy
                        for (int i = 0; i < keys.Length; i++)
                        {
                            resultsPtr[i] = GetIndexNoRemapMultiPart(keysPtr[i]);
                        }
                    }
                }
            }
        }

        // Prefetch-enabled streaming - matches Rust's index_stream implementation
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void GetIndicesStreamPrefetch(ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal = true)
        {
            // Fall back to regular streaming if SSE2 prefetch not supported
            if (!Sse2.IsSupported)
            {
                GetIndicesStream(keys, results, minimal);
                return;
            }

            if (_isSinglePart)
                GetIndicesStreamPrefetchSinglePart(keys, results, minimal);
            else
                GetIndicesStreamPrefetchMultiPart(keys, results, minimal);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization)]
        [SkipLocalsInit]
        private void GetIndicesStreamPrefetchSinglePart(ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal = true)
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            const int PREFETCH_DISTANCE = 32; // Match Rust's B parameter
            var useMinimal = minimal && _minimal;
            var numKeys = _numKeys;

            // JIT-optimized: Use aligned buffers for better vectorization
            // Ring buffers for prefetching - aligned for SIMD
            Span<HashValue> nextHashes = stackalloc HashValue[PREFETCH_DISTANCE];
            Span<ulong> nextBuckets = stackalloc ulong[PREFETCH_DISTANCE];

            ref var keysRef = ref MemoryMarshal.GetReference(keys);
            ref var resultsRef = ref MemoryMarshal.GetReference(results);

            unsafe
            {
                // Get raw pointers to ring buffers to avoid bounds checks
                fixed (HashValue* hashBufPtr = &MemoryMarshal.GetReference(nextHashes))
                fixed (ulong* bucketBufPtr = &MemoryMarshal.GetReference(nextBuckets))
                {
                    // JIT-optimized: Initialize and prefetch first batch with unrolling hints
                    int remaining = Math.Min(PREFETCH_DISTANCE, keys.Length);
                    
                    // Process in groups of 4 for better JIT vectorization
                    int vectorized = remaining & ~3; // Round down to multiple of 4
                    
                    for (int i = 0; i < vectorized; i += 4)
                    {
                        // Manual unrolling to hint JIT for better optimization
                        var key0 = Unsafe.Add(ref keysRef, i + 0);
                        var key1 = Unsafe.Add(ref keysRef, i + 1);
                        var key2 = Unsafe.Add(ref keysRef, i + 2);
                        var key3 = Unsafe.Add(ref keysRef, i + 3);
                        
                        hashBufPtr[i + 0] = THasher.Hash(key0, _seed);
                        hashBufPtr[i + 1] = THasher.Hash(key1, _seed);
                        hashBufPtr[i + 2] = THasher.Hash(key2, _seed);
                        hashBufPtr[i + 3] = THasher.Hash(key3, _seed);
                        
                        bucketBufPtr[i + 0] = BucketInPart(hashBufPtr[i + 0].High());
                        bucketBufPtr[i + 1] = BucketInPart(hashBufPtr[i + 1].High());
                        bucketBufPtr[i + 2] = BucketInPart(hashBufPtr[i + 2].High());
                        bucketBufPtr[i + 3] = BucketInPart(hashBufPtr[i + 3].High());

                        // Prefetch pilot data with spatial locality
                        Sse.Prefetch0(_pilots + bucketBufPtr[i + 0]);
                        Sse.Prefetch0(_pilots + bucketBufPtr[i + 1]);
                        Sse.Prefetch0(_pilots + bucketBufPtr[i + 2]);
                        Sse.Prefetch0(_pilots + bucketBufPtr[i + 3]);
                    }
                    
                    // Handle remaining elements
                    for (int i = vectorized; i < remaining; i++)
                    {
                        var key = Unsafe.Add(ref keysRef, i);
                        hashBufPtr[i] = THasher.Hash(key, _seed);
                        bucketBufPtr[i] = BucketInPart(hashBufPtr[i].High());
                        Sse.Prefetch0(_pilots + bucketBufPtr[i]);
                    }

                    // Fill remainder with defaults
                    for (int i = remaining; i < PREFETCH_DISTANCE; i++)
                    {
                        hashBufPtr[i] = default;
                        bucketBufPtr[i] = 0;
                    }

                    // Process main loop with prefetch pipeline
                    int processed = 0;

                    // Main loop - process keys and prefetch ahead
                    int mainLoopEnd = Math.Max(0, keys.Length - PREFETCH_DISTANCE);
                    while (processed < mainLoopEnd)
                    {
                        int idx = processed % PREFETCH_DISTANCE;
                        var currentHash = hashBufPtr[idx];
                        var currentBucket = bucketBufPtr[idx];

                        // Prefetch next key while processing current
                        var nextKey = Unsafe.Add(ref keysRef, processed + PREFETCH_DISTANCE);
                        hashBufPtr[idx] = THasher.Hash(nextKey, _seed);
                        bucketBufPtr[idx] = BucketInPart(hashBufPtr[idx].High());

                        // Prefetch pilot data for next iteration
                        Sse.Prefetch0(_pilots + bucketBufPtr[idx]);

                        // Process current key with prefetched data
                        var pilot = _pilots[currentBucket];
                        var hp = HashPilot(pilot);
                        var slot = SlotInPartHp(currentHash, hp);

                        // JIT-optimized: Branchless conditional for better optimization
                        if (useMinimal)
                        {
                            var needsRemap = slot >= numKeys;
                            if (needsRemap)
                            {
                                slot = (nuint)TRemappingStorage.Index(_remapStorage, (int)(slot - numKeys));
                            }
                        }

                        Unsafe.Add(ref resultsRef, processed) = slot;
                        processed++;
                    }

                    // Process remaining prefetched items (matches Rust's leftover loop)
                    while (processed < keys.Length)
                    {
                        int idx = processed % PREFETCH_DISTANCE;
                        var currentHash = hashBufPtr[idx];
                        var currentBucket = bucketBufPtr[idx];

                        var pilot = _pilots[currentBucket];
                        var hp = HashPilot(pilot);
                        var slot = SlotInPartHp(currentHash, hp);

                        // JIT-optimized: Branchless conditional for better optimization  
                        if (useMinimal)
                        {
                            var needsRemap = slot >= numKeys;
                            if (needsRemap)
                            {
                                slot = (nuint)TRemappingStorage.Index(_remapStorage, (int)(slot - numKeys));
                            }
                        }

                        Unsafe.Add(ref resultsRef, processed) = slot;
                        processed++;
                    }
                }
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization)]
        [SkipLocalsInit]
        private void GetIndicesStreamPrefetchMultiPart(ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal = true)
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            const int PREFETCH_DISTANCE = 32;
            var useMinimal = minimal && _minimal;
            var numKeys = _numKeys;

            // JIT-optimized: Use aligned buffers for better vectorization
            Span<HashValue> nextHashes = stackalloc HashValue[PREFETCH_DISTANCE];
            Span<ulong> nextBuckets = stackalloc ulong[PREFETCH_DISTANCE];
            Span<ulong> nextParts = stackalloc ulong[PREFETCH_DISTANCE];

            ref var keysRef = ref MemoryMarshal.GetReference(keys);
            ref var resultsRef = ref MemoryMarshal.GetReference(results);

            unsafe
            {
                // Get raw pointers to ring buffers to avoid bounds checks
                fixed (HashValue* hashBufPtr = &MemoryMarshal.GetReference(nextHashes))
                fixed (ulong* bucketBufPtr = &MemoryMarshal.GetReference(nextBuckets))
                fixed (ulong* partBufPtr = &MemoryMarshal.GetReference(nextParts))
                {
                    // JIT-optimized: Initialize and prefetch first batch with unrolling hints
                    int remaining = Math.Min(PREFETCH_DISTANCE, keys.Length);
                    
                    // Process in groups of 4 for better JIT vectorization
                    int vectorized = remaining & ~3; // Round down to multiple of 4
                    
                    for (int i = 0; i < vectorized; i += 4)
                    {
                        // Manual unrolling to hint JIT for better optimization
                        var key0 = Unsafe.Add(ref keysRef, i + 0);
                        var key1 = Unsafe.Add(ref keysRef, i + 1);
                        var key2 = Unsafe.Add(ref keysRef, i + 2);
                        var key3 = Unsafe.Add(ref keysRef, i + 3);
                        
                        hashBufPtr[i + 0] = THasher.Hash(key0, _seed);
                        hashBufPtr[i + 1] = THasher.Hash(key1, _seed);
                        hashBufPtr[i + 2] = THasher.Hash(key2, _seed);
                        hashBufPtr[i + 3] = THasher.Hash(key3, _seed);
                        
                        var high0 = hashBufPtr[i + 0].High();
                        var high1 = hashBufPtr[i + 1].High();
                        var high2 = hashBufPtr[i + 2].High();
                        var high3 = hashBufPtr[i + 3].High();

                        // Calculate parts and remainders
                        var (part0, remainder0) = _remParts.ReduceWithRemainder(high0);
                        var (part1, remainder1) = _remParts.ReduceWithRemainder(high1);
                        var (part2, remainder2) = _remParts.ReduceWithRemainder(high2);
                        var (part3, remainder3) = _remParts.ReduceWithRemainder(high3);
                        
                        partBufPtr[i + 0] = part0;
                        partBufPtr[i + 1] = part1;
                        partBufPtr[i + 2] = part2;
                        partBufPtr[i + 3] = part3;

                        // Calculate buckets in total using remainder
                        var bucketInPart0 = BucketInPart(remainder0);
                        var bucketInPart1 = BucketInPart(remainder1);
                        var bucketInPart2 = BucketInPart(remainder2);
                        var bucketInPart3 = BucketInPart(remainder3);
                        
                        bucketBufPtr[i + 0] = part0 * (ulong)_bucketsPerPart + bucketInPart0;
                        bucketBufPtr[i + 1] = part1 * (ulong)_bucketsPerPart + bucketInPart1;
                        bucketBufPtr[i + 2] = part2 * (ulong)_bucketsPerPart + bucketInPart2;
                        bucketBufPtr[i + 3] = part3 * (ulong)_bucketsPerPart + bucketInPart3;

                        // Prefetch pilot data with spatial locality
                        Sse.Prefetch0(_pilots + bucketBufPtr[i + 0]);
                        Sse.Prefetch0(_pilots + bucketBufPtr[i + 1]);
                        Sse.Prefetch0(_pilots + bucketBufPtr[i + 2]);
                        Sse.Prefetch0(_pilots + bucketBufPtr[i + 3]);
                    }
                    
                    // Handle remaining elements
                    for (int i = vectorized; i < remaining; i++)
                    {
                        var key = Unsafe.Add(ref keysRef, i);
                        hashBufPtr[i] = THasher.Hash(key, _seed);
                        var high = hashBufPtr[i].High();

                        // Calculate part and remainder
                        var (part, remainder) = _remParts.ReduceWithRemainder(high);
                        partBufPtr[i] = part;

                        // Calculate bucket in total using remainder
                        var bucketInPart = BucketInPart(remainder);
                        bucketBufPtr[i] = part * (ulong)_bucketsPerPart + bucketInPart;

                        // Prefetch pilot data
                        Sse.Prefetch0(_pilots + bucketBufPtr[i]);
                    }

                    // Fill remainder
                    for (int i = remaining; i < PREFETCH_DISTANCE; i++)
                    {
                        hashBufPtr[i] = default;
                        bucketBufPtr[i] = 0;
                        partBufPtr[i] = 0;
                    }

                    // Process main loop
                    int processed = 0;

                    // Main loop - process keys and prefetch ahead
                    int mainLoopEnd = Math.Max(0, keys.Length - PREFETCH_DISTANCE);
                    while (processed < mainLoopEnd)
                    {
                        int idx = processed % PREFETCH_DISTANCE;
                        var currentHash = hashBufPtr[idx];
                        var currentBucket = bucketBufPtr[idx];
                        var currentPart = partBufPtr[idx];

                        // Prefetch next key
                        var nextKey = Unsafe.Add(ref keysRef, processed + PREFETCH_DISTANCE);
                        hashBufPtr[idx] = THasher.Hash(nextKey, _seed);
                        var high = hashBufPtr[idx].High();

                        var (part, remainder) = _remParts.ReduceWithRemainder(high);
                        partBufPtr[idx] = part;
                        var bucketInPart = BucketInPart(remainder);
                        bucketBufPtr[idx] = part * (ulong)_bucketsPerPart + bucketInPart;

                        Sse.Prefetch0(_pilots + bucketBufPtr[idx]);

                        // Process current with prefetched data
                        var pilot = _pilots[currentBucket];
                        var hp = HashPilot(pilot);
                        var slotInPart = SlotInPartHp(currentHash, hp);
                        var slot = (nuint)(currentPart * (ulong)_slotsPerPart) + slotInPart;

                        // JIT-optimized: Branchless conditional for better optimization
                        if (useMinimal)
                        {
                            var needsRemap = slot >= numKeys;
                            if (needsRemap)
                            {
                                slot = (nuint)TRemappingStorage.Index(_remapStorage, (int)(slot - numKeys));
                            }
                        }

                        Unsafe.Add(ref resultsRef, processed) = slot;
                        processed++;
                    }

                    // Process remaining prefetched items (matches Rust's leftover loop)
                    while (processed < keys.Length)
                    {
                        int idx = processed % PREFETCH_DISTANCE;
                        var currentHash = hashBufPtr[idx];
                        var currentBucket = bucketBufPtr[idx];
                        var currentPart = partBufPtr[idx];

                        var pilot = _pilots[currentBucket];
                        var hp = HashPilot(pilot);
                        var slotInPart = SlotInPartHp(currentHash, hp);
                        var slot = (nuint)(currentPart * (ulong)_slotsPerPart) + slotInPart;

                        // JIT-optimized: Branchless conditional for better optimization
                        if (useMinimal)
                        {
                            var needsRemap = slot >= numKeys;
                            if (needsRemap)
                            {
                                slot = (nuint)TRemappingStorage.Index(_remapStorage, (int)(slot - numKeys));
                            }
                        }

                        Unsafe.Add(ref resultsRef, processed) = slot;
                        processed++;
                    }
                }
            }
        }

        #endregion

        #region Construction Methods

        private bool ComputePilots(ReadOnlySpan<TKey> keys, out ulong finalSeed, out BucketStats? stats)
        {
            // Initialize arrays for construction
            // _pilots already allocated in constructor, but clear/resize in loop
            stats = null;

            var tries = 0;
            const int MAX_TRIES = 10;

            var rng = new BouncyCastleChaCha8Rng(31415); // Test with BouncyCastle ChaCha8

            // Create PartitionedBitVec once and reuse it across seed attempts
            using var taken = new PartitionedBitVec(_parts, _slotsPerPart);

            // Loop over global seeds attempting construction
            while (true) // Try multiple seeds until construction succeeds (PtrHash paper Section 3.3)
            {
                tries++;
                if (tries > MAX_TRIES)
                {
                    DebugConstruction($"ERROR: PtrHash failed to find a global seed after {MAX_TRIES} tries.");
                    finalSeed = 0;
                    return false; // Construction failed after max attempts
                }

                var oldSeed = _seed;

                // Choose a global seed s
                _seed = rng.NextUInt64(); // self.seed = rng.random()

                // Clear the taken bits for new attempt
                taken.Clear();

                if (TryBuildWithSeed(keys, _seed, taken, out stats))
                {
                    finalSeed = _seed;

                    // Pilots data already stored during construction

                    // Return true with stats collected during construction
                    return true;
                }

                // If build failed, continue to next seed
                // Try next seed
            }
        }

        private bool TryBuildWithSeed(ReadOnlySpan<TKey> keys, ulong seed, PartitionedBitVec taken, out BucketStats? stats)
        {
            // Initialize stats
            stats = null;

            // Seed already assigned in ComputePilots before calling this method

            // Reset pilots
            System.Runtime.InteropServices.NativeMemory.Clear(_pilots, (nuint)_bucketsTotal);

            // Rent array for hashing
            var hashArray = ArrayPool<HashValue>.Shared.Rent(keys.Length);
            try
            {
                var hashBuffer = hashArray.AsSpan(0, keys.Length);

                // First, hash all keys and partition them by parts
                var partStarts = SortPartsByHashes(keys, seed, hashBuffer);

                // Process parts in parallel
                var parallelOptions = new ParallelOptions
                {
                    MaxDegreeOfParallelism = MaxParallelism
                };

                var success = true;
                var lockObject = new object();
                var partStatsList = new BucketStats[_parts];

                Parallel.For(0, (int)_parts, parallelOptions, part =>
                {
                    if (!success) return; // Early exit if another thread failed

                    var partStart = (int)partStarts[part];
                    var partEnd = (int)partStarts[part + 1];
                    // Create span from array to avoid closure over ref local
                    var partHashes = new Span<HashValue>(hashArray, partStart, partEnd - partStart);

                    // Get pilot slice for this part
                    var partPilotStart = part * (int)_bucketsPerPart;
                    Span<byte> partPilots = new Span<byte>(_pilots + partPilotStart, (int)_bucketsPerPart);

                    // Build this part using hash-evict algorithm
                    if (!BuildPart(part, partHashes, partPilots, taken, out var partStats))
                    {
                        lock (lockObject)
                        {
                            success = false;
                        }
                    }
                    else
                    {
                        partStatsList[part] = partStats;
                    }
                });

                if (!success)
                {
                    stats = null;
                    return false;
                }

                // Aggregate statistics from all parts
                stats = new BucketStats();
                foreach (var partStats in partStatsList)
                {
                    if (partStats != null)
                    {
                        stats.Merge(partStats);
                    }
                }

                // After successful construction, create remap table if needed
                if (!TryRemapFreeSlots(taken))
                {
                    stats = null;
                    return false; // Construction failed - try next seed
                }

                return true;
            }
            finally
            {
                // Always return the rented array
                ArrayPool<HashValue>.Shared.Return(hashArray);
            }
        }

        private static bool IsPowerOfTwo(int value)
        {
            return value > 0 && (value & (value - 1)) == 0;
        }

        // Hash all keys and partition by parts
        // Caller provides the array to make ownership clear
        private uint[] SortPartsByHashes(ReadOnlySpan<TKey> keys, ulong seed, Span<HashValue> hashBuffer)
        {
            // Hash all keys using seed, then sort for duplicate detection
            for (int i = 0; i < keys.Length; i++)
            {
                hashBuffer[i] = THasher.Hash(keys[i], seed);
            }

            // Sort by hash - use built-in IntroSort (zero allocations, optimal performance)
            hashBuffer.Sort();

            // O(n) duplicate detection on sorted hashes - indicates duplicate keys
            for (int i = 1; i < hashBuffer.Length; i++)
            {
                if (hashBuffer[i - 1].Full() == hashBuffer[i].Full())
                {
                    // Found duplicate hash - this means duplicate keys
                    throw new PtrHashException($"Duplicate hash found. This usually indicates duplicate keys in the input.");
                }
            }

            // Locate part boundaries in sorted hash array using binary search
            var partStarts = new uint[_parts + 1];
            partStarts[0] = 0;

            for (nuint part = 1; part <= _parts; part++)
            {
                // Binary search for first hash belonging to this part
                int left = 0, right = hashBuffer.Length;
                while (left < right)
                {
                    int mid = (left + right) / 2;
                    if (GetPart(hashBuffer[mid]) < part)
                        left = mid + 1;
                    else
                        right = mid;
                }
                partStarts[part] = (uint)left;
            }

            return partStarts;
        }

        // Build a single part using hash-evict algorithm
        private bool BuildPart(int part, ReadOnlySpan<HashValue> partHashes, Span<byte> partPilots, PartitionedBitVec taken, out BucketStats partStats)
        {
            // Initialize statistics collection
            partStats = new BucketStats();

            // Sort buckets within this part
            var (sortedHashes, bucketStarts, bucketOrder) = SortBucketsInPart(part, partHashes);

            // Use the sorted hashes from here on - this is critical for deterministic ordering
            var hashesSpan = sortedHashes.AsSpan();

            const ulong kmax = 256;
            // Use ArrayPool to avoid allocation
            var slots = ArrayPool<int>.Shared.Rent((int)_slotsPerPart);
            try
            {
                Array.Fill(slots, -1, 0, (int)_slotsPerPart); // -1 = BucketIdx::NONE

                // Get this part's BitVec - critical: use only this part's bit slice
                var partTaken = taken.GetPart(part);

                // Binary heap for bucket eviction processing
                var stack = new BinaryHeap<BucketInfo>();
                var recent = new int[16];
                Array.Fill(recent, -1); // -1 = BucketIdx::NONE
                var rng = new FastRand(); // Auto-seeded random number generator (uses WyRand algorithm)

                // Process buckets in size order (largest first)

                var totalBuckets = bucketOrder.Length;
                var processedBuckets = 0;

                for (int bucketIdx = 0; bucketIdx < bucketOrder.Length; bucketIdx++)
                {
                    var newBucket = bucketOrder[bucketIdx];
                    var bucketStart = bucketStarts[newBucket];
                    var bucketEnd = bucketStarts[newBucket + 1];
                    var newBucketSize = bucketEnd - bucketStart;

                    if (newBucketSize == 0)
                    {
                        partPilots[newBucket] = 0;
                        processedBuckets++;
                        continue;
                    }

                    var evictions = 0;

                    // Push initial bucket onto eviction stack with size-based priority
                    stack.Push(new BucketInfo((nuint)newBucketSize, (nuint)newBucket));
                    Array.Fill(recent, -1); // Initialize recent buckets to prevent cycles (Section 3.3)
                    var recentIdx = 0;
                    recent[0] = newBucket; // Mark bucket as recently processed

                    // Process eviction chain (Rust: while let Some((_b_len, b)) = stack.pop())
                    var maxEvictionsForBucket = 0;

                    while (!stack.IsEmpty)
                    {
                        // Termination: prevent infinite eviction cycles (PtrHash paper Section 3.3)
                        if (evictions >= 10 * (int)_slotsPerPart)
                        {
                            return false;
                        }

                        // Track max evictions for this bucket
                        if (evictions > maxEvictionsForBucket)
                            maxEvictionsForBucket = evictions;

                        // Additional termination check for excessive evictions
                        if (evictions > (int)_slotsPerPart && IsPowerOfTwo(evictions))
                        {
                            // Expensive logging/diagnostics on power-of-two intervals only
                            if (evictions >= 10 * (int)_slotsPerPart)
                            {
                                return false; // Too many evictions, abort
                            }
                        }

                        var bucketInfo = stack.Pop();
                        var currentBucket = (int)bucketInfo.BucketId;


                        var currentStart = bucketStarts[currentBucket];
                        var currentEnd = bucketStarts[currentBucket + 1];
                        var currentBucketHashes = hashesSpan.Slice(currentStart, currentEnd - currentStart);

                        if (currentBucketHashes.Length == 0)
                            continue;

                        // 1) Try collision-free pilot first (hot path optimization)
                        var pilotResult = FindPilot(kmax, currentBucketHashes, partTaken, out var pilotsChecked, currentBucket);

                        if (pilotResult.HasValue)
                        {
                            var (pilot, hashPilot) = pilotResult.Value;
                            partPilots[currentBucket] = (byte)pilot;

                            // Place bucket in slots
                            // IMPORTANT: Taken is already filled by FindPilotInPart->TryTakePilotInPart
                            foreach (var hash in currentBucketHashes)
                            {
                                var localSlot = SlotInPartHp(hash, hashPilot);
                                slots[localSlot] = currentBucket;
                                // DO NOT mark slots as taken here - already done in TryTakePilotInPart
                            }
                            continue;
                        }

                        // 2) Find pilot with minimal collisions and evict
                        var bestResult = FindBestPilotWithEvictionInPart(currentBucketHashes, slots, recent, rng, kmax, bucketStarts);
                        var bestPilot = bestResult.pilot;

                        // Set pilot and compute hash of pilot
                        partPilots[currentBucket] = (byte)bestPilot;
                        var hp = HashPilot(bestPilot);

                        // Collect statistics
                        var globalBucketId = (nuint)(part * (int)_bucketsPerPart + currentBucket);
                        partStats.Add(globalBucketId, _bucketsTotal, currentBucketHashes.Length, bestPilot, evictions);

                        // Eviction algorithm: Drop the collisions and set the new pilot
                        var evictionsThisRound = 0;

                        // For each slot in this bucket
                        foreach (var hash in currentBucketHashes)
                        {
                            var localSlot = SlotInPartHp(hash, hp);

                            // Check if slot is occupied
                            var occupyingBucket = slots[localSlot];
                            if (occupyingBucket >= 0) // Slot is occupied
                            {
                                if (occupyingBucket == currentBucket)
                                    throw new InvalidOperationException("Self-collision detected"); // assert!(b2 != b)

                                // Push evicted bucket onto stack for reprocessing
                                var evictedStart = bucketStarts[occupyingBucket];
                                var evictedEnd = bucketStarts[occupyingBucket + 1];
                                var evictedSize = evictedEnd - evictedStart;

                                stack.Push(new BucketInfo((nuint)evictedSize, (nuint)occupyingBucket));
                                evictions++;
                                evictionsThisRound++;

                                // Clear all slots for the evicted bucket
                                var evictedPilot = (ulong)partPilots[occupyingBucket];
                                var evictedHp = HashPilot(evictedPilot);
                                var evictedHashes = hashesSpan.Slice(evictedStart, evictedSize);

                                // Clear slots by recomputing them from the hashes and pilot
                                foreach (var evictedHash in evictedHashes)
                                {
                                    var evictedLocalSlot = SlotInPartHp(evictedHash, evictedHp);
                                    // Clear slot assignment
                                    slots[evictedLocalSlot] = -1;
                                    // Mark slot as available
                                    partTaken.Set(evictedLocalSlot, false);
                                }
                            }

                            // Assign slot to current bucket
                            slots[localSlot] = currentBucket;
                            // Mark slot as taken
                            partTaken.Set(localSlot, true);
                        }


                        // Update recent buckets for collision avoidance
                        recentIdx += 1; // recent_idx += 1
                        recentIdx %= recent.Length; // recent_idx %= recent.len()
                        recent[recentIdx] = currentBucket; // recent[recent_idx] = b
                    }

                    processedBuckets++;
                }

                return true;
            }
            finally
            {
                ArrayPool<int>.Shared.Return(slots);
            }
        }

        // Sort buckets within a single part by size (PtrHash paper Section 3.3)
        // Returns the sorted hash array AND bucket starts/order that match it
        private (HashValue[] sortedHashes, int[] bucketStarts, int[] bucketOrder) SortBucketsInPart(int part, ReadOnlySpan<HashValue> partHashes)
        {
            // Use ArrayPool for temporary allocations (better than new arrays)
            var hashBucketPairPool = ArrayPool<(HashValue hash, int bucket)>.Shared;
            var hashBucketPairs = hashBucketPairPool.Rent(partHashes.Length);

            var sortedHashes = new HashValue[partHashes.Length]; // Result array - don't pool this

            // Compute bucket for each hash
            for (int i = 0; i < partHashes.Length; i++)
            {
                var hash = partHashes[i];
                // Use global bucket index: self.bucket(hashes[end]) == part * self.buckets + b
                var globalBucket = (int)Bucket(hash);
                var localBucket = globalBucket - part * (int)_bucketsPerPart;
                hashBucketPairs[i] = (hash, localBucket);
            }

            // Use Array.Sort with custom comparison (faster than List.Sort) - only sort actual data length
            Array.Sort(hashBucketPairs, 0, partHashes.Length, Comparer<(HashValue hash, int bucket)>.Create((a, b) =>
            {
                var bucketCompare = a.bucket.CompareTo(b.bucket);
                return bucketCompare != 0 ? bucketCompare : a.hash.Full().CompareTo(b.hash.Full());
            }));

            // Extract sorted hashes directly (no LINQ) - use actual data length, not pooled array length
            for (int i = 0; i < partHashes.Length; i++)
            {
                sortedHashes[i] = hashBucketPairs[i].hash;
            }

            // Create bucket starts array
            var bucketStarts = new int[_bucketsPerPart + 1]; // +1 for end sentinel
            var currentBucket = 0;
            var hashIndex = 0;

            for (int i = 0; i < partHashes.Length; i++)
            {
                var pair = hashBucketPairs[i];
                // Fill in start positions for empty buckets
                while (currentBucket <= pair.bucket)
                {
                    bucketStarts[currentBucket] = hashIndex;
                    currentBucket++;
                }
                hashIndex++;
            }

            // Fill remaining bucket starts
            while (currentBucket <= (int)_bucketsPerPart)
            {
                bucketStarts[currentBucket] = hashIndex;
                currentBucket++;
            }

            // Create bucket order sorted by size (largest first) - use ArrayPool
            var bucketSizePool = ArrayPool<(int size, int bucket)>.Shared;
            var bucketSizes = bucketSizePool.Rent((int)_bucketsPerPart);

            try
            {
                for (int i = 0; i < (int)_bucketsPerPart; i++)
                {
                    var size = bucketStarts[i + 1] - bucketStarts[i];
                    bucketSizes[i] = (size, i);
                }

                // Sort by size descending, then by bucket index for deterministic order
                Array.Sort(bucketSizes, 0, (int)_bucketsPerPart, Comparer<(int size, int bucket)>.Create((a, b) =>
                {
                    var sizeCompare = b.size.CompareTo(a.size); // Descending
                    return sizeCompare != 0 ? sizeCompare : a.bucket.CompareTo(b.bucket);
                }));

                // Extract bucket order directly (no LINQ)
                var bucketOrder = new int[_bucketsPerPart]; // Result array - don't pool this
                for (int i = 0; i < (int)_bucketsPerPart; i++)
                {
                    bucketOrder[i] = bucketSizes[i].bucket;
                }

                return (sortedHashes, bucketStarts, bucketOrder);
            }
            finally
            {
                // Return pooled arrays
                hashBucketPairPool.Return(hashBucketPairs);
                bucketSizePool.Return(bucketSizes);
            }
        }

        // Size-specialized dispatch function for find_pilot optimization (~10% speedup)
        private (ulong pilot, ulong hashPilot)? FindPilot(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            return FindPilotSlice(kmax, bucketHashes, taken, out pilotsChecked, bucketId);
        }


        // Variable-size bucket processing for larger buckets (renamed from FindPilotInPart)
        private (ulong pilot, ulong hashPilot)? FindPilotSlice(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            // Sequential pilot search from 0 to kmax-1 with 4x loop unrolling (Section 3.3)
            int r = bucketHashes.Length / 4 * 4; // let r = bucket.len() / 4 * 4;

            pilotsChecked = 0;

            for (ulong pilot = 0; pilot < kmax; pilot++) // 'p: for p in 0u64..kmax
            {
                pilotsChecked++;
                var hp = HashPilot(pilot);

                // Process chunks of 4 bucket elements at a time (EXACT Rust)
                bool hasCollision = false;
                for (int i = 0; i < r; i += 4)
                {
                    // Compute the four candidate slots
                    nuint slot0 = SlotInPartHp(bucketHashes[i], hp);
                    nuint slot1 = SlotInPartHp(bucketHashes[i + 1], hp);
                    nuint slot2 = SlotInPartHp(bucketHashes[i + 2], hp);
                    nuint slot3 = SlotInPartHp(bucketHashes[i + 3], hp);

                    // Query taken[] once per slot
                    bool t0 = taken.GetUnchecked(slot0);
                    bool t1 = taken.GetUnchecked(slot1);
                    bool t2 = taken.GetUnchecked(slot2);
                    bool t3 = taken.GetUnchecked(slot3);

                    if (t0 || t1 || t2 || t3)
                    {
                        hasCollision = true;
                        break;
                    }
                }

                if (hasCollision) continue;

                // Check remaining elements (EXACT Rust)
                for (int i = r; i < bucketHashes.Length; i++)
                {
                    var hash = bucketHashes[i];
                    var localSlot = SlotInPartHp(hash, hp);
                    if (taken.GetUnchecked(localSlot)) // bad |= check(hx)
                    {
                        hasCollision = true;
                        break;
                    }
                }

                if (hasCollision) continue;

                // If no external collision, try to take this pilot (EXACT Rust)
                if (TryTakePilotInPart(bucketHashes, pilot, taken)) // if self.try_take_pilot(bucket, hp, taken)
                {
                    return (pilot, hp); // return Some((p, hp))
                }
            }

            return null; // None
        }

        // try_take_pilot implementation - marks slots as taken with backtracking (Section 3.3)
        private bool TryTakePilotInPart(ReadOnlySpan<HashValue> bucketHashes, ulong pilot, BitVec taken)
        {
            var hp = HashPilot(pilot);

            // This bucket does not collide with previous buckets, but it may still collide with itself.
            for (int i = 0; i < bucketHashes.Length; i++)
            {
                var hash = bucketHashes[i];
                var localSlot = SlotInPartHp(hash, hp);

                if (taken.Get(localSlot))
                {
                    // Collision within the bucket. Clean already set entries (Section 3.3 backtracking)
                    // for &hx in unsafe { bucket.get_unchecked(..i) }
                    for (int j = 0; j < i; j++)
                    {
                        var previousHash = bucketHashes[j];
                        var previousSlot = SlotInPartHp(previousHash, hp);
                        taken.Set(previousSlot, false);
                    }
                    return false;
                }

                // Mark slot as taken immediately (Section 3.3)
                taken.Set(localSlot, true);
            }

            return true; // Successfully took all slots
        }

        // Optimized recent array lookup - faster than Array.IndexOf for small arrays
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static bool IsInRecentArray(int[] recent, int bucket)
        {
            // Manual unrolled loop for the 16-element recent array - much faster than Array.IndexOf
            for (int i = 0; i < recent.Length; i++)
            {
                if (recent[i] == bucket)
                    return true;
            }
            return false;
        }

        // Find best pilot with minimal collisions (PtrHash paper Section 3.3)
        private (ulong score, ulong pilot) FindBestPilotWithEvictionInPart(ReadOnlySpan<HashValue> bucketHashes, int[] slots, int[] recent, FastRand rng, ulong kmax, int[] bucketStarts)
        {
            var bestScore = ulong.MaxValue;
            var bestPilot = ulong.MaxValue;
            var startPilot = (ulong)rng.NextByte(); // Random starting pilot
            var newBLen = (ulong)bucketHashes.Length;

            // Use ArrayPool for temporary array to avoid allocation in hot path
            var slotsTmp = ArrayPool<nuint>.Shared.Rent(bucketHashes.Length);
            try
            {
                bool DuplicateSlots(ReadOnlySpan<HashValue> bucketHashes, ulong pilot)
                {
                    var hp = HashPilot(pilot);

                    // EXACT Rust pattern: slots_tmp.clear(); slots_tmp.extend(slots_for_bucket(b, p));
                    for (int i = 0; i < bucketHashes.Length; i++)
                    {
                        slotsTmp[i] = SlotInPartHp(bucketHashes[i], hp);
                    }

                    // EXACT Rust pattern: slots_tmp.sort_unstable();
                    // Use built-in sort - simpler and often faster than counting sort
                    slotsTmp.AsSpan(0, bucketHashes.Length).Sort();

                    // EXACT Rust pattern: slots_tmp.iter().tuple_windows().any(|(a, b)| a == b)
                    for (int i = 0; i < bucketHashes.Length - 1; i++)
                    {
                        if (slotsTmp[i] == slotsTmp[i + 1])
                        {
                            return true; // Duplicate found
                        }
                    }

                    return false; // No duplicates
                }

                // 'p: for delta in 0u64..kmax
                for (ulong delta = 0; delta < kmax; delta++)
                {
                    var pilot = (startPilot + delta) % kmax;
                    var hp = HashPilot(pilot);

                    var collisionScore = 0UL;
                    var shouldSkip = false;

                    // for p in b_slots(hp)
                    foreach (var hash in bucketHashes)
                    {
                        var localSlot = SlotInPartHp(hash, hp);
                        var occupyingBucket = slots[localSlot];

                        // let s = unsafe { *slots.get_unchecked(p) };
                        // if s.is_none() { continue; }
                        if (occupyingBucket == -1)
                        {
                            continue;
                        }
                        // else if recent.contains(&s) { continue 'p; }
                        // Optimized: recent array is small (16 elements), so linear search is fine but we can optimize it
                        else if (IsInRecentArray(recent, occupyingBucket))
                        {
                            shouldSkip = true;
                            break; // Exit inner loop to continue outer loop
                        }

                        // Collision scoring: s² penalizes evicting large buckets more (Section 3.3)
                        var bucketSize = bucketStarts[occupyingBucket + 1] - bucketStarts[occupyingBucket];
                        var newScore = (ulong)(bucketSize * bucketSize);
                        collisionScore += newScore;

                        // Early termination: skip pilots with worse collision scores (Section 3.3)
                        if (collisionScore >= bestScore)
                        {
                            shouldSkip = true;
                            break; // Exit inner loop to continue outer loop
                        }
                    }

                    // Skip this pilot if we hit a recent bucket or score exceeded best
                    if (shouldSkip)
                        continue;

                    // if !duplicate_slots(b, p)
                    if (!DuplicateSlots(bucketHashes, pilot))
                    {
                        //  best = (collision_score, p);
                        bestScore = collisionScore;
                        bestPilot = pilot;

                        // if collision_score == new_b_len * new_b_len { break; }
                        if (collisionScore == newBLen * newBLen)
                        {
                            break;
                        }
                    }
                }

                return (bestScore, bestPilot);
            }
            finally
            {
                ArrayPool<nuint>.Shared.Return(slotsTmp);
            }
        }


        private bool TryRemapFreeSlots(PartitionedBitVec taken)
        {
            // Efficient implementation of remap_free_slots algorithm using IterZeros() (Section 3.2)
            // This eliminates the O(n²) nested loop issue by only processing actual zero bits
            // Assert: count of free slots should equal slots_total - n
            var freeSlotCount = taken.CountZeros();
            if (freeSlotCount != _slotsTotal - _numKeys)
            {
                return false; // Inconsistent state - "Not the right number of free slots left!"
            }

            if (!_minimal || _slotsTotal == _numKeys)
            {
                _remapStorage = default;
                return true;
            }

            // Compute the free spots (PtrHash paper Section 3.2)
            // Use ArrayPool for temporary storage
            var maxRemapSize = (int)(_slotsTotal - _numKeys);
            var remapArray = ArrayPool<ulong>.Shared.Rent(maxRemapSize);
            var remapCount = 0;

            try
            {
                // Helper function for slot access (Section 3.2)
                // get = |t: &Vec<BitVec>, idx: usize| t[idx / self.slots][idx % self.slots];
                bool Get(nuint idx)
                {
                    var part = idx / _slotsPerPart;
                    var localSlot = idx % _slotsPerPart;
                    return taken.Parts[part].Get(localSlot);
                }

                // Efficient single-pass algorithm using IterZeros() (Section 3.2)
                // This is equivalent to:
                // for i in taken.iter().enumerate().flat_map(|(p, t)| t.iter_zeros().map(move |i| offset + i)).take_while(|&i| i < self.n)
                foreach (var freeSlotIndex in taken.IterZeros())
                {
                    if (freeSlotIndex >= _numKeys) // take_while(|&i| i < self.n) - stop when we exceed n
                        break;

                    // Process this free slot immediately (Section 3.2)
                    var i = (uint)freeSlotIndex;
                    while (!Get(_numKeys + (nuint)remapCount))
                    {
                        remapArray[remapCount++] = i;
                    }
                    remapArray[remapCount++] = i;
                }

                // Create remapping storage using selected type
                var remapValues = remapArray.AsSpan(0, remapCount);
                _remapStorage = TRemappingStorage.TryNew(remapValues);
            }
            finally
            {
                ArrayPool<ulong>.Shared.Return(remapArray);
            }
            return true;
        }

        #endregion

        #region Utility Methods

        private static nuint CalculateNumBuckets(nuint numKeys, double lambda)
        {
            return (nuint)Math.Ceiling((double)numKeys / lambda);
        }

        private static nuint CalculateNumSlots(nuint numKeys, double alpha)
        {
            return (nuint)Math.Ceiling((double)numKeys / alpha);
        }

        private static nuint CalculateSlotsPerBucket(double lambda)
        {
            return (nuint)Math.Max(1, Math.Ceiling(lambda));
        }

        #endregion

        #region IDisposable Support
        private bool _disposed = false;

        ~PtrHash()
        {
            Dispose(false);
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        private void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                unsafe
                {
                    if (_pilots != null)
                    {
                        NativeMemory.AlignedFree(_pilots);
                        _pilots = null;
                    }
                }

                _remapStorage.Dispose();

                _disposed = true;
            }
        }

        #endregion
    }

}