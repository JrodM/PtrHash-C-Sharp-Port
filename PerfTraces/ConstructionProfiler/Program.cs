using System;
using System.Diagnostics;
using System.Linq;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;

namespace ConstructionProfiler
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("PtrHash Construction Profiler - 100K Keys");
            Console.WriteLine("==========================================");
            
            // Generate test keys (same as benchmark)
            var keyCount = 100_000;
            var random = new Random(42);
            
            Console.WriteLine($"Generating {keyCount:N0} unique keys...");
            var keySet = new HashSet<ulong>();
            while (keySet.Count < keyCount)
            {
                keySet.Add((ulong)random.NextInt64(1, long.MaxValue));
            }
            var keys = keySet.ToArray();
            Console.WriteLine($"Generated {keys.Length:N0} unique keys");
            
            // Enable construction debugging
            PtrHash<ulong, FxHasher>.DEBUG_CONSTRUCTION = true;
            
            Console.WriteLine("\nStarting construction profiling...");
            
            // Check if running in automated mode (no console input available)
            bool isAutomated = args.Length > 0 && args[0] == "--auto";
            if (!isAutomated)
            {
                Console.WriteLine("Press any key to begin construction (dotTrace should be attached)");
                Console.ReadKey();
            }
            else
            {
                Console.WriteLine("Running in automated mode...");
            }
            
            var stopwatch = Stopwatch.StartNew();
            
            try
            {
                // Profile multi-part construction (the slow one)
                Console.WriteLine("\nConstructing PtrHash with multi-part algorithm...");
                var ptrHash = new PtrHash<ulong, FxHasher>(keys, PtrHashParams.DefaultFast);
                
                stopwatch.Stop();
                Console.WriteLine($"Construction completed in {stopwatch.ElapsedMilliseconds:N0} ms ({stopwatch.Elapsed.TotalSeconds:F2}s)");
                
                // Verify it works
                Console.WriteLine("Verifying hash function...");
                var verifyCount = Math.Min(1000, keys.Length);
                var verifyKeys = keys.Take(verifyCount).ToArray();
                
                var positions = new HashSet<nuint>();
                foreach (var key in verifyKeys)
                {
                    var pos = ptrHash.GetIndex(key);
                    if (!positions.Add(pos))
                    {
                        Console.WriteLine($"ERROR: Collision detected at position {pos}");
                        return;
                    }
                }
                
                Console.WriteLine($"Verification passed: {verifyCount:N0} keys mapped to unique positions");
                
                // Cleanup
                ptrHash.Dispose();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"ERROR during construction: {ex.Message}");
                Console.WriteLine($"Stack trace: {ex.StackTrace}");
            }
            
            Console.WriteLine("\nProfiling session complete. Press any key to exit.");
            Console.ReadKey();
        }
    }
}
