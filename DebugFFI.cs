using System;
using PtrHash.CSharp.Interop.PtrHash;
using PtrHash.CSharp.Interop.Native;

class Program
{
    static void Main()
    {
        Console.WriteLine("Debug FFI structure...");
        
        // Test with very small dataset first
        var keys = new ulong[] { 1, 2, 3, 4, 5 };
        
        try
        {
            Console.WriteLine("Creating Fast parameters...");
            var fastParams = PtrHashNative.FFIParams.Fast;
            Console.WriteLine($"Fast params: DefaultParamSet={fastParams.DefaultParamSet}");
            Console.WriteLine($"             HasOverrideSinglePart={fastParams.HasOverrideSinglePart}");
            Console.WriteLine($"             HasOverrideLambda={fastParams.HasOverrideLambda}");
            Console.WriteLine($"             HasOverrideHashFunction={fastParams.HasOverrideHashFunction}");
            Console.WriteLine($"             OverrideHashFunction={fastParams.OverrideHashFunction}");
            
            Console.WriteLine("\nTrying to create PtrHash...");
            using var hash = new PtrHashInterop<ulong>(keys, fastParams);
            Console.WriteLine("SUCCESS: PtrHash created!");
            
            var info = hash.GetInfo();
            Console.WriteLine($"Key count: {info.KeyCount}");
            Console.WriteLine($"Bits per key: {info.BitsPerKey:F2}");
            
        }
        catch (Exception ex)
        {
            Console.WriteLine($"FAILED: {ex.Message}");
            
            // Try with explicit stronger hash
            Console.WriteLine("\nTrying with StrongerIntHash override...");
            try
            {
                var strongerParams = PtrHashNative.FFIParams.FastWithOverrides(hashFunction: 1);
                Console.WriteLine($"Stronger params: DefaultParamSet={strongerParams.DefaultParamSet}");
                Console.WriteLine($"                 HasOverrideHashFunction={strongerParams.HasOverrideHashFunction}");
                Console.WriteLine($"                 OverrideHashFunction={strongerParams.OverrideHashFunction}");
                
                using var hash2 = new PtrHashInterop<ulong>(keys, strongerParams);
                Console.WriteLine("SUCCESS: PtrHash created with StrongerIntHash!");
                
                var info2 = hash2.GetInfo();
                Console.WriteLine($"Key count: {info2.KeyCount}");
                
            }
            catch (Exception ex2)
            {
                Console.WriteLine($"ALSO FAILED: {ex2.Message}");
            }
        }
    }
}