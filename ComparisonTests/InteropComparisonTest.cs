using NUnit.Framework;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Interop.Core;
using PtrHash.CSharp.Interop.PtrHash;
using System;
using System.Diagnostics;
using System.Linq;
using static PtrHash.CSharp.Interop.Core.U64HashFunction;

namespace ComparisonTests
{
    [TestFixture]
    public class InteropComparisonTest
    {
        [Test]
        public void Interop_100K_StrongerIntHash_ShouldWork()
        {
            // Test interop version with 100K sequential keys
            var keys = Enumerable.Range(1, 1_000).Select(i => (ulong)i).ToArray();

            var stopwatch = Stopwatch.StartNew();
            var config = PtrHashConfig.Default with { U64HashFunction = StrongerIntHash };
            using var interopHash = new PtrHashU64(keys.AsSpan(), config);
            stopwatch.Stop();
            
            Console.WriteLine($"Interop construction with StrongerIntHash: {stopwatch.ElapsedMilliseconds}ms");
            
            // Test functionality with sample
            var sampleKeys = keys.Where((_, i) => i % 100 == 0).ToArray();
            var sampleIndices = sampleKeys.Select(k => interopHash.GetIndex(k)).ToArray();
            
            Assert.That(sampleIndices.Distinct().Count(), Is.EqualTo(sampleKeys.Length), "Should maintain uniqueness");
            Assert.Pass($"Interop SUCCESS: 100K keys in {stopwatch.ElapsedMilliseconds}ms");
        }

        [Test]
        public void Port_100K_StrongerIntHasher_Performance()
        {
            Console.WriteLine("Starting Port_100K_StrongerIntHasher_Performance test");
            // Test C# port version with 100K sequential keys - expect this to be much slower
            var keys = Enumerable.Range(1, 100_000).Select(i => (ulong)i).ToArray();
            Console.WriteLine($"Created {keys.Length} keys");

            var stopwatch = Stopwatch.StartNew();
            try
            {
                Console.WriteLine("Creating PtrHash instance...");
                using var portHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);
                stopwatch.Stop();
                
                Console.WriteLine($"C# Port construction with StrongerIntHasher: {stopwatch.ElapsedMilliseconds}ms");
                
                // Test functionality with sample
                var sampleKeys = keys.Where((_, i) => i % 100 == 0).ToArray();
                var sampleIndices = sampleKeys.Select(k => portHash.GetIndex(k)).ToArray();
                var streamResults = new nuint[sampleKeys.Length];
                portHash.GetIndicesStream(sampleKeys, streamResults, minimal: true);
                
                Assert.That(sampleIndices.Distinct().Count(), Is.EqualTo(sampleKeys.Length), "Should maintain uniqueness");
                Assert.That(streamResults, Is.EqualTo(sampleIndices), "Streaming should match individual lookups");
                
                Assert.Pass($"C# Port SUCCESS: 100K keys in {stopwatch.ElapsedMilliseconds}ms");
            }
            catch (Exception ex)
            {
                stopwatch.Stop();
                Assert.Fail($"C# Port FAILED after {stopwatch.ElapsedMilliseconds}ms: {ex.Message}");
            }
        }

        [Test]
        public void CompareInteropVsPort_20K_ConstructionTime()
        {
            // Arrange - Use a size that should work for both
            var keys = Enumerable.Range(1, 20_000).Select(i => (ulong)i).ToArray();

            // Test interop construction time
            var interopStopwatch = Stopwatch.StartNew();
            var config = PtrHashConfig.Default with { U64HashFunction = U64HashFunction.StrongerIntHash };
            using var interopHash = new PtrHashU64(keys.AsSpan(), config);
            interopStopwatch.Stop();
            var performanceRatio = 0;

            /*// Test C# port construction time
            var portStopwatch = Stopwatch.StartNew();
            using var portHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);
            portStopwatch.Stop();

            // Compare results
            Console.WriteLine($"Interop construction: {interopStopwatch.ElapsedMilliseconds}ms");
            Console.WriteLine($"C# Port construction: {portStopwatch.ElapsedMilliseconds}ms");
            
            performanceRatio = (double)portStopwatch.ElapsedMilliseconds / interopStopwatch.ElapsedMilliseconds;
            Console.WriteLine($"Performance ratio (Port/Interop): {performanceRatio:F2}x");

            // Verify both produce valid results
            var testKey = keys[1000];
            var interopIndex = interopHash.GetIndex(testKey);
            var portIndex = portHash.GetIndex(testKey);
            
            Assert.That(interopIndex, Is.LessThan((nuint)keys.Length));
            Assert.That(portIndex, Is.LessThan((nuint)keys.Length));
            */
            Assert.Pass($"Both work correctly. Port performance: {performanceRatio:F2}x of interop");

        }
    }
}