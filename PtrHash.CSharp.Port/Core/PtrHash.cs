using System;
using System.Buffers;
using System.Collections.Generic;
using System.IO;
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
using PtrHash.CSharp.Port.Core.Serialization;

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
    /// </summary>
    /// <typeparam name="TKey">Type of keys</typeparam>
    /// <typeparam name="THasher">Hash function implementation</typeparam>
    /// <typeparam name="TBucketFunction">Bucket function implementation</typeparam>
    /// <typeparam name="TRemappingStorage">Remapping storage type for minimal mode</typeparam>
    public sealed unsafe partial class PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage, TPart> : IPtrHash<TKey>, IDisposable
        where THasher : struct, IKeyHasher<TKey>
        where TBucketFunction : struct, IBucketFunction
        where TRemappingStorage : struct, IRemappingStorage<TRemappingStorage>
        where TPart : struct, IPartConstant
    {

        // Debug feature flag
        public static bool DEBUG_CONSTRUCTION = false;

        private static void DebugConstruction(string message)
        {
            if (DEBUG_CONSTRUCTION)
                Console.WriteLine(message);
        }

        // Cap parallelism to prevent thread explosion
        private static readonly nuint MaxParallelism = (nuint)Environment.ProcessorCount;

        internal TBucketFunction _bucketFunction;

        internal TRemappingStorage _remapStorage;

        internal byte* _pilots;

        internal readonly nuint _parts;
        internal readonly nuint _slotsPerPart;
        internal readonly nuint _slotsTotal;
        internal readonly nuint _bucketsPerPart;
        internal readonly nuint _bucketsTotal;

        internal readonly FastReduce _remParts; // rem_parts: Rp::new(parts)
        internal readonly FastReduce _remBuckets; // rem_buckets: Rb::new(buckets_per_part)
        internal readonly FastReduce _remBucketsTotal; // rem_buckets_total: Rb::new(buckets_total)
        internal readonly FM32 _remSlots; // rem_slots: RemSlots::new(slots_per_part.max(1))

        internal readonly nuint _numKeys;
        internal readonly bool _minimal;
        internal readonly double _bitsPerKey;
        internal ulong _seed;
        
        private readonly bool _ownsMemory = true;

        /// <summary>
        /// Construct a PtrHash from a collection of keys
        /// </summary>
        public PtrHash(ReadOnlySpan<TKey> keys, PtrHashParams parameters)
        {
            if (keys.Length == 0)
                throw new ArgumentException("Keys collection cannot be empty", nameof(keys));
            
            _ownsMemory = true;

            try
            {
                _numKeys = (nuint)keys.Length;
                _minimal = parameters.Minimal;

                // Calculate parts and structure sizes
                if (typeof(TPart) == typeof(SinglePart))
                {
                    // Single part mode: all keys in one partition for faster queries
                    _parts = 1;
                    _slotsPerPart = CalculateSlotsPerPart(_numKeys, parameters.Alpha);
                    _slotsTotal = _slotsPerPart;
                    _bucketsPerPart = CalculateBucketsPerPart(_numKeys, parameters.Lambda);
                    _bucketsTotal = _bucketsPerPart;
                }
                else
                {
                    // Multi-part mode: partition keys for better cache locality and parallelism
                    var shards = 1;

                    // Formula of Vigna, eps-cost-sharding: https://arxiv.org/abs/2503.18397
                    // (1-alpha)/2, so that on average we still have some room to play with.
                    var eps = (1.0 - parameters.Alpha) / 2.0;
                    var x = _numKeys * eps * eps / 2.0;
                    var targetParts = x / Math.Log(x);

                    // In Rust, negative float as usize becomes 0. In C#, we need to handle this explicitly
                    var partsPerShard = targetParts > 0 ? (nuint)Math.Floor(targetParts) / (nuint)shards : 0;
                    _parts = Math.Max(1, partsPerShard) * (nuint)shards;

                    var keysPerPart = _numKeys / _parts;
                    partsPerShard = _parts / (nuint)shards;
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
                
                var pilotsPtr = (byte*)NativeMemory.AlignedAlloc(_bucketsTotal, 64);
                NativeMemory.Clear(pilotsPtr, _bucketsTotal);
                _pilots = pilotsPtr;

                _remapStorage = default;
                
                _remParts = new FastReduce(_parts);
                _remBuckets = new FastReduce(_bucketsPerPart);
                _remBucketsTotal = new FastReduce(_bucketsTotal);
                _remSlots = new FM32(Math.Max(1, _slotsPerPart));
                
                _bucketFunction = new TBucketFunction();
                _bucketFunction.SetBucketsPerPart(_bucketsPerPart);
                
                if (!ComputePilots(keys, out _seed, out var constructionStats))
                {
                    throw new PtrHashException("Failed to construct minimal perfect hash function. Try different parameters or check for duplicate keys.");
                }
                
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
                if (_pilots != null)
                {
                    NativeMemory.AlignedFree(_pilots);
                    _pilots = null;
                }
                _remapStorage.Dispose();
                throw;
            }
        }
        
        /// <summary>
        /// Construct a PtrHash from memory-mapped data (zero-copy).
        /// The caller is responsible for keeping the mapped memory alive.
        /// </summary>
        public unsafe PtrHash(byte* mappedDataPtr, nuint dataSize, in PtrHashFileFormat.FileHeader header)
        {
            if (mappedDataPtr == null)
                throw new ArgumentNullException(nameof(mappedDataPtr));
            if (dataSize < PtrHashFileFormat.HeaderSize)
                throw new ArgumentException("Data size too small for header", nameof(dataSize));
                
            ValidateTypes(header);
            _ownsMemory = false;
            
            _seed = header.Seed;
            _parts = (nuint)header.Parts;
            _bucketsPerPart = (nuint)header.BucketsPerPart;
            _slotsPerPart = (nuint)header.SlotsPerPart;
            _bucketsTotal = (nuint)header.BucketsTotal;
            _slotsTotal = (nuint)header.SlotsTotal;
            _numKeys = (nuint)header.NumKeys;
            _minimal = (header.Flags & PtrHashFileFormat.HeaderFlags.IsMinimal) != 0;

            _pilots = mappedDataPtr + PtrHashFileFormat.PilotsOffset;
            
            _remParts = new FastReduce(_parts);
            _remBuckets = new FastReduce(_bucketsPerPart);
            _remBucketsTotal = new FastReduce(_bucketsTotal);
            _remSlots = new FM32(Math.Max(1, _slotsPerPart));
            
            _bucketFunction = new TBucketFunction();
            _bucketFunction.SetBucketsPerPart(_bucketsPerPart);
            
            if (_minimal && header.RemapCount > 0)
            {
                var remapPtr = mappedDataPtr + header.RemapOffset;
                _remapStorage = TRemappingStorage.CreateFromMemoryMap(remapPtr, header.RemapCount);
            }
            else
            {
                _remapStorage = default;
            }
            
            var pilotBits = (ulong)(_bucketsTotal * 8);
            var remapBits = (ulong)(TRemappingStorage.GetSizeInBytes(_remapStorage) * 8);
            var totalBits = pilotBits + remapBits;
            _bitsPerKey = totalBits / (double)_numKeys;
        }
        
        /// <summary>
        /// Construct a PtrHash from a stream (copy-to-memory).
        /// </summary>
        public unsafe PtrHash(Stream stream, in PtrHashFileFormat.FileHeader header)
        {
            if (stream == null)
                throw new ArgumentNullException(nameof(stream));
                
            ValidateTypes(header);
            _ownsMemory = true;
            
            _seed = header.Seed;
            _parts = (nuint)header.Parts;
            _bucketsPerPart = (nuint)header.BucketsPerPart;
            _slotsPerPart = (nuint)header.SlotsPerPart;
            _bucketsTotal = (nuint)header.BucketsTotal;
            _slotsTotal = (nuint)header.SlotsTotal;
            _numKeys = (nuint)header.NumKeys;
            _minimal = (header.Flags & PtrHashFileFormat.HeaderFlags.IsMinimal) != 0;

            var pilotsPtr = (byte*)NativeMemory.AlignedAlloc(_bucketsTotal, 64);
            NativeMemory.Clear(pilotsPtr, _bucketsTotal);
            _pilots = pilotsPtr;
            
            try
            {
                var pilotsSpan = new Span<byte>(_pilots, (int)_bucketsTotal);
                stream.ReadExactly(pilotsSpan);
                
                var padding = AlignTo64(_bucketsTotal) - _bucketsTotal;
                if (padding > 0)
                {
                    stream.Seek((long)padding, SeekOrigin.Current);
                }
                
                _remParts = new FastReduce(_parts);
                _remBuckets = new FastReduce(_bucketsPerPart);
                _remBucketsTotal = new FastReduce(_bucketsTotal);
                _remSlots = new FM32(Math.Max(1, _slotsPerPart));

                _bucketFunction = new TBucketFunction();
                _bucketFunction.SetBucketsPerPart(_bucketsPerPart);
                
                if (_minimal && header.RemapCount > 0)
                {
                    _remapStorage = TRemappingStorage.Deserialize(stream, header.RemapCount);
                }
                else
                {
                    _remapStorage = default;
                }
                
                var pilotBits = (ulong)(_bucketsTotal * 8);
                var remapBits = (ulong)(TRemappingStorage.GetSizeInBytes(_remapStorage) * 8);
                var totalBits = pilotBits + remapBits;
                _bitsPerKey = totalBits / (double)_numKeys;
            }
            catch
            {
                if (_pilots != null)
                {
                    NativeMemory.AlignedFree(_pilots);
                    _pilots = null;
                }
                throw;
            }
        }
        
        private static nuint AlignTo64(nuint value)
        {
            return (value + 63) & ~(nuint)63;
        }

        public PtrHashInfo GetInfo()
        {
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
            var bucket = Bucket(hx, _remBucketsTotal, _remParts, _bucketsPerPart, _remBuckets, _bucketFunction);
            var pilot = (ulong)_pilots[bucket];
            return Slot(hx, pilot, _seed, _remParts, _slotsPerPart, _remSlots);
        }

        #endregion

        #region Single-Part Index Methods

        /// <summary>
        /// Faster version of GetIndex for when there is only a single part.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexSinglePart(TKey key)
        {
            var slot = GetIndexNoRemapSinglePart(key);
            return slot < _numKeys ? slot : TRemappingStorage.Index(_remapStorage, slot - _numKeys);
        }

        /// <summary>
        /// Faster version of GetIndexNoRemap for when there is only a single part, without remapping.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexNoRemapSinglePart(TKey key)
        {
            var hx = THasher.Hash(key, _seed);
            var bucket = BucketInPart(hx.High(), _remBuckets, _bucketFunction);
            var pilot = (ulong)_pilots[bucket];
            return SlotInPart(hx, pilot, _seed, _remSlots);
        }

        #endregion

        #region Unified Index Methods

        /// <summary>
        /// Automatically chooses single-part or multi-part implementation
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndex(TKey key)
        {
            return typeof(TPart) == typeof(SinglePart) ? GetIndexSinglePart(key) : GetIndexMultiPart(key);
        }

        /// <summary>
        /// Automatically chooses single-part or multi-part implementation
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexNoRemap(TKey key)
        {
            return typeof(TPart) == typeof(SinglePart) ? GetIndexNoRemapSinglePart(key) : GetIndexNoRemapMultiPart(key);
        }

        #endregion

        #region Core Hash Functions

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static ulong HashPilot(ulong pilot, ulong seed)
        {
            const ulong C = 0x51_7c_c1_b7_27_22_0a_95UL;
            return C * (pilot ^ seed);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static nuint GetPart(HashValue hx, FastReduce remParts)
        {
            return remParts.Reduce(hx.High());
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static nuint BucketInPart(ulong x, FastReduce remBuckets, TBucketFunction bucketFunction)
        {
            if (bucketFunction.IsLinear)
                return remBuckets.Reduce(x);
            else if (bucketFunction.BOutput)
                return (nuint)bucketFunction.Call(x);
            else
                return remBuckets.Reduce(bucketFunction.Call(x));
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static nuint Bucket(HashValue hx, FastReduce remBucketsTotal, FastReduce remParts, nuint bucketsPerPart, FastReduce remBuckets, TBucketFunction bucketFunction)
        {
            if (bucketFunction.IsLinear)
                return remBucketsTotal.Reduce(hx.High());
            var (part, remainder) = remParts.ReduceWithRemainder(hx.High());
            var bucket = BucketInPart(remainder, remBuckets, bucketFunction);
            return part * bucketsPerPart + bucket;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static nuint SlotInPartHp(HashValue hx, ulong hp, FM32 remSlots)
        {
            return remSlots.Reduce(hx.Low() ^ hp);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static nuint SlotInPart(HashValue hx, ulong pilot, ulong seed, FM32 remSlots)
        {
            return SlotInPartHp(hx, HashPilot(pilot, seed), remSlots);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static nuint Slot(HashValue hx, ulong pilot, ulong seed, FastReduce remParts, nuint slotsPerPart, FM32 remSlots)
        {
            return (GetPart(hx, remParts) * slotsPerPart) + SlotInPart(hx, pilot, seed, remSlots);
        }

        #endregion

        #region Streaming Methods

        public void GetIndicesStream<TMinimal>(ReadOnlySpan<TKey> keys, Span<nuint> results)
            where TMinimal : struct, IBoolConstant
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            var numKeys      = _numKeys;
            var remapStorage = _remapStorage;

            ref TKey  keysRef    = ref MemoryMarshal.GetReference(keys);
            ref nuint resultsRef = ref MemoryMarshal.GetReference(results);

            for (int i = 0; i < keys.Length; i++)
            {
                ref TKey key = ref Unsafe.Add(ref keysRef, i);

                var slot = typeof(TPart) == typeof(SinglePart)
                    ? GetIndexNoRemapSinglePart(key)
                    : GetIndexNoRemapMultiPart(key);

                if (typeof(TMinimal) == typeof(UseMinimal) && slot >= numKeys)
                {
                    var remapIndex = slot - numKeys;
                    slot = TRemappingStorage.Index(remapStorage, remapIndex);
                }

                Unsafe.Add(ref resultsRef, i) = slot;
            }
        }

        public void GetIndicesStreamPrefetch<TMinimal, TPrefetchDistance>(ReadOnlySpan<TKey> keys, Span<nuint> results)
            where TMinimal : struct, IBoolConstant
            where TPrefetchDistance : struct, IPrefetchDistanceConstant
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            uint B         = default(TPrefetchDistance).Value; // JIT constant after specialization
            var numKeys    = _numKeys;
            
            // Capture ALL fields the hot loop touches as locals.
            // The JIT reloads instance fields from `this` on every iteration.
            ulong             seed            = _seed;
            byte*             pilots          = _pilots;
            TRemappingStorage remapStorage    = _remapStorage;
            FastReduce        remBuckets      = _remBuckets;
            FastReduce        remBucketsTotal = _remBucketsTotal;
            FastReduce        remParts        = _remParts;
            FM32              remSlots        = _remSlots;
            nuint             slotsPerPart    = _slotsPerPart;
            nuint             bucketsPerPart  = _bucketsPerPart;
            TBucketFunction   bucketFunction  = _bucketFunction;

            HashValue* hashBuf   = stackalloc HashValue[(int)B];
            ulong*     bucketBuf = stackalloc ulong[(int)B];

            ref var keysRef    = ref MemoryMarshal.GetReference(keys);
            ref var resultsRef = ref MemoryMarshal.GetReference(results);

            // Phase: Init
            // Hash the first B keys, compute their buckets, and issue prefetches.
            uint initCount = (uint)Math.Min((int)B, keys.Length);
            for (uint i = 0; i < initCount; i++)
            {
                var hash   = THasher.Hash(Unsafe.Add(ref keysRef, (int)i), seed);
                hashBuf[i]   = hash;
                bucketBuf[i] = typeof(TPart) == typeof(SinglePart)
                    ? (ulong)BucketInPart(hash.High(), remBuckets, bucketFunction)
                    : Bucket(hash, remBucketsTotal, remParts, bucketsPerPart, remBuckets, bucketFunction);
                Sse.Prefetch0(pilots + bucketBuf[i]);
            }

            // Phase: Main loop
            // For each result slot [0 .. N-B):
            //   1. Read the ring-buffer entry for keys[processed]   (hash + bucket)
            //   2. Hash the look-ahead key keys[processed + B]
            //   3. Update the ring-buffer slot with the look-ahead data
            //   4. Prefetch the look-ahead pilot                    (hides DRAM latency)
            //   5. Read the current pilot                           (was prefetched B iterations ago)
            //   6. Compute the slot and optionally remap
            uint processed   = 0;
            uint mainLoopEnd = (uint)Math.Max(0, keys.Length - (int)B);

            while (processed < mainLoopEnd)
            {
                uint idx = processed % B;

                var currentHash   = hashBuf[idx];
                var currentBucket = bucketBuf[idx];

                var nextHash = THasher.Hash(Unsafe.Add(ref keysRef, (int)(processed + B)), seed);
                ulong nextBucket = typeof(TPart) == typeof(SinglePart)
                    ? (ulong)BucketInPart(nextHash.High(), remBuckets, bucketFunction)
                    : Bucket(nextHash, remBucketsTotal, remParts, bucketsPerPart, remBuckets, bucketFunction);

                hashBuf[idx]   = nextHash;
                bucketBuf[idx] = nextBucket;
                Sse.Prefetch0(pilots + nextBucket);

                ulong pilot = pilots[currentBucket];
                nuint slot  = typeof(TPart) == typeof(SinglePart)
                    ? SlotInPart(currentHash, pilot, seed, remSlots)
                    : Slot(currentHash, pilot, seed, remParts, slotsPerPart, remSlots);

                if (typeof(TMinimal) == typeof(UseMinimal) && slot >= numKeys)
                    slot = TRemappingStorage.Index(remapStorage, slot - numKeys);

                Unsafe.Add(ref resultsRef, (int)processed) = slot;
                processed++;
            }

            // Phase: Drain
            // Process the last B entries still sitting in the ring buffer (no new prefetches).
            while (processed < (uint)keys.Length)
            {
                uint idx    = processed % B;
                ulong pilot = pilots[bucketBuf[idx]];
                nuint slot  = typeof(TPart) == typeof(SinglePart)
                    ? SlotInPart(hashBuf[idx], pilot, seed, remSlots)
                    : Slot(hashBuf[idx], pilot, seed, remParts, slotsPerPart, remSlots);

                if (typeof(TMinimal) == typeof(UseMinimal) && slot >= numKeys)
                    slot = TRemappingStorage.Index(remapStorage, slot - numKeys);

                Unsafe.Add(ref resultsRef, (int)processed) = slot;
                processed++;
            }
        }

        #endregion

        #region Construction Methods

        private bool ComputePilots(ReadOnlySpan<TKey> keys, out ulong finalSeed, out BucketStats? stats)
        {
            stats = null;

            var tries = 0;
            const int MAX_TRIES = 10;

            var rng = new BouncyCastleChaCha8Rng(31415);

            // Create PartitionedBitVec once and reuse it across seed attempts
            using var taken = new PartitionedBitVec(_parts, _slotsPerPart);

            while (true)
            {
                tries++;
                if (tries > MAX_TRIES)
                {
                    DebugConstruction($"ERROR: PtrHash failed to find a global seed after {MAX_TRIES} tries.");
                    finalSeed = 0;
                    return false;
                }
                
                _seed = rng.NextUInt64();
                taken.Clear();

                if (TryBuildWithSeed(keys, _seed, taken, out stats))
                {
                    finalSeed = _seed;
                    return true;
                }

            }
        }

        private bool TryBuildWithSeed(ReadOnlySpan<TKey> keys, ulong seed, PartitionedBitVec taken, out BucketStats? stats)
        {
            stats = null;
            NativeMemory.Clear(_pilots, _bucketsTotal);
            var hashArray = ArrayPool<HashValue>.Shared.Rent(keys.Length);

            try
            {
                var hashBuffer = hashArray.AsSpan(0, keys.Length);
                
                for (int i = 0; i < keys.Length; i++)
                {
                    hashBuffer[i] = THasher.Hash(keys[i], seed);
                }

                // Sort by hash for part assignment using radix sort for O(n) performance
                // This is a hot path, sorting millions of hashes in-place
                RadixSort.SortHashValues(hashBuffer);

                // Check for duplicate hashes
                for (int i = 1; i < hashBuffer.Length; i++)
                {
                    if (hashBuffer[i - 1].Full() == hashBuffer[i].Full())
                    {
                        return false;
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
                        if (GetPart(hashBuffer[mid], _remParts) < part)
                            left = mid + 1;
                        else
                            right = mid;
                    }
                    partStarts[part] = (uint)left;
                }
                
                var parallelOptions = new ParallelOptions
                {
                    MaxDegreeOfParallelism = (int)Math.Min(_parts, MaxParallelism)
                };

                var success = 1L;
                var partStatsList = DEBUG_CONSTRUCTION ? new BucketStats[_parts] : null;

                Parallel.For(0, (int)_parts, parallelOptions, part =>
                {
                    if (Interlocked.Read(ref success) == 0) return;

                    var partStart = (int)partStarts[part];
                    var partEnd = (int)partStarts[part + 1];
                    var partHashes = new Span<HashValue>(hashArray, partStart, partEnd - partStart);

                    var partPilotStart = part * (int)_bucketsPerPart;
                    Span<byte> partPilots = new Span<byte>(_pilots + partPilotStart, (int)_bucketsPerPart);

                    if (!BuildPart(part, partHashes, partPilots, taken, out var partStats))
                    {
                        Interlocked.Exchange(ref success, 0L);
                    }
                    else if (partStatsList != null)
                    {
                        partStatsList[part] = partStats;
                    }
                });

                if (success == 0L || !TryRemapFreeSlots(taken))
                {
                    stats = null;
                    return false;
                }

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
                ArrayPool<HashValue>.Shared.Return(hashArray);
            }
        }

        private static bool IsPowerOfTwo(int value)
        {
            return value > 0 && (value & (value - 1)) == 0;
        }


        private bool BuildPart(int part, ReadOnlySpan<HashValue> partHashes, Span<byte> partPilots, PartitionedBitVec taken, out BucketStats partStats)
        {
            const ulong kmax = 256;
            
            partStats = new BucketStats();

            // Sort buckets within this part
            var (bucketStarts, bucketOrder) = BuildBucketInfo(part, partHashes);
            var slots = ArrayPool<int>.Shared.Rent((int)_slotsPerPart);
            
            try
            {
                Array.Fill(slots, -1, 0, (int)_slotsPerPart);
                
                var partTaken = taken.GetPart(part);

                var stack = new BinaryHeap<BucketInfo>();
                var recent = new int[16];
                Array.Fill(recent, -1);
                var rng = new FastRand();

                var processedBuckets = 0;

                for (int bucketIdx = 0; bucketIdx < (int)_bucketsPerPart; bucketIdx++)
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

                    // Push initial bucket onto eviction stack with size based priority
                    stack.Push(new BucketInfo((nuint)newBucketSize, (nuint)newBucket));
                    Array.Fill(recent, -1);
                    var recentIdx = 0;
                    recent[0] = newBucket;

                    var maxEvictionsForBucket = 0;

                    while (!stack.IsEmpty)
                    {
                        if (evictions >= 10 * (int)_slotsPerPart)
                        {
                            return false;
                        }

                        if (evictions > maxEvictionsForBucket)
                            maxEvictionsForBucket = evictions;

                        if (evictions > (int)_slotsPerPart && IsPowerOfTwo(evictions))
                        {
                            if (evictions >= 10 * (int)_slotsPerPart)
                            {
                                return false;
                            }
                        }

                        var bucketInfo = stack.Pop();
                        var currentBucket = (int)bucketInfo.BucketId;


                        var currentStart = bucketStarts[currentBucket];
                        var currentEnd = bucketStarts[currentBucket + 1];
                        var currentBucketHashes = partHashes.Slice(currentStart, currentEnd - currentStart);

                        if (currentBucketHashes.Length == 0)
                            continue;

                        var pilotResult = FindPilot(kmax, currentBucketHashes, partTaken, out var pilotsChecked);

                        if (pilotResult.HasValue)
                        {
                            var (pilot, hashPilot) = pilotResult.Value;
                            partPilots[currentBucket] = (byte)pilot;

                            foreach (var hash in currentBucketHashes)
                            {
                                var localSlot = SlotInPartHp(hash, hashPilot, _remSlots);
                                slots[localSlot] = currentBucket;
                            }
                            continue;
                        }

                        var bestResult = FindBestPilotWithEvictionInPart(currentBucketHashes, slots, recent, rng, kmax, bucketStarts);
                        var bestPilot = bestResult.pilot;

                        if (bestPilot == ulong.MaxValue)
                        {
                            DebugConstruction($"Part {part}: bucket of size {currentBucketHashes.Length} with {_slotsPerPart} slots: Indistinguishable hashes in bucket!");
                            for (int i = 0; i < currentBucketHashes.Length; i++)
                            {
                                var hash = currentBucketHashes[i];
                                var slot = SlotInPartHp(hash, HashPilot(0, _seed), _remSlots);
                                DebugConstruction($"  0x{hash.Full():X16} -> slot {slot}");
                            }
                            return false;
                        }

                        partPilots[currentBucket] = (byte)bestPilot;
                        var hp = HashPilot(bestPilot, _seed);
                        
                        var globalBucketId = (nuint)(part * (int)_bucketsPerPart + currentBucket);
                        partStats.Add(globalBucketId, _bucketsTotal, currentBucketHashes.Length, bestPilot, evictions);

                        var evictionsThisRound = 0;

                        foreach (var hash in currentBucketHashes)
                        {
                            var localSlot = SlotInPartHp(hash, hp, _remSlots);
                            var occupyingBucket = slots[localSlot];

                            if (occupyingBucket >= 0)
                            {
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

                                var evictedStart = bucketStarts[occupyingBucket];
                                var evictedEnd = bucketStarts[occupyingBucket + 1];
                                var evictedSize = evictedEnd - evictedStart;

                                stack.Push(new BucketInfo((nuint)evictedSize, (nuint)occupyingBucket));
                                evictions++;
                                evictionsThisRound++;

                                var evictedPilot = (ulong)partPilots[occupyingBucket];
                                var evictedHp = HashPilot(evictedPilot, _seed);
                                var evictedHashes = partHashes.Slice(evictedStart, evictedSize);

                                foreach (var evictedHash in evictedHashes)
                                {
                                    var evictedLocalSlot = SlotInPartHp(evictedHash, evictedHp, _remSlots);
                                    slots[evictedLocalSlot] = -1;
                                    partTaken.Set(evictedLocalSlot, false);
                                }
                            }
                            
                            slots[localSlot] = currentBucket;
                            partTaken.Set(localSlot, true);
                        }


                        recentIdx += 1;
                        recentIdx %= recent.Length;
                        recent[recentIdx] = currentBucket;
                    }

                    processedBuckets++;
                }

                return true;
            }
            finally
            {
                ArrayPool<int>.Shared.Return(slots);
                ArrayPool<int>.Shared.Return(bucketStarts);
                ArrayPool<int>.Shared.Return(bucketOrder);
            }
        }

        private (int[] bucketStarts, int[] bucketOrder) BuildBucketInfo(int part, ReadOnlySpan<HashValue> partHashesSorted)
        {
            var bucketStartsPool = ArrayPool<int>.Shared;
            var bucketStarts = bucketStartsPool.Rent((int)_bucketsPerPart + 1); // +1 for end sentinel
            
            var end = 0;
            for (int b = 0; b < (int)_bucketsPerPart; b++)
            {
                bucketStarts[b] = end;
                
                while (end < partHashesSorted.Length)
                {
                    var globalBucket = (int)Bucket(partHashesSorted[end], _remBucketsTotal, _remParts, _bucketsPerPart, _remBuckets, _bucketFunction);
                    var localBucket = globalBucket - part * (int)_bucketsPerPart;
                    if (localBucket != b) break;
                    end++;
                }
            }
            bucketStarts[_bucketsPerPart] = end;
            
            var bucketSizePool = ArrayPool<(int size, int bucket)>.Shared;
            var bucketSizes = bucketSizePool.Rent((int)_bucketsPerPart);
            
            try
            {
                for (int i = 0; i < (int)_bucketsPerPart; i++)
                {
                    var size = bucketStarts[i + 1] - bucketStarts[i];
                    bucketSizes[i] = (size, i);
                }
                
                Array.Sort(bucketSizes, 0, (int)_bucketsPerPart, Comparer<(int size, int bucket)>.Create((a, b) =>
                {
                    var sizeCompare = b.size.CompareTo(a.size);
                    return sizeCompare != 0 ? sizeCompare : a.bucket.CompareTo(b.bucket);
                }));
                
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
                return bucketHashes.Length switch
            {
                1 => FindPilotSlice<Size1>(kmax, bucketHashes, taken, out pilotsChecked),
                2 => FindPilotSlice<Size2>(kmax, bucketHashes, taken, out pilotsChecked),
                3 => FindPilotSlice<Size3>(kmax, bucketHashes, taken, out pilotsChecked),
                4 => FindPilotSlice<Size4>(kmax, bucketHashes, taken, out pilotsChecked),
                5 => FindPilotSlice<Size5>(kmax, bucketHashes, taken, out pilotsChecked),
                6 => FindPilotSlice<Size6>(kmax, bucketHashes, taken, out pilotsChecked),
                7 => FindPilotSlice<Size7>(kmax, bucketHashes, taken, out pilotsChecked),
                8 => FindPilotSlice<Size8>(kmax, bucketHashes, taken, out pilotsChecked),
                _ => FindPilotSlice<SizeGeneric>(kmax, bucketHashes, taken, out pilotsChecked),
            };
        }


        private unsafe (ulong pilot, ulong hashPilot)? FindPilotSlice<TSize>(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked)
            where TSize : struct, ISizeConstant
        {
            var sizeConst = default(TSize);
            var bucketSize = sizeConst.Value;
            
            var actualSize = bucketSize > 0 ? bucketSize : bucketHashes.Length;
            int r = actualSize / 4 * 4;

            pilotsChecked = 0;

            for (ulong pilot = 0; pilot < kmax; pilot++)
            {
                pilotsChecked++;
                var hp = HashPilot(pilot, _seed);

                bool hasCollision = false;

                for (int i = 0; i < r; i += 4)
                {
                    nuint slot0 = SlotInPartHp(bucketHashes[i], hp, _remSlots);
                    nuint slot1 = SlotInPartHp(bucketHashes[i + 1], hp, _remSlots);
                    nuint slot2 = SlotInPartHp(bucketHashes[i + 2], hp, _remSlots);
                    nuint slot3 = SlotInPartHp(bucketHashes[i + 3], hp, _remSlots);
                    
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
                
                for (int i = r; i < actualSize; i++)
                {
                    var hash = bucketHashes[i];
                    var localSlot = SlotInPartHp(hash, hp, _remSlots);
                    if (taken.GetUnchecked(localSlot)) // bad |= check(hx)
                    {
                        hasCollision = true;
                        break;
                    }
                }

                if (hasCollision) continue;

                if (TryTakePilotInPart(bucketHashes, pilot, taken))
                {
                    return (pilot, hp);
                }
            }

            return null;
        }

        private unsafe bool TryTakePilotInPart(ReadOnlySpan<HashValue> bucketHashes, ulong pilot, BitVec taken)
        {
            var hp = HashPilot(pilot, _seed);

            for (int i = 0; i < bucketHashes.Length; i++)
            {
                var hash = bucketHashes[i];
                var localSlot = SlotInPartHp(hash, hp, _remSlots);

                if (taken.GetUnchecked(localSlot))
                {
                    for (int j = 0; j < i; j++)
                    {
                        var previousHash = bucketHashes[j];
                        var previousSlot = SlotInPartHp(previousHash, hp, _remSlots);
                        taken.Set(previousSlot, false);
                    }
                    return false;
                }
                
                taken.Set(localSlot, true);
            }

            return true;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static bool IsInRecentArray(int[] recent, int bucket)
        {
            for (int i = 0; i < recent.Length; i++)
            {
                if (recent[i] == bucket)
                    return true;
            }
            return false;
        }
        
        private (ulong score, ulong pilot) FindBestPilotWithEvictionInPart(ReadOnlySpan<HashValue> bucketHashes, int[] slots, int[] recent, FastRand rng, ulong kmax, int[] bucketStarts)
        {
            var bestScore = ulong.MaxValue;
            var bestPilot = ulong.MaxValue;
            var startPilot = (ulong)rng.NextByte();
            var newBLen = (ulong)bucketHashes.Length;
            var slotsTmp = ArrayPool<nuint>.Shared.Rent(bucketHashes.Length);
            
            try
            {
                bool DuplicateSlots(ReadOnlySpan<HashValue> bucketHashes, ulong pilot)
                {
                    var hp = HashPilot(pilot, _seed);

                    for (int i = 0; i < bucketHashes.Length; i++)
                    {
                        slotsTmp[i] = SlotInPartHp(bucketHashes[i], hp, _remSlots);
                    }

                    slotsTmp.AsSpan(0, bucketHashes.Length).Sort();

                    for (int i = 0; i < bucketHashes.Length - 1; i++)
                    {
                        if (slotsTmp[i] == slotsTmp[i + 1])
                        {
                            return true;
                        }
                    }

                    return false;
                }

                for (ulong delta = 0; delta < kmax; delta++)
                {
                    var pilot = (startPilot + delta) % kmax;
                    var hp = HashPilot(pilot, _seed);

                    var collisionScore = 0UL;
                    var shouldSkip = false;

                    foreach (var hash in bucketHashes)
                    {
                        var localSlot = SlotInPartHp(hash, hp, _remSlots);
                        var occupyingBucket = slots[localSlot];

                        if (occupyingBucket == -1)
                        {
                            continue;
                        }
                        else if (IsInRecentArray(recent, occupyingBucket))
                        {
                            shouldSkip = true;
                            break;
                        }


                        var bucketSize = bucketStarts[occupyingBucket + 1] - bucketStarts[occupyingBucket];
                        var newScore = (ulong)(bucketSize * bucketSize);
                        collisionScore += newScore;

                        if (collisionScore >= bestScore)
                        {
                            shouldSkip = true;
                            break;
                        }
                    }

                    if (shouldSkip)
                        continue;

                    if (!DuplicateSlots(bucketHashes, pilot))
                    {
                        bestScore = collisionScore;
                        bestPilot = pilot;

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
                return false;
            }

            if (!_minimal || _slotsTotal == _numKeys)
            {
                _remapStorage = default;
                return true;
            }
            
            var maxRemapSize = (int)(_slotsTotal - _numKeys);
            var remapArray = ArrayPool<ulong>.Shared.Rent(maxRemapSize);
            var remapCount = 0;

            try
            {
                // get = |t: &Vec<BitVec>, idx: usize| t[idx / self.slots][idx % self.slots];
                bool Get(nuint idx)
                {
                    var part = idx / _slotsPerPart;
                    var localSlot = idx % _slotsPerPart;
                    return taken.Parts[part].Get(localSlot);
                }

                // for i in taken.iter().enumerate().flat_map(|(p, t)| t.iter_zeros().map(move |i| offset + i)).take_while(|&i| i < self.n)
                foreach (var freeSlotIndex in taken.IterZeros())
                {
                    if (freeSlotIndex >= _numKeys) // take_while(|&i| i < self.n) - stop when we exceed n
                        break;

                    var i = (uint)freeSlotIndex;
                    while (!Get(_numKeys + (nuint)remapCount))
                    {
                        remapArray[remapCount++] = i;
                    }
                    remapArray[remapCount++] = i;
                }

                var remapValues = remapArray.AsSpan(0, remapCount);
                if (!TRemappingStorage.TryNew(remapValues, out _remapStorage))
                {
                    return false;
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
                    if (_ownsMemory && _pilots != null)
                    {
                        NativeMemory.AlignedFree(_pilots);
                        _pilots = null;
                    }
                }

                if (_ownsMemory)
                {
                    _remapStorage.Dispose();
                }

                _disposed = true;
            }
        }

        #endregion
    }

}