using NUnit.Framework;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.Util;
using System;
using System.Diagnostics;
using System.Linq;

namespace ComparisonTests
{
    [TestFixture]
    public class PilotSearchTest
    {
        [Test]
        public void TestPilotSearchWithSampleBucket()
        {
            Console.WriteLine("\n=== C# Test: Pilot Search with Sample Bucket ===");
            
            var hasher = new StrongerIntHasher();
            var seed = 0UL;
            
            // Create a sample bucket with keys that might cause collisions
            var testKeys = new ulong[] { 90000, 90001, 90002, 90003, 90004 };
            var hashes = testKeys.Select(key => hasher.Hash(key, seed)).ToArray();
            
            Console.WriteLine("Testing pilot search for bucket with keys: " + string.Join(", ", testKeys));
            Console.WriteLine("Hash values:");
            for (int i = 0; i < hashes.Length; i++)
            {
                Console.WriteLine($"  Key {testKeys[i]}: {hashes[i].Full():X16}");
            }
            
            // Test with different slot counts to see modulus behavior
            var slotCounts = new nuint[] { 1009, 10007, 10101 };
            
            foreach (var slotCount in slotCounts)
            {
                Console.WriteLine($"\nTesting with {slotCount} slots:");
                
                // Test both FastReduce and basic modulus
                TestPilotSearchWithModulusType(hashes, slotCount, true);  // FastReduce
                TestPilotSearchWithModulusType(hashes, slotCount, false); // Basic modulus
            }
        }
        
        private void TestPilotSearchWithModulusType(HashValue[] hashes, nuint slotCount, bool useFastReduce)
        {
            var modulusType = useFastReduce ? "FastReduce" : "BasicMod";
            Console.WriteLine($"  {modulusType} modulus:");
            
            var taken = new BitVec(slotCount);
            var kmax = 256UL;
            
            // Simulate the pilot search algorithm
            for (ulong pilot = 0; pilot < Math.Min(kmax, 20); pilot++) // Test first 20 pilots
            {
                var hp = HashPilot(pilot, 0UL);
                bool hasCollision = false;
                var slots = new nuint[hashes.Length];
                
                for (int i = 0; i < hashes.Length; i++)
                {
                    var slotCalc = hashes[i].Low() ^ hp;
                    var slot = useFastReduce ? 
                        FastReduce.Reduce(slotCalc, slotCount) : 
                        (nuint)(slotCalc % (ulong)slotCount);
                    
                    slots[i] = slot;
                    
                    if (taken.Get(slot))
                    {
                        hasCollision = true;
                        break;
                    }
                }
                
                if (!hasCollision)
                {
                    // Check for internal collisions
                    var uniqueSlots = slots.Distinct().Count();
                    if (uniqueSlots == slots.Length)
                    {
                        Console.WriteLine($"    Pilot {pilot,3}: SUCCESS - Slots: [{string.Join(", ", slots)}]");
                        
                        // Mark slots as taken for next iteration
                        foreach (var slot in slots)
                        {
                            taken.Set(slot, true);
                        }
                        
                        if (pilot >= 5) break; // Stop after finding a few successful pilots
                    }
                    else
                    {
                        Console.WriteLine($"    Pilot {pilot,3}: INTERNAL COLLISION - Slots: [{string.Join(", ", slots)}]");
                    }
                }
                else
                {
                    Console.WriteLine($"    Pilot {pilot,3}: EXTERNAL COLLISION - Slots: [{string.Join(", ", slots)}]");
                }
            }
        }
        
        [Test]
        public void TestFastReduceVsBasicModulusSystematic()
        {
            Console.WriteLine("\n=== C# Test: FastReduce vs Basic Modulus Systematic ===");
            
            var modulus = 10101UL;
            var testCount = 0;
            var mismatchCount = 0;
            
            // Test with a range of hash values
            var testHashes = new ulong[] {
                0x0000000000000000UL,
                0x0000000000000001UL,
                0x0000000000000010UL,
                0x0000000000000100UL,
                0x0000000000001000UL,
                0xFFFFFFFFFFFFFFFFUL,
                0xFFFFFFFFFFFFFFFEUL,
                0xE4BCE4FEFA716B03UL, // Hash from key 90000
                0xD9E17C9882E3F211UL, // Hash from key 90001
                0xF55B6E9ABD3BAA7AUL, // Hash from key 90002
                0x313A29615FDEC6F3UL, // Hash from key 90003
                0x3AAAA551130653AEUL, // Hash from key 100000
                0x5279A216D398A48AUL  // Hash from key 100001
            };
            
            Console.WriteLine($"Testing {testHashes.Length} hash values with modulus {modulus}:");
            Console.WriteLine("Format: Hash -> FastReduce -> BasicMod -> Match");
            
            foreach (var hash in testHashes)
            {
                var fastResult = FastReduce.Reduce(hash, (nuint)modulus);
                var basicResult = (nuint)(hash % modulus);
                var match = fastResult == basicResult ? "✓" : "✗";
                
                testCount++;
                if (fastResult != basicResult)
                {
                    mismatchCount++;
                }
                
                Console.WriteLine($"0x{hash:X16} -> {fastResult,5} -> {basicResult,5} {match}");
            }
            
            Console.WriteLine($"\nSummary: {mismatchCount}/{testCount} mismatches ({100.0 * mismatchCount / testCount:F1}%)");
            
            if (mismatchCount > 0)
            {
                Console.WriteLine("WARNING: FastReduce and basic modulus give different results!");
                Console.WriteLine("This could explain algorithmic differences between C# and Rust implementations.");
            }
        }
        
        // Helper method matching the C# PtrHash implementation
        private static ulong HashPilot(ulong pilot, ulong seed)
        {
            const ulong C = 0x51_7c_c1_b7_27_22_0a_95UL; // FxHash constant from Rust
            return C * (pilot ^ seed); // Rust: hash::C.wrapping_mul(p ^ self.seed)
        }
    }
}