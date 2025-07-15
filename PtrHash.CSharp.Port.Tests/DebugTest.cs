using NUnit.Framework;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Linq;

namespace PtrHash.CSharp.Port.Tests
{
    [TestFixture]
    public class PerformanceTests
    {
        [Test]
        public void LargeDataset_ShouldProduceUniqueIndices()
        {
            // Test with larger dataset to verify parallelization performance
            var keys = Enumerable.Range(1, 1000).Select(x => (ulong)x).ToArray();
            var parameters = PtrHashParams.DefaultFast;
            
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, parameters);
            var info = ptrHash.GetInfo();
            
            // Verify all keys produce unique indices
            var indices = keys.Select(key => ptrHash.GetIndexNoRemap(key)).ToArray();
            var uniqueCount = indices.ToHashSet().Count;
            
            Assert.That(uniqueCount, Is.EqualTo(keys.Length), "All keys should produce unique indices");
            Assert.That((int)info.MaxIndex, Is.GreaterThanOrEqualTo(keys.Length), "MaxIndex should be >= number of keys");
            Assert.That(info.BitsPerKey, Is.LessThan(4.0), "Should use less than 4 bits per key for DefaultFast");
        }
    }
}