using NUnit.Framework;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Diagnostics;
using System.Linq;

namespace ComparisonTests
{
    [TestFixture]
    public class DetailedDebugTest
    {
        [Test]
        public void Debug_3K_Detailed_Performance()
        {
            Console.WriteLine("Starting detailed 3K debug test");
            var keys = Enumerable.Range(1, 3_000).Select(i => (ulong)i).ToArray();
            
            var sw = Stopwatch.StartNew();
            try
            {
                using var portHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);
                sw.Stop();
                Console.WriteLine($"\\n=== FINAL RESULT ===");
                Console.WriteLine($"SUCCESS: 3K keys constructed in {sw.ElapsedMilliseconds}ms");
            }
            catch (Exception ex)
            {
                sw.Stop();
                Console.WriteLine($"\\n=== FINAL RESULT ===");
                Console.WriteLine($"FAILED after {sw.ElapsedMilliseconds}ms: {ex.Message}");
                throw;
            }
        }

        [Test] 
        public void Debug_5K_Performance_Analysis()
        {
            Console.WriteLine("Starting 5K performance analysis");
            var keys = Enumerable.Range(1, 5_000).Select(i => (ulong)i).ToArray();
            
            var sw = Stopwatch.StartNew();
            try
            {
                using var portHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);
                sw.Stop();
                Console.WriteLine($"\\n=== FINAL RESULT ===");
                Console.WriteLine($"SUCCESS: 5K keys constructed in {sw.ElapsedMilliseconds}ms");
            }
            catch (Exception ex)
            {
                sw.Stop();
                Console.WriteLine($"\\n=== FINAL RESULT ===");
                Console.WriteLine($"FAILED after {sw.ElapsedMilliseconds}ms: {ex.Message}");
                throw;
            }
        }
    }
}