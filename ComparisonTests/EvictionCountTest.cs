using NUnit.Framework;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ComparisonTests
{
    [TestFixture]
    public class EvictionCountTest
    {
        [Test]
        public void TestEvictionTerminationCondition()
        {
            Console.WriteLine("\n=== C# Test: Eviction Termination Condition ===");
            
            // Create a PtrHash instance with the same parameters as our failing test
            var keys = Enumerable.Range(90000, 10000).Select(i => (ulong)i).ToArray();
            var parameters = PtrHashParams.DefaultFast;
            
            Console.WriteLine($"Testing with {keys.Length} keys");
            Console.WriteLine($"Alpha = {parameters.Alpha}");
            Console.WriteLine($"Lambda = {parameters.Lambda}");
            
            try
            {
                var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, parameters);
                Console.WriteLine("✓ Construction succeeded unexpectedly");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"✗ Construction failed as expected: {ex.Message}");
                
                // Let's examine the parameters that would have been used
                var numKeys = (nuint)keys.Length;
                var shards = 1;
                var eps = (1.0 - parameters.Alpha) / 2.0;
                var x = (double)numKeys * eps * eps / 2.0;
                var targetParts = x / Math.Log(x);
                var partsPerShard = targetParts > 0 ? (nuint)Math.Floor(targetParts) / (nuint)shards : 0;
                var parts = Math.Max(1, partsPerShard) * (nuint)shards;
                
                var keysPerPart = numKeys / parts;
                var slotsPerPart = (nuint)((double)keysPerPart / parameters.Alpha);
                
                // Avoid powers of two
                if (IsPowerOfTwo((int)slotsPerPart))
                    slotsPerPart += 1;
                
                var bucketsPerPart = (nuint)Math.Ceiling((double)keysPerPart / parameters.Lambda) + 3;
                
                Console.WriteLine($"\nCalculated parameters for {keys.Length} keys:");
                Console.WriteLine($"  Parts: {parts}");
                Console.WriteLine($"  Keys per part: {keysPerPart}");
                Console.WriteLine($"  Slots per part: {slotsPerPart}");
                Console.WriteLine($"  Buckets per part: {bucketsPerPart}");
                Console.WriteLine($"  Total slots: {parts * slotsPerPart}");
                Console.WriteLine($"  Real alpha: {(double)numKeys / (double)(parts * slotsPerPart):F4}");
                Console.WriteLine($"  Eviction limit per part: {10 * slotsPerPart}");
                
                // Calculate what Rust would use
                Console.WriteLine($"\nRust comparison:");
                Console.WriteLine($"  Rust self.slots (slots per part): {slotsPerPart}");
                Console.WriteLine($"  Rust termination condition: evictions >= {10 * slotsPerPart}");
                Console.WriteLine($"  C# termination condition: evictions >= {10 * slotsPerPart}");
                Console.WriteLine($"  Match: {(10 * slotsPerPart == 10 * slotsPerPart ? "✓" : "✗")}");
            }
        }
        
        private static bool IsPowerOfTwo(int value)
        {
            return value > 0 && (value & (value - 1)) == 0;
        }
        
        [Test]
        public void TestEvictionLimitWithDifferentAlpha()
        {
            Console.WriteLine("\n=== C# Test: Eviction Limit with Different Alpha ===");
            
            var keys = Enumerable.Range(90000, 10000).Select(i => (ulong)i).ToArray();
            var alphas = new double[] { 0.99, 0.95, 0.90, 0.85, 0.80 };
            
            foreach (var alpha in alphas)
            {
                var parameters = new PtrHashParams { Alpha = alpha, Lambda = 3.0, Minimal = true, SinglePart = false };
                
                var numKeys = (nuint)keys.Length;
                var shards = 1;
                var eps = (1.0 - parameters.Alpha) / 2.0;
                var x = (double)numKeys * eps * eps / 2.0;
                var targetParts = x / Math.Log(x);
                var partsPerShard = targetParts > 0 ? (nuint)Math.Floor(targetParts) / (nuint)shards : 0;
                var parts = Math.Max(1, partsPerShard) * (nuint)shards;
                
                var keysPerPart = numKeys / parts;
                var slotsPerPart = (nuint)((double)keysPerPart / parameters.Alpha);
                
                if (IsPowerOfTwo((int)slotsPerPart))
                    slotsPerPart += 1;
                
                var evictionLimit = 10 * slotsPerPart;
                
                Console.WriteLine($"Alpha {alpha:F2}: {parts} parts, {slotsPerPart} slots/part, eviction limit {evictionLimit}");
                
                try
                {
                    var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, parameters);
                    Console.WriteLine($"  ✓ Construction succeeded");
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"  ✗ Construction failed: {ex.Message}");
                }
            }
        }
        
        [Test]
        public void TestEvictionFailureWithLargerScale()
        {
            Console.WriteLine("\n=== C# Test: Eviction Failure with Larger Scale ===");
            
            var keyCounts = new int[] { 50000, 100000, 150000, 200000 };
            var parameters = PtrHashParams.DefaultFast;
            
            foreach (var keyCount in keyCounts)
            {
                var keys = Enumerable.Range(0, keyCount).Select(i => (ulong)i).ToArray();
                
                // Calculate expected parameters
                var numKeys = (nuint)keys.Length;
                var shards = 1;
                var eps = (1.0 - parameters.Alpha) / 2.0;
                var x = (double)numKeys * eps * eps / 2.0;
                var targetParts = x / Math.Log(x);
                var partsPerShard = targetParts > 0 ? (nuint)Math.Floor(targetParts) / (nuint)shards : 0;
                var parts = Math.Max(1, partsPerShard) * (nuint)shards;
                
                var keysPerPart = numKeys / parts;
                var slotsPerPart = (nuint)((double)keysPerPart / parameters.Alpha);
                
                if (IsPowerOfTwo((int)slotsPerPart))
                    slotsPerPart += 1;
                
                var evictionLimit = 10 * slotsPerPart;
                
                Console.WriteLine($"Testing {keyCount} keys:");
                Console.WriteLine($"  Parts: {parts}, Slots/part: {slotsPerPart}, Eviction limit: {evictionLimit}");
                
                try
                {
                    var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, parameters);
                    Console.WriteLine($"  ✓ Construction succeeded");
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"  ✗ Construction failed: {ex.Message}");
                    if (ex.Message.Contains("INFINITE LOOP"))
                    {
                        Console.WriteLine($"  → This confirms the eviction limit is being triggered");
                    }
                }
            }
        }
        
        [Test]
        public void TestWithDifferentSeedsForEvictions()
        {
            Console.WriteLine("\n=== C# Test: Different Seeds for Evictions ===");
            
            var keys = Enumerable.Range(90000, 10000).Select(i => (ulong)i).ToArray();
            var parameters = PtrHashParams.DefaultFast;
            
            // Test multiple attempts to see if we can trigger eviction failures
            for (int attempt = 0; attempt < 5; attempt++)
            {
                Console.WriteLine($"\nAttempt {attempt + 1}:");
                
                try
                {
                    var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, parameters);
                    Console.WriteLine($"  ✓ Construction succeeded");
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"  ✗ Construction failed: {ex.Message}");
                    if (ex.Message.Contains("INFINITE LOOP"))
                    {
                        Console.WriteLine($"  → Eviction limit triggered!");
                        break;
                    }
                }
            }
        }
    }
}