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
using PtrHash.CSharp.Port.Sorting;

namespace PtrHash.CSharp.Port.Core
{
    // Const generic emulation for compile-time specialization
    public interface IBoolConstant { bool Value { get; } }
    public interface IPartConstant { bool IsSinglePart { get; } }
    
    public readonly struct UseMinimal : IBoolConstant { public bool Value => true; }
    public readonly struct NoMinimal : IBoolConstant { public bool Value => false; }
    public readonly struct SinglePart : IPartConstant { public bool IsSinglePart => true; }
    public readonly struct MultiPart : IPartConstant { public bool IsSinglePart => false; }
    
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
    /// - CacheLineEF remapping compression exists but isn't well tested.
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
                    _slotsPerPart = CalculateSlotsPerPart(_numKeys, parameters.Alpha);
                    _slotsTotal = _slotsPerPart;
                    _bucketsPerPart = CalculateBucketsPerPart(_numKeys, parameters.Lambda);
                    _bucketsTotal = _bucketsPerPart;
                }
                else
                {
                    // Multi-part mode: partition keys for better cache locality and parallelism (Section 3.1)
                    var shards = 1; // Sharding::None => 1

                    // Formula of Vigna, eps-cost-sharding: https://arxiv.org/abs/2503.18397
                    // (1-alpha)/2, so that on average we still have some room to play with.
                    var eps = (1.0 - parameters.Alpha) / 2.0;
                    var x = _numKeys * eps * eps / 2.0;
                    var targetParts = x / Math.Log(x);

                    // In Rust, negative float as usize becomes 0. In C#, we need to handle this explicitly (Section 3.1 formula)
                    var partsPerShard = targetParts > 0 ? (nuint)Math.Floor(targetParts) / (nuint)shards : 0;
                    _parts = Math.Max(1, partsPerShard) * (nuint)shards;
                    _isSinglePart = _parts == 1;

                    var keysPerPart = _numKeys / _parts;
                    partsPerShard = _parts / (nuint)shards; // Recalculate after adjustment
                    var slotsPerPart = CalculateSlotsPerPart(keysPerPart, parameters.Alpha);

                    // Avoid powers of two, since then %S does not depend on all bits
                    if (IsPowerOfTwo((int)slotsPerPart))
                    {
                        slotsPerPart += 1;
                    }

                    _slotsPerPart = slotsPerPart;
                    _slotsTotal = _parts * _slotsPerPart;
                    // Add a few extra buckets to avoid collisions for small n.
                    _bucketsPerPart = CalculateBucketsPerPart(keysPerPart, parameters.Lambda) + 3;
                    _bucketsTotal = _parts * _bucketsPerPart;
                }

                // Allocate unmanaged memory for pilots
                var pilotsPtr = (byte*)NativeMemory.AlignedAlloc(_bucketsTotal, 64);
                NativeMemory.Clear(pilotsPtr, _bucketsTotal);
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
                _bitsPerKey = totalBits / (double)_numKeys;

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
                    NativeMemory.AlignedFree(_pilots);
                    _pilots = null;
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
            return slot < _numKeys ? slot : TRemappingStorage.Index(_remapStorage, slot - _numKeys);
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
            return slot < _numKeys ? slot : TRemappingStorage.Index(_remapStorage, slot - _numKeys);
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
        //[MethodImpl(MethodImplOptions.AggressiveInlining)]
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
        //MethodImpl(MethodImplOptions.AggressiveInlining)]
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

        private nuint Slot(HashValue hx, ulong pilot)
        {
            // Algorithm: (part * slots_per_part) + slot_in_part (PtrHash paper Equation 2)
            return (GetPart(hx) * _slotsPerPart) + SlotInPart(hx, pilot);
        }

        private nuint SlotInPart(HashValue hx, ulong pilot)
        {
            // self.slot_in_part_hp(hx, self.hash_pilot(pilot))
            return SlotInPartHp(hx, HashPilot(pilot));
        }

        private nuint SlotInPartHp(HashValue hx, ulong hp)
        {
            // Use low 64 bits XORed with hash pilot, reduced to [0, S)
            return _remSlots.Reduce(hx.Low() ^ hp);
        }

        private nuint GetPart(HashValue hx)
        {
            // Use high 64 bits to determine part index [0, P)
            return _remParts.Reduce(hx.High());
        }

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
            var useMinimal = minimal && _minimal;

            if (_isSinglePart)
            {
                if (useMinimal)
                    GetIndicesStreamCore<SinglePart, UseMinimal>(keys, results);
                else
                    GetIndicesStreamCore<SinglePart, NoMinimal>(keys, results);
            }
            else
            {
                if (useMinimal)
                    GetIndicesStreamCore<MultiPart, UseMinimal>(keys, results);
                else
                    GetIndicesStreamCore<MultiPart, NoMinimal>(keys, results);
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private void GetIndicesStreamCore<TPart, TMinimal>(ReadOnlySpan<TKey> keys, Span<nuint> results)
            where TPart : struct, IPartConstant
            where TMinimal : struct, IBoolConstant
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            var numKeys = _numKeys;

            ref TKey keysRef = ref MemoryMarshal.GetReference(keys);
            ref nuint resultsRef = ref MemoryMarshal.GetReference(results);

            for (int i = 0; i < keys.Length; i++)
            {
                ref TKey key = ref Unsafe.Add(ref keysRef, i);

                // Type checks resolved at compile-time per specialization
                var slot = typeof(TPart) == typeof(SinglePart)
                    ? GetIndexNoRemapSinglePart(key)
                    : GetIndexNoRemapMultiPart(key);

                if (typeof(TMinimal) == typeof(UseMinimal) && slot >= numKeys)
                {
                    var remapIndex = slot - numKeys;
                    slot = TRemappingStorage.Index(_remapStorage, remapIndex);
                }

                Unsafe.Add(ref resultsRef, i) = slot;
            }
        }


        // Prefetch-enabled streaming, this preformed worse than the naive version for C# ( unless we use AOT )
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void GetIndicesStreamPrefetch(ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal = true, int prefetchDistance = 32)
        {
            // Fall back to regular streaming if SSE2 prefetch not supported
            if (!Sse2.IsSupported)
            {
                GetIndicesStream(keys, results, minimal);
                return;
            }

            // Dispatch to specialized methods like Rust's const generics
            if (_isSinglePart)
            {
                if (minimal)
                    GetIndicesStreamPrefetchCore<SinglePart, UseMinimal>(keys, results, prefetchDistance);
                else
                    GetIndicesStreamPrefetchCore<SinglePart, NoMinimal>(keys, results, prefetchDistance);
            }
            else
            {
                if (minimal)
                    GetIndicesStreamPrefetchCore<MultiPart, UseMinimal>(keys, results, prefetchDistance);
                else
                    GetIndicesStreamPrefetchCore<MultiPart, NoMinimal>(keys, results, prefetchDistance);
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private void GetIndicesStreamPrefetchCore<TPart, TMinimal>(ReadOnlySpan<TKey> keys, Span<nuint> results, int prefetchDistance)
            where TPart : struct, IPartConstant
            where TMinimal : struct, IBoolConstant
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");


            // These will be compile-time constants due to generic specialization
            var isSinglePart = default(TPart).IsSinglePart;
            var useMinimal = default(TMinimal).Value;
            var numKeys = _numKeys;

            // Ring buffers for prefetching
            Span<HashValue> nextHashes = stackalloc HashValue[prefetchDistance];
            Span<ulong> nextBuckets = stackalloc ulong[prefetchDistance];

            ref var keysRef = ref MemoryMarshal.GetReference(keys);
            ref var resultsRef = ref MemoryMarshal.GetReference(results);

            unsafe
            {
                // Get raw pointers to ring buffers to avoid bounds checks
                fixed (HashValue* hashBufPtr = &MemoryMarshal.GetReference(nextHashes))
                fixed (ulong* bucketBufPtr = &MemoryMarshal.GetReference(nextBuckets))
                {
                    // Initialize and prefetch first batch
                    int leftover = prefetchDistance;
                    for (int i = 0; i < prefetchDistance; i++)
                    {
                        HashValue hash;
                        if (i < keys.Length)
                        {
                            var key = Unsafe.Add(ref keysRef, i);
                            hash = THasher.Hash(key, _seed);
                            leftover--;
                        }
                        else
                        {
                            hash = default; // clear other slots in once pass.
                        }

                        hashBufPtr[i] = hash;

                        bucketBufPtr[i] = Bucket(hashBufPtr[i]);

                        // Prefetch pilot data
                        Sse.Prefetch0(_pilots + bucketBufPtr[i]);
                    }

                    // Process main loop with prefetch pipeline
                    int processed = 0;
                    int mainLoopEnd = Math.Max(0, keys.Length - prefetchDistance);

                    while (processed < mainLoopEnd)
                    {
                        int idx = processed % prefetchDistance;

                        // Prefetch the next key and pilot first to overlap memory latency
                        var nextKey = Unsafe.Add(ref keysRef, processed + prefetchDistance);
                        var nextHash = THasher.Hash(nextKey, _seed);
                        var nextBucket = Bucket(nextHash);
                        Sse.Prefetch0(_pilots + nextBucket);

                        // Process the current key using previously prefetched data
                        var currentHash = hashBufPtr[idx];
                        var currentBucket = bucketBufPtr[idx];
                        var pilot = _pilots[currentBucket];
                        var slot = Slot(currentHash, pilot);

                        if (useMinimal && slot >= numKeys)
                            slot = TRemappingStorage.Index(_remapStorage, slot - numKeys);

                        Unsafe.Add(ref resultsRef, processed) = slot;

                        // Update the ring buffer with the next key and bucket
                        hashBufPtr[idx] = nextHash;
                        bucketBufPtr[idx] = nextBucket;

                        processed++;
                    }

                    // for _ in 0..B - self.leftover
                    int leftoverCount = prefetchDistance - leftover;
                    for (int i = 0; i < leftoverCount; i++)
                    {
                        int idx = processed % prefetchDistance;
                        var currentHash = hashBufPtr[idx];
                        var currentBucket = bucketBufPtr[idx];

                        var pilot = _pilots[currentBucket];
                        var slot = Slot(currentHash, pilot);

                        // JIT will optimize this branch away if useMinimal is false
                        if (useMinimal && slot >= numKeys)
                        {
                            slot = TRemappingStorage.Index(_remapStorage, slot - numKeys);
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

            var rng = new BouncyCastleChaCha8Rng(31415); // Strong RNG.

            // Create PartitionedBitVec once and reuse it across seed attempts
            using var taken = new PartitionedBitVec(_parts, _slotsPerPart);

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
                _seed = rng.NextUInt64();

                // Clear the taken bits for new attempt
                taken.Clear();

                if (TryBuildWithSeed(keys, _seed, taken, out stats))
                {
                    finalSeed = _seed;
                    // Return true with stats collected during construction
                    return true;
                }

                // If build failed, continue to next seed
            }
        }

        private bool TryBuildWithSeed(ReadOnlySpan<TKey> keys, ulong seed, PartitionedBitVec taken, out BucketStats? stats)
        {
            // Initialize stats
            stats = null;

            // Seed already assigned in ComputePilots before calling this method

            // Reset pilots
            NativeMemory.Clear(_pilots, _bucketsTotal);
            var hashArray = ArrayPool<HashValue>.Shared.Rent(keys.Length);

            try
            {
                var hashBuffer = hashArray.AsSpan(0, keys.Length);

                // First, hash all keys 
                for (int i = 0; i < keys.Length; i++)
                {
                    hashBuffer[i] = THasher.Hash(keys[i], seed);
                }

                // Sort by hash for part assignment using radix sort for O(n) performance
                // This is a critical hot path - sorting millions of hashes in-place
                RadixSort.SortHashValues(hashBuffer);

                // Check for duplicate hashes - if found, return false to retry with different seed
                for (int i = 1; i < hashBuffer.Length; i++)
                {
                    if (hashBuffer[i - 1].Full() == hashBuffer[i].Full())
                    {
                        return false; // Duplicate hashes found, retry needed
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

                // Process parts in parallel
                var parallelOptions = new ParallelOptions
                {
                    MaxDegreeOfParallelism = MaxParallelism
                };

                var success = 1L; // 1 = true, 0 = false for Interlocked
                var partStatsList = DEBUG_CONSTRUCTION ? new BucketStats[_parts] : null;

                Parallel.For(0, (int)_parts, parallelOptions, part =>
                {
                    if (Interlocked.Read(ref success) == 0) return; // Early exit if another thread failed

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
                        Interlocked.Exchange(ref success, 0L); // Atomically set to false
                    }
                    else if (partStatsList != null)
                    {
                        partStatsList[part] = partStats;
                    }
                });

                // After successful construction, create remap table if needed
                if (success == 0L || !TryRemapFreeSlots(taken))
                {
                    stats = null;
                    return false; // Construction failed - try next seed
                }

                // Aggregate statistics from all parts
                if (partStatsList != null)
                {
                    stats = new BucketStats();
                    foreach (var partStats in partStatsList)
                    {
                        if (partStats != null)
                        {
                            stats.Merge(partStats);
                        }
                    }
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


        private bool BuildPart(int part, ReadOnlySpan<HashValue> partHashes, Span<byte> partPilots, PartitionedBitVec taken, out BucketStats partStats)
        {
            // Initialize statistics collection
            partStats = new BucketStats();

            // Sort buckets within this part - use pooled arrays
            var (bucketStarts, bucketOrder) = BuildBucketInfo(part, partHashes);

            // Use the sorted hashes from here on - this is critical for deterministic ordering
            var hashesSpan = partHashes; // Already sorted from global radix sort

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

                var totalBuckets = (int)_bucketsPerPart; // Use actual bucket count, not pooled array length
                var processedBuckets = 0;

                for (int bucketIdx = 0; bucketIdx < (int)_bucketsPerPart; bucketIdx++) // Use actual bucket count
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

                    // Process eviction chain (let Some((_b_len, b)) = stack.pop())
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
                        var pilotResult = FindPilot(kmax, currentBucketHashes, partTaken, out var pilotsChecked);

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

                        // Handle case where no valid pilot was found
                        if (bestPilot == ulong.MaxValue)
                        {
                            DebugConstruction($"Part {part}: bucket of size {currentBucketHashes.Length} with {_slotsPerPart} slots: Indistinguishable hashes in bucket!");
                            for (int i = 0; i < currentBucketHashes.Length; i++)
                            {
                                var hash = currentBucketHashes[i];
                                var slot = SlotInPartHp(hash, HashPilot(0));
                                DebugConstruction($"  0x{hash.Full():X16} -> slot {slot}");
                            }
                            return false; // Failed to construct this part
                        }

                        // Set pilot and compute hash of pilot
                        partPilots[currentBucket] = (byte)bestPilot;
                        var hp = HashPilot(bestPilot);

                        // Collect statistics
                        var globalBucketId = (nuint)(part * (int)_bucketsPerPart + currentBucket);
                        partStats.Add(globalBucketId, _bucketsTotal, currentBucketHashes.Length, bestPilot, evictions);

                        var evictionsThisRound = 0;

                        // Single pass: handle eviction and placement atomically 
                        foreach (var hash in currentBucketHashes)
                        {
                            var localSlot = SlotInPartHp(hash, hp);
                            var occupyingBucket = slots[localSlot];

                            if (occupyingBucket >= 0) // Slot is occupied
                            {
                                // With atomic placement, self-collision should never happen 
                                // assert!(b2 != b)
                                if (occupyingBucket == currentBucket)
                                {
                                    DebugConstruction($"SELF-COLLISION DEBUG:");
                                    DebugConstruction($"  Current bucket: {currentBucket}");
                                    DebugConstruction($"  Selected pilot: {bestPilot}");
                                    DebugConstruction($"  Hash pilot: 0x{hp:X16}");
                                    DebugConstruction($"  Hash: 0x{hash.Full():X16}");
                                    DebugConstruction($"  Slot: {localSlot}");
                                    DebugConstruction($"  Occupying bucket: {occupyingBucket}");
                                    DebugConstruction($"  Bucket hashes: [{string.Join(", ", currentBucketHashes.ToArray().Select(h => $"0x{h.Full():X16}"))}]");
                                    throw new InvalidOperationException("Self-collision detected - algorithm invariant violated");
                                }

                                // Push evicted bucket onto stack for reprocessing
                                var evictedStart = bucketStarts[occupyingBucket];
                                var evictedEnd = bucketStarts[occupyingBucket + 1];
                                var evictedSize = evictedEnd - evictedStart;

                                stack.Push(new BucketInfo((nuint)evictedSize, (nuint)occupyingBucket));
                                evictions++;
                                evictionsThisRound++;

                                // Clear all slots for the evicted bucket immediately
                                var evictedPilot = (ulong)partPilots[occupyingBucket];
                                var evictedHp = HashPilot(evictedPilot);
                                var evictedHashes = hashesSpan.Slice(evictedStart, evictedSize);

                                foreach (var evictedHash in evictedHashes)
                                {
                                    var evictedLocalSlot = SlotInPartHp(evictedHash, evictedHp);
                                    slots[evictedLocalSlot] = -1;
                                    partTaken.Set(evictedLocalSlot, false);
                                }
                            }

                            // Always place current bucket in slot (this happens regardless of eviction)
                            slots[localSlot] = currentBucket;
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
                // Return all pooled arrays
                ArrayPool<int>.Shared.Return(slots);
                ArrayPool<int>.Shared.Return(bucketStarts);
                ArrayPool<int>.Shared.Return(bucketOrder);
            }
        }

        private (int[] bucketStarts, int[] bucketOrder) BuildBucketInfo(int part, ReadOnlySpan<HashValue> partHashesSorted)
        {

            // Create bucket starts array
            var bucketStartsPool = ArrayPool<int>.Shared;
            var bucketStarts = bucketStartsPool.Rent((int)_bucketsPerPart + 1); // +1 for end sentinel
            
            // Scan through sorted hashes to find bucket boundaries
            var end = 0;
            for (int b = 0; b < (int)_bucketsPerPart; b++)
            {
                bucketStarts[b] = end;
                
                // Find all hashes that belong to bucket b
                // NOTE: Many branch misses here
                while (end < partHashesSorted.Length)
                {
                    var globalBucket = (int)Bucket(partHashesSorted[end]);
                    var localBucket = globalBucket - part * (int)_bucketsPerPart;
                    if (localBucket != b) break;
                    end++;
                }
            }
            bucketStarts[_bucketsPerPart] = end; // Final sentinel
            
            // Create bucket order sorted by size (largest first)
            var bucketSizePool = ArrayPool<(int size, int bucket)>.Shared;
            var bucketSizes = bucketSizePool.Rent((int)_bucketsPerPart);
            
            try
            {
                // Calculate sizes
                for (int i = 0; i < (int)_bucketsPerPart; i++)
                {
                    var size = bucketStarts[i + 1] - bucketStarts[i];
                    bucketSizes[i] = (size, i);
                }
                
                // Sort by size descending (largest buckets first for better eviction performance)
                Array.Sort(bucketSizes, 0, (int)_bucketsPerPart, Comparer<(int size, int bucket)>.Create((a, b) =>
                {
                    var sizeCompare = b.size.CompareTo(a.size); // Descending
                    return sizeCompare != 0 ? sizeCompare : a.bucket.CompareTo(b.bucket);
                }));
                
                // Extract bucket order
                var bucketOrderPool = ArrayPool<int>.Shared;
                var bucketOrder = bucketOrderPool.Rent((int)_bucketsPerPart);
                for (int i = 0; i < (int)_bucketsPerPart; i++)
                {
                    bucketOrder[i] = bucketSizes[i].bucket;
                }
                
                return (bucketStarts, bucketOrder);
            }
            finally
            {
                bucketSizePool.Return(bucketSizes);
            }
        }


        private (ulong pilot, ulong hashPilot)? FindPilot(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked)
        {
            return FindPilotSlice(kmax, bucketHashes, taken, out pilotsChecked);
        }


        // Variable-size bucket processing for larger buckets (renamed from FindPilotInPart)
        private unsafe (ulong pilot, ulong hashPilot)? FindPilotSlice(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked)
        {
            // Sequential pilot search from 0 to kmax-1 with 4x loop unrolling (Section 3.3)
            int r = bucketHashes.Length / 4 * 4; // let r = bucket.len() / 4 * 4;

            pilotsChecked = 0;

            for (ulong pilot = 0; pilot < kmax; pilot++) // 'p: for p in 0u64..kmax
            {
                pilotsChecked++;
                var hp = HashPilot(pilot);

                // Process chunks of 4 bucket elements at a time
                bool hasCollision = false;
                for (int i = 0; i < r; i += 4)
                {
                    // Compute the four candidate slots
                    nuint slot0 = SlotInPartHp(bucketHashes[i], hp);
                    nuint slot1 = SlotInPartHp(bucketHashes[i + 1], hp);
                    nuint slot2 = SlotInPartHp(bucketHashes[i + 2], hp);
                    nuint slot3 = SlotInPartHp(bucketHashes[i + 3], hp);

                    // Use unchecked access for maximum performance
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

                // Check remaining elements
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

                // If no external collision, try to take this pilot
                if (TryTakePilotInPart(bucketHashes, pilot, taken)) // if self.try_take_pilot(bucket, hp, taken)
                {
                    return (pilot, hp); // return Some((p, hp))
                }
            }

            return null; // None
        }

        // try_take_pilot implementation - marks slots as taken with backtracking (Section 3.3)
        private unsafe bool TryTakePilotInPart(ReadOnlySpan<HashValue> bucketHashes, ulong pilot, BitVec taken)
        {
            var hp = HashPilot(pilot);

            // This bucket does not collide with previous buckets, but it may still collide with itself.
            for (int i = 0; i < bucketHashes.Length; i++)
            {
                var hash = bucketHashes[i];
                var localSlot = SlotInPartHp(hash, hp);

                if (taken.GetUnchecked(localSlot))
                {
                    // Collision within the bucket. Clean already set entries (Section 3.3 backtracking)
                    // for &hx in unsafe { bucket.get_unchecked(..i) }
                    for (int j = 0; j < i; j++)
                    {
                        var previousHash = bucketHashes[j];
                        var previousSlot = SlotInPartHp(previousHash, hp);
                        taken.SetUnchecked(previousSlot, false);
                    }
                    return false;
                }

                // Mark slot as taken immediately (Section 3.3)
                taken.SetUnchecked(localSlot, true);
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

                    //  : slots_tmp.clear(); slots_tmp.extend(slots_for_bucket(b, p));
                    for (int i = 0; i < bucketHashes.Length; i++)
                    {
                        slotsTmp[i] = SlotInPartHp(bucketHashes[i], hp);
                    }

                    //  : slots_tmp.sort_unstable();
                    // Use built-in sort - simpler and often faster than counting sort
                    slotsTmp.AsSpan(0, bucketHashes.Length).Sort();

                    //  : slots_tmp.iter().tuple_windows().any(|(a, b)| a == b)
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
                if (!TRemappingStorage.TryNew(remapValues, out _remapStorage))
                {
                    return false; // Remapping storage creation failed - retry with different seed
                }

            }
            finally
            {
                ArrayPool<ulong>.Shared.Return(remapArray);
            }
            return true;
        }

        #endregion

        #region Utility Methods

        private static nuint CalculateBucketsPerPart(nuint keysPerPart, double lambda)
        {
            return (nuint)Math.Ceiling(keysPerPart / lambda);
        }

        private static nuint CalculateSlotsPerPart(nuint keysPerPart, double alpha)
        {
            return (nuint)Math.Ceiling(keysPerPart / alpha);
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