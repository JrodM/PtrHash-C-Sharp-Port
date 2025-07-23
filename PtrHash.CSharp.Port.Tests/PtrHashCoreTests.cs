using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Linq;

namespace PtrHash.CSharp.Port.Tests
{
    [TestClass]
    public class PtrHashCoreTests
    {
        #region Constructor Tests

        [TestMethod]
        public void Constructor_WithValidKeys_CreatesValidInstance()
        {
            // Test both UInt64 and String keys in one test
            // Arrange & Act - UInt64
            var ulongKeys = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            using var ulongPtrHash = new PtrHash<ulong, StrongerIntHasher>(ulongKeys, PtrHashParams.DefaultFast);
            var ulongInfo = ulongPtrHash.GetInfo();

            // Assert - UInt64
            Assert.AreEqual((nuint)1000, ulongInfo.KeyCount);
            Assert.IsTrue(ulongInfo.BitsPerKey >= 2.0 && ulongInfo.BitsPerKey <= 4.0);
            Assert.IsTrue(ulongInfo.MaxIndex >= (nuint)1000);

            // Arrange & Act - String
            var stringKeys = Enumerable.Range(1, 100).Select(i => $"key_{i}").ToArray();
            using var stringPtrHash = new PtrHash<string, StringHasher>(stringKeys, PtrHashParams.DefaultFast);
            var stringInfo = stringPtrHash.GetInfo();

            // Assert - String
            Assert.AreEqual((nuint)100, stringInfo.KeyCount);
            Assert.IsTrue(stringInfo.BitsPerKey > 0);
            Assert.IsTrue(stringInfo.MaxIndex >= (nuint)100);
        }

        [TestMethod]
        public void Constructor_WithInvalidKeys_ThrowsException()
        {
            // Test both empty and duplicate keys
            Assert.ThrowsException<ArgumentException>(() => 
                new PtrHash<ulong, FxHasher>(Array.Empty<ulong>(), PtrHashParams.DefaultFast));

            Assert.ThrowsException<PtrHashException>(() => 
                new PtrHash<ulong, FxHasher>(new ulong[] { 1, 2, 3, 2, 4 }, PtrHashParams.DefaultFast));
        }

        #endregion

        #region Index Retrieval Tests

        [TestMethod]
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
            Assert.AreEqual(keys.Length, indices.Distinct().Count());
            Assert.IsTrue(indices.All(idx => idx < (nuint)keys.Length));

            // Assert - GetIndexNoRemap
            Assert.AreEqual(keys.Length, noRemapIndices.Distinct().Count());
            Assert.IsTrue(noRemapIndices.All(idx => idx < info.MaxIndex));
        }

        #endregion

        #region Streaming Tests

        [TestMethod]
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
            CollectionAssert.AreEqual(expectedMinimal, streamMinimal);
            CollectionAssert.AreEqual(expectedNoRemap, streamNoRemap);
        }

        #endregion

        #region Configuration Tests

        [TestMethod]
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
            CollectionAssert.AreNotEqual(strongIndices, xxh3Indices);
            
            // Assert - Both are valid perfect hash functions
            Assert.AreEqual(100, xxh3Indices.Distinct().Count());
            Assert.AreEqual(100, strongIndices.Distinct().Count());
        }

        [TestMethod]
        public void SinglePartConfiguration_WorksCorrectly()
        {
            // Arrange
            var keys = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            var singlePartParams = PtrHashParams.DefaultFast with { SinglePart = true };
            
            // Act
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, singlePartParams);
            var indices = keys.Select(key => ptrHash.GetIndex(key)).ToArray();

            // Assert
            Assert.AreEqual(keys.Length, indices.Distinct().Count());
            Assert.IsTrue(indices.All(idx => idx < (nuint)keys.Length));
        }

        #endregion

        #region Scale Tests

        [TestMethod]
        [DataRow(1_000)]
        [DataRow(10_000)]
        [DataRow(100_000)]
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
            Assert.AreEqual((nuint)keyCount, info.KeyCount);
            Assert.IsTrue(info.BitsPerKey >= 2.0 && info.BitsPerKey <= 4.0);
            Assert.AreEqual(sampleKeys.Length, sampleIndices.Distinct().Count());
            CollectionAssert.AreEqual(sampleIndices, streamResults);
        }

        #endregion
    }
}