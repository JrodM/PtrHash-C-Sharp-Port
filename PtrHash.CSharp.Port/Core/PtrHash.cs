using System;
using System.Buffers;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Threading;
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
        private static readonly int MaxParallelism = 1;//Environment.ProcessorCount;
        
        private readonly THasher _hasher;
        private readonly byte[] _pilots;
        private readonly LinearBucketFunction _bucketFunction;
        
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
                var shards = 1; // Sharding::None => 1
                
                // Formula of Vigna, eps-cost-sharding: https://arxiv.org/abs/2503.18397
                // (1-alpha)/2, so that on average we still have some room to play with.
                var eps = (1.0 - parameters.Alpha) / 2.0;
                var x = (double)_numKeys * eps * eps / 2.0;
                var targetParts = x / Math.Log(x);
                Console.WriteLine($"[DEBUG] Multi-part calc: n={_numKeys}, eps={eps:F6}, x={x:F6}, ln(x)={Math.Log(x):F6}, targetParts={targetParts:F6}");
                // In Rust, negative float as usize becomes 0. In C#, we need to handle this explicitly
                var partsPerShard = targetParts > 0 ? (nuint)Math.Floor(targetParts) / (nuint)shards : 0;
                _parts = Math.Max(1, partsPerShard) * (nuint)shards;
                Console.WriteLine($"[DEBUG] Parts calculation: targetParts={targetParts:F6} -> partsPerShard={partsPerShard} -> parts={_parts}");
                
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
            
            _pilots = new byte[_bucketsTotal];
            
            // Initialize reduction structures like Rust does
            _remParts = new FastReduceInstance(_parts);
            _remBuckets = new FastReduceInstance(_bucketsPerPart);
            _remSlots = new FM32(Math.Max(1, _slotsPerPart));

            Console.WriteLine($"Starting construction: {_parts} parts, {_slotsPerPart} slots/part, {_bucketsPerPart} buckets/part");
            Console.WriteLine($"  Alpha: {parameters.Alpha}, Lambda: {parameters.Lambda}");
            Console.WriteLine($"  Keys per part: {_numKeys / _parts}, Total slots: {_slotsTotal}");
            Console.WriteLine($"  Real alpha: {(double)_numKeys / (double)_slotsTotal:F4}");
            // Construct the hash function using hash-evict algorithm
            if (!ComputePilots(keys, out _seed))
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

        private bool ComputePilots(ReadOnlySpan<TKey> keys, out ulong finalSeed)
        {
            var overallStart = System.Diagnostics.Stopwatch.StartNew();
            
            // Initialize arrays - matching Rust's initialization
            // Note: _pilots already allocated in constructor, but Rust clears/resizes in loop
            
            var tries = 0;
            const int MAX_TRIES = 10;
            
            var rng = new Random(31415); // ChaCha8Rng::seed_from_u64(31415)
            
            // Loop over global seeds `s` - matching Rust's labeled loop
            while (true) // Rust: let stats = 's: loop
            {
                tries++;
                if (tries > MAX_TRIES)
                {
                    Console.WriteLine($"[ERROR] PtrHash failed to find a global seed after {MAX_TRIES} tries.");
                    finalSeed = 0;
                    return false; // Rust: return None;
                }
                
                var oldSeed = _seed;
                
                // Choose a global seed s
                _seed = (ulong)rng.NextInt64(); // self.seed = rng.random()
                if (tries == 1)
                {
                    Console.WriteLine($"[INFO] First seed tried: {_seed}");
                }
                else
                {
                    Console.WriteLine($"[WARN] Previous seed {oldSeed} failed.");
                    Console.WriteLine($"[WARN] Trying seed number {tries}: {_seed}.");
                }
                
                // NOTE: C# doesn't pre-allocate taken Vec<BitVec> like Rust
                // Each attempt creates fresh PartitionedBitVec in TryBuildWithSeed
                
                if (TryBuildWithSeed(keys, _seed))
                {
                    finalSeed = _seed;
                    
                    // Pack the data - Rust: self.pilots = pilots (already done)
                    // Log timing - matching Rust's log_duration("total build", overall_start)
                    var totalTime = overallStart.ElapsedMilliseconds;
                    Console.WriteLine($"[TRACE] total build: {totalTime}ms");
                    
                    // Rust would return Some(stats) here
                    // C# returns true since we don't track BucketStats
                    return true;
                }
                
                // If build failed, continue to next seed
                // Rust: continue 's;
            }
        }

        private bool TryBuildWithSeed(ReadOnlySpan<TKey> keys, ulong seed)
        {
            var buildStopwatch = System.Diagnostics.Stopwatch.StartNew();
            Console.WriteLine($"[TRACE] TryBuildWithSeed: {keys.Length} keys, seed={seed}");
            
            // Seed already assigned in ComputePilots before calling this method
            // Matching Rust where self.seed is set before calling build_shard
            
            // Reset pilots
            Array.Fill(_pilots, (byte)0);
            // Track taken slots using Vec<BitVec> like Rust - for ALL parts
            var taken = new PartitionedBitVec(_parts, _slotsPerPart);

            // First, hash all keys and partition them by parts (like Rust's sort_parts)
            var hashingStart = System.Diagnostics.Stopwatch.StartNew();
            var (allHashes, partStarts) = SortPartsByHashes(keys, seed);
            hashingStart.Stop();
            Console.WriteLine($"[TRACE] sort buckets: {hashingStart.ElapsedMilliseconds}ms");
            
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
            Console.WriteLine($"[TRACE] find pilots: {parallelStart.ElapsedMilliseconds}ms (success={success})");
            
            if (!success)
            {
                buildStopwatch.Stop();
                Console.WriteLine($"[TRACE] Build FAILED after {buildStopwatch.ElapsedMilliseconds}ms");
                return false;
            }
            
            // After successful construction, create remap table if needed
            var remapStart = System.Diagnostics.Stopwatch.StartNew();
            if (!TryRemapFreeSlots(taken))
            {
                buildStopwatch.Stop();
                Console.WriteLine($"[TRACE] Failed to construct remap table after {buildStopwatch.ElapsedMilliseconds}ms");
                return false; // Rust: continue 's;
            }
            remapStart.Stop();
            
            buildStopwatch.Stop();
            Console.WriteLine($"[TRACE] remap free: {remapStart.ElapsedMilliseconds}ms");
            Console.WriteLine($"[TRACE] build successful in {buildStopwatch.ElapsedMilliseconds}ms");
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
            DebugLog($"[TRACE] BuildPartRust: Part {part}, {partHashes.Length} hashes");
            
            // Sort buckets within this part (like Rust's sort_buckets)
            var sortStopwatch = System.Diagnostics.Stopwatch.StartNew();
            var (sortedHashes, bucketStarts, bucketOrder) = SortBucketsInPart(part, partHashes);
            sortStopwatch.Stop();
            
            // Use the sorted hashes from here on - this is CRITICAL for matching Rust exactly
            var hashesSpan = sortedHashes.AsSpan();
            
            const ulong kmax = 256;
            var slots = new int[_slotsPerPart];
            Array.Fill(slots, -1); // -1 = BucketIdx::NONE
            
            // Get this part's BitVec - CRITICAL: Rust passes just the part's BitSlice, not global
            var partTaken = taken.GetPart(part);
            
            // Debug for Part 0 only to compare with Rust
            var isDebugPart = part == 0;
            if (isDebugPart)
            {
                Console.WriteLine($"C# Part {part}: Starting with {partHashes.Length} hashes, {partTaken.Length} slots");
                var first5 = partHashes.Length >= 5 ? partHashes.Slice(0, 5) : partHashes;
                Console.WriteLine($"C# Part {part}: First 5 hash values: {string.Join(", ", first5.ToArray().Select(h => h.Full().ToString("X16")))}");
            }
            
            // EXACT RUST BINARY HEAP IMPLEMENTATION
            var stack = new BinaryHeap<BucketInfo>();
            var recent = new int[16];
            Array.Fill(recent, -1); // -1 = BucketIdx::NONE
            var rng = new Random(); // Auto-seeded with entropy like Rust's fastrand::Rng::new()
            var totalEvictions = 0;

            // Process buckets in size order (largest first) - EXACT Rust pattern
            if (isDebugPart)
            {
                Console.WriteLine($"C# Part {part}: First 10 bucket sizes: {string.Join(", ", bucketOrder.Take(10).Select(b => bucketStarts[b + 1] - bucketStarts[b]))}");
                Console.WriteLine($"C# Part {part}: First 10 bucket IDs: {string.Join(", ", bucketOrder.Take(10))}");
            }
            
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
                var cycleDetection = new Dictionary<int, int>(); // Track how many times each bucket is processed
                
                while (!stack.IsEmpty)
                {
                    // EXACT Rust termination condition: if evictions >= 10 * self.slots
                    if (evictions >= 10 * (int)_slotsPerPart)
                    {
                        evictionLoopStart.Stop();
                        Console.WriteLine($"INFINITE LOOP DETECTED: Part {part}, evictions={evictions}, stack size={stack.Count}");
                        Console.WriteLine($"  Bucket {bucketIdx}/{totalBuckets} (id={newBucket}), size={newBucketSize}, time={bucketStartTime.ElapsedMilliseconds}ms");
                        Console.WriteLine($"  Recent array: [{string.Join(",", recent.Where(r => r != -1))}]");
                        Console.WriteLine($"  Max evictions for this bucket: {maxEvictionsForBucket}");
                        Console.WriteLine($"  Total time in eviction loop: {evictionLoopStart.ElapsedMilliseconds}ms");
                        // Show current stack size info
                        Console.WriteLine($"  Stack contains {stack.Count} buckets waiting to be processed");
                        return false;
                    }
                    
                    // Track max evictions for this bucket
                    if (evictions > maxEvictionsForBucket)
                        maxEvictionsForBucket = evictions;
                    
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
                    
                    // Debug first few buckets for Part 0
                    if (isDebugPart && processedBuckets < 3)
                    {
                        Console.WriteLine($"C# Part {part}: Processing bucket {currentBucket} (#{processedBuckets}), size={currentBucketHashes.Length}");
                        var first3 = currentBucketHashes.Length >= 3 ? currentBucketHashes.Slice(0, 3) : currentBucketHashes;
                        Console.WriteLine($"C# Part {part}: Bucket {currentBucket} first 3 hashes: {string.Join(", ", first3.ToArray().Select(h => h.Full().ToString("X16")))}");
                    }
                    
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
                    var bestPilot = bestResult.pilot;
                    
                    // EXACT Rust sequence: pilots[b] = p as u8; let hp = self.hash_pilot(p);
                    partPilots[currentBucket] = (byte)bestPilot;
                    var hp = HashPilot(bestPilot);
                    
                    // EXACT Rust eviction algorithm: Drop the collisions and set the new pilot
                    var evictionStart = System.Diagnostics.Stopwatch.StartNew();
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
                    
                    evictionStart.Stop();
                    totalEvictionTime += evictionStart.ElapsedTicks;
                    
                    // Update recent buckets (EXACT Rust algorithm)
                    recentIdx += 1; // recent_idx += 1
                    recentIdx %= recent.Length; // recent_idx %= recent.len()
                    recent[recentIdx] = currentBucket; // recent[recent_idx] = b
                }
                
                bucketStartTime.Stop();
                processedBuckets++;
                totalEvictions += evictions;
            }
            
            bucketProcessingStopwatch.Stop();
            partStopwatch.Stop();
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
        private int _collisionLogCount = 0;
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

                    // DEBUG LOG
                    if (t0 || t1 || t2 || t3)
                    {
                        if (_collisionLogCount < 100)
                        {
                            Console.WriteLine(
                             $"[DEBUG Collision] pilot={pilot}, bucketIdx={bucketId}, " +
                             $"i={i}..{i + 3}, " +
                             $"slots=[{slot0},{slot1},{slot2},{slot3}], " +
                             $"taken=[{t0},{t1},{t2},{t3}]"
                         );
                          _collisionLogCount++;
                        }
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
        private (ulong score, ulong pilot) FindBestPilotWithEvictionInPart(ReadOnlySpan<HashValue> bucketHashes, int[] slots, int[] recent, Random rng, ulong kmax, int[] bucketStarts)
        {
            var bestScore = ulong.MaxValue;
            var bestPilot = ulong.MaxValue;
            var startPilot = (ulong)rng.Next(256); // Random starting pilot
            var newBLen = (ulong)bucketHashes.Length;
            
            // Create duplicate_slots closure matching Rust exactly - optimized version
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