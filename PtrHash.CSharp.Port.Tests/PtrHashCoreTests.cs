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
        #region Constructor Tests

        [Test]
        public void Constructor_WithValidKeys_CreatesValidInstance()
        {
            // Test both UInt64 and String keys in one test
            // Arrange & Act - UInt64
            var ulongKeys = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            using var ulongPtrHash = new PtrHash<ulong, StrongerIntHasher>(ulongKeys, PtrHashParams.DefaultFast);
            var ulongInfo = ulongPtrHash.GetInfo();

            // Assert - UInt64
            Assert.That(ulongInfo.KeyCount, Is.EqualTo((nuint)1000));
            Assert.That(ulongInfo.BitsPerKey, Is.InRange(2.0, 4.0));
            Assert.That(ulongInfo.MaxIndex, Is.GreaterThanOrEqualTo((nuint)1000));

            // Arrange & Act - String
            var stringKeys = Enumerable.Range(1, 100).Select(i => $"key_{i}").ToArray();
            using var stringPtrHash = new PtrHash<string, StringHasher>(stringKeys, PtrHashParams.DefaultFast);
            var stringInfo = stringPtrHash.GetInfo();

            // Assert - String
            Assert.That(stringInfo.KeyCount, Is.EqualTo((nuint)100));
            Assert.That(stringInfo.BitsPerKey, Is.GreaterThan(0));
            Assert.That(stringInfo.MaxIndex, Is.GreaterThanOrEqualTo((nuint)100));
        }

        [Test]
        public void Constructor_WithInvalidKeys_ThrowsException()
        {
            // Test both empty and duplicate keys
            Assert.Throws<ArgumentException>(() => 
                new PtrHash<ulong, FxHasher>(Array.Empty<ulong>(), PtrHashParams.DefaultFast),
                "Empty keys should throw ArgumentException");

            Assert.Throws<PtrHashException>(() => 
                new PtrHash<ulong, FxHasher>(new ulong[] { 1, 2, 3, 2, 4 }, PtrHashParams.DefaultFast),
                "Duplicate keys should throw PtrHashException");
        }

        #endregion

        #region Index Retrieval Tests

        [Test]
        public void GetIndex_ProducesUniqueIndicesInValidRange()
        {
            // Arrange
            var keys = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);

            // Act
            var indices = keys.Select(key => ptrHash.GetIndex(key)).ToArray();
            var noRemapIndices = keys.Select(key => ptrHash.GetIndexNoRemap(key)).ToArray();
            var info = ptrHash.GetInfo();

            // Assert - GetIndex (minimal)
            Assert.That(indices.Distinct().Count(), Is.EqualTo(keys.Length), "All minimal indices should be unique");
            Assert.That(indices.All(idx => idx < (nuint)keys.Length), Is.True, "All minimal indices should be < n");

            // Assert - GetIndexNoRemap
            Assert.That(noRemapIndices.Distinct().Count(), Is.EqualTo(keys.Length), "All no-remap indices should be unique");
            Assert.That(noRemapIndices.All(idx => idx < info.MaxIndex), Is.True, "All no-remap indices should be < MaxIndex");
        }

        #endregion

        #region Streaming Tests

        [Test]
        public void GetIndicesStream_ConsistentWithSingleLookups()
        {
            // Arrange
            var keys = Enumerable.Range(1, 200).Select(i => (ulong)i).ToArray();
            using var ptrHash = new PtrHash<ulong, FxHasher>(keys, PtrHashParams.DefaultFast);

            // Act - Get expected results from single lookups
            var expectedMinimal = keys.Select(key => ptrHash.GetIndex(key)).ToArray();
            var expectedNoRemap = keys.Select(key => ptrHash.GetIndexNoRemap(key)).ToArray();

            // Act - Get stream results
            var streamMinimal = new nuint[keys.Length];
            var streamNoRemap = new nuint[keys.Length];
            ptrHash.GetIndicesStream(keys, streamMinimal, minimal: true);
            ptrHash.GetIndicesStream(keys, streamNoRemap, minimal: false);

            // Assert
            Assert.That(streamMinimal, Is.EqualTo(expectedMinimal), 
                "Stream with minimal=true should match GetIndex");
            Assert.That(streamNoRemap, Is.EqualTo(expectedNoRemap), 
                "Stream with minimal=false should match GetIndexNoRemap");
        }

        #endregion

        #region Configuration Tests

        [Test]
        public void DifferentHashers_ProduceDifferentButValidMappings()
        {
            // Arrange
            var keys = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            
            // Act
            using var xxh3Hash = new PtrHash<ulong, Xxh3Hasher>(keys, PtrHashParams.DefaultFast);
            using var strongHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);
            
            var xxh3Indices = keys.Take(100).Select(k => xxh3Hash.GetIndex(k)).ToArray();
            var strongIndices = keys.Take(100).Select(k => strongHash.GetIndex(k)).ToArray();

            // Assert - Different mappings
            Assert.That(xxh3Indices, Is.Not.EqualTo(strongIndices), 
                "Different hashers should produce different mappings");
            
            // Assert - Both are valid perfect hash functions
            Assert.That(xxh3Indices.Distinct().Count(), Is.EqualTo(100), 
                "Xxh3 hasher should produce unique indices");
            Assert.That(strongIndices.Distinct().Count(), Is.EqualTo(100), 
                "Stronger hasher should produce unique indices");
        }

        [Test]
        public void SinglePartConfiguration_WorksCorrectly()
        {
            // Arrange
            var keys = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            var singlePartParams = PtrHashParams.DefaultFast with { SinglePart = true };
            
            // Act
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, singlePartParams);
            var indices = keys.Select(key => ptrHash.GetIndex(key)).ToArray();

            // Assert
            Assert.That(indices.Distinct().Count(), Is.EqualTo(keys.Length), 
                "Single part should still produce perfect hash");
            Assert.That(indices.All(idx => idx < (nuint)keys.Length), Is.True,
                "All indices should be in valid range");
        }

        #endregion

        #region Scale Tests

        [Test]
        [TestCase(1_000)]
        [TestCase(10_000)]
        [TestCase(100_000)]
        public void VariousDatasetSizes_MaintainCorrectness(int keyCount)
        {
            // Arrange
            var keys = Enumerable.Range(1, keyCount).Select(i => (ulong)i).ToArray();
            
            // Act
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);
            var info = ptrHash.GetInfo();
            
            // Sample 1% of keys for testing (max 1000)
            var sampleSize = Math.Min(1000, keyCount / 100);
            var sampleKeys = keys.Where((_, i) => i % (keyCount / sampleSize) == 0).Take(sampleSize).ToArray();
            var sampleIndices = sampleKeys.Select(k => ptrHash.GetIndex(k)).ToArray();
            
            // Test streaming
            var streamResults = new nuint[sampleKeys.Length];
            ptrHash.GetIndicesStream(sampleKeys, streamResults, minimal: true);

            // Assert
            Assert.That(info.KeyCount, Is.EqualTo((nuint)keyCount));
            Assert.That(info.BitsPerKey, Is.InRange(2.0, 4.0), 
                $"Bits per key should be reasonable for {keyCount} keys");
            Assert.That(sampleIndices.Distinct().Count(), Is.EqualTo(sampleKeys.Length), 
                "Sample should have unique indices");
            Assert.That(streamResults, Is.EqualTo(sampleIndices), 
                "Stream should match individual lookups");
        }

        #endregion
    }
}