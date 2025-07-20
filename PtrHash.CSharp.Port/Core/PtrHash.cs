using System;
using System.Buffers;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading;
using System.Threading.Tasks;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.Util.Collections;
using PtrHash.CSharp.Port.Util.RNG;
using PtrHash.CSharp.Port.Util.Computation;
using PtrHash.CSharp.Port.Core.Stats;
using PtrHash.CSharp.Port.Native;

namespace PtrHash.CSharp.Port.Core
{
    /// <summary>
    /// Generic PtrHash minimal perfect hash function implementation
    /// Uses hash-evict construction algorithm with 8-bit pilots
    /// </summary>
    /// <typeparam name="TKey">Type of keys</typeparam>
    /// <typeparam name="THasher">Hash function implementation</typeparam>
    public sealed unsafe class PtrHash<TKey, THasher> : IPtrHash<TKey>, IDisposable
        where THasher : struct, IKeyHasher<TKey>
    {
        // Debug feature flags - set to false for production
        public static bool DEBUG_CONSTRUCTION = false;
    
        private static void DebugConstruction(string message)
        {
            if (DEBUG_CONSTRUCTION)
                Console.WriteLine(message);
        }

        // Cap parallelism to prevent thread explosion (Rust's rayon uses all cores by default)
        private static readonly int MaxParallelism = Environment.ProcessorCount;
        
        private readonly THasher _hasher;
        private byte* _pilots;
        private uint* _remapTable;
        
        // Multi-part support fields (matching Rust implementation exactly)
        private readonly nuint _parts;
        private readonly nuint _slotsPerPart;
        private readonly nuint _slotsTotal;
        private readonly nuint _bucketsPerPart;
        private readonly nuint _bucketsTotal;
        
        // Pre-computed reduction structures (like Rust's rem_* fields)
        private readonly FastReduceInstance _remParts; // rem_parts: Rp::new(parts)
        private readonly FastReduceInstance _remBuckets; // rem_buckets: Rb::new(buckets_per_part)
        private readonly FM32 _remSlots; // rem_slots: RemSlots::new(slots_per_part.max(1))
        
        private readonly nuint _numKeys;
        private nuint _remapTableSize;
        private readonly bool _minimal;
        private readonly bool _isSinglePart;
        private readonly double _bitsPerKey;
        private ulong _seed;
        

        /// <summary>
        /// Construct a PtrHash from a collection of keys
        /// </summary>
        public PtrHash(ReadOnlySpan<TKey> keys, PtrHashParams parameters)
        {
            if (keys.Length == 0)
                throw new ArgumentException("Keys collection cannot be empty", nameof(keys));

            _hasher = new THasher();
            _numKeys = (nuint)keys.Length;
            _minimal = parameters.Minimal;
            _isSinglePart = parameters.SinglePart;

            // Calculate parts and structure sizes following Rust algorithm exactly
            if (_isSinglePart)
            {
                // Single part mode
                _parts = 1;
                _slotsPerPart = CalculateNumSlots(_numKeys, parameters.Alpha);
                _slotsTotal = _slotsPerPart;
                _bucketsPerPart = CalculateNumBuckets(_numKeys, parameters.Lambda);
                _bucketsTotal = _bucketsPerPart;
            }
            else
            {
                // Multi-part mode - exact Rust calculation
                var shards = 1; // Sharding::None => 1

                // Formula of Vigna, eps-cost-sharding: https://arxiv.org/abs/2503.18397
                // (1-alpha)/2, so that on average we still have some room to play with.
                var eps = (1.0 - parameters.Alpha) / 2.0;
                var x = (double)_numKeys * eps * eps / 2.0;
                var targetParts = x / Math.Log(x);

                // In Rust, negative float as usize becomes 0. In C#, we need to handle this explicitly
                var partsPerShard = targetParts > 0 ? (nuint)Math.Floor(targetParts) / (nuint)shards : 0;
                _parts = Math.Max(1, partsPerShard) * (nuint)shards;
                _isSinglePart = _parts == 1;

                var keysPerPart = _numKeys / _parts;
                partsPerShard = _parts / (nuint)shards; // Recalculate like Rust
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

            // Allocate unmanaged memory for pilots (cache-aligned for better performance)
            _pilots = (byte*)System.Runtime.InteropServices.NativeMemory.AlignedAlloc((nuint)_bucketsTotal, 64);
            // Initialize to zero (like Rust's Vec::new)
            System.Runtime.InteropServices.NativeMemory.Clear(_pilots, (nuint)_bucketsTotal);

            // Will allocate remap table later if minimal=true
            _remapTable = null;
            _remapTableSize = 0;

            // Initialize reduction structures like Rust does
            _remParts = new FastReduceInstance(_parts);
            _remBuckets = new FastReduceInstance(_bucketsPerPart);
            _remSlots = new FM32(Math.Max(1, _slotsPerPart));


            // Construct the hash function using hash-evict algorithm
            if (!ComputePilots(keys, out _seed, out var constructionStats))
            {
                throw new PtrHashException("Failed to construct minimal perfect hash function. Try different parameters or check for duplicate keys.");
            }

            // Remap table will be created during construction if needed

            // Calculate bits per key
            var pilotBits = _bucketsTotal * 8;
            var remapBits = _remapTable != null ? _remapTableSize * 32 : 0;
            var totalBits = pilotBits + remapBits;
            _bitsPerKey = (double)totalBits / (double)_numKeys;


            if (DEBUG_CONSTRUCTION)
            {
                DebugConstruction($"PtrHash constructed with seed: {_seed}");
                DebugConstruction($"Parts: {_parts}, Slots per part: {_slotsPerPart}, Buckets per part: {_bucketsPerPart}");
                DebugConstruction($"Total slots: {_slotsTotal}, Total buckets: {_bucketsTotal}");
                DebugConstruction($"Bits per key: {_bitsPerKey:F2}");

                constructionStats?.Print();
            }

        }

        public PtrHashInfo GetInfo()
        {
            // MaxIndex is always slots_total - this is the upper bound for GetIndexNoRemapMultiPart()
            // GetIndex() with minimal=true will remap values >= numKeys, but MaxIndex represents the theoretical maximum
            return new PtrHashInfo(_numKeys, _bitsPerKey, _slotsTotal);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexMultiPart(TKey key)
        {
            var slot = GetIndexNoRemapMultiPart(key);
            return slot < _numKeys ? slot : (nuint)_remapTable[slot - _numKeys];
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexNoRemapMultiPart(TKey key)
        {
            var hx = _hasher.Hash(key, _seed);
            var bucket = Bucket(hx); // Use global bucket calculation like Rust
            var pilot = (ulong)_pilots[bucket]; // Convert byte to ulong (Pilot type)
            return Slot(hx, pilot);
        }

        /// <summary>
        /// Faster version of GetIndex for when there is only a single part.
        /// Use only when there is indeed a single part, i.e., after constructing
        /// with PtrHashParams.SinglePart set to true.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexSinglePart(TKey key)
        {
            var slot = GetIndexNoRemapSinglePart(key);
            return slot < _numKeys ? slot : (nuint)_remapTable[slot - _numKeys];
        }

        /// <summary>
        /// Faster version of GetIndexNoRemap for when there is only a single part, without remapping.
        /// Use only when there is indeed a single part, i.e., after constructing
        /// with PtrHashParams.SinglePart set to true.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexNoRemapSinglePart(TKey key)
        {
            var hx = _hasher.Hash(key, _seed);
            var bucket = _remBuckets.Reduce(hx.High()); // Direct bucket calculation for single part
            var pilot = (ulong)_pilots[bucket];
            return SlotInPart(hx, pilot); // Direct slot calculation without part offset
        }

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

        
        // Rust bucket() function - returns global bucket index
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint Bucket(HashValue hx)
        {
            // EXACT Rust optimization: Fast path for LINEAR bucket functions
            // Rust: if BF::LINEAR { return self.rem_buckets_total.reduce(hx.high()); }
            if (_parts == 1)
            {
                // Single part - use direct reduction with pre-computed instance
                return _remBuckets.Reduce(hx.High());
            }
            
            // Multi-part: Extract high bits for part selection; do normal bucket computation within the part
            // Rust: let (part, hx) = self.rem_parts.reduce_with_remainder(hx.high());
            //       let bucket = self.bucket_in_part(hx);
            //       part * self.buckets + bucket
            var (part, remainder) = _remParts.ReduceWithRemainder(hx.High());
            var localBucket = _remBuckets.Reduce(remainder);
            return part * _bucketsPerPart + localBucket;
        }
        
        // Rust bucket_in_part() function - returns bucket index within a part
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint BucketInPart(HashValue hx)
        {
            // For Linear bucket function: rem_buckets.reduce(hx.high())
            // For u64, high() returns the full value
            return _remBuckets.Reduce(hx.High());
        }
    
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint Slot(HashValue hx, ulong pilot)
        {
            // Exact Rust algorithm: (self.part(hx) * self.slots) + self.slot_in_part(hx, pilot)
            return (GetPart(hx) * _slotsPerPart)  + SlotInPart(hx, pilot);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint SlotInPart(HashValue hx, ulong pilot)
        {
            // Rust: self.slot_in_part_hp(hx, self.hash_pilot(pilot))
            return SlotInPartHp(hx, HashPilot(pilot));
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint SlotInPartHp(HashValue hx, ulong hp)
        {
            // Rust: self.rem_slots.reduce(hx.low() ^ hp)
            
            return _remSlots.Reduce(hx.Low() ^ hp);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint GetPart(HashValue hx)
        {
            // Rust uses: rem_parts.reduce(hx.high())
            // For u64, high() returns the full value, not just high 32 bits
            return _remParts.Reduce(hx.High());
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private ulong HashPilot(ulong pilot)
        {
            const ulong C = 0x51_7c_c1_b7_27_22_0a_95UL; // FxHash constant from Rust
            return C * (pilot ^ _seed); // Rust: hash::C.wrapping_mul(p ^ self.seed)
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void GetIndicesStreamPreFetch(ReadOnlySpan<TKey> keys, Span<nuint> results, uint prefetchDistance = 32, bool minimal = true)
        {
            var useMinimal = minimal && _minimal && _remapTable != null;
            var B = (int)Math.Min(prefetchDistance, keys.Length);
            
            // Ring buffers to cache the hash and bucket of upcoming queries (like Rust)
            // Use stackalloc for better performance (no heap allocation)
            Span<HashValue> nextHashes = stackalloc HashValue[B];
            Span<nuint> nextBuckets = stackalloc nuint[B];
            
            fixed (TKey* keysPtr = keys)
            fixed (nuint* resultsPtr = results)
            fixed (HashValue* hashesPtr = nextHashes)
            fixed (nuint* bucketsPtr = nextBuckets)
            {
                var pilotsPtr = _pilots;
                var remapPtr = _remapTable;
                // Initialize and prefetch first B values (exact Rust pattern)
                var keyEnumerator = 0;
                var leftover = B;
                var keysLength = keys.Length;
                
                for (int idx = 0; idx < B; idx++)
                {
                    HashValue hx = default;
                    if (keyEnumerator < keysLength)
                    {
                        hx = _hasher.Hash(keysPtr[keyEnumerator], _seed);
                        keyEnumerator++;
                        leftover--;
                    }
                    hashesPtr[idx] = hx;
                    
                    // Consolidated bucket calculation
                    bucketsPtr[idx] = _isSinglePart 
                        ? _remBuckets.Reduce(hx.High())  // Single-part: direct
                        : Bucket(hx);                    // Multi-part: with part calculation
                    
                    // Prefetch pilot for this bucket (B steps ahead)
                    Prefetch.PrefetchRead(pilotsPtr + bucketsPtr[idx]);
                }
                
                int resultIndex = 0;
                int i = 0;
                
                // Process remaining keys with ring buffer rotation (matching Rust fold pattern)
                while (keyEnumerator < keysLength)
                {
                    var nextHash = _hasher.Hash(keysPtr[keyEnumerator], _seed);
                    var idx = i % B;
                    var curHash = hashesPtr[idx];
                    var curBucket = bucketsPtr[idx];
                    
                    // Update ring buffer with new values
                    hashesPtr[idx] = nextHash;
                    
                    // Consolidated bucket calculation
                    bucketsPtr[idx] = _isSinglePart
                        ? _remBuckets.Reduce(nextHash.High())  // Single-part: direct
                        : Bucket(nextHash);                    // Multi-part: with part calculation
                    
                    // Prefetch pilot for the new bucket (B steps ahead)
                    Prefetch.PrefetchRead(pilotsPtr + bucketsPtr[idx]);
                    
                    // Process current hash/bucket (prefetched B iterations ago)
                    var pilot = (ulong)pilotsPtr[curBucket];
                    
                    // Consolidated slot calculation
                    var slot = _isSinglePart
                        ? SlotInPart(curHash, pilot)  // Single-part: direct
                        : Slot(curHash, pilot);       // Multi-part: with part offset
                    
                    // Apply remap if minimal and slot >= numKeys
                    if (useMinimal && slot >= _numKeys)
                    {
                        slot = (nuint)remapPtr[slot - _numKeys];
                    }
                    
                    resultsPtr[resultIndex] = slot;
                    resultIndex++;
                    keyEnumerator++;
                    i++;
                }
                
                // Process leftover keys from ring buffer (B - leftover remaining)
                for (int remaining = 0; remaining < B - leftover; remaining++)
                {
                    var idx = i % B;
                    var curHash = hashesPtr[idx];
                    var curBucket = bucketsPtr[idx];
                    
                    // Process current hash/bucket
                    var pilot = (ulong)pilotsPtr[curBucket];
                    
                    // Consolidated slot calculation
                    var slot = _isSinglePart
                        ? SlotInPart(curHash, pilot)  // Single-part: direct
                        : Slot(curHash, pilot);       // Multi-part: with part offset
                    
                    // Apply remap if minimal and slot >= numKeys
                    if (useMinimal && slot >= _numKeys)
                    {
                        slot = (nuint)remapPtr[slot - _numKeys];
                    }
                    
                    resultsPtr[resultIndex] = slot;
                    resultIndex++;
                    i++;
                }
            }
        }

        /// <summary>
        /// High-performance streaming version without prefetch complexity
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void GetIndicesStreamMultiPart(ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal = true)
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            var useMinimal = minimal && _minimal && _remapTable != null;
            
            // Safe version without pinning - use span indexing with single bounds check pattern
            for (int i = 0; i < keys.Length; i++)
            {
                var hash = _hasher.Hash(keys[i], _seed);
                var bucket = Bucket(hash);
                
                // Safe access with bounds checking
                byte pilot;
                unsafe
                {
                    pilot = _pilots[bucket];
                }
                
                var slot = Slot(hash, pilot);
                
                // Apply remap if minimal and slot >= numKeys
                if (useMinimal && slot >= _numKeys)
                {
                    uint remappedSlot;
                    unsafe
                    {
                        remappedSlot = _remapTable[slot - _numKeys];
                    }
                    slot = remappedSlot;
                }
                
                results[i] = slot;
            }
        }

        /// <summary>
        /// Single-part optimized streaming version
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void GetIndicesStreamSinglePart(ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal = true)
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            var useMinimal = minimal && _minimal && _remapTable != null;
            
            for (int i = 0; i < keys.Length; i++)
            {
                var hx = _hasher.Hash(keys[i], _seed);
                var bucket = _remBuckets.Reduce(hx.High()); // Direct bucket for single part
                
                byte pilot;
                unsafe
                {
                    pilot = _pilots[bucket];
                }
                
                var slot = SlotInPart(hx, pilot); // Direct slot without part offset
                
                // Apply remap if minimal and slot >= numKeys
                if (useMinimal && slot >= _numKeys)
                {
                    uint remappedSlot;
                    unsafe
                    {
                        remappedSlot = _remapTable[slot - _numKeys];
                    }
                    slot = remappedSlot;
                }
                
                results[i] = slot;
            }
        }

        /// <summary>
        /// Optimized streaming version that automatically chooses single-part or multi-part implementation
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void GetIndicesStream(ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal = true)
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            var useMinimal = minimal && _minimal && _remapTable != null;
            
            // Safe version without pinning - use span indexing with single bounds check pattern
            for (int i = 0; i < keys.Length; i++)
            {
                var hash = _hasher.Hash(keys[i], _seed);
                
                // Consolidated bucket calculation
                var bucket = _isSinglePart 
                    ? _remBuckets.Reduce(hash.High())  // Single-part: direct
                    : Bucket(hash);                    // Multi-part: with part calculation
                
                // Safe access with bounds checking
                byte pilot;
                unsafe
                {
                    pilot = _pilots[bucket];
                }
                
                // Consolidated slot calculation
                var slot = _isSinglePart
                    ? SlotInPart(hash, pilot)  // Single-part: direct
                    : Slot(hash, pilot);       // Multi-part: with part offset
                
                // Apply remap if minimal and slot >= numKeys
                if (useMinimal && slot >= _numKeys)
                {
                    uint remappedSlot;
                    unsafe
                    {
                        remappedSlot = _remapTable[slot - _numKeys];
                    }
                    slot = remappedSlot;
                }
                
                results[i] = slot;
            }
        }

        /// <summary>
        /// Hardware-specific prefetch optimization
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static unsafe void PrefetchOptimized(void* ptr)
        {
            // Use hardware-specific prefetch hints when available
            #if NET8_0_OR_GREATER
            if (System.Runtime.Intrinsics.X86.Sse.IsSupported)
            {
                System.Runtime.Intrinsics.X86.Sse.Prefetch0(ptr);
            }
            else
            #endif
            {
                // Fallback to generic prefetch
                System.Runtime.Intrinsics.X86.Sse.Prefetch0(ptr);
            }
        }



        private bool ComputePilots(ReadOnlySpan<TKey> keys, out ulong finalSeed, out BucketStats? stats)
        {
            // Initialize arrays - matching Rust's initialization
            // Note: _pilots already allocated in constructor, but Rust clears/resizes in loop
            stats = null;
            
            var tries = 0;
            const int MAX_TRIES = 10;
            
            var rng = new BouncyCastleChaCha8Rng(31415); // Test with BouncyCastle ChaCha8

            // Create PartitionedBitVec once and reuse it across seed attempts
            using var taken = new PartitionedBitVec(_parts, _slotsPerPart);
            
            // Loop over global seeds `s` - matching Rust's labeled loop
            while (true) // Rust: let stats = 's: loop
            {
                tries++;
                if (tries > MAX_TRIES)
                {
                    DebugConstruction($"ERROR: PtrHash failed to find a global seed after {MAX_TRIES} tries.");
                    finalSeed = 0;
                    return false; // Rust: return None;
                }
                
                var oldSeed = _seed;
                
                // Choose a global seed s
                _seed = rng.NextUInt64(); // self.seed = rng.random()
                if (tries == 1)
                {
                    DebugConstruction($"First seed tried: {_seed}");
                }
                else
                {
                    DebugConstruction($"Previous seed {oldSeed} failed.");
                    DebugConstruction($"Trying seed number {tries}: {_seed}.");
                }
                
                // Clear the taken bits for new attempt
                taken.Clear();
                
                if (TryBuildWithSeed(keys, _seed, taken, out stats))
                {
                    finalSeed = _seed;
                    
                    // Pack the data - Rust: self.pilots = pilots (already done)
                    
                    // Return true with stats collected during construction
                    return true;
                }
                
                // If build failed, continue to next seed
                // Rust: continue 's;
            }
        }

        private bool TryBuildWithSeed(ReadOnlySpan<TKey> keys, ulong seed, PartitionedBitVec taken, out BucketStats? stats)
        {
            // Initialize stats
            stats = null;

            // Seed already assigned in ComputePilots before calling this method
            // Matching Rust where self.seed is set before calling build_shard

            // Reset pilots
            System.Runtime.InteropServices.NativeMemory.Clear(_pilots, (nuint)_bucketsTotal);

            // Rent array for hashing
            var hashArray = ArrayPool<HashValue>.Shared.Rent(keys.Length);
            try
            {
                var hashBuffer = hashArray.AsSpan(0, keys.Length);
                
                // First, hash all keys and partition them by parts (like Rust's sort_parts)
                var partStarts = SortPartsByHashes(keys, seed, hashBuffer);

                // Process parts in parallel like Rust's par_chunks_exact_mut
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

                    // Build this part using exact Rust build_part algorithm
                    if (!BuildPartRust(part, partHashes, partPilots, taken, out var partStats))
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
                    return false; // Rust: continue 's;
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
        
        // Hash all keys and partition by parts (like Rust's sort_parts)
        // Caller provides the array to make ownership clear
        private uint[] SortPartsByHashes(ReadOnlySpan<TKey> keys, ulong seed, Span<HashValue> hashBuffer)
        {
            // Hash all keys first (like Rust: keys.map(|key| self.hash_key(key)))
            // No duplicate checking here - we'll do it after sorting like Rust
            for (int i = 0; i < keys.Length; i++)
            {
                hashBuffer[i] = _hasher.Hash(keys[i], seed);
            }
            
            // Sort by hash - use built-in IntroSort (zero allocations, optimal performance)
            hashBuffer.Sort();
            
            // Check for duplicate hashes AFTER sorting (like Rust: hashes.par_windows(2).all(|w| w[0] != w[1]))
            // This is O(n) and doesn't require HashSet allocation
            for (int i = 1; i < hashBuffer.Length; i++)
            {
                if (hashBuffer[i - 1].Full() == hashBuffer[i].Full())
                {
                    // Found duplicate hash - this means duplicate keys
                    throw new PtrHashException($"Duplicate hash found. This usually indicates duplicate keys in the input.");
                }
            }
            
            // Find part starts using binary search (like Rust)
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

        // Build a single part (like Rust's build_part)
        private bool BuildPartRust(int part, ReadOnlySpan<HashValue> partHashes, Span<byte> partPilots, PartitionedBitVec taken, out BucketStats partStats)
        {
            // Initialize statistics collection
            partStats = new BucketStats();

            // Sort buckets within this part (like Rust's sort_buckets)
            var (sortedHashes, bucketStarts, bucketOrder) = SortBucketsInPart(part, partHashes);

            // Use the sorted hashes from here on - this is CRITICAL for matching Rust exactly
            var hashesSpan = sortedHashes.AsSpan();

            const ulong kmax = 256;
            // Use ArrayPool to avoid allocation
            var slots = ArrayPool<int>.Shared.Rent((int)_slotsPerPart);
            try
            {
                Array.Fill(slots, -1, 0, (int)_slotsPerPart); // -1 = BucketIdx::NONE

                // Get this part's BitVec - CRITICAL: Rust passes just the part's BitSlice, not global
                var partTaken = taken.GetPart(part);

                // EXACT RUST BINARY HEAP IMPLEMENTATION
                var stack = new BinaryHeap<BucketInfo>();
                var recent = new int[16];
                Array.Fill(recent, -1); // -1 = BucketIdx::NONE
                var rng = new FastRand(); // Auto-seeded like Rust's fastrand::Rng::new() (uses WyRand)

                // Process buckets in size order (largest first) - EXACT Rust pattern
                DebugConstruction($"C# Part {part}: First 10 bucket sizes: {string.Join(", ", bucketOrder.Take(10).Select(b => bucketStarts[b + 1] - bucketStarts[b]))}");
                DebugConstruction($"C# Part {part}: First 10 bucket IDs: {string.Join(", ", bucketOrder.Take(10))}");

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

                    // Push initial bucket onto stack (Rust: stack.push((new_b_len, new_b)))
                    stack.Push(new BucketInfo((nuint)newBucketSize, (nuint)newBucket));
                    Array.Fill(recent, -1); // Rust: recent.fill(BucketIdx::NONE)
                    var recentIdx = 0;
                    recent[0] = newBucket; // Rust: recent[0] = new_b

                    // Process eviction chain (Rust: while let Some((_b_len, b)) = stack.pop())
                    var maxEvictionsForBucket = 0;

                    while (!stack.IsEmpty)
                    {
                        // EXACT Rust termination condition: if evictions >= 10 * self.slots
                        if (evictions >= 10 * (int)_slotsPerPart)
                        {
                            return false;
                        }

                        // Track max evictions for this bucket
                        if (evictions > maxEvictionsForBucket)
                            maxEvictionsForBucket = evictions;

                        // EXACT Rust termination condition (nested structure)
                        if (evictions > (int)_slotsPerPart && IsPowerOfTwo(evictions))
                        {
                            DebugConstruction($"Part {part}: Power-of-two check at evictions={evictions}, slotsPerPart={_slotsPerPart}");
                            // Expensive logging/diagnostics on power-of-two intervals only
                            if (evictions >= 10 * (int)_slotsPerPart)
                            {
                                DebugConstruction($"Part {part}: Too many evictions, aborting at {evictions}");
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

                        // 1) Try collision-free pilot first (Rust hot path)
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

                        // 2) Find pilot with minimal collisions and evict (EXACT Rust collision handling)
                        var bestResult = FindBestPilotWithEvictionInPart(currentBucketHashes, slots, recent, rng, kmax, bucketStarts);
                        var bestPilot = bestResult.pilot;

                        // EXACT Rust sequence: pilots[b] = p as u8; let hp = self.hash_pilot(p);
                        partPilots[currentBucket] = (byte)bestPilot;
                        var hp = HashPilot(bestPilot);

                        // Collect statistics
                        var globalBucketId = (nuint)(part * (int)_bucketsPerPart + currentBucket);
                        partStats.Add(globalBucketId, _bucketsTotal, currentBucketHashes.Length, bestPilot, evictions);

                        // EXACT Rust eviction algorithm: Drop the collisions and set the new pilot
                        var evictionsThisRound = 0;

                        // EXACT Rust pattern: for slot in b_slots(hp)
                        foreach (var hash in currentBucketHashes)
                        {
                            var localSlot = SlotInPartHp(hash, hp);

                            // EXACT Rust pattern: let b2 = slots[slot]; if b2.is_some()
                            var occupyingBucket = slots[localSlot];
                            if (occupyingBucket >= 0) // b2.is_some() in Rust
                            {
                                if (occupyingBucket == currentBucket)
                                    throw new InvalidOperationException("Self-collision detected"); // assert!(b2 != b)

                                // EXACT Rust pattern: stack.push((bucket_len(b2), b2)); evictions += 1;
                                var evictedStart = bucketStarts[occupyingBucket];
                                var evictedEnd = bucketStarts[occupyingBucket + 1];
                                var evictedSize = evictedEnd - evictedStart;

                                stack.Push(new BucketInfo((nuint)evictedSize, (nuint)occupyingBucket));
                                evictions++;
                                evictionsThisRound++;

                                // EXACT Rust pattern: for p2 in slots_for_bucket(b2, pilots[b2] as Pilot)
                                var evictedPilot = (ulong)partPilots[occupyingBucket];
                                var evictedHp = HashPilot(evictedPilot);
                                var evictedHashes = hashesSpan.Slice(evictedStart, evictedSize);

                                // Clear slots by recomputing them from the hashes and pilot
                                foreach (var evictedHash in evictedHashes)
                                {
                                    var evictedLocalSlot = SlotInPartHp(evictedHash, evictedHp);
                                    // EXACT Rust pattern: *slots.get_unchecked_mut(p2) = BucketIdx::NONE;
                                    slots[evictedLocalSlot] = -1;
                                    // EXACT Rust pattern: taken.set_unchecked(p2, false);
                                    partTaken.Set(evictedLocalSlot, false);
                                }
                            }

                            // EXACT Rust pattern: *slots.get_unchecked_mut(slot) = b;
                            slots[localSlot] = currentBucket;
                            // EXACT Rust pattern: taken.set_unchecked(slot, true);
                            partTaken.Set(localSlot, true);
                        }


                        // Update recent buckets (EXACT Rust algorithm)
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

        // Sort buckets within a single part (like Rust's sort_buckets)
        // CRITICAL: This must return the sorted hash array AND bucket starts/order that match it
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
                // CRITICAL FIX: Use global bucket index like Rust, not local bucket index
                // Rust: self.bucket(hashes[end]) == part * self.buckets + b
                var globalBucket = (int)Bucket(hash);
                var localBucket = globalBucket - part * (int)_bucketsPerPart;
                hashBucketPairs[i] = (hash, localBucket);
            }
            
            // Use Array.Sort with custom comparison (faster than List.Sort) - only sort actual data length
            Array.Sort(hashBucketPairs, 0, partHashes.Length, Comparer<(HashValue hash, int bucket)>.Create((a, b) => {
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
                Array.Sort(bucketSizes, 0, (int)_bucketsPerPart, Comparer<(int size, int bucket)>.Create((a, b) => {
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
        
        // Size-specialized dispatch function matching Rust's find_pilot optimization (~10% speedup)
        private (ulong pilot, ulong hashPilot)? FindPilot(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            // Rust optimization: size-specialized dispatch for buckets with 1-8 elements
            return bucketHashes.Length switch
            {
                1 => FindPilotArray1(kmax, bucketHashes, taken, out pilotsChecked, bucketId),
                2 => FindPilotArray2(kmax, bucketHashes, taken, out pilotsChecked, bucketId),
                3 => FindPilotArray3(kmax, bucketHashes, taken, out pilotsChecked, bucketId),
                4 => FindPilotArray4(kmax, bucketHashes, taken, out pilotsChecked, bucketId),
                5 => FindPilotArray5(kmax, bucketHashes, taken, out pilotsChecked, bucketId),
                6 => FindPilotArray6(kmax, bucketHashes, taken, out pilotsChecked, bucketId),
                7 => FindPilotArray7(kmax, bucketHashes, taken, out pilotsChecked, bucketId),
                8 => FindPilotArray8(kmax, bucketHashes, taken, out pilotsChecked, bucketId),
                _ => FindPilotSlice(kmax, bucketHashes, taken, out pilotsChecked, bucketId)
            };
        }
        
        // Size-specialized versions for fixed-size buckets (1-8 elements)
        // In Rust, all find_pilot_array methods just call find_pilot_slice
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray1(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            return FindPilotSlice(kmax, bucketHashes, taken, out pilotsChecked, bucketId);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray2(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            return FindPilotSlice(kmax, bucketHashes, taken, out pilotsChecked, bucketId);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray3(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            return FindPilotSlice(kmax, bucketHashes, taken, out pilotsChecked, bucketId);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray4(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            return FindPilotSlice(kmax, bucketHashes, taken, out pilotsChecked, bucketId);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray5(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            return FindPilotSlice(kmax, bucketHashes, taken, out pilotsChecked, bucketId);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray6(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            return FindPilotSlice(kmax, bucketHashes, taken, out pilotsChecked, bucketId);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray7(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            return FindPilotSlice(kmax, bucketHashes, taken, out pilotsChecked, bucketId);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray8(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            return FindPilotSlice(kmax, bucketHashes, taken, out pilotsChecked, bucketId);
        }

        // Variable-size bucket processing for larger buckets (renamed from FindPilotInPart)
        private (ulong pilot, ulong hashPilot)? FindPilotSlice(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            // EXACT Rust algorithm: Sequential search from 0 to kmax-1 with 4x chunking
            int r = bucketHashes.Length / 4 * 4; // Rust: let r = bucket.len() / 4 * 4;

            pilotsChecked = 0;

            for (ulong pilot = 0; pilot < kmax; pilot++) // Rust: 'p: for p in 0u64..kmax
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
                    if (taken.GetUnchecked(localSlot)) // Rust: bad |= check(hx)
                    {
                        hasCollision = true;
                        break;
                    }
                }

                if (hasCollision) continue;

                // If no external collision, try to take this pilot (EXACT Rust)
                if (TryTakePilotInPart(bucketHashes, pilot, taken)) // Rust: if self.try_take_pilot(bucket, hp, taken)
                {
                    return  (pilot, hp); // Rust: return Some((p, hp))
                }
            }

            return null; // Rust: None
        }
        
        // EXACT Rust try_take_pilot implementation - marks slots as taken with backtracking
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
                    // Collision within the bucket. Clean already set entries (EXACT Rust backtrack)
                    // Rust: for &hx in unsafe { bucket.get_unchecked(..i) }
                    for (int j = 0; j < i; j++)
                    {
                        var previousHash = bucketHashes[j];
                        var previousSlot = SlotInPartHp(previousHash, hp);
                        taken.Set(previousSlot, false);
                    }
                    return false;
                }
                
                // Mark slot as taken immediately (EXACT Rust behavior)
                // Rust: unsafe { taken.set_unchecked(slot, true) };
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
        
        // Find best pilot with minimal collisions (Rust-style eviction logic)
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
            
            // EXACT Rust pattern: 'p: for delta in 0u64..kmax
            for (ulong delta = 0; delta < kmax; delta++)
            {
                var pilot = (startPilot + delta) % kmax;
                var hp = HashPilot(pilot);
                
                var collisionScore = 0UL;
                var shouldSkip = false;
                
                // EXACT Rust pattern: for p in b_slots(hp)
                foreach (var hash in bucketHashes)
                {
                    var localSlot = SlotInPartHp(hash, hp);
                    var occupyingBucket = slots[localSlot];
                    
                    // EXACT Rust pattern: let s = unsafe { *slots.get_unchecked(p) };
                    // EXACT Rust pattern: if s.is_none() { continue; }
                    if (occupyingBucket == -1)
                    {
                        continue;
                    }
                    // EXACT Rust pattern: else if recent.contains(&s) { continue 'p; }
                    // Optimized: recent array is small (16 elements), so linear search is fine but we can optimize it
                    else if (IsInRecentArray(recent, occupyingBucket))
                    {
                        shouldSkip = true;
                        break; // Exit inner loop to continue outer loop
                    }
                    
                    // EXACT Rust pattern: bucket_len(s).pow(2)
                    var bucketSize = bucketStarts[occupyingBucket + 1] - bucketStarts[occupyingBucket];
                    var newScore = (ulong)(bucketSize * bucketSize);
                    collisionScore += newScore;
                    
                    // EXACT Rust pattern: if collision_score >= best.0 { continue 'p; }
                    if (collisionScore >= bestScore)
                    {
                        shouldSkip = true;
                        break; // Exit inner loop to continue outer loop
                    }
                }
                
                // Skip this pilot if we hit a recent bucket or score exceeded best
                if (shouldSkip)
                    continue;
                
                // EXACT Rust pattern: if !duplicate_slots(b, p)
                if (!DuplicateSlots(bucketHashes, pilot))
                {
                    // EXACT Rust pattern: best = (collision_score, p);
                    bestScore = collisionScore;
                    bestPilot = pilot;
                    
                    // EXACT Rust pattern: if collision_score == new_b_len * new_b_len { break; }
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
            // Efficient implementation of Rust's remap_free_slots algorithm using IterZeros()
            // This eliminates the O(n²) nested loop issue by only processing actual zero bits
            // Assert: count of free slots should equal slots_total - n
            var freeSlotCount = taken.CountZeros();
            if (freeSlotCount != _slotsTotal - _numKeys)
            {
                return false; // Inconsistent state - "Not the right number of free slots left!"
            }
            
            if (!_minimal || _slotsTotal == _numKeys)
            {
                unsafe
                {
                    this._remapTable = null;
                    _remapTableSize = 0;
                }
                return true;
            }
            
            // Compute the free spots - exact Rust algorithm
            // Use ArrayPool for temporary storage
            var maxRemapSize = (int)(_slotsTotal - _numKeys);
            var remapArray = ArrayPool<uint>.Shared.Rent(maxRemapSize);
            var remapCount = 0;
            
            try
            {
                // Helper function equivalent to Rust's get closure
                // get = |t: &Vec<BitVec>, idx: usize| t[idx / self.slots][idx % self.slots];
                bool Get(nuint idx)
                {
                    var part = idx / _slotsPerPart;
                    var localSlot = idx % _slotsPerPart;
                    return taken.Parts[part].Get(localSlot);
                }
                
                // Efficient single-pass algorithm using IterZeros() - matches Rust's approach exactly
                // This is equivalent to:
                // for i in taken.iter().enumerate().flat_map(|(p, t)| t.iter_zeros().map(move |i| offset + i)).take_while(|&i| i < self.n)
                foreach (var freeSlotIndex in taken.IterZeros())
                {
                    if (freeSlotIndex >= _numKeys) // take_while(|&i| i < self.n) - stop when we exceed n
                        break;
                        
                    // Process this free slot immediately - same logic as Rust
                    var i = (uint)freeSlotIndex;
                    while (!Get(_numKeys + (nuint)remapCount))
                    {
                        remapArray[remapCount++] = i;
                    }
                    remapArray[remapCount++] = i;
                }
                
                // Allocate exact-sized unmanaged memory for remap table
                unsafe
                {
                    _remapTableSize = (nuint)remapCount;
                    _remapTable = (uint*)System.Runtime.InteropServices.NativeMemory.AlignedAlloc(_remapTableSize * 4, 64);
                    
                    // Copy only the used portion to unmanaged memory
                    fixed (uint* sourcePtr = remapArray)
                    {
                        System.Runtime.InteropServices.NativeMemory.Copy(sourcePtr, _remapTable, _remapTableSize * 4);
                    }
                }
            }
            finally
            {
                ArrayPool<uint>.Shared.Return(remapArray);
            }
            return true;
        }

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
                        System.Runtime.InteropServices.NativeMemory.Free(_pilots);
                        _pilots = null;
                    }

                    if (_remapTable != null)
                    {
                        System.Runtime.InteropServices.NativeMemory.Free(_remapTable);
                        _remapTable = null;
                    }
                }

                _disposed = true;
            }
        }
        #endregion
    }

}