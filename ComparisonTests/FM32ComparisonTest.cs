using NUnit.Framework;
using PtrHash.CSharp.Port.Util;
using System;
using System.Diagnostics;

namespace ComparisonTests
{
    [TestFixture]
    public class FM32ComparisonTest
    {
        [Test]
        public void TestFM32OverflowBehavior()
        {
            Console.WriteLine("\n=== C# Test: FM32 Overflow Behavior ===");
            
            // Test with various moduli that might cause overflow
            var testModuli = new ulong[] { 
                10101,
                100000,
                1000000,
                10000000,
                uint.MaxValue,
                uint.MaxValue - 1,
                uint.MaxValue / 2,
                65536,
                1009,
                10007
            };
            
            Console.WriteLine("Testing FM32 initialization with different moduli:");
            Console.WriteLine("Format: Modulus -> d -> m -> (m calculation check)");
            
            foreach (var modulus in testModuli)
            {
                var fm32 = new FM32((nuint)modulus);
                
                // Calculate what m should be with wrapping vs regular addition
                var regularM = (ulong.MaxValue / modulus) + 1;
                var wrappingM = unchecked((ulong.MaxValue / modulus) + 1); // Simulate wrapping
                
                // Check if there's a difference
                var match = regularM == wrappingM ? "=" : "≠";
                var overflowCheck = (ulong.MaxValue / modulus) == ulong.MaxValue ? "OVERFLOW" : "OK";
                
                Console.WriteLine($"Modulus {modulus,10}: d={modulus,10} m={regularM,20} [{overflowCheck}]");
                
                // Test if overflow could occur
                if (ulong.MaxValue / modulus > ulong.MaxValue - 1)
                {
                    Console.WriteLine($"  ^ POTENTIAL OVERFLOW: (MaxValue / {modulus}) + 1 might wrap");
                }
            }
        }
        
        [Test]
        public void TestFM32DirectComparison()
        {
            Console.WriteLine("\n=== C# Test: FM32 Direct Comparison ===");
            
            // Test with the exact same inputs as the Rust test
            var modulus = 10101UL;
            var fm32 = new FM32((nuint)modulus);
            
            var testHashes = new ulong[] {
                0x0000000000000000UL,
                0xD6F32EC63603FAB9UL,
                0xADE65D8C6C07F572UL,
                0x199B75FCB95B9107UL,
                0xC71B3C5329B3DE6EUL,
                0x38F5AB9EC9B02AABUL,
                0xE4BCE4FEFA716B03UL, // Hash from key 90000
                0xD9E17C9882E3F211UL, // Hash from key 90001
                0xF55B6E9ABD3BAA7AUL  // Hash from key 90002
            };
            
            Console.WriteLine($"C# FM32 results for modulus {modulus}:");
            Console.WriteLine("Expected Rust results based on previous test:");
            Console.WriteLine("Hash                 C# FM32  Expected");
            
            // Expected results from the Rust test output
            var expectedRust = new ulong[] { 0, 5250, 400, 7201, 851, 8944, 8589, 1657, 9434 };
            
            for (int i = 0; i < testHashes.Length; i++)
            {
                var hash = testHashes[i];
                var fm32Result = fm32.Reduce(hash);
                var expected = i < expectedRust.Length ? expectedRust[i] : 0;
                var match = fm32Result == expected ? "✓" : "✗";
                
                Console.WriteLine($"0x{hash:X16} -> {fm32Result,5} -> {expected,5} {match}");
            }
        }
        
        [Test]
        public void TestFM32ParameterDetails()
        {
            Console.WriteLine("\n=== C# Test: FM32 Parameter Details ===");
            
            var modulus = 10101UL;
            var fm32 = new FM32((nuint)modulus);
            
            Console.WriteLine($"FM32 internal parameters for modulus {modulus}:");
            Console.WriteLine($"d = {modulus}");
            
            // Calculate m step by step
            var division = ulong.MaxValue / modulus;
            var m = division + 1;
            
            Console.WriteLine($"ulong.MaxValue = {ulong.MaxValue}");
            Console.WriteLine($"MaxValue / {modulus} = {division}");
            Console.WriteLine($"m = {division} + 1 = {m}");
            
            // Test if this could overflow
            var wouldOverflow = division == ulong.MaxValue;
            Console.WriteLine($"Would overflow: {wouldOverflow}");
            
            // Test a few hash values with step-by-step calculation
            var testHash = 0xE4BCE4FEFA716B03UL; // Hash from key 90000
            Console.WriteLine($"\nStep-by-step calculation for hash 0x{testHash:X16}:");
            Console.WriteLine($"1. lowbits = m * hash = {m} * {testHash} = {unchecked(m * testHash)}");
            
            var lowbits = m * testHash;
            var result = (UInt128)lowbits * (UInt128)modulus >> 64;
            Console.WriteLine($"2. result = (lowbits * d) >> 64 = ({lowbits} * {modulus}) >> 64 = {result}");
            
            var fm32Result = fm32.Reduce(testHash);
            Console.WriteLine($"3. FM32.Reduce() = {fm32Result}");
            Console.WriteLine($"   Expected Rust = 8589");
            Console.WriteLine($"   Match: {(fm32Result == 8589 ? "✓" : "✗")}");
        }
    }
}