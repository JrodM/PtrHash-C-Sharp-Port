using System;
using System.Runtime.InteropServices;
using PtrHash.CSharp.Port.Util;

namespace PerfTraces.PrngComparison
{
    class Program
    {
        // Native ChaCha8 RNG interop for direct comparison
        [DllImport("libptrhash.so", CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr create_chacha8_rng(ulong seed);

        [DllImport("libptrhash.so", CallingConvention = CallingConvention.Cdecl)]
        private static extern void destroy_chacha8_rng(IntPtr rng);

        [DllImport("libptrhash.so", CallingConvention = CallingConvention.Cdecl)]
        private static extern ulong chacha8_next_u64(IntPtr rng);

        static void Main(string[] args)
        {
            Console.WriteLine("ChaCha8 PRNG Comparison Test");
            Console.WriteLine("============================");
            Console.WriteLine();

            // Test with the same seed used in PtrHash construction
            const ulong testSeed = 31415;
            const int numValues = 100;

            try
            {
                // Create C# ChaCha8 implementation
                var csharpRng = new ChaCha8Rng(testSeed);
                
                // Create native Rust ChaCha8 implementation
                var rustRng = create_chacha8_rng(testSeed);
                if (rustRng == IntPtr.Zero)
                {
                    Console.WriteLine("ERROR: Failed to create native ChaCha8 RNG");
                    return;
                }

                Console.WriteLine($"Comparing {numValues} values from C# ChaCha8Rng vs Rust ChaCha8Rng");
                Console.WriteLine($"Seed: {testSeed}");
                Console.WriteLine();
                Console.WriteLine("Index    C# Value             Rust Value           Match");
                Console.WriteLine("------   ------------------   ------------------   -----");

                int matches = 0;
                for (int i = 0; i < numValues; i++)
                {
                    var csharpValue = csharpRng.NextUInt64();
                    var rustValue = chacha8_next_u64(rustRng);
                    var match = csharpValue == rustValue;
                    
                    if (match) matches++;

                    Console.WriteLine($"{i,6}   {csharpValue,18}   {rustValue,18}   {(match ? "✓" : "✗")}");
                    
                    if (!match && i < 10)
                    {
                        Console.WriteLine($"       Hex: 0x{csharpValue:X16} vs 0x{rustValue:X16}");
                    }
                }

                Console.WriteLine();
                Console.WriteLine($"Results: {matches}/{numValues} values match ({(double)matches / numValues * 100:F1}%)");
                
                if (matches == numValues)
                {
                    Console.WriteLine("SUCCESS: C# ChaCha8 implementation matches Rust exactly!");
                }
                else
                {
                    Console.WriteLine("FAILURE: C# ChaCha8 implementation does not match Rust!");
                    if (matches == 0)
                    {
                        Console.WriteLine("No matches found - likely incorrect algorithm implementation");
                    }
                    else if (matches < numValues / 2)
                    {
                        Console.WriteLine("Few matches found - likely byte order or initialization issue");
                    }
                    else
                    {
                        Console.WriteLine("Many matches found - likely minor implementation difference");
                    }
                }

                // Cleanup
                destroy_chacha8_rng(rustRng);
            }
            catch (DllNotFoundException)
            {
                Console.WriteLine("Native ptrhash_rust_native library not found.");
                Console.WriteLine("Running C# ChaCha8 implementation test only...");
                Console.WriteLine();

                // Test C# implementation for basic sanity
                var rng1 = new ChaCha8Rng(testSeed);
                var rng2 = new ChaCha8Rng(testSeed);

                Console.WriteLine("Testing C# ChaCha8 determinism:");
                Console.WriteLine("Index    Value 1              Value 2              Match");
                Console.WriteLine("------   ------------------   ------------------   -----");

                bool deterministic = true;
                for (int i = 0; i < 10; i++)
                {
                    var val1 = rng1.NextUInt64();
                    var val2 = rng2.NextUInt64();
                    var match = val1 == val2;
                    
                    if (!match) deterministic = false;

                    Console.WriteLine($"{i,6}   {val1,18}   {val2,18}   {(match ? "✓" : "✗")}");
                }

                Console.WriteLine();
                if (deterministic)
                {
                    Console.WriteLine("C# ChaCha8 is deterministic with same seed ✓");
                }
                else
                {
                    Console.WriteLine("C# ChaCha8 is NOT deterministic with same seed ✗");
                }

                // Test different seeds produce different sequences
                var rng3 = new ChaCha8Rng(testSeed);
                var rng4 = new ChaCha8Rng(testSeed + 1);

                var val3 = rng3.NextUInt64();
                var val4 = rng4.NextUInt64();

                Console.WriteLine();
                Console.WriteLine($"Different seeds produce different values: {val3} vs {val4} = {(val3 != val4 ? "✓" : "✗")}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
            }

            Console.WriteLine();
            // Console.WriteLine("Press any key to exit...");
            // Console.ReadKey();
        }
    }
}