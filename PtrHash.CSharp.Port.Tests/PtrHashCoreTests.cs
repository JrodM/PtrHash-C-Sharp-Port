using NUnit.Framework;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Linq;

namespace PtrHash.CSharp.Port.Tests
{
    [TestFixture]
    public class PtrHashCoreTests
    {
        [Test]
        public void Constructor_WithValidUInt64Keys_ShouldCreateValidPtrHash()
        {
            // Arrange
            var keys = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            var parameters = PtrHashParams.DefaultFast;

            // Act
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, parameters);
            var info = ptrHash.GetInfo();

            // Assert
            Assert.That(info.KeyCount, Is.EqualTo((nuint)1000));
            Assert.That(info.BitsPerKey, Is.GreaterThan(0));
            Assert.That(info.MaxIndex, Is.GreaterThanOrEqualTo((nuint)1000));
        }

        [Test]
        public void Constructor_WithStringKeys_ShouldCreateValidPtrHash()
        {
            // Arrange
            var keys = Enumerable.Range(1, 100).Select(i => $"key_{i}").ToArray();
            var parameters = PtrHashParams.DefaultFast;

            // Act
            using var ptrHash = new PtrHash<string, StringHasher>(keys, parameters);
            var info = ptrHash.GetInfo();

            // Assert
            Assert.That(info.KeyCount, Is.EqualTo((nuint)100));
            Assert.That(info.BitsPerKey, Is.GreaterThan(0));
            Assert.That(info.MaxIndex, Is.GreaterThanOrEqualTo((nuint)100));
        }

        [Test]
        public void GetIndex_WithValidKeys_ShouldReturnUniqueIndices()
        {
            // Arrange
            var keys = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);

            // Act
            var indices = keys.Select(key => ptrHash.GetIndex(key)).ToArray();

