using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.Util;
using PtrHash.CSharp.Port.Native;

namespace PtrHash.CSharp.Port.Core
{
    /// <summary>
    /// Helper class to mimic Rust's Vec<BitVec> functionality
    /// </summary>
    internal class PartitionedBitVec
    {
        private readonly BitVec[] _parts;
        private readonly nuint _slotsPerPart;
        
        public PartitionedBitVec(nuint parts, nuint slotsPerPart)
        {
            _parts = new BitVec[parts];
            _slotsPerPart = slotsPerPart;
            for (int i = 0; i < (int)parts; i++)
            {
                _parts[i] = new BitVec(slotsPerPart);
            }
        }
        
        public bool Get(nuint globalSlot)
        {
            var part = globalSlot / _slotsPerPart;
            var localSlot = globalSlot % _slotsPerPart;
            return _parts[part].Get(localSlot);
        }
        
        public void Set(nuint globalSlot, bool value)
        {
            var part = globalSlot / _slotsPerPart;
            var localSlot = globalSlot % _slotsPerPart;
            _parts[part].Set(localSlot, value);
        }
        
        // Direct access to part's BitVec for local slot operations
        public bool GetLocal(nuint part, nuint localSlot)
        {
            return _parts[part].Get(localSlot);
        }
        
        public void SetLocal(nuint part, nuint localSlot, bool value)
        {
            _parts[part].Set(localSlot, value);
        }
        
        public nuint CountOnes()
        {
            nuint total = 0;
            foreach (var part in _parts)
            {
                total += part.CountOnes();
            }
            return total;
        }
        
        public nuint CountZeros()
        {
            nuint total = 0;
            foreach (var part in _parts)
            {
                total += part.Length - part.CountOnes();
            }
            return total;
        }
        
        public nuint TotalLength => (nuint)_parts.Length * _slotsPerPart;
        
        // Access to individual parts for remap algorithm
        public BitVec[] Parts => _parts;
    }
    
    /// <summary>
    /// Generic PtrHash minimal perfect hash function implementation
    /// Uses hash-evict construction algorithm with 8-bit pilots
    /// </summary>
    /// <typeparam name="TKey">Type of keys</typeparam>
    /// <typeparam name="THasher">Hash function implementation</typeparam>
    public sealed class PtrHash<TKey, THasher> : IPtrHash<TKey>
        where THasher : struct, IKeyHasher<TKey>
    {
        // Cap parallelism to prevent thread explosion (Rust's rayon uses all cores by default)
        private static readonly int MaxParallelism = Math.Min(Environment.ProcessorCount, 8);
        private readonly THasher _hasher;
        private readonly byte[] _pilots;
        private readonly LinearBucketFunction _bucketFunction;
        
        // Multi-part support fields (matching Rust implementation exactly)
        private readonly nuint _parts;
        private readonly nuint _slotsPerPart;
        private readonly nuint _slotsTotal;
        private readonly nuint _bucketsPerPart;
        private readonly nuint _bucketsTotal;
        
        private readonly nuint _numKeys;
        private uint[]? _remapTable;
        private readonly bool _minimal;
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

            // Calculate parts and structure sizes following Rust algorithm exactly
            if (parameters.SinglePart)
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
                var eps = (1.0 - parameters.Alpha) / 2.0;
                var x = (double)_numKeys * eps * eps / 2.0;
                var targetParts = x / Math.Log(x);
                var shards = 1; // Single shard for now
                // Handle edge case where targetParts is negative or invalid
                var partsPerShard = targetParts > 0 ? 
                    Math.Max(1, (nuint)Math.Floor(targetParts) / (nuint)shards) : 
                    1;
                _parts = partsPerShard * (nuint)shards;
                
                var keysPerPart = _numKeys / _parts;
                var slotsPerPart = (nuint)((double)keysPerPart / parameters.Alpha);
                
                // Avoid powers of two, since then %S does not depend on all bits
                if (IsPowerOfTwo((int)slotsPerPart))
                {
                    slotsPerPart += 1;
                }
                
                _slotsPerPart = slotsPerPart;
                _slotsTotal = _parts * _slotsPerPart;
                _bucketsPerPart = (nuint)Math.Ceiling((double)keysPerPart / parameters.Lambda) + 3;
                _bucketsTotal = _parts * _bucketsPerPart;
            }
            
