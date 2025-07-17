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
    public class SlotCalculationTest
    {
        [Test]
        public void TestSlotCalculationComponents()
        {
            Console.WriteLine("\n=== C# Test: Slot Calculation Components ===");
            
            // Test the individual components of slot calculation
            var hasher = new StrongerIntHasher();
            var seed = 0UL;
            
            // Test keys that are problematic
            var testKeys = new ulong[] { 90000, 90001, 90002, 90003, 100000, 100001 };
            
            Console.WriteLine("Testing individual slot calculation components:");
            Console.WriteLine("Format: Key -> Hash -> HashPilot(0) -> SlotInPartHp");
            
            foreach (var key in testKeys)
            {
                var hash = hasher.Hash(key, seed);
                var hashPilot = HashPilot(0, seed); // pilot=0
                var slotCalc = hash.Low() ^ hashPilot;
                
                Console.WriteLine($"Key {key,6}: Hash=0x{hash.Full():X16}, HP(0)=0x{hashPilot:X16}, Low^HP=0x{slotCalc:X16}");
            }
            
            // Test basic modulus operation with different slot counts
            Console.WriteLine("\nTesting basic modulus operation with different slot counts:");
            var slotCounts = new nuint[] { 1009, 10007, 10101 }; // Prime numbers like real usage
            
            foreach (var slotCount in slotCounts)
            {
                Console.WriteLine($"\nSlot count: {slotCount}");
                
                foreach (var key in testKeys.Take(3))
                {
                    var hash = hasher.Hash(key, seed);
                    var hashPilot = HashPilot(0, seed);
                    var slotCalc = hash.Low() ^ hashPilot;
                    var slot = slotCalc % slotCount; // Basic modulus for comparison
                    
                    Console.WriteLine($"  Key {key}: slotCalc=0x{slotCalc:X16} -> slot={slot} (mod {slotCount})");
                }
            }
        }
        
        [Test]
        public void TestHashPilotCalculation()
        {
            Console.WriteLine("\n=== C# Test: HashPilot Calculation ===");
            
            var seed = 0UL;
            var pilots = new ulong[] { 0, 1, 2, 10, 100, 255 };
            
            Console.WriteLine("Testing HashPilot calculation:");
            Console.WriteLine("Format: pilot -> HashPilot(pilot, seed)");
            
            foreach (var pilot in pilots)
            {
                var hashPilot = HashPilot(pilot, seed);
                Console.WriteLine($"Pilot {pilot,3}: 0x{hashPilot:X16}");
            }
            
            // Test with different seed
            seed = 0x517cc1b727220a95UL;
            Console.WriteLine($"\nWith seed 0x{seed:X16}:");
            foreach (var pilot in pilots)
            {
                var hashPilot = HashPilot(pilot, seed);
                Console.WriteLine($"Pilot {pilot,3}: 0x{hashPilot:X16}");
            }
        }
        
        [Test]
        public void TestFastReduceVsFM32()
        {
            Console.WriteLine("\n=== C# Test: FastReduce vs Basic Modulus ===");
            
            var modulus = 10101UL;
            
            var testHashes = new ulong[] { 
                0x0000000000000000UL,
                0xD6F32EC63603FAB9UL,
                0xADE65D8C6C07F572UL,
                0x199B75FCB95B9107UL,
                0xC71B3C5329B3DE6EUL,
                0x38F5AB9EC9B02AABUL
            };
            
            Console.WriteLine($"Comparing FastReduce vs basic modulus for modulus {modulus}:");
            Console.WriteLine("Format: Hash -> FastReduce -> BasicMod");
            
            foreach (var hash in testHashes)
            {
                var fastResult = FastReduce.Reduce(hash, (nuint)modulus);
                var basicResult = hash % modulus;
                var match = fastResult == basicResult ? "✓" : "✗";
                
                Console.WriteLine($"0x{hash:X16} -> {fastResult,5} -> {basicResult,5} {match}");
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