            // Assert1
            Assert.That(indices.Length, Is.EqualTo(1000));
            Assert.That(indices.Distinct().Count(), Is.EqualTo(1000), "All indices should be unique");
            Assert.That(indices.All(idx => idx < (nuint)1000), Is.True, "All indices should be less than n");
        }

        [Test]
        public void GetIndexNoRemap_WithValidKeys_ShouldReturnValidIndices()
        {
            // Arrange
            var keys = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);
            var info = ptrHash.GetInfo();

            // Act
            var indices = keys.Select(key => ptrHash.GetIndexNoRemap(key)).ToArray();

            // Assert
            Assert.That(indices.Length, Is.EqualTo(1000));
            Assert.That(indices.Distinct().Count(), Is.EqualTo(1000), "All indices should be unique");
            Assert.That(indices.All(idx => idx < info.MaxIndex), Is.True, "All indices should be less than max_index");
        }

        [Test]
        public void GetIndicesStream_WithMinimalFalse_ShouldEqualIndexNoRemap()
        {
            // Arrange
            var keys = Enumerable.Range(1, 200).Select(i => (ulong)i).ToArray();
            using var ptrHash = new PtrHash<ulong, FxHasher>(keys, PtrHashParams.DefaultFast);

            // Act
            var streamResults = new nuint[keys.Length];
            ptrHash.GetIndicesStream(keys, streamResults, minimal: false);
            
            var noRemapResults = keys.Select(key => ptrHash.GetIndexNoRemap(key)).ToArray();

            // Assert
            Assert.That(streamResults, Is.EqualTo(noRemapResults), 
                "Stream results with minimal=false should equal IndexNoRemap results");
        }

        [Test]
        public void GetIndicesStream_WithMinimalTrue_ShouldEqualIndex()
        {
            // Arrange
            var keys = Enumerable.Range(1, 200).Select(i => (ulong)i).ToArray();
            using var ptrHash = new PtrHash<ulong, FxHasher>(keys, PtrHashParams.DefaultFast);

            // Act
            var streamResults = new nuint[keys.Length];
            ptrHash.GetIndicesStream(keys, streamResults, minimal: true);
            
            var indexResults = keys.Select(key => ptrHash.GetIndex(key)).ToArray();

            // Assert
            Assert.That(streamResults, Is.EqualTo(indexResults), 
                "Stream results with minimal=true should equal Index results");
        }

        [Test]
        public void GetIndicesStream_WithDifferentPrefetchDistances_ShouldProduceSameResults()
        {
            // Arrange
            var keys = Enumerable.Range(1, 300).Select(i => (ulong)i).ToArray();
            using var ptrHash = new PtrHash<ulong, FxHasher>(keys, PtrHashParams.DefaultFast);

            // Act
            var results1 = new nuint[keys.Length];
            var results2 = new nuint[keys.Length];
            
            ptrHash.GetIndicesStream(keys, results1, prefetchDistance: 16, minimal: true);
            ptrHash.GetIndicesStream(keys, results2, prefetchDistance: 64, minimal: true);

            // Assert
            Assert.That(results1, Is.EqualTo(results2), 
                "Different prefetch distances should produce the same results");
        }

        [Test]
        public void GetIndicesStream_MinimalFalseVsTrue_ShouldBeConsistentWhenMapped()
        {
            // Arrange
            var keys = Enumerable.Range(1, 10_000).Select(i => (ulong)i).ToArray();
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);

            // Act
            var noRemapResults = new nuint[keys.Length];
            var minimalResults = new nuint[keys.Length];
            
            ptrHash.GetIndicesStream(keys, noRemapResults, minimal: false);
            ptrHash.GetIndicesStream(keys, minimalResults, minimal: true);

            // Verify that manual mapping of noRemapResults equals minimalResults
            var manuallyMappedResults = noRemapResults.Select(idx => ptrHash.GetIndex(keys[Array.IndexOf(keys, keys.First(k => ptrHash.GetIndexNoRemap(k) == idx))])).ToArray();

            // Assert
            Assert.That(minimalResults, Is.EqualTo(manuallyMappedResults), 
                "Minimal=true should be equivalent to manually mapping minimal=false results");
        }

        [Test]
        public void Constructor_WithDuplicateKeys_ShouldThrowException()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 2, 4 }; // Contains duplicate

            // Act & Assert
            Assert.Throws<PtrHashException>(() => new PtrHash<ulong, FxHasher>(keys, PtrHashParams.DefaultFast));
        }

        [Test]
        public void Constructor_WithEmptyKeys_ShouldThrowException()
        {
            // Arrange
            var keys = new ulong[0];

            // Act & Assert
            Assert.Throws<ArgumentException>(() => new PtrHash<ulong, FxHasher>(keys, PtrHashParams.DefaultFast));
        }

        [Test]
        public void GetInfo_ShouldReturnConsistentInformation()
        {
            // Arrange
            var keys = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);

            // Act
            var info = ptrHash.GetInfo();

            // Assert
            Assert.That(info.KeyCount, Is.EqualTo((nuint)1000));
            Assert.That(info.BitsPerKey, Is.InRange(2.0, 4.0), "Bits per key should be reasonable for default_fast");
            Assert.That(info.MaxIndex, Is.GreaterThanOrEqualTo((nuint)1000));
            
            // Verify all indices are within bounds
            var allIndices = keys.Select(k => ptrHash.GetIndex(k));
            Assert.That(allIndices.All(idx => idx < (nuint)1000), Is.True, "All minimal indices should be < KeyCount");
            
            var allNoRemapIndices = keys.Select(k => ptrHash.GetIndexNoRemap(k));
            Assert.That(allNoRemapIndices.All(idx => idx < info.MaxIndex), Is.True, "All no-remap indices should be < MaxIndex");
        }

        [Test]
        public void DifferentHashers_ShouldProduceDifferentResults()
        {
            // Arrange
            var keys = Enumerable.Range(1, 10_000).Select(i => (ulong)i).ToArray();
            using var ptrHashFx = new PtrHash<ulong, Xxh3Hasher>(keys, PtrHashParams.DefaultFast);
            using var ptrHashStrong = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);

            // Act
            var fxIndices = keys.Select(k => ptrHashFx.GetIndex(k)).ToArray();
            var strongIndices = keys.Select(k => ptrHashStrong.GetIndex(k)).ToArray();

            // Assert
            Assert.That(fxIndices.Length, Is.EqualTo(strongIndices.Length));
            Assert.That(fxIndices, Is.Not.EqualTo(strongIndices), "Different hashers should produce different index mappings");
            
            // Both should still be perfect hash functions
            Assert.That(fxIndices.Distinct().Count(), Is.EqualTo(keys.Length));
            Assert.That(strongIndices.Distinct().Count(), Is.EqualTo(keys.Length));
        }

        [Test]
        public void SinglePart_ShouldWorkCorrectly()
        {
            // Arrange
            var keys = Enumerable.Range(1, 10_000).Select(i => (ulong)i).ToArray();
            var singlePartParams = PtrHashParams.DefaultFast with { SinglePart = true };
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, singlePartParams);

            // Act
            var indices = keys.Select(key => ptrHash.GetIndex(key)).ToArray();
            var info = ptrHash.GetInfo();

            // Assert
            Assert.That(indices.Distinct().Count(), Is.EqualTo(10_000), "Single part should still be a perfect hash");
            Assert.That(info.KeyCount, Is.EqualTo((nuint)10_000));
            Assert.That(indices.All(idx => idx < (nuint)10_000), Is.True);
        }

        [Test]
        public void LargeDataset_ShouldHandleCorrectly()
        {
            // Arrange
            var keys = Enumerable.Range(1, 100_000).Select(i => (ulong)i).ToArray();
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);

            // Act
            var sampleKeys = keys.Where((_, i) => i % 100 == 0).ToArray(); // Every 100th key
            var sampleIndices = sampleKeys.Select(k => ptrHash.GetIndex(k)).ToArray();
            
            // Test streaming on sample
            var streamResults = new nuint[sampleKeys.Length];
            ptrHash.GetIndicesStream(sampleKeys, streamResults, minimal: true);

            // Assert
            Assert.That(sampleIndices.Distinct().Count(), Is.EqualTo(sampleKeys.Length), "Large dataset should maintain uniqueness");
            Assert.That(streamResults, Is.EqualTo(sampleIndices), "Streaming should match individual lookups");
        }
    }
}