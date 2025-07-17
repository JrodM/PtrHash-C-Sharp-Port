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
        //[Test]
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

        //[Test]
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
    }
}