            _bucketFunction = new LinearBucketFunction(_bucketsPerPart);
            _pilots = new byte[_bucketsTotal];

            // Construct the hash function using hash-evict algorithm
            if (!TryConstruct(keys, out _seed))
            {
                throw new PtrHashException("Failed to construct minimal perfect hash function. Try different parameters or check for duplicate keys.");
            }

            // Validation can be enabled for debugging by uncommenting the line below
            // ValidateHashFunction(keys);

            // Remap table will be created during construction if needed

            // Calculate bits per key
            var totalBits = (_pilots.Length * 8) + (_remapTable?.Length * 32 ?? 0);
            _bitsPerKey = (double)totalBits / (double)_numKeys;
        }

        public PtrHashInfo GetInfo()
        {
            // MaxIndex is always slots_total - this is the upper bound for GetIndexNoRemap()
            // GetIndex() with minimal=true will remap values >= numKeys, but MaxIndex represents the theoretical maximum
            return new PtrHashInfo(_numKeys, _bitsPerKey, _slotsTotal);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndex(TKey key)
        {
            var slot = GetIndexNoRemap(key);
            if (slot < _numKeys)
            {
                return slot;
            }
            else
            {
                return _remapTable != null ? (nuint)_remapTable[slot - _numKeys] : slot;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexNoRemap(TKey key)
        {
            var hx = _hasher.Hash(key, _seed);
            var bucket = GetBucketGlobal(hx); // Use global bucket calculation like Rust
            var pilot = (ulong)_pilots[bucket]; // Convert byte to ulong (Pilot type)
            return ComputeSlot(hx, pilot);
        }
        
        // Rust bucket() function - returns global bucket index
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint GetBucketGlobal(ulong hx)
        {
            // Must match SortBucketsInPart calculation exactly!
            // Construction: FastReduce.Reduce(hash, _bucketsPerPart) within each part
            var part = GetPart(hx);
            var localBucket = FastReduce.Reduce(hx, _bucketsPerPart);
            return part * _bucketsPerPart + localBucket;
        }
        
        // Rust bucket_in_part() function - returns bucket index within a part
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint GetBucketInPart(ulong hx)
        {
            // For Linear bucket function: rem_buckets.reduce(x)
            var high = hx >> 32; // Get high 32 bits
            return FastModulo(high, _bucketsPerPart);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint FastModulo(ulong value, nuint modulus)
        {
            // Simple modulo for now - can optimize later with FastReduce like Rust
            return (nuint)(value % (ulong)modulus);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint ComputeSlot(ulong hx, ulong pilot)
        {
            // Exact Rust algorithm: (self.part(hx) * self.slots) + self.slot_in_part(hx, pilot)
            var part = GetPart(hx);
            var localSlot = SlotInPart(hx, pilot);
            return part * _slotsPerPart + localSlot;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint SlotInPart(ulong hx, ulong pilot)
        {
            // Rust: self.slot_in_part_hp(hx, self.hash_pilot(pilot))
            var hp = HashPilot(pilot);
            return SlotInPartHp(hx, hp);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint SlotInPartHp(ulong hx, ulong hp)
        {
            // Rust: self.rem_slots.reduce(hx.low() ^ hp)
            // hx.low() in Rust returns lower 32 bits, rem_slots uses FM32, not FastReduce!
            var hxLow = (uint)(hx & 0xFFFFFFFF); // Get lower 32 bits like Rust's hx.low()
            return (nuint)FastReduce.Reduce32(hxLow ^ (uint)hp, (uint)_slotsPerPart);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint GetPart(ulong hx)
        {
            // Rust uses: rem_parts.reduce(hx.high()) - for u64, high() returns the full value
            return FastModulo(hx, _parts);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private ulong HashPilot(ulong pilot)
        {
            const ulong C = 0x51_7c_c1_b7_27_22_0a_95UL; // FxHash constant from Rust
            return C * (pilot ^ _seed); // Rust: hash::C.wrapping_mul(p ^ self.seed)
        }

        public unsafe void GetIndicesStream(ReadOnlySpan<TKey> keys, Span<nuint> results, uint prefetchDistance = 32, bool minimal = true)
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            var useMinimal = minimal && _minimal && _remapTable != null;
            var B = (int)prefetchDistance;
            
            // Ring buffers to cache the hash and bucket of upcoming queries (like Rust)
            var nextHashes = new ulong[B];
            var nextBuckets = new nuint[B];
            
            // Initialize and prefetch first B values
            var leftover = Math.Min(B, keys.Length);
            for (int idx = 0; idx < B; idx++)
            {
                ulong hx = 0;
                if (idx < keys.Length)
                {
                    hx = _hasher.Hash(keys[idx], _seed);
                }
                nextHashes[idx] = hx;
                nextBuckets[idx] = GetBucketGlobal(nextHashes[idx]);
                
                // Prefetch pilot for this bucket
                unsafe
                {
                    fixed (byte* pilotsPtr = _pilots)
                    {
                        Prefetch.PrefetchRead(pilotsPtr + nextBuckets[idx]);
                    }
                }
            }
            
            fixed (byte* pilotsPtr = _pilots)
            fixed (uint* remapPtr = _remapTable)
            {
                int keyIndex = 0;
                
                // Process main keys with ring buffer
                for (int i = B; i < keys.Length; i++)
                {
                    // Get next hash and update ring buffer
                    var nextHash = _hasher.Hash(keys[i], _seed);
                    var idx = keyIndex % B;
                    var curHash = nextHashes[idx];
                    var curBucket = nextBuckets[idx];
                    
                    // Update ring buffer with new values
                    nextHashes[idx] = nextHash;
                    nextBuckets[idx] = GetBucketGlobal(nextHashes[idx]);
                    
                    // Prefetch pilot for the new bucket
                    Prefetch.PrefetchRead(pilotsPtr + nextBuckets[idx]);
                    
                    // Compute current slot using cached values
                    var pilot = (ulong)pilotsPtr[curBucket];
                    var slot = ComputeSlot(curHash, pilot);
                    
                    // Apply remap if minimal and slot >= numKeys
                    if (useMinimal && slot >= _numKeys)
                    {
                        slot = (nuint)remapPtr![slot - _numKeys];
                    }
                    
                    results[keyIndex] = slot;
                    keyIndex++;
                }
                
                // Process remaining keys from ring buffer
                for (int remaining = 0; remaining < leftover; remaining++)
                {
                    var idx = keyIndex % B;
                    var curHash = nextHashes[idx];
                    var curBucket = nextBuckets[idx];
                    
                    var pilot = (ulong)pilotsPtr[curBucket];
                    var slot = ComputeSlot(curHash, pilot);
                    
                    if (useMinimal && slot >= _numKeys)
                    {
                        slot = (nuint)remapPtr![slot - _numKeys];
                    }
                    
                    if (keyIndex < results.Length)
                    {
                        results[keyIndex] = slot;
                    }
                    keyIndex++;
                }
            }
        }

        private bool TryConstruct(ReadOnlySpan<TKey> keys, out ulong finalSeed)
        {
            const int maxAttempts = 10;
            var rng = new Random(31415); // Use fixed initial seed like Rust
            
            for (int attempt = 0; attempt < maxAttempts; attempt++)
            {
                // Generate better 64-bit seeds like Rust does
                var seed = ((ulong)rng.Next() << 32) | (ulong)rng.Next();
                
                if (TryBuildWithSeed(keys, seed))
                {
                    finalSeed = seed;
                    return true;
                }
            }
            
            finalSeed = 0;
            return false;
        }

        private bool TryBuildWithSeed(ReadOnlySpan<TKey> keys, ulong seed)
        {
            // Store seed for later use
            this._seed = seed;
            
            // Reset pilots
            Array.Fill(_pilots, (byte)0);

            // First, hash all keys and partition them by parts (like Rust's sort_parts)
            var (allHashes, partStarts) = SortPartsByHashes(keys, seed);
            
            // Track taken slots using Vec<BitVec> like Rust - for ALL parts
            var taken = new PartitionedBitVec(_parts, _slotsPerPart);
            
            // Process parts in parallel like Rust's par_chunks_exact_mut
            var parallelOptions = new ParallelOptions
            {
                MaxDegreeOfParallelism = MaxParallelism
            };
            
            var success = true;
            var lockObject = new object();
            
            Parallel.For(0, (int)_parts, parallelOptions, part =>
            {
                if (!success) return; // Early exit if another thread failed
                
                var partStart = (int)partStarts[part];
                var partEnd = (int)partStarts[part + 1];
                var partHashes = allHashes.AsSpan(partStart, partEnd - partStart);
                
                // Get pilot slice for this part
                var partPilotStart = part * (int)_bucketsPerPart;
                var partPilots = _pilots.AsSpan(partPilotStart, (int)_bucketsPerPart);
                
                // Build this part using exact Rust build_part algorithm
                if (!BuildPartRust(part, partHashes, partPilots, taken))
                {
                    lock (lockObject)
                    {
                        success = false;
                    }
                }
            });
            
            if (!success)
            {
                return false;
            }
            
            // After successful construction, create remap table if needed
            if (!TryRemapFreeSlots(taken))
            {
                return false; // Failed to create remap table
            }
            
            return true;
        }

        private static bool IsPowerOfTwo(int value)
        {
            return value > 0 && (value & (value - 1)) == 0;
        }
        
        // Hash all keys and partition by parts (like Rust's sort_parts)
        private (ulong[] allHashes, uint[] partStarts) SortPartsByHashes(ReadOnlySpan<TKey> keys, ulong seed)
        {
            // Convert to array for parallel processing (ReadOnlySpan can't be captured in lambda)
            var keysArray = keys.ToArray();
            var allHashes = new ulong[keysArray.Length];
            var seenKeys = new HashSet<TKey>();
            
            // First check for duplicates sequentially to maintain deterministic error reporting
            for (int i = 0; i < keysArray.Length; i++)
            {
                if (!seenKeys.Add(keysArray[i]))
                {
                    throw new PtrHashException($"Duplicate key found: {keysArray[i]}");
                }
            }
            
            // Hash keys in parallel like Rust's keys.par_iter()
            var parallelOptions = new ParallelOptions
            {
                MaxDegreeOfParallelism = MaxParallelism
            };
            
            Parallel.For(0, keysArray.Length, parallelOptions, i =>
            {
                allHashes[i] = _hasher.Hash(keysArray[i], seed);
            });
            
            // Sort by hash (like Rust radix sort)
            Array.Sort(allHashes);
            
            // Find part starts using binary search (like Rust)
            var partStarts = new uint[_parts + 1];
            partStarts[0] = 0;
            
            for (nuint part = 1; part <= _parts; part++)
            {
                // Binary search for first hash belonging to this part
                int left = 0, right = allHashes.Length;
                while (left < right)
                {
                    int mid = (left + right) / 2;
                    if (GetPart(allHashes[mid]) < part)
                        left = mid + 1;
                    else
                        right = mid;
                }
                partStarts[part] = (uint)left;
            }
            
            return (allHashes, partStarts);
        }
        
        // Build a single part (like Rust's build_part)
        private bool BuildPartRust(int part, ReadOnlySpan<ulong> partHashes, Span<byte> partPilots, PartitionedBitVec taken)
        {
            // Sort buckets within this part (like Rust's sort_buckets)
            var (sortedHashes, bucketStarts, bucketOrder) = SortBucketsInPart(part, partHashes);
            // Use the sorted hashes from here on - this is CRITICAL for matching Rust exactly
            var hashesSpan = sortedHashes.AsSpan();
            
            const ulong kmax = 256;
            var slots = new int[_slotsPerPart];
            Array.Fill(slots, -1); // -1 = BucketIdx::NONE
            
            // EXACT RUST BINARY HEAP IMPLEMENTATION
            var stack = new BinaryHeap<BucketInfo>();
            var recent = new int[16];
            Array.Fill(recent, -1); // -1 = BucketIdx::NONE
            var rng = new Random();
            var totalEvictions = 0;

            // Process buckets in size order (largest first) - EXACT Rust pattern
            for (int bucketIdx = 0; bucketIdx < bucketOrder.Length; bucketIdx++)
            {
                var newBucket = bucketOrder[bucketIdx];
                var bucketStart = bucketStarts[newBucket];
                var bucketEnd = bucketStarts[newBucket + 1];
                var newBucketSize = bucketEnd - bucketStart;
                
                if (newBucketSize == 0)
                {
                    partPilots[newBucket] = 0;
                    continue;
                }
                
                var evictions = 0;
                
                // Push initial bucket onto stack (Rust: stack.push((new_b_len, new_b)))
                stack.Push(new BucketInfo((nuint)newBucketSize, (nuint)newBucket));
                Array.Fill(recent, -1); // Rust: recent.fill(BucketIdx::NONE)
                var recentIdx = 0;
                recent[0] = newBucket; // Rust: recent[0] = new_b
                
                // Process eviction chain (Rust: while let Some((_b_len, b)) = stack.pop())
                while (!stack.IsEmpty)
                {
                    // Rust termination condition
                    if (evictions > (int)_slotsPerPart && IsPowerOfTwo(evictions))
                    {
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
                    
                    // 1) Try collision-free pilot first (Rust hot path)
                    var pilotResult = FindPilotInPart(kmax, currentBucketHashes, part, taken);
                    if (pilotResult.HasValue)
                    {
                        var pilot = pilotResult.Value;
                        partPilots[currentBucket] = (byte)pilot;
                        
                        // Place bucket in slots
                        foreach (var hash in currentBucketHashes)
                        {
                            var localSlot = SlotInPartHp(hash, HashPilot(pilot));
                            slots[localSlot] = currentBucket;
                            
                            // Mark slot as taken in part's BitVec (use local slot within part)
                            taken.SetLocal((nuint)part, localSlot, true);
                        }
                        continue;
                    }
                    
                    // 2) Find pilot with minimal collisions and evict (EXACT Rust collision handling)
                    var bestResult = FindBestPilotWithEvictionInPart(currentBucketHashes, slots, recent, rng, kmax, part, bucketStarts);
                    if (bestResult.pilot == ulong.MaxValue)
                    {
                        return false; // Failed to find suitable pilot (indistinguishable hashes)
                    }
                    
                    var bestPilot = bestResult.pilot;
                    partPilots[currentBucket] = (byte)bestPilot;
                    var hp = HashPilot(bestPilot);
                    
                    // EXACT Rust eviction algorithm: Drop collisions and set new pilot
                    foreach (var hash in currentBucketHashes)
                    {
                        var localSlot = SlotInPartHp(hash, hp);
                        
                        // THIS IS A HOT INSTRUCTION (Rust comment)
                        var occupyingBucket = slots[localSlot];
                        if (occupyingBucket >= 0) // b2.is_some() in Rust
                        {
                            if (occupyingBucket == currentBucket)
                                throw new InvalidOperationException("Self-collision detected"); // assert!(b2 != b)
                            
                            // DROP BUCKET (Rust comment)
                            var evictedStart = bucketStarts[occupyingBucket];
                            var evictedEnd = bucketStarts[occupyingBucket + 1];
                            var evictedSize = evictedEnd - evictedStart;
                            
                            // Push evicted bucket onto stack (Rust: stack.push((bucket_len(b2), b2)))
                            stack.Push(new BucketInfo((nuint)evictedSize, (nuint)occupyingBucket));
                            evictions++;
                            
                            // Clear all slots occupied by evicted bucket (Rust: for p2 in slots_for_bucket)
                            var evictedPilot = (ulong)partPilots[occupyingBucket];
                            var evictedHp = HashPilot(evictedPilot);
                            var evictedHashes = hashesSpan.Slice(evictedStart, evictedSize);
                            
                            foreach (var evictedHash in evictedHashes)
                            {
                                var evictedLocalSlot = SlotInPartHp(evictedHash, evictedHp);
                                slots[evictedLocalSlot] = -1; // BucketIdx::NONE
                                
                                // Clear slot from part's BitVec (use local slot within part)
                                taken.SetLocal((nuint)part, evictedLocalSlot, false);
                            }
                        }
                        
                        // Place current bucket (Rust: *slots.get_unchecked_mut(slot) = b)
                        slots[localSlot] = currentBucket;
                        
                        // Mark slot as taken (Rust: taken.set_unchecked(slot, true))
                        taken.SetLocal((nuint)part, localSlot, true);
                    }
                    
                    // Update recent buckets (EXACT Rust algorithm)
                    recentIdx += 1; // recent_idx += 1
                    recentIdx %= recent.Length; // recent_idx %= recent.len()
                    recent[recentIdx] = currentBucket; // recent[recent_idx] = b
                }
                
                totalEvictions += evictions;
            }
            
            return true;
        }

        // Sort buckets within a single part (like Rust's sort_buckets)
        // CRITICAL: This must return the sorted hash array AND bucket starts/order that match it
        private (ulong[] sortedHashes, int[] bucketStarts, int[] bucketOrder) SortBucketsInPart(int part, ReadOnlySpan<ulong> partHashes)
        {
            // Group hashes by bucket within this part
            var keyBucketPairs = new List<(ulong hash, int bucket)>(partHashes.Length);
            
            foreach (var hash in partHashes)
            {
                // EXACT RUST ALGORITHM: For LINEAR bucket functions, bucket_in_part uses rem_buckets.reduce(x)
                // This gives us bucket index within the part [0, buckets_per_part)
                var localBucket = (int)FastReduce.Reduce(hash, _bucketsPerPart);
                
                keyBucketPairs.Add((hash, localBucket));
            }
            
            // Sort by bucket, then by hash for deterministic order
            keyBucketPairs.Sort((a, b) => {
                var bucketCompare = a.bucket.CompareTo(b.bucket);
                return bucketCompare != 0 ? bucketCompare : a.hash.CompareTo(b.hash);
            });
            
            // Extract the sorted hashes
            var sortedHashes = keyBucketPairs.Select(p => p.hash).ToArray();
            
            // Create bucket starts array
            var bucketStarts = new int[_bucketsPerPart + 1]; // +1 for end sentinel
            var currentBucket = 0;
            var hashIndex = 0;
            
            foreach (var (hash, bucket) in keyBucketPairs)
            {
                // Fill in start positions for empty buckets
                while (currentBucket <= bucket)
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
            
            // Create bucket order sorted by size (largest first)
            var bucketSizes = new List<(int size, int bucket)>();
            for (int i = 0; i < (int)_bucketsPerPart; i++)
            {
                var size = bucketStarts[i + 1] - bucketStarts[i];
                bucketSizes.Add((size, i));
            }
            
            // Sort by size descending, then by bucket index for deterministic order
            bucketSizes.Sort((a, b) => {
                var sizeCompare = b.size.CompareTo(a.size); // Descending
                return sizeCompare != 0 ? sizeCompare : a.bucket.CompareTo(b.bucket);
            });
            
            var bucketOrder = bucketSizes.Select(x => x.bucket).ToArray();
            
            return (sortedHashes, bucketStarts, bucketOrder);
        }
        
        // Find a collision-free pilot for a bucket within a part
        private ulong? FindPilotInPart(ulong kmax, ReadOnlySpan<ulong> bucketHashes, int part, PartitionedBitVec taken)
        {
            var random = new Random();
            var startPilot = (ulong)random.Next(256);
            
            for (ulong delta = 0; delta < kmax; delta++)
            {
                var pilot = (startPilot + delta) % kmax;
                var hp = HashPilot(pilot);
                
                bool hasCollision = false;
                var localSlots = new HashSet<nuint>();
                
                foreach (var hash in bucketHashes)
                {
                    var localSlot = SlotInPartHp(hash, hp);
                    
                    // Check for internal collision within bucket
                    if (!localSlots.Add(localSlot))
                    {
                        hasCollision = true;
                        break;
                    }
                    
                    // Check for external collision with existing slots (use local slot within part)
                    if (taken.GetLocal((nuint)part, localSlot))
                    {
                        hasCollision = true;
                        break;
                    }
                }
                
                if (!hasCollision)
                {
                    return pilot;
                }
            }
            
            return null; // No collision-free pilot found
        }
        // Find best pilot with minimal collisions (Rust-style eviction logic)
        private (ulong score, ulong pilot) FindBestPilotWithEvictionInPart(ReadOnlySpan<ulong> bucketHashes, int[] slots, int[] recent, Random rng, ulong kmax, int part, int[] bucketStarts)
        {
            var bestScore = ulong.MaxValue;
            var bestPilot = ulong.MaxValue;
            var startPilot = (ulong)rng.Next(256);
            
            for (ulong delta = 0; delta < kmax; delta++)
            {
                var pilot = (startPilot + delta) % kmax;
                var hp = HashPilot(pilot);
                
                // Check for internal collisions first
                if (HasDuplicateSlotsInPart(bucketHashes, pilot, part))
                {
                    continue; // Skip pilots that cause internal collisions
                }
                
                var collisionScore = 0UL;
                bool skipPilot = false;
                
                foreach (var hash in bucketHashes)
                {
                    var localSlot = SlotInPartHp(hash, hp);
                    var occupyingBucket = slots[localSlot];
                    
                    if (occupyingBucket == -1)
                    {
                        continue; // Slot is free
                    }
                    
                    // Check if this is a recently evicted bucket (cycle prevention)
                    if (Array.IndexOf(recent, occupyingBucket) >= 0)
                    {
                        skipPilot = true;
                        break;
                    }
                    
                    // Calculate collision score (bucket size squared - Rust style)
                    var bucketSize = bucketStarts[occupyingBucket + 1] - bucketStarts[occupyingBucket];
                    collisionScore += (ulong)(bucketSize * bucketSize);
                    
                    // Early termination if score is already worse than best
                    if (collisionScore >= bestScore)
                    {
                        skipPilot = true;
                        break;
                    }
                }
                
                if (skipPilot)
                    continue;
                
                // Update best if this pilot has lower collision score
                if (collisionScore < bestScore)
                {
                    bestScore = collisionScore;
                    bestPilot = pilot;
                    
                    // If we found a collision-free solution, use it immediately
                    if (collisionScore == 0)
                    {
                        break;
                    }
                }
            }
            
            return (bestScore, bestPilot);
        }

        // Check for duplicate slots within a bucket (internal collisions)
        private void ValidateHashFunction(ReadOnlySpan<TKey> keys)
        {
            var indices = new HashSet<nuint>();
            for (int i = 0; i < keys.Length; i++)
            {
                var key = keys[i];
                var hx = _hasher.Hash(key, _seed);
                var bucket = GetBucketGlobal(hx);
                var pilot = (ulong)_pilots[bucket];
                var part = GetPart(hx);
                var localSlot = SlotInPart(hx, pilot);
                var globalSlot = part * _slotsPerPart + localSlot;
                var index = GetIndexNoRemap(key);
                
                
                if (!indices.Add(index))
                {
                    // Find which other key produces the same index
                    for (int j = 0; j < i; j++)
                    {
                        var otherIndex = GetIndexNoRemap(keys[j]);
                        if (otherIndex == index)
                        {
                            var otherKey = keys[j];
                            var otherHx = _hasher.Hash(otherKey, _seed);
                            var otherBucket = GetBucketGlobal(otherHx);
                            var otherPilot = (ulong)_pilots[otherBucket];
                            var otherPart = GetPart(otherHx);
                            var otherLocalSlot = SlotInPart(otherHx, otherPilot);
                            var otherGlobalSlot = otherPart * _slotsPerPart + otherLocalSlot;
                            
                            break;
                        }
                    }
                    throw new PtrHashException($"Hash function validation failed: Key {keys[i]} (position {i}) produces duplicate index {index}");
                }
            }
        }

        private bool HasDuplicateSlotsInPart(ReadOnlySpan<ulong> bucketHashes, ulong pilot, int part)
        {
            var hp = HashPilot(pilot);
            var slots = new HashSet<nuint>();
            
            foreach (var hash in bucketHashes)
            {
                var localSlot = SlotInPartHp(hash, hp);
                if (!slots.Add(localSlot))
                {
                    return true; // Duplicate found
                }
            }
            
            return false;
        }
        
        
        
        


        private bool TryRemapFreeSlots(PartitionedBitVec taken)
        {
            // Exact implementation of Rust's remap_free_slots algorithm
            // Assert: count of free slots should equal slots_total - n
            var freeSlotCount = taken.CountZeros();
            if (freeSlotCount != _slotsTotal - _numKeys)
            {
                return false; // Inconsistent state - "Not the right number of free slots left!"
            }
            
            if (!_minimal || _slotsTotal == _numKeys)
            {
                this._remapTable = Array.Empty<uint>();
                return true;
            }
            
            // Compute the free spots - exact Rust algorithm
            var v = new List<uint>((int)(_slotsTotal - _numKeys));
            
            // Helper function equivalent to Rust's get closure
            // get = |t: &Vec<BitVec>, idx: usize| t[idx / self.slots][idx % self.slots];
            bool Get(nuint idx)
            {
                var part = idx / _slotsPerPart;
                var localSlot = idx % _slotsPerPart;
                return taken.Parts[part].Get(localSlot);
            }
            
            // Exact Rust algorithm: complex iterator that finds free slots in [0, n)
            // taken.iter().enumerate().flat_map(|(p, t)| {
            //     let offset = p * self.slots;
            //     t.iter_zeros().map(move |i| offset + i)
            // }).take_while(|&i| i < self.n)
            
            var freeSlots = new List<nuint>();
            for (int p = 0; p < taken.Parts.Length; p++)
            {
                var offset = (nuint)p * _slotsPerPart;
                var part = taken.Parts[p];
                
                // Find all zeros (free slots) in this part
                for (nuint localSlot = 0; localSlot < _slotsPerPart; localSlot++)
                {
                    if (!part.Get(localSlot))
                    {
                        var globalSlot = offset + localSlot;
                        if (globalSlot < _numKeys) // take_while(|&i| i < self.n)
                        {
                            freeSlots.Add(globalSlot);
                        }
                    }
                }
            }
            
            // Process each free slot with the Rust algorithm
            foreach (var i in freeSlots)
            {
                // while !get(&taken, self.n + v.len()) { v.push(i as u64); } v.push(i as u64);
                while (!Get(_numKeys + (nuint)v.Count))
                {
                    v.Add((uint)i);
                }
                v.Add((uint)i);
            }
            
            this._remapTable = v.ToArray();
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

        public void Dispose()
        {
            // Nothing to dispose in this implementation
        }
    }

    /// <summary>
    /// Information about a bucket for the BinaryHeap eviction algorithm
    /// Comparable by size (largest first) to match Rust BinaryHeap behavior
    /// </summary>
    internal struct BucketInfo : IComparable<BucketInfo>
    {
        public nuint Size { get; }
        public nuint BucketId { get; }

        public BucketInfo(nuint size, nuint bucketId)
        {
            Size = size;
            BucketId = bucketId;
        }

        // BinaryHeap in Rust is a max-heap, so we want larger sizes first
        // Return negative for larger sizes to get max-heap behavior
        public int CompareTo(BucketInfo other)
        {
            var sizeCompare = other.Size.CompareTo(Size); // Reverse for max-heap
            if (sizeCompare != 0) return sizeCompare;
            return other.BucketId.CompareTo(BucketId); // Reverse for deterministic order
        }
    }
}