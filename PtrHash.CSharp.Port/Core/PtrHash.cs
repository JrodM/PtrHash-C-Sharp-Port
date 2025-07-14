using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
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
            
            _bucketFunction = new LinearBucketFunction(_bucketsTotal);
            _pilots = new byte[_bucketsTotal];

            // Construct the hash function using hash-evict algorithm
            if (!TryConstruct(keys, out _seed))
            {
                throw new PtrHashException("Failed to construct minimal perfect hash function. Try different parameters or check for duplicate keys.");
            }

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
            var bucket = _bucketFunction.GetBucket(hx);
            var pilot = (ulong)_pilots[bucket]; // Convert byte to ulong (Pilot type)
            return ComputeSlot(hx, pilot);
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
            // Note: hx.low() in Rust extracts lower 64 bits, but we already have u64
            return FastReduce.Reduce(hx ^ hp, _slotsPerPart);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint GetPart(ulong hx)
        {
            // Rust uses: FastReduce.Reduce(hx, self.parts)
            return FastReduce.Reduce(hx, _parts);
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
                nextBuckets[idx] = _bucketFunction.GetBucket(nextHashes[idx]);
                
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
                    nextBuckets[idx] = _bucketFunction.GetBucket(nextHashes[idx]);
                    
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

            // Group keys by bucket and get their hashes - following Rust's sort_buckets pattern
            var (bucketStarts, sortedHashes) = SortBuckets(keys, seed);
            
            // Track taken slots using Vec<BitVec> like Rust - for ALL parts
            var taken = new PartitionedBitVec(_parts, _slotsPerPart);
            
            // Track which bucket owns each slot - for ALL slots across ALL parts
            var slots = new int[_slotsTotal];
            Array.Fill(slots, -1); // -1 = NONE like Rust BucketIdx::NONE
            
            const ulong kmax = 256;
            
            // Create bucket order - sort by bucket size descending
            var bucketOrder = CreateBucketOrderFromStarts(bucketStarts);
            
            // Process each bucket following Rust's build_part algorithm
            var stack = new BinaryHeap<BucketInfo>();
            var recent = new int[16];
            Array.Fill(recent, -1);
            
            var rng = new Random();
            var totalEvictions = 0;
            
            for (int bucketIdx = 0; bucketIdx < bucketOrder.Length; bucketIdx++)
            {
                var bucket = bucketOrder[bucketIdx];
                var bucketStart = bucketStarts[bucket];
                var bucketEnd = bucketStarts[bucket + 1];
                var bucketSize = bucketEnd - bucketStart;
                
                if (bucketSize == 0)
                {
                    _pilots[bucket] = 0;
                    continue;
                }
                
                var bucketHashes = sortedHashes.AsSpan(bucketStart, bucketSize);
                var evictions = 0;
                
                stack.Push(new BucketInfo((nuint)bucketSize, (nuint)bucket));
                Array.Fill(recent, -1);
                var recentIdx = 0;
                recent[0] = bucket;
                
                while (!stack.IsEmpty)
                {
                    if (evictions > (int)_slotsTotal && IsPowerOfTwo(evictions))
                    {
                        if (evictions >= 10 * (int)_slotsTotal)
                        {
                            return false; // Too many evictions, abort
                        }
                    }
                    
                    var bucketInfo = stack.Pop();
                    var currentBucket = (int)bucketInfo.BucketId;
                    var currentStart = bucketStarts[currentBucket];
                    var currentEnd = bucketStarts[currentBucket + 1];
                    var currentHashes = sortedHashes.AsSpan(currentStart, currentEnd - currentStart);
                    
                    if (currentHashes.Length == 0)
                        continue;
                    
                    // 1) Hot path: find collision-free pilot (matching Rust find_pilot)
                    var pilotResult = FindPilotRust(kmax, currentHashes, taken, slots);
                    if (pilotResult.HasValue)
                    {
                        var (pilot, pilotHash) = pilotResult.Value;
                        _pilots[currentBucket] = (byte)pilot;
                        
                        // Place bucket in slots using GLOBAL slot computation (matching Rust)
                        foreach (var hash in currentHashes)
                        {
                            var globalSlot = ComputeSlot(hash, pilot); // Use global slot like Rust
                            slots[globalSlot] = currentBucket;
                            taken.Set(globalSlot, true);
                        }
                        continue;
                    }
                    
                    // 2) Find pilot with minimal collisions (matching Rust)
                    var bestResult = FindBestPilotRust(currentHashes, slots, taken, recent, rng, kmax, bucketStarts);
                    if (bestResult.pilot == ulong.MaxValue)
                    {
                        return false; // Indistinguishable hashes
                    }
                    
                    var bestPilot = bestResult.pilot;
                    _pilots[currentBucket] = (byte)bestPilot;
                    
                    // Handle evictions and place bucket using GLOBAL slots (matching Rust)
                    foreach (var hash in currentHashes)
                    {
                        var globalSlot = ComputeSlot(hash, bestPilot); // Use global slot like Rust
                        var occupyingBucket = slots[globalSlot];
                        
                        if (occupyingBucket != -1 && occupyingBucket != currentBucket)
                        {
                            // Evict the existing bucket
                            var evictedStart = bucketStarts[occupyingBucket];
                            var evictedEnd = bucketStarts[occupyingBucket + 1];
                            var evictedSize = evictedEnd - evictedStart;
                            
                            stack.Push(new BucketInfo((nuint)evictedSize, (nuint)occupyingBucket));
                            evictions++;
                            
                            // Remove evicted bucket from slots
                            var evictedPilot = (ulong)_pilots[occupyingBucket];
                            var evictedHashes = sortedHashes.AsSpan(evictedStart, evictedSize);
                            
                            foreach (var evictedHash in evictedHashes)
                            {
                                var evictedGlobalSlot = ComputeSlot(evictedHash, evictedPilot);
                                slots[evictedGlobalSlot] = -1;
                                taken.Set(evictedGlobalSlot, false);
                            }
                        }
                        
                        // Place current bucket
                        slots[globalSlot] = currentBucket;
                        taken.Set(globalSlot, true);
                    }
                    
                    // Update recent buckets
                    recentIdx = (recentIdx + 1) % recent.Length;
                    recent[recentIdx] = currentBucket;
                }
                
                totalEvictions += evictions;
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
        
        // Exact Rust sort_buckets implementation
        private (int[] bucketStarts, ulong[] sortedHashes) SortBuckets(ReadOnlySpan<TKey> keys, ulong seed)
        {
            // Hash all keys and group by bucket
            var keyBucketPairs = new List<(ulong hash, int bucket)>(keys.Length);
            var seenKeys = new HashSet<TKey>();
            
            foreach (var key in keys)
            {
                if (!seenKeys.Add(key))
                {
                    throw new PtrHashException($"Duplicate key found: {key}");
                }
                
                var hash = _hasher.Hash(key, seed);
                var bucket = _bucketFunction.GetBucket(hash);
                keyBucketPairs.Add((hash, (int)bucket));
            }
            
            // Sort by bucket, then by hash for deterministic order
            keyBucketPairs.Sort((a, b) => {
                var bucketCompare = a.bucket.CompareTo(b.bucket);
                return bucketCompare != 0 ? bucketCompare : a.hash.CompareTo(b.hash);
            });
            
            // Create bucket starts array (like Rust)
            var bucketStarts = new int[_bucketsPerPart + 1]; // +1 for end sentinel
            var sortedHashes = new ulong[keys.Length];
            
            int currentBucket = 0;
            int hashIndex = 0;
            
            foreach (var (hash, bucket) in keyBucketPairs)
            {
                // Fill in start positions for empty buckets
                while (currentBucket <= bucket)
                {
                    bucketStarts[currentBucket] = hashIndex;
                    currentBucket++;
                }
                
                sortedHashes[hashIndex] = hash;
                hashIndex++;
            }
            
            // Fill remaining bucket starts
            while (currentBucket <= (int)_bucketsPerPart)
            {
                bucketStarts[currentBucket] = hashIndex;
                currentBucket++;
            }
            
            return (bucketStarts, sortedHashes);
        }
        
        private int[] CreateBucketOrderFromStarts(int[] bucketStarts)
        {
            var bucketSizes = new List<(int size, int bucket)>();
            
            for (int i = 0; i < bucketStarts.Length - 1; i++)
            {
                var size = bucketStarts[i + 1] - bucketStarts[i];
                bucketSizes.Add((size, i));
            }
            
            // Sort by size descending, then by bucket index for deterministic order
            bucketSizes.Sort((a, b) => {
                var sizeCompare = b.size.CompareTo(a.size);
                return sizeCompare != 0 ? sizeCompare : a.bucket.CompareTo(b.bucket);
            });
            
            return bucketSizes.Select(x => x.bucket).ToArray();
        }
        
        // Exact Rust find_pilot implementation with global slot computation
        private (ulong pilot, ulong pilotHash)? FindPilotRust(ulong kmax, ReadOnlySpan<ulong> bucket, PartitionedBitVec taken, int[] slots)
        {
            var r = bucket.Length / 4 * 4; // Round down to multiple of 4
            
            for (ulong p = 0; p < kmax; p++)
            {
                // Check function that tests if global slot is already taken
                bool CheckSlot(ulong hx) => taken.Get(ComputeSlot(hx, p));
                
                // Process chunks of 4 bucket elements at a time (exact Rust algorithm)
                bool hasCollision = false;
                for (int i = 0; i < r; i += 4)
                {
                    // Check all 4 elements without early break
                    var checks = new bool[4]
                    {
                        CheckSlot(bucket[i]),
                        CheckSlot(bucket[i + 1]),
                        CheckSlot(bucket[i + 2]),
                        CheckSlot(bucket[i + 3])
                    };
                    
                    if (checks[0] || checks[1] || checks[2] || checks[3])
                    {
                        hasCollision = true;
                        break;
                    }
                }
                
                if (hasCollision)
                    continue;
                
                // Check remaining elements
                for (int i = r; i < bucket.Length; i++)
                {
                    if (CheckSlot(bucket[i]))
                    {
                        hasCollision = true;
                        break;
                    }
                }
                
                if (hasCollision)
                    continue;
                
                // No external collisions found, check internal collisions using global slots
                if (TryTakePilotRust(bucket, p, taken))
                {
                    return (p, HashPilot(p));
                }
            }
            
            return null;
        }
        
        
        /// <summary>
        /// Fill `taken` with the slots for pilot, but backtrack as soon as a
        /// collision within the bucket is found.
        /// Returns true on success.
        /// Exact implementation of Rust's try_take_pilot with global slots
        /// </summary>
        private bool TryTakePilotRust(ReadOnlySpan<ulong> bucket, ulong pilot, PartitionedBitVec taken)
        {
            // This bucket does not collide with previous buckets, but it may still collide with itself.
            for (int i = 0; i < bucket.Length; i++)
            {
                var hx = bucket[i];
                var globalSlot = ComputeSlot(hx, pilot); // Use global slot computation
                
                if (taken.Get(globalSlot))
                {
                    // Collision within the bucket. Clean already set entries.
                    for (int j = 0; j < i; j++)
                    {
                        var prevGlobalSlot = ComputeSlot(bucket[j], pilot);
                        taken.Set(prevGlobalSlot, false);
                    }
                    return false;
                }
                taken.Set(globalSlot, true);
            }
            
            return true;
        }
        
        // Exact Rust best pilot finding with global slots
        private (ulong score, ulong pilot) FindBestPilotRust(ReadOnlySpan<ulong> bucket, int[] slots, PartitionedBitVec taken, 
            int[] recent, Random rng, ulong kmax, int[] bucketStarts)
        {
            var p0 = (ulong)rng.Next(256);
            var best = (score: ulong.MaxValue, pilot: ulong.MaxValue);
            
            for (ulong delta = 0; delta < kmax; delta++)
            {
                var pilot = (p0 + delta) % kmax;
                ulong collisionScore = 0;
                bool skipPilot = false;
                
                foreach (var hash in bucket)
                {
                    var globalSlot = ComputeSlot(hash, pilot); // Use global slot computation
                    var occupyingBucket = slots[globalSlot];
                    
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
                    
                    // Calculate collision score (bucket size squared)
                    var bucketSize = bucketStarts[occupyingBucket + 1] - bucketStarts[occupyingBucket];
                    var newScore = (ulong)(bucketSize * bucketSize);
                    collisionScore += newScore;
                    
                    if (collisionScore >= best.score)
                    {
                        skipPilot = true;
                        break;
                    }
                }
                
                if (skipPilot)
                    continue;
                
                // Check for duplicate slots within this bucket (Rust duplicate_slots check)
                if (!HasDuplicateSlotsRust(bucket, pilot))
                {
                    best = (collisionScore, pilot);
                    
                    // Early exit optimization
                    var expectedScore = (ulong)(bucket.Length * bucket.Length);
                    if (collisionScore == expectedScore)
                    {
                        break;
                    }
                }
            }
            
            return best;
        }
        
        private bool HasDuplicateSlotsRust(ReadOnlySpan<ulong> bucket, ulong pilot)
        {
            var slots = new HashSet<nuint>();
            
            foreach (var hash in bucket)
            {
                var globalSlot = ComputeSlot(hash, pilot); // Use global slot computation
                if (!slots.Add(globalSlot))
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
}