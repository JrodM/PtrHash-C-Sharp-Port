using NUnit.Framework;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Diagnostics;
using System.Linq;

namespace ComparisonTests
{
    [TestFixture]
    public class HasherParityTest
    {
        [Test]
        public void TestStrongerIntHasherParity()
        {
            Console.WriteLine("\n=== C# Test: StrongerIntHasher Parity Test ===");
            
            var hasher = new StrongerIntHasher();
            
            // Test seeds and keys that should produce identical results in Rust
            var testSeeds = new ulong[] { 0, 1, 42, 0x517cc1b727220a95UL, ulong.MaxValue };
            var testKeys = new ulong[]
            {
                0, 1, 2, 100, 1000, 10000,
                ulong.MaxValue, ulong.MaxValue - 1, 0x517cc1b727220a95UL,
                // Sequential keys that are problematic in C#
                90001, 90002, 90003, 100000, 100001
            };
            
            Console.WriteLine($"Testing {testSeeds.Length} seeds × {testKeys.Length} keys = {testSeeds.Length * testKeys.Length} combinations");
            
            foreach (var seed in testSeeds)
            {
                Console.WriteLine($"\n--- Seed: 0x{seed:X16} ---");
                foreach (var key in testKeys)
                {
                    var hashResult = hasher.Hash(key, seed);
                    Console.WriteLine($"Key: {key,12} -> Hash: 0x{hashResult.Full():X16}");
                }
            }
            
            // Test the exact sequence that fails in C#
            Console.WriteLine("\n--- Testing Sequential Keys 1-100 with seed 0 ---");
            for (ulong i = 1; i <= 100; i++)
            {
                var hashResult = hasher.Hash(i, 0);
                if (i <= 10 || i % 10 == 0)
                {
                    Console.WriteLine($"Key: {i,3} -> Hash: 0x{hashResult.Full():X16}");
                }
            }
        }
        
        [Test]
        public void TestSpecificProblematicSeed()
        {
            Console.WriteLine("\n=== C# Test: Testing Specific Problematic Seed ===");
            
            var hasher = new StrongerIntHasher();
            
            // Test the exact seed that fails in the 90k test
            var problematicSeed = 4153797660501972207UL;
            Console.WriteLine($"Testing seed: {problematicSeed} (0x{problematicSeed:X16})");
            
            // Test first few keys that would be hashed during construction
            var testKeys = new ulong[] { 1, 2, 3, 4, 5, 90000, 90001, 90002, 90003, 90004 };
            
            foreach (var key in testKeys)
            {
                var hashResult = hasher.Hash(key, problematicSeed);
                Console.WriteLine($"Key: {key,6} -> Hash: 0x{hashResult.Full():X16} (Low: 0x{hashResult.Low():X16}, High: 0x{hashResult.High():X16})");
            }
        }
        
        [Test]
        public void TestHashValueImplementation()
        {
            Console.WriteLine("\n=== C# Test: Testing HashValue Implementation ===");
            
            var hasher = new StrongerIntHasher();
            var testKey = 12345UL;
            var testSeed = 0x517cc1b727220a95UL;
            
            var hashResult = hasher.Hash(testKey, testSeed);
            
            Console.WriteLine($"Key: {testKey}");
            Console.WriteLine($"Seed: 0x{testSeed:X16}");
            Console.WriteLine($"Hash Full: 0x{hashResult.Full():X16}");
            Console.WriteLine($"Hash Low:  0x{hashResult.Low():X16}");
            Console.WriteLine($"Hash High: 0x{hashResult.High():X16}");
            
            // Verify that for u64 hashes, Low() and High() return the same value
            Assert.AreEqual(hashResult.Low(), hashResult.High(), 
                "For u64 hashes, Low() and High() should return the same value");
            Assert.AreEqual(hashResult.Full(), hashResult.Low(),
                "For u64 hashes, Full() should equal Low()");
        }
        
        [Test]
        public void TestWrappingMultiplication()
        {
            Console.WriteLine("\n=== C# Test: Testing Wrapping Multiplication ===");
            
            // Test edge cases for wrapping multiplication
            var testCases = new (ulong a, ulong b, ulong expected)[]
            {
                (0, 0x517cc1b727220a95UL, 0),
                (1, 0x517cc1b727220a95UL, 0x517cc1b727220a95UL),
                (ulong.MaxValue, 0x517cc1b727220a95UL, unchecked(ulong.MaxValue * 0x517cc1b727220a95UL)),
                (0x517cc1b727220a95UL, 0x517cc1b727220a95UL, unchecked(0x517cc1b727220a95UL * 0x517cc1b727220a95UL))
            };
            
            foreach (var (a, b, expected) in testCases)
            {
                var result = a.WrappingMul(b);
                Console.WriteLine($"0x{a:X16} * 0x{b:X16} = 0x{result:X16} (expected: 0x{expected:X16})");
                Assert.AreEqual(expected, result, $"Wrapping multiplication failed for {a} * {b}");
            }
        }
    }
}