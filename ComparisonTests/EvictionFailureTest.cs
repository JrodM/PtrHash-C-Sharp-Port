using NUnit.Framework;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ComparisonTests
{
    [TestFixture]
    public class EvictionFailureTest
    {
        [Test]
        public void TestEvictionFailureWith100KKeys()
        {
            Console.WriteLine("\n=== C# Test: Eviction Failure with 100K Keys (0-100000) ===");
            
            // This is the exact scenario that causes eviction failures
            var keys = Enumerable.Range(0, 100000).Select(i => (ulong)i).ToArray();
            var parameters = PtrHashParams.DefaultFast;
            
            Console.WriteLine($"Testing with {keys.Length} keys (0 to {keys.Length - 1})");
            Console.WriteLine($"Alpha = {parameters.Alpha}");
            Console.WriteLine($"Lambda = {parameters.Lambda}");
            
            // Calculate what the parameters should be
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
            
            Console.WriteLine($"Expected parameters:");
            Console.WriteLine($"  Parts: {parts}");
            Console.WriteLine($"  Keys per part: {keysPerPart}");
            Console.WriteLine($"  Slots per part: {slotsPerPart}");
            Console.WriteLine($"  Eviction limit per part: {evictionLimit}");
            
            try
            {
                var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, parameters);
                Console.WriteLine("✗ Construction succeeded unexpectedly - this should fail!");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"✓ Construction failed as expected: {ex.Message}");
                
                if (ex.Message.Contains("INFINITE LOOP"))
                {
                    Console.WriteLine("  → This confirms the eviction limit is being triggered");
                    Console.WriteLine("  → The termination condition is working correctly");
                }
                else
                {
                    Console.WriteLine("  → Unexpected failure type");
                }
            }
        }
        
        [Test]
        public void TestEvictionFailureWithSmallerRanges()
        {
            Console.WriteLine("\n=== C# Test: Finding the Threshold for Eviction Failures ===");
            
            var keyCounts = new int[] { 10000, 25000, 50000, 75000, 100000 };
            var parameters = PtrHashParams.DefaultFast;
            
            foreach (var keyCount in keyCounts)
            {
                var keys = Enumerable.Range(0, keyCount).Select(i => (ulong)i).ToArray();
                
                Console.WriteLine($"\nTesting {keyCount} keys (0 to {keyCount - 1}):");
                
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
                        Console.WriteLine($"  → Eviction limit triggered at {keyCount} keys");
                        Console.WriteLine($"  → This helps identify the threshold");
                    }
                }
            }
        }
        
        [Test]
        public void TestEvictionFailureWithDifferentStartingPoints()
        {
            Console.WriteLine("\n=== C# Test: Different Starting Points for 100K Keys ===");
            
            var startingPoints = new int[] { 0, 10000, 50000, 90000, 1000000 };
            var keyCount = 100000;
            var parameters = PtrHashParams.DefaultFast;
            
            foreach (var start in startingPoints)
            {
                var keys = Enumerable.Range(start, keyCount).Select(i => (ulong)i).ToArray();
                
                Console.WriteLine($"\nTesting {keyCount} keys ({start} to {start + keyCount - 1}):");
                
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
                        Console.WriteLine($"  → Eviction limit triggered");
                        Console.WriteLine($"  → Starting point {start} causes eviction issues");
                    }
                }
            }
        }
        
        private static bool IsPowerOfTwo(int value)
        {
            return value > 0 && (value & (value - 1)) == 0;
        }
    }
}