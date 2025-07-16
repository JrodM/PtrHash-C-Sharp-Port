using System;
using System.Linq;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;

namespace ComparisonTests
{
    class DebugSimpleTest
    {
        static void Main_Disabled()
        {
            // Test different sizes to find where it breaks
            int[] sizes = { 10_000, 50_000, 75_000, 90_000, 100_000, 110_000, 112_000 };
            
            foreach (var size in sizes)
            {
                Console.WriteLine($"\n=== Testing {size:N0} keys ===");
                var keys = Enumerable.Range(1, size).Select(i => (ulong)i).ToArray();
                
                try
                {
                    var sw = System.Diagnostics.Stopwatch.StartNew();
                    using var hash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);
                    sw.Stop();
                    Console.WriteLine($"✓ SUCCESS in {sw.ElapsedMilliseconds}ms");
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"✗ FAILED: {ex.Message}");
                }
            }
        }
    }
}