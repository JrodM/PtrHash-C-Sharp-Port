using System;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;

class Program
{
    static void Main()
    {
        Console.WriteLine("=== C# Test: StrongerIntHasher Parity Test ===");
        
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
}