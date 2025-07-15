using System;
using System.Buffers;
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
        
        // Get a specific part's BitVec
        public BitVec GetPart(int partIndex) => _parts[partIndex];
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
        // Debug feature flag - set to false for production
        private const bool DEBUG_PILOT_SEARCH = true;
        
        [System.Diagnostics.Conditional("DEBUG_PILOT_SEARCH")]
        private static void DebugLog(string message)
        {
            if (DEBUG_PILOT_SEARCH)
                Console.WriteLine(message);
        }
        
        // Cap parallelism to prevent thread explosion (Rust's rayon uses all cores by default)
        private static readonly int MaxParallelism = Environment.ProcessorCount;
        
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
            Console.WriteLine($"PtrHash constructor: {keys.Length} keys, minimal={parameters.Minimal}");
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

            Console.WriteLine($"Starting construction: {_parts} parts, {_slotsPerPart} slots/part, {_bucketsPerPart} buckets/part");
            // Construct the hash function using hash-evict algorithm
            if (!TryConstruct(keys, out _seed))
            {
                throw new PtrHashException("Failed to construct minimal perfect hash function. Try different parameters or check for duplicate keys.");
            }
            Console.WriteLine("Construction completed successfully");

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
            var bucket = Bucket(hx); // Use global bucket calculation like Rust
            var pilot = (ulong)_pilots[bucket]; // Convert byte to ulong (Pilot type)
            return Slot(hx, pilot);
        }
        
        // Rust bucket() function - returns global bucket index
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint Bucket(HashValue hx)
        {
            // EXACT Rust optimization: Fast path for LINEAR bucket functions
            // Rust: if BF::LINEAR { return self.rem_buckets_total.reduce(hx.high()); }
            if (_parts == 1)
            {
                // Single part - use direct reduction (Rust fast path)
                return FastReduce.Reduce(hx.High(), _bucketsPerPart);
            }
            
            // Multi-part: Extract high bits for part selection; do normal bucket computation within the part
            // Rust: let (part, hx) = self.rem_parts.reduce_with_remainder(hx.high());
            //       let bucket = self.bucket_in_part(hx);
            //       part * self.buckets + bucket
            var (part, remainder) = FastReduce.ReduceWithRemainder(hx.High(), _parts);
            var localBucket = FastReduce.Reduce(remainder, _bucketsPerPart);
            return part * _bucketsPerPart + localBucket;
        }
        
        // Rust bucket_in_part() function - returns bucket index within a part
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint BucketInPart(HashValue hx)
        {
            // For Linear bucket function: rem_buckets.reduce(hx.high())
            // For u64, high() returns the full value
            return FastReduce.Reduce(hx.High(), _bucketsPerPart);
        }
    
        
        /// <summary>
        /// FastReduce implementation from Rust - reduces using high bits multiplication
        /// </summary>
        private static class FastReduce
        {
            [MethodImpl(MethodImplOptions.AggressiveInlining)]
            public static nuint Reduce(ulong hash, nuint modulus)
            {
                // Rust: mul_high(d, h) = (d as u128 * h as u128) >> 64
                var result = (UInt128)modulus * (UInt128)hash;
                return (nuint)(result >> 64);
            }
            
            [MethodImpl(MethodImplOptions.AggressiveInlining)]
            public static (nuint reduced, ulong remainder) ReduceWithRemainder(ulong hash, nuint modulus)
            {
                var result = (UInt128)modulus * (UInt128)hash;
                return ((nuint)(result >> 64), (ulong)result);
            }
        }
        
        /// <summary>
        /// FastMod32 implementation from Rust - used for slots reduction
        /// </summary>
        private static class FastMod32
        {
            [MethodImpl(MethodImplOptions.AggressiveInlining)]
            public static nuint Reduce(ulong hash, nuint modulus)
            {
                // Rust FM32: let lowbits = self.m.wrapping_mul(h as u64);
                //           ((lowbits as u128 * self.d as u128) >> 64) as usize
                // Where m = (u64::MAX / d as u64).wrapping_add(1)
                var m = (ulong.MaxValue / (ulong)modulus) + 1;
                var lowbits = m * hash;
                return (nuint)((UInt128)lowbits * (UInt128)modulus >> 64);
            }
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
            // rem_slots uses FM32, not FastReduce!
            return FastMod32.Reduce(hx.Low() ^ hp, _slotsPerPart);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private nuint GetPart(HashValue hx)
        {
            // Rust uses: rem_parts.reduce(hx.high())
            // For u64, high() returns the full value, not just high 32 bits
            return FastReduce.Reduce(hx.High(), _parts);
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
            var nextHashes = new HashValue[B];
            var nextBuckets = new nuint[B];
            
            // Initialize and prefetch first B values
            var leftover = Math.Min(B, keys.Length);
            for (int idx = 0; idx < B; idx++)
            {
                HashValue hx = default;
                if (idx < keys.Length)
                {
                    hx = _hasher.Hash(keys[idx], _seed);
                }
                nextHashes[idx] = hx;
                nextBuckets[idx] = Bucket(nextHashes[idx]);
                
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
                    nextBuckets[idx] = Bucket(nextHashes[idx]);
                    
                    // Prefetch pilot for the new bucket
                    Prefetch.PrefetchRead(pilotsPtr + nextBuckets[idx]);
                    
                    // Compute current slot using cached values
                    var pilot = (ulong)pilotsPtr[curBucket];
                    var slot = Slot(curHash, pilot);
                    
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
                    var slot = Slot(curHash, pilot);
                    
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
                var seed = ((ulong)(uint)rng.Next() << 32) | (ulong)(uint)rng.Next();
                
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
            var buildStopwatch = System.Diagnostics.Stopwatch.StartNew();
            Console.WriteLine($"TryBuildWithSeed: {keys.Length} keys, seed={seed}");
            
            // Store seed for later use
            this._seed = seed;
            
            // Reset pilots
            Array.Fill(_pilots, (byte)0);

            // First, hash all keys and partition them by parts (like Rust's sort_parts)
            var hashingStart = System.Diagnostics.Stopwatch.StartNew();
            var (allHashes, partStarts) = SortPartsByHashes(keys, seed);
            hashingStart.Stop();
            Console.WriteLine($"SortPartsByHashes completed: {_parts} parts in {hashingStart.ElapsedMilliseconds}ms");
            
            // Track taken slots using Vec<BitVec> like Rust - for ALL parts
            var taken = new PartitionedBitVec(_parts, _slotsPerPart);
            
            // Process parts in parallel like Rust's par_chunks_exact_mut
            var parallelOptions = new ParallelOptions
            {
                MaxDegreeOfParallelism = MaxParallelism
            };
            
            var success = true;
            var lockObject = new object();
            
            var parallelStart = System.Diagnostics.Stopwatch.StartNew();
            DebugLog($"Starting parallel build of {_parts} parts...");
            
            // Log part sizes for analysis
            for (int i = 0; i < (int)_parts; i++)
            {
                var partSize = partStarts[i + 1] - partStarts[i];
                DebugLog($"  Part {i}: {partSize} hashes");
            }
            
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
            parallelStart.Stop();
            Console.WriteLine($"Parallel build completed in {parallelStart.ElapsedMilliseconds}ms: success={success}");
            
            if (!success)
            {
                buildStopwatch.Stop();
                Console.WriteLine($"Build FAILED after {buildStopwatch.ElapsedMilliseconds}ms");
                return false;
            }
            
            // After successful construction, create remap table if needed
            var remapStart = System.Diagnostics.Stopwatch.StartNew();
            if (!TryRemapFreeSlots(taken))
            {
                buildStopwatch.Stop();
                Console.WriteLine($"Remap FAILED after {buildStopwatch.ElapsedMilliseconds}ms");
                return false; // Failed to create remap table
            }
            remapStart.Stop();
            
            buildStopwatch.Stop();
            Console.WriteLine($"TryBuildWithSeed SUCCESS in {buildStopwatch.ElapsedMilliseconds}ms");
            Console.WriteLine($"  Breakdown: hashing={hashingStart.ElapsedMilliseconds}ms, parallel_build={parallelStart.ElapsedMilliseconds}ms, remap={remapStart.ElapsedMilliseconds}ms");
            return true;
        }

        private static bool IsPowerOfTwo(int value)
        {
            return value > 0 && (value & (value - 1)) == 0;
        }
        
        // Hash all keys and partition by parts (like Rust's sort_parts)
        private (HashValue[] allHashes, uint[] partStarts) SortPartsByHashes(ReadOnlySpan<TKey> keys, ulong seed)
        {
            // Convert to array for parallel processing (ReadOnlySpan can't be captured in lambda)
            var keysArray = keys.ToArray();
            var allHashes = new HashValue[keysArray.Length];
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
        private bool BuildPartRust(int part, ReadOnlySpan<HashValue> partHashes, Span<byte> partPilots, PartitionedBitVec taken)
        {
            var partStopwatch = System.Diagnostics.Stopwatch.StartNew();
            Console.WriteLine($"BuildPartRust: Part {part}, {partHashes.Length} hashes");
            
            // Sort buckets within this part (like Rust's sort_buckets)
            var sortStopwatch = System.Diagnostics.Stopwatch.StartNew();
            var (sortedHashes, bucketStarts, bucketOrder) = SortBucketsInPart(part, partHashes);
            sortStopwatch.Stop();
            DebugLog($"  Part {part}: Sorting took {sortStopwatch.ElapsedMilliseconds}ms, {bucketOrder.Length} buckets");
            
            // Use the sorted hashes from here on - this is CRITICAL for matching Rust exactly
            var hashesSpan = sortedHashes.AsSpan();
            
            const ulong kmax = 256;
            var slots = new int[_slotsPerPart];
            Array.Fill(slots, -1); // -1 = BucketIdx::NONE
            
            // Get this part's BitVec - CRITICAL: Rust passes just the part's BitSlice, not global
            var partTaken = taken.GetPart(part);
            
            // EXACT RUST BINARY HEAP IMPLEMENTATION
            var stack = new BinaryHeap<BucketInfo>();
            var recent = new int[16];
            Array.Fill(recent, -1); // -1 = BucketIdx::NONE
            var rng = new Random();
            var totalEvictions = 0;

            // Process buckets in size order (largest first) - EXACT Rust pattern
            var bucketProcessingStopwatch = System.Diagnostics.Stopwatch.StartNew();
            var totalBuckets = bucketOrder.Length;
            var processedBuckets = 0;
            var totalPilotSearchTime = 0L;
            var totalEvictionTime = 0L;
            var totalPilotAttempts = 0;
            var bucketsRequiringManyPilots = 0;
            
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
                var bucketStartTime = System.Diagnostics.Stopwatch.StartNew();
                
                // Push initial bucket onto stack (Rust: stack.push((new_b_len, new_b)))
                stack.Push(new BucketInfo((nuint)newBucketSize, (nuint)newBucket));
                Array.Fill(recent, -1); // Rust: recent.fill(BucketIdx::NONE)
                var recentIdx = 0;
                recent[0] = newBucket; // Rust: recent[0] = new_b
                
                // Process eviction chain (Rust: while let Some((_b_len, b)) = stack.pop())
                var maxEvictionsForBucket = 0;
                var evictionLoopStart = System.Diagnostics.Stopwatch.StartNew();
                
                while (!stack.IsEmpty)
                {
                    // DEBUG: Add hard limit to prevent infinite loops during debugging
                    if (evictions > 100000)
                    {
                        evictionLoopStart.Stop();
                        Console.WriteLine($"INFINITE LOOP DETECTED: Part {part}, evictions={evictions}, stack size={stack.Count}");
                        Console.WriteLine($"  Bucket {bucketIdx}/{totalBuckets}, size={newBucketSize}, time={bucketStartTime.ElapsedMilliseconds}ms");
                        Console.WriteLine($"  Recent array: [{string.Join(",", recent.Where(r => r != -1))}]");
                        Console.WriteLine($"  Max evictions for this bucket: {maxEvictionsForBucket}");
                        Console.WriteLine($"  Total time in eviction loop: {evictionLoopStart.ElapsedMilliseconds}ms");
                        return false;
                    }
                    
                    // Track max evictions for this bucket
                    if (evictions > maxEvictionsForBucket)
                        maxEvictionsForBucket = evictions;
                    
                    // DEBUG: Log progress periodically
                    if (evictions > 0 && evictions % 5000 == 0)
                    {
                        Console.WriteLine($"Part {part}: {evictions} evictions, stack size={stack.Count}, bucket {bucketIdx}/{totalBuckets}, elapsed={bucketStartTime.ElapsedMilliseconds}ms");
                    }
                    
                    // EXACT Rust termination condition (nested structure)
                    if (evictions > (int)_slotsPerPart && IsPowerOfTwo(evictions))
                    {
                        Console.WriteLine($"Part {part}: Power-of-two check at evictions={evictions}, slotsPerPart={_slotsPerPart}");
                        // Expensive logging/diagnostics on power-of-two intervals only
                        if (evictions >= 10 * (int)_slotsPerPart)
                        {
                            Console.WriteLine($"Part {part}: Too many evictions, aborting at {evictions}");
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
                    var pilotSearchStart = System.Diagnostics.Stopwatch.StartNew();
                    var pilotResult = FindPilot(kmax, currentBucketHashes, partTaken, out var pilotsChecked, currentBucket);
                    pilotSearchStart.Stop();
                    totalPilotSearchTime += pilotSearchStart.ElapsedTicks;
                    totalPilotAttempts += pilotsChecked;
                    if (pilotsChecked > 50) bucketsRequiringManyPilots++;
                    
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
                    var bestPilotStart = System.Diagnostics.Stopwatch.StartNew();
                    var bestResult = FindBestPilotWithEvictionInPart(currentBucketHashes, slots, recent, rng, kmax, bucketStarts);
                    bestPilotStart.Stop();
                    totalPilotSearchTime += bestPilotStart.ElapsedTicks;
                    
                    if (bestResult.pilot == ulong.MaxValue)
                    {
                        if (DEBUG_PILOT_SEARCH)
                        {
                            DebugLog($"Part {part}: Failed to find pilot for bucket {currentBucket} with {currentBucketHashes.Length} hashes. Indistinguishable hashes detected.");
                        }
                        return false; // Failed to find suitable pilot (indistinguishable hashes)
                    }
                    
                    var bestPilot = bestResult.pilot;
                    partPilots[currentBucket] = (byte)bestPilot;
                    var hp = HashPilot(bestPilot);
                    
                    // EXACT Rust eviction algorithm: Drop collisions and set new pilot
                    var evictionStart = System.Diagnostics.Stopwatch.StartNew();
                    var evictionsThisRound = 0;
                    
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
                            evictionsThisRound++;
                            
                            // Clear all slots occupied by evicted bucket (Rust: for p2 in slots_for_bucket)
                            var evictedPilot = (ulong)partPilots[occupyingBucket];
                            var evictedHp = HashPilot(evictedPilot);
                            var evictedHashes = hashesSpan.Slice(evictedStart, evictedSize);
                            
                            foreach (var evictedHash in evictedHashes)
                            {
                                var evictedLocalSlot = SlotInPartHp(evictedHash, evictedHp);
                                slots[evictedLocalSlot] = -1; // BucketIdx::NONE
                                
                                // Clear slot from part's BitVec
                                partTaken.Set(evictedLocalSlot, false);
                            }
                        }
                        
                        // Place current bucket (Rust: *slots.get_unchecked_mut(slot) = b)
                        slots[localSlot] = currentBucket;
                        
                        // Mark slot as taken (Rust: taken.set_unchecked(slot, true))
                        partTaken.Set(localSlot, true);
                    }
                    
                    evictionStart.Stop();
                    totalEvictionTime += evictionStart.ElapsedTicks;
                    
                    if (evictionsThisRound > 0)
                    {
                        // Log when we're causing lots of evictions
                        if (evictionsThisRound >= 3)
                        {
                            Console.WriteLine($"  Part {part}: Bucket {currentBucket} evicted {evictionsThisRound} buckets, stack now={stack.Count}");
                        }
                    }
                    
                    // Update recent buckets (EXACT Rust algorithm)
                    recentIdx += 1; // recent_idx += 1
                    recentIdx %= recent.Length; // recent_idx %= recent.len()
                    recent[recentIdx] = currentBucket; // recent[recent_idx] = b
                }
                
                bucketStartTime.Stop();
                processedBuckets++;
                
                // Log slow buckets
                if (bucketStartTime.ElapsedMilliseconds > 100 || evictions > 1000)
                {
                    Console.WriteLine($"  Part {part}: SLOW bucket {newBucket} (size={newBucketSize}) took {bucketStartTime.ElapsedMilliseconds}ms, {evictions} evictions");
                }
                
                totalEvictions += evictions;
                
                // Periodic progress updates
                if (DEBUG_PILOT_SEARCH && processedBuckets % 500 == 0)
                {
                    var avgTimePerBucket = bucketProcessingStopwatch.ElapsedMilliseconds / (double)processedBuckets;
                    var eta = (totalBuckets - processedBuckets) * avgTimePerBucket;
                    DebugLog($"  Part {part}: {processedBuckets}/{totalBuckets} buckets, avg={avgTimePerBucket:F1}ms/bucket, ETA={eta:F0}ms");
                }
            }
            
            bucketProcessingStopwatch.Stop();
            partStopwatch.Stop();
            
            if (DEBUG_PILOT_SEARCH)
            {
                DebugLog($"Part {part} completed successfully:");
                DebugLog($"  Total time: {partStopwatch.ElapsedMilliseconds}ms");
                DebugLog($"  Bucket processing: {bucketProcessingStopwatch.ElapsedMilliseconds}ms");
                DebugLog($"  Pilot search time: {new TimeSpan(totalPilotSearchTime).TotalMilliseconds:F1}ms");
                DebugLog($"  Eviction time: {new TimeSpan(totalEvictionTime).TotalMilliseconds:F1}ms");
                DebugLog($"  Total evictions: {totalEvictions}, Buckets processed: {bucketOrder.Length}");
                DebugLog($"  Pilot search stats: {totalPilotAttempts} total attempts, avg {(double)totalPilotAttempts / bucketOrder.Length:F1} per bucket");
                DebugLog($"  Expensive buckets: {bucketsRequiringManyPilots} buckets required >50 pilot attempts");
            }
            return true;
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
                // For hashes already in this part, compute their bucket within the part
                // This should match how Rust's sort_buckets works
                var localBucket = (int)BucketInPart(hash);
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
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray1(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            pilotsChecked = 0;
            var hash0 = bucketHashes[0];
            
            for (ulong pilot = 0; pilot < kmax; pilot++)
            {
                pilotsChecked++;
                var hp = HashPilot(pilot);
                var slot0 = SlotInPartHp(hash0, hp);
                
                if (!taken.GetUnchecked(slot0))
                {
                    if (TryTakePilotInPart(bucketHashes, pilot, taken))
                    {
                        return (pilot, hp);
                    }
                }
            }
            return null;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray2(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            pilotsChecked = 0;
            var hash0 = bucketHashes[0];
            var hash1 = bucketHashes[1];
            
            for (ulong pilot = 0; pilot < kmax; pilot++)
            {
                pilotsChecked++;
                var hp = HashPilot(pilot);
                var slot0 = SlotInPartHp(hash0, hp);
                var slot1 = SlotInPartHp(hash1, hp);
                
                if (!taken.GetUnchecked(slot0) && !taken.GetUnchecked(slot1))
                {
                    if (TryTakePilotInPart(bucketHashes, pilot, taken))
                    {
                        return (pilot, hp);
                    }
                }
            }
            return null;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray3(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            pilotsChecked = 0;
            var hash0 = bucketHashes[0];
            var hash1 = bucketHashes[1];
            var hash2 = bucketHashes[2];
            
            for (ulong pilot = 0; pilot < kmax; pilot++)
            {
                pilotsChecked++;
                var hp = HashPilot(pilot);
                var slot0 = SlotInPartHp(hash0, hp);
                var slot1 = SlotInPartHp(hash1, hp);
                var slot2 = SlotInPartHp(hash2, hp);
                
                if (!taken.GetUnchecked(slot0) && !taken.GetUnchecked(slot1) && !taken.GetUnchecked(slot2))
                {
                    if (TryTakePilotInPart(bucketHashes, pilot, taken))
                    {
                        return (pilot, hp);
                    }
                }
            }
            return null;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray4(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            pilotsChecked = 0;
            var hash0 = bucketHashes[0];
            var hash1 = bucketHashes[1];
            var hash2 = bucketHashes[2];
            var hash3 = bucketHashes[3];
            
            for (ulong pilot = 0; pilot < kmax; pilot++)
            {
                pilotsChecked++;
                var hp = HashPilot(pilot);
                var slot0 = SlotInPartHp(hash0, hp);
                var slot1 = SlotInPartHp(hash1, hp);
                var slot2 = SlotInPartHp(hash2, hp);
                var slot3 = SlotInPartHp(hash3, hp);
                
                if (!taken.GetUnchecked(slot0) && !taken.GetUnchecked(slot1) && !taken.GetUnchecked(slot2) && !taken.GetUnchecked(slot3))
                {
                    if (TryTakePilotInPart(bucketHashes, pilot, taken))
                    {
                        return (pilot, hp);
                    }
                }
            }
            return null;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray5(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            pilotsChecked = 0;
            var hash0 = bucketHashes[0];
            var hash1 = bucketHashes[1];
            var hash2 = bucketHashes[2];
            var hash3 = bucketHashes[3];
            var hash4 = bucketHashes[4];
            
            for (ulong pilot = 0; pilot < kmax; pilot++)
            {
                pilotsChecked++;
                var hp = HashPilot(pilot);
                var slot0 = SlotInPartHp(hash0, hp);
                var slot1 = SlotInPartHp(hash1, hp);
                var slot2 = SlotInPartHp(hash2, hp);
                var slot3 = SlotInPartHp(hash3, hp);
                var slot4 = SlotInPartHp(hash4, hp);
                
                if (!taken.GetUnchecked(slot0) && !taken.GetUnchecked(slot1) && !taken.GetUnchecked(slot2) && !taken.GetUnchecked(slot3) && !taken.GetUnchecked(slot4))
                {
                    if (TryTakePilotInPart(bucketHashes, pilot, taken))
                    {
                        return (pilot, hp);
                    }
                }
            }
            return null;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray6(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            pilotsChecked = 0;
            var hash0 = bucketHashes[0];
            var hash1 = bucketHashes[1];
            var hash2 = bucketHashes[2];
            var hash3 = bucketHashes[3];
            var hash4 = bucketHashes[4];
            var hash5 = bucketHashes[5];
            
            for (ulong pilot = 0; pilot < kmax; pilot++)
            {
                pilotsChecked++;
                var hp = HashPilot(pilot);
                var slot0 = SlotInPartHp(hash0, hp);
                var slot1 = SlotInPartHp(hash1, hp);
                var slot2 = SlotInPartHp(hash2, hp);
                var slot3 = SlotInPartHp(hash3, hp);
                var slot4 = SlotInPartHp(hash4, hp);
                var slot5 = SlotInPartHp(hash5, hp);
                
                if (!taken.GetUnchecked(slot0) && !taken.GetUnchecked(slot1) && !taken.GetUnchecked(slot2) && !taken.GetUnchecked(slot3) && !taken.GetUnchecked(slot4) && !taken.GetUnchecked(slot5))
                {
                    if (TryTakePilotInPart(bucketHashes, pilot, taken))
                    {
                        return (pilot, hp);
                    }
                }
            }
            return null;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray7(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            pilotsChecked = 0;
            var hash0 = bucketHashes[0];
            var hash1 = bucketHashes[1];
            var hash2 = bucketHashes[2];
            var hash3 = bucketHashes[3];
            var hash4 = bucketHashes[4];
            var hash5 = bucketHashes[5];
            var hash6 = bucketHashes[6];
            
            for (ulong pilot = 0; pilot < kmax; pilot++)
            {
                pilotsChecked++;
                var hp = HashPilot(pilot);
                var slot0 = SlotInPartHp(hash0, hp);
                var slot1 = SlotInPartHp(hash1, hp);
                var slot2 = SlotInPartHp(hash2, hp);
                var slot3 = SlotInPartHp(hash3, hp);
                var slot4 = SlotInPartHp(hash4, hp);
                var slot5 = SlotInPartHp(hash5, hp);
                var slot6 = SlotInPartHp(hash6, hp);
                
                if (!taken.GetUnchecked(slot0) && !taken.GetUnchecked(slot1) && !taken.GetUnchecked(slot2) && !taken.GetUnchecked(slot3) && !taken.GetUnchecked(slot4) && !taken.GetUnchecked(slot5) && !taken.GetUnchecked(slot6))
                {
                    if (TryTakePilotInPart(bucketHashes, pilot, taken))
                    {
                        return (pilot, hp);
                    }
                }
            }
            return null;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private (ulong pilot, ulong hashPilot)? FindPilotArray8(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            pilotsChecked = 0;
            var hash0 = bucketHashes[0];
            var hash1 = bucketHashes[1];
            var hash2 = bucketHashes[2];
            var hash3 = bucketHashes[3];
            var hash4 = bucketHashes[4];
            var hash5 = bucketHashes[5];
            var hash6 = bucketHashes[6];
            var hash7 = bucketHashes[7];
            
            for (ulong pilot = 0; pilot < kmax; pilot++)
            {
                pilotsChecked++;
                var hp = HashPilot(pilot);
                var slot0 = SlotInPartHp(hash0, hp);
                var slot1 = SlotInPartHp(hash1, hp);
                var slot2 = SlotInPartHp(hash2, hp);
                var slot3 = SlotInPartHp(hash3, hp);
                var slot4 = SlotInPartHp(hash4, hp);
                var slot5 = SlotInPartHp(hash5, hp);
                var slot6 = SlotInPartHp(hash6, hp);
                var slot7 = SlotInPartHp(hash7, hp);
                
                if (!taken.GetUnchecked(slot0) && !taken.GetUnchecked(slot1) && !taken.GetUnchecked(slot2) && !taken.GetUnchecked(slot3) && !taken.GetUnchecked(slot4) && !taken.GetUnchecked(slot5) && !taken.GetUnchecked(slot6) && !taken.GetUnchecked(slot7))
                {
                    if (TryTakePilotInPart(bucketHashes, pilot, taken))
                    {
                        return (pilot, hp);
                    }
                }
            }
            return null;
        }
        
        // Variable-size bucket processing for larger buckets (renamed from FindPilotInPart)
        private (ulong pilot, ulong hashPilot)? FindPilotSlice(ulong kmax, ReadOnlySpan<HashValue> bucketHashes, BitVec taken, out int pilotsChecked, int bucketId = -1)
        {
            // EXACT Rust algorithm: Sequential search from 0 to kmax-1 with 4x chunking
            int r = bucketHashes.Length / 4 * 4; // Rust: let r = bucket.len() / 4 * 4;
            
            pilotsChecked = 0;
            var debugThisBucket = false; // Will be set true if this bucket requires many pilots
            
            
            for (ulong pilot = 0; pilot < kmax; pilot++) // Rust: 'p: for p in 0u64..kmax
            {
                pilotsChecked++;
                var hp = HashPilot(pilot);
                
                // Enable debugging if this bucket is taking too many pilots
                if (!debugThisBucket && pilotsChecked > 50 && bucketId >= 0 && bucketId < 10)
                {
                    debugThisBucket = true;
                    if (DEBUG_PILOT_SEARCH)
                    {
                        var totalOccupied = taken.CountOnes();
                        var totalSlots = taken.Length;
                        DebugLog($"      DEBUG Bucket {bucketId}: {bucketHashes.Length} hashes, {totalOccupied}/{totalSlots} slots occupied ({(double)totalOccupied/totalSlots:P1}) after {pilotsChecked} pilots");
                    }
                }
                
                if (DEBUG_PILOT_SEARCH && debugThisBucket && pilot < (ulong)(pilotsChecked + 3)) // Debug next 3 pilots after threshold
                {
                    DebugLog($"        Pilot {pilot}: hp={hp}");
                    for (int i = 0; i < Math.Min(bucketHashes.Length, 4); i++)
                    {
                        var hashValue = bucketHashes[i];
                        var hashLow = hashValue.Low();
                        var xorResult = hashLow ^ hp;
                        var slot = SlotInPartHp(hashValue, hp);
                        var occupied = taken.GetUnchecked(slot);
                        DebugLog($"          Hash[{i}]={hashValue.Full()}, low={hashLow}, xor={xorResult}, slot={slot}, occupied={occupied}");
                    }
                }
                
                // Process chunks of 4 bucket elements at a time (EXACT Rust)
                bool hasCollision = false;
                for (int i = 0; i < r; i += 4)
                {
                    // Check all 4 elements of the chunk without early break (EXACT Rust)
                    var slot0 = SlotInPartHp(bucketHashes[i], hp);
                    var slot1 = SlotInPartHp(bucketHashes[i + 1], hp);
                    var slot2 = SlotInPartHp(bucketHashes[i + 2], hp);
                    var slot3 = SlotInPartHp(bucketHashes[i + 3], hp);
                    
                    // Avoid array allocation and bounds checking (PERFORMANCE CRITICAL)
                    if (taken.GetUnchecked(slot0) || taken.GetUnchecked(slot1) || taken.GetUnchecked(slot2) || taken.GetUnchecked(slot3)) // Rust: if checks.iter().any(|&bad| bad)
                    {
                        hasCollision = true;
                        break; // Rust: continue 'p
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
                
                if (hasCollision) 
                {
                    if (DEBUG_PILOT_SEARCH && debugThisBucket && pilot < (ulong)(pilotsChecked + 3))
                    {
                        DebugLog($"        Pilot {pilot}: Skipped due to external collision in chunk processing");
                    }
                    continue; // Rust: if bad { continue 'p; }
                }
                
                // If no external collision, try to take this pilot (EXACT Rust)
                if (TryTakePilotInPart(bucketHashes, pilot, taken)) // Rust: if self.try_take_pilot(bucket, hp, taken)
                {
                    if (DEBUG_PILOT_SEARCH && pilotsChecked > 50) // Log if this bucket required many pilot attempts
                    {
                        DebugLog($"    Bucket with {bucketHashes.Length} hashes found pilot {pilot} after {pilotsChecked} attempts");
                    }
                    return (pilot, hp); // Rust: return Some((p, hp))
                }
                else if (DEBUG_PILOT_SEARCH && debugThisBucket && pilot < (ulong)(pilotsChecked + 3))
                {
                    DebugLog($"        TryTakePilotInPart FAILED for pilot {pilot} - internal collision within bucket");
                }
            }
            
            if (DEBUG_PILOT_SEARCH)
            {
                DebugLog($"    FAILED: Bucket with {bucketHashes.Length} hashes exhausted all {pilotsChecked} pilots!");
            }
            return null; // Rust: None
        }
        
        // EXACT Rust try_take_pilot implementation - marks slots as taken with backtracking
        private bool TryTakePilotInPart(ReadOnlySpan<HashValue> bucketHashes, ulong pilot, BitVec taken)
        {
            var hp = HashPilot(pilot);
            var shouldDebug = DEBUG_PILOT_SEARCH && pilot < 3 && bucketHashes.Length <= 5;
            
            // This bucket does not collide with previous buckets, but it may still collide with itself.
            for (int i = 0; i < bucketHashes.Length; i++)
            {
                var hash = bucketHashes[i];
                var localSlot = SlotInPartHp(hash, hp);
                
                if (taken.Get(localSlot))
                {
                    if (shouldDebug)
                    {
                        DebugLog($"            TryTakePilot({pilot}): Collision at slot {localSlot} (already occupied)");
                    }
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
        // Find best pilot with minimal collisions (Rust-style eviction logic)
        private (ulong score, ulong pilot) FindBestPilotWithEvictionInPart(ReadOnlySpan<HashValue> bucketHashes, int[] slots, int[] recent, Random rng, ulong kmax, int[] bucketStarts)
        {
            var bestScore = ulong.MaxValue;
            var bestPilot = ulong.MaxValue;
            var startPilot = (ulong)rng.Next(256);
            var newBLen = (ulong)bucketHashes.Length;
            
            // Create duplicate_slots closure matching Rust exactly
            var slotsTmp = new nuint[bucketHashes.Length];
            bool DuplicateSlots(ReadOnlySpan<HashValue> bucketHashes, ulong pilot)
            {
                var hp = HashPilot(pilot);
                
                // EXACT Rust pattern: slots_tmp.clear(); slots_tmp.extend(slots_for_bucket(b, p));
                for (int i = 0; i < bucketHashes.Length; i++)
                {
                    slotsTmp[i] = SlotInPartHp(bucketHashes[i], hp);
                }
                
                // EXACT Rust pattern: slots_tmp.sort_unstable();
                Array.Sort(slotsTmp, 0, bucketHashes.Length);
                
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
                    else if (Array.IndexOf(recent, occupyingBucket) >= 0)
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

        // Check for duplicate slots within a bucket (internal collisions)
        private void ValidateHashFunction(ReadOnlySpan<TKey> keys)
        {
            var indices = new HashSet<nuint>();
            for (int i = 0; i < keys.Length; i++)
            {
                var key = keys[i];
                var hx = _hasher.Hash(key, _seed);
                var bucket = Bucket(hx);
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
                            var otherBucket = Bucket(otherHx);
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