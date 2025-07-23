using System;
using PtrHash.CSharp.Interop.PtrHash;
using PtrHash.CSharp.Interop.Native;

class Program
{
    static void Main()
    {
        Console.WriteLine("Testing optional override functionality...");
        
        try
        {
            var keys = new ulong[] { 1, 2, 3, 4, 5 };
            
            // Test 1: Fast preset with no overrides
            Console.WriteLine("\n1. Fast preset with no overrides:");
            var fastParams = PtrHashNative.FFIParams.Fast;
            using var hash1 = new PtrHashInterop<ulong>(keys, fastParams);
            Console.WriteLine($"   Created successfully with {hash1.GetInfo().KeyCount} keys");
            
            // Test 2: Fast preset with hash function override only
            Console.WriteLine("\n2. Fast preset with StrongerIntHash override:");
            var fastWithStronger = PtrHashNative.FFIParams.FastWithOverrides(hashFunction: 1);
            using var hash2 = new PtrHashInterop<ulong>(keys, fastWithStronger);
            Console.WriteLine($"   Created successfully with {hash2.GetInfo().KeyCount} keys");
            
            // Test 3: Fast preset with multiple overrides
            Console.WriteLine("\n3. Fast preset with multiple overrides:");
            var fastWithMultiple = PtrHashNative.FFIParams.FastWithOverrides(
                hashFunction: 1, 
                singlePart: true, 
                lambda: 4.0
            );
            using var hash3 = new PtrHashInterop<ulong>(keys, fastWithMultiple);
            Console.WriteLine($"   Created successfully with {hash3.GetInfo().KeyCount} keys");
            
            // Test 4: Custom parameters (all overrides set)
            Console.WriteLine("\n4. Custom parameters:");
            var customParams = PtrHashNative.FFIParams.Custom(hashFunction: 1);
            using var hash4 = new PtrHashInterop<ulong>(keys, customParams);
            Console.WriteLine($"   Created successfully with {hash4.GetInfo().KeyCount} keys");
            
            // Test lookups work correctly
            Console.WriteLine("\n5. Testing lookups:");
            for (int i = 0; i < keys.Length; i++)
            {
                var idx1 = hash1.GetIndex(keys[i]);
                var idx2 = hash2.GetIndex(keys[i]);
                Console.WriteLine($"   Key {keys[i]}: Fast={idx1}, FastWithStronger={idx2}");
            }
            
            Console.WriteLine("\nOptional override test completed successfully!");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
            Console.WriteLine($"Stack trace: {ex.StackTrace}");
        }
    }
}