using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Interop.Core;
using PtrHash.CSharp.Interop.PtrHash;
using PtrHash.CSharp.Interop.Native;

namespace HashAnalyzer
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("PtrHash Hash Quality Analyzer");
            Console.WriteLine("============================");

            // Generate test keys (same as benchmark)
            var keyCount = 100_000;
            var random = new Random(42);
            
            Console.WriteLine($"Generating {keyCount:N0} unique keys...");
            var keySet = new HashSet<ulong>();
            while (keySet.Count < keyCount)
            {
                keySet.Add((ulong)random.NextInt64(1, long.MaxValue));
            }
            var keys = keySet.ToArray();
            Console.WriteLine($"Generated {keys.Length:N0} unique keys\n");

            // Test different hashers
            Console.WriteLine("=== Hash Quality Analysis ===");
            
            // Test C# FxHasher
            Console.WriteLine("1. C# FxHasher:");
            var fxHasher = new FxHasher();
            AnalyzeHasher("FxHasher", keys, (key, seed) => fxHasher.Hash(key, seed));
            
            // Test C# StrongerIntHasher  
            Console.WriteLine("\n2. C# StrongerIntHasher:");
            var strongerHasher = new StrongerIntHasher();
            AnalyzeHasher("StrongerIntHasher", keys, (key, seed) => strongerHasher.Hash(key, seed));
            
            // Test Native Rust FxHash (via interop)
            Console.WriteLine("\n3. Native Rust FxHash64 (via interop):");
            AnalyzeHasher("Native FxHash64", keys, (key, seed) => PtrHashU64.TestNativeFxHash64(key, seed));
            
            // Test Native Rust StrongerIntHash (via interop)
            Console.WriteLine("\n4. Native Rust StrongerIntHash (via interop):");
            AnalyzeHasher("Native StrongerIntHash", keys, (key, seed) => PtrHashU64.TestNativeStrongerHash(key, seed));

            // Construction Performance Comparison
            Console.WriteLine("\n=== Construction Performance Analysis ===");
            CompareConstructionPerformance(keys);
        }

        static void AnalyzeHasher(string name, ulong[] keys, Func<ulong, ulong, ulong> hasher)
        {
            // Test with multiple seeds like actual PtrHash construction
            var random = new Random(42);
            var seeds = new ulong[] { 
                0, // Default case
                0x517cc1b727220a95UL, // Fixed seed
                (ulong)random.NextInt64(), // Random like construction
                (ulong)random.NextInt64(),
                (ulong)random.NextInt64()
            };
            
            Console.WriteLine($"  Testing with {seeds.Length} different seeds:");
            
            var totalAvalanche = 0.0;
            foreach (var seed in seeds)
            {
                var avalanche = TestAvalancheEffect(keys.Take(200).ToArray(), hasher, seed);
                totalAvalanche += avalanche;
                Console.WriteLine($"    Seed 0x{seed:X16}: {avalanche:F2}% avalanche");
            }
            
            const int buckets = 1024;
            
            // Hash distribution analysis (using first random seed)
            var testSeed = seeds[2];
            var bucketCounts = new int[buckets];
            var hashes = new List<ulong>();
            
            foreach (var key in keys.Take(10000)) // Sample for distribution
            {
                var hash = hasher(key, testSeed);
                hashes.Add(hash);
                bucketCounts[hash % (ulong)buckets]++;
            }
            
            // Calculate statistics
            var avgPerBucket = hashes.Count / (double)buckets;
            var variance = bucketCounts.Select(c => Math.Pow(c - avgPerBucket, 2)).Average();
            var stdDev = Math.Sqrt(variance);
            var maxBucket = bucketCounts.Max();
            var minBucket = bucketCounts.Min();
            
            Console.WriteLine($"  Hash Distribution (10K keys, {buckets} buckets, seed 0x{testSeed:X16}):");
            Console.WriteLine($"    Average per bucket: {avgPerBucket:F2}");
            Console.WriteLine($"    Standard deviation: {stdDev:F2}");
            Console.WriteLine($"    Min bucket: {minBucket}, Max bucket: {maxBucket}");
            Console.WriteLine($"    Load factor variance: {stdDev / avgPerBucket:F3}");
            Console.WriteLine($"    Average avalanche effect: {totalAvalanche / seeds.Length:F2}% (closer to 50% is better)");
        }
        
        
        static double TestAvalancheEffect(ulong[] keys, Func<ulong, ulong, ulong> hasher, ulong seed)
        {
            var totalBitFlips = 0;
            var totalTests = 0;
            
            foreach (var key in keys)
            {
                var originalHash = hasher(key, seed);
                
                // Test flipping each bit in the key
                for (int bit = 0; bit < 64; bit++)
                {
                    var flippedKey = key ^ (1UL << bit);
                    var flippedHash = hasher(flippedKey, seed);
                    var xorResult = originalHash ^ flippedHash;
                    
                    // Count bit differences
                    totalBitFlips += System.Numerics.BitOperations.PopCount(xorResult);
                    totalTests++;
                }
            }
            
            // Perfect avalanche would flip 50% of output bits
            return (totalBitFlips / (double)(totalTests * 64)) * 100.0;
        }
        
        static void CompareConstructionPerformance(ulong[] keys)
        {
            var iterations = 3;
            
            // Test C# FxHasher construction
            var fxTimes = new List<double>();
            for (int i = 0; i < iterations; i++)
            {
                var sw = Stopwatch.StartNew();
                using var fxHash = new PtrHash<ulong, FxHasher>(keys, PtrHashParams.DefaultFast);
                sw.Stop();
                fxTimes.Add(sw.Elapsed.TotalMilliseconds);
            }
            
            // Test C# StrongerIntHasher construction
            var strongerTimes = new List<double>();
            for (int i = 0; i < iterations; i++)
            {
                var sw = Stopwatch.StartNew();
                using var strongerHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);
                sw.Stop();
                strongerTimes.Add(sw.Elapsed.TotalMilliseconds);
            }
            
            // Test Native construction
            var nativeTimes = new List<double>();
            for (int i = 0; i < iterations; i++)
            {
                var sw = Stopwatch.StartNew();
                using var nativeHash = new PtrHashU64(keys.AsSpan(), PtrHashConfig.Default);
                sw.Stop();
                nativeTimes.Add(sw.Elapsed.TotalMilliseconds);
            }
            
            Console.WriteLine($"Construction times (average of {iterations} runs):");
            Console.WriteLine($"  C# FxHasher:         {fxTimes.Average():F1} ms");
            Console.WriteLine($"  C# StrongerHasher:   {strongerTimes.Average():F1} ms");
            Console.WriteLine($"  Native Rust:         {nativeTimes.Average():F1} ms");
            
            Console.WriteLine($"\nSpeedup ratios (vs Native):");
            Console.WriteLine($"  C# FxHasher:         {fxTimes.Average() / nativeTimes.Average():F1}x slower");
            Console.WriteLine($"  C# StrongerHasher:   {strongerTimes.Average() / nativeTimes.Average():F1}x slower");
        }
    }
}