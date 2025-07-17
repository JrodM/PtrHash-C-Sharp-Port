using NUnit.Framework;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Collections.Generic;
using System.Linq;

namespace ComparisonTests
{
    [TestFixture]
    public class SlotCountTest
    {
        [Test]
        public void TestActualSlotCountUsed()
        {
            Console.WriteLine("\n=== C# Test: Actual Slot Count Used ===");
            
            // Create a PtrHash instance with the same parameters as our failing test
            var keys = Enumerable.Range(90000, 10000).Select(i => (ulong)i).ToArray();
            var parameters = PtrHashParams.DefaultFast;
            
            Console.WriteLine($"Testing with {keys.Length} keys");
            Console.WriteLine($"Alpha = {parameters.Alpha}");
            Console.WriteLine($"Lambda = {parameters.Lambda}");
            
            // Build a small PtrHash to see what slot count is actually used
            var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, parameters);
            
            Console.WriteLine($"Construction completed successfully with {keys.Length} keys");
            
            // Try to verify some known hash values
            var hasher = new StrongerIntHasher();
            var seed = 0UL;
            
            // Test the same keys we used in the slot calculation test
            var testKeys = new ulong[] { 90000, 90001, 90002 };
            
            Console.WriteLine("\nTesting individual key lookups:");
            foreach (var key in testKeys)
            {
                var hash = hasher.Hash(key, seed);
                var result = ptrHash.GetIndex(key);
                Console.WriteLine($"Key {key}: Hash=0x{hash.Full():X16}, PtrHash result={result}");
            }
        }
        
        [Test]
        public void TestSlotCountCalculation()
        {
            Console.WriteLine("\n=== C# Test: Slot Count Calculation ===");
            
            // Test with different key counts to see how slot count is calculated
            var keyCounts = new int[] { 1000, 10000, 90000, 100000 };
            var parameters = PtrHashParams.DefaultFast;
            
            Console.WriteLine($"Testing slot count calculation with Alpha={parameters.Alpha}");
            Console.WriteLine("Format: Keys -> SlotsPerPart -> SlotsTotal");
            
            foreach (var keyCount in keyCounts)
            {
                var keys = Enumerable.Range(0, keyCount).Select(i => (ulong)i).ToArray();
                
                try
                {
                    var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, parameters);
                    Console.WriteLine($"{keyCount,6} keys -> CONSTRUCTED SUCCESSFULLY");
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"{keyCount,6} keys -> FAILED: {ex.Message}");
                }
            }
        }
        
        [Test]
        public void TestSlotCountForProblematicRange()
        {
            Console.WriteLine("\n=== C# Test: Slot Count for Problematic Range ===");
            
            // Test with the exact range that's failing
            var startKey = 90000;
            var keyCount = 10000;
            var keys = Enumerable.Range(startKey, keyCount).Select(i => (ulong)i).ToArray();
            
            Console.WriteLine($"Testing with keys {startKey} to {startKey + keyCount - 1}");
            
            var parameters = PtrHashParams.DefaultFast;
            
            try
            {
                var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, parameters);
                Console.WriteLine("✓ Construction succeeded");
                
                // Test a few lookups
                Console.WriteLine("Testing lookups:");
                for (int i = 0; i < 5; i++)
                {
                    var key = keys[i];
                    var result = ptrHash.GetIndex(key);
                    Console.WriteLine($"  Key {key} -> {result}");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"✗ Construction failed: {ex.Message}");
                Console.WriteLine($"  Exception type: {ex.GetType().Name}");
                if (ex.InnerException != null)
                {
                    Console.WriteLine($"  Inner exception: {ex.InnerException.Message}");
                }
            }
        }
    }
}