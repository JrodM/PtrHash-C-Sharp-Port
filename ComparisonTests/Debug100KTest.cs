using NUnit.Framework;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Diagnostics;
using System.Linq;

namespace ComparisonTests
{
    [TestFixture]
    public class Debug100KTest
    {
        private void RunPerformanceTest(int keyCount)
        {
            Console.WriteLine($"\n=== Testing with {keyCount:N0} keys ===");
            var keys = Enumerable.Range(1, keyCount).Select(i => (ulong)i).ToArray();
            
            var sw = Stopwatch.StartNew();
            try
            {
                using var portHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);
                sw.Stop();
                
                var elapsedMs = sw.ElapsedMilliseconds;
                var keysPerSecond = keyCount / (elapsedMs / 1000.0);
                
                Console.WriteLine($"SUCCESS: {keyCount:N0} keys constructed in {elapsedMs:N0}ms");
                Console.WriteLine($"Performance: {keysPerSecond:N0} keys/second");
                
                // Check if we hit a performance cliff (>1 second or <10k keys/sec)
                if (elapsedMs > 1000 || keysPerSecond < 10_000)
                {
                    Console.WriteLine("*** PERFORMANCE CLIFF DETECTED ***");
                }
            }
            catch (Exception ex)
            {
                sw.Stop();
                Console.WriteLine($"FAILED after {sw.ElapsedMilliseconds:N0}ms: {ex.Message}");
                throw;
            }
        }

        //[Test]
        public void Test_10K_Keys()
        {
            RunPerformanceTest(10_000);
        }

        //[Test]
        public void Test_20K_Keys()
        {
            RunPerformanceTest(20_000);
        }

       // [Test]
        public void Test_30K_Keys()
        {
            RunPerformanceTest(30_000);
        }

       [Test]
        public void Test_50K_Keys()
        {
            RunPerformanceTest(90_000);
        }

        //[Test]
        public void Test_75K_Keys()
        {
            RunPerformanceTest(75_000);
        }

        //[Test]
        public void Test_100K_Keys()
        {
            RunPerformanceTest(112_000);
        }

        //[Test]
        public void RunAllSizesInSequence()
        {
            Console.WriteLine("=== Running all sizes to identify performance cliff ===");
            Console.WriteLine("Using StrongerIntHasher with DefaultFast params\n");
            
            int[] sizes = { 10_000, 20_000, 30_000, 50_000, 75_000, 100_000 };
            double previousKeysPerSecond = double.MaxValue;
            
            foreach (var size in sizes)
            {
                var keys = Enumerable.Range(1, size).Select(i => (ulong)i).ToArray();
                
                var sw = Stopwatch.StartNew();
                try
                {
                    using var portHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);
                    sw.Stop();
                    
                    var elapsedMs = sw.ElapsedMilliseconds;
                    var keysPerSecond = size / (elapsedMs / 1000.0);
                    var degradation = previousKeysPerSecond == double.MaxValue ? 0 : 
                        (previousKeysPerSecond - keysPerSecond) / previousKeysPerSecond * 100;
                    
                    Console.WriteLine($"{size,7:N0} keys: {elapsedMs,6:N0}ms | {keysPerSecond,10:N0} keys/sec");
                    
                    if (degradation > 50)
                    {
                        Console.WriteLine($"        *** MAJOR PERFORMANCE DROP: {degradation:F1}% degradation ***");
                    }
                    
                    previousKeysPerSecond = keysPerSecond;
                }
                catch (Exception ex)
                {
                    sw.Stop();
                    Console.WriteLine($"{size,7:N0} keys: FAILED after {sw.ElapsedMilliseconds:N0}ms - {ex.Message}");
                }
            }
            
            Console.WriteLine("\nTest complete.");
        }
    }
}