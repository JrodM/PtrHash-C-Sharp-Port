using NUnit.Framework;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Linq;

namespace PtrHash.CSharp.Port.Tests
{
    [TestFixture]
    public class BasicFunctionalityTests
    {
        [Test]
        public void Constructor_WithUInt64Keys_ShouldCreateValidPtrHash()
        {
            // Arrange
            var keys = Enumerable.Range(0, 1000).Select(i => (ulong)i).ToArray();
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
            var keys = Enumerable.Range(0, 100).Select(i => $"key_{i}").ToArray();
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
            var keys = Enumerable.Range(0, 1000).Select(i => (ulong)i).ToArray();
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);

            // Act
            var indices = keys.Select(key => ptrHash.GetIndex(key)).ToArray();

            // Assert
            Assert.That(indices.Length, Is.EqualTo(1000));
            Assert.That(indices.Distinct().Count(), Is.EqualTo(1000), "All indices should be unique");
            Assert.That(indices.All(idx => idx < (nuint)1000), Is.True, "All indices should be less than n");
        }

        [Test]
        public void GetIndexNoRemap_WithValidKeys_ShouldReturnValidIndices()
        {
            // Arrange
            var keys = Enumerable.Range(0, 1000).Select(i => (ulong)i).ToArray();
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
            var keys = Enumerable.Range(0, 100).Select(i => (ulong)i).ToArray();
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
            var keys = Enumerable.Range(0, 100).Select(i => (ulong)i).ToArray();
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
            var keys = Enumerable.Range(0, 200).Select(i => (ulong)i).ToArray();
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
        public void GetInfo_ShouldReturnValidInformation()
        {
            // Arrange
            var keys = Enumerable.Range(0, 1000).Select(i => (ulong)i).ToArray();
            using var ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);

            // Act
            var info = ptrHash.GetInfo();

            // Assert
            Assert.That(info.KeyCount, Is.EqualTo((nuint)1000));
            Assert.That(info.BitsPerKey, Is.InRange(2.0, 4.0), "Bits per key should be reasonable for default_fast");
            Assert.That(info.MaxIndex, Is.GreaterThanOrEqualTo((nuint)1000));
        }
    }
}