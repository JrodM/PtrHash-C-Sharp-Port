using NUnit.Framework;
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Linq;

namespace PtrHash.CSharp.Port.Tests
{
    [TestFixture]
    public class PtrHashDictionaryCoreTests
    {
        [Test]
        public void Constructor_WithValidKeyValuePairs_ShouldCreateValidHashMap()
        {
            // Arrange
            var keys = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => $"value_{k}").ToArray();
            var sentinel = "NOT_FOUND";

            // Act
            using var hashMap = new PtrHashDictionaryU64<string>(keys, values, sentinel);

            // Assert
            Assert.That(hashMap.Sentinel, Is.EqualTo(sentinel));
            var info = hashMap.GetInfo();
            Assert.That(info.KeyCount, Is.EqualTo((nuint)1000));
        }

        [Test]
        public void Constructor_WithMismatchedArrays_ShouldThrowException()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3 };
            var values = new string[] { "one", "two" }; // Different length

            // Act & Assert
            Assert.Throws<ArgumentException>(() => 
                new PtrHashDictionaryU64<string>(keys, values, "NOT_FOUND"));
        }

        [Test]
        public void TryGetValue_WithAllValidKeys_ShouldReturnCorrectValues()
        {
            // Arrange
            var keys = Enumerable.Range(1, 500).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => (int)(k * 2)).ToArray();
            using var hashMap = new PtrHashDictionaryU64<int>(keys, values, -1);

            // Act & Assert - Test all keys
            foreach (var (key, expectedValue) in keys.Zip(values))
            {
                bool found = hashMap.TryGetValue(key, out int actualValue);
                Assert.That(found, Is.True, $"Key {key} should be found");
                Assert.That(actualValue, Is.EqualTo(expectedValue), $"Value for key {key} should match");
            }
        }

        [Test]
        public void TryGetValue_WithInvalidKeys_ShouldReturnSentinelAndFalse()
        {
            // Arrange
            var keys = new ulong[] { 10, 20, 30 };
            var values = new string[] { "ten", "twenty", "thirty" };
            var sentinel = "MISSING";
            using var hashMap = new PtrHashDictionaryU64<string>(keys, values, sentinel);

            // Act & Assert - Test keys not in the map
            var invalidKeys = new ulong[] { 5, 15, 25, 35, 100 };
            foreach (var invalidKey in invalidKeys)
            {
                bool found = hashMap.TryGetValue(invalidKey, out string value);
                Assert.That(found, Is.False, $"Invalid key {invalidKey} should not be found");
                Assert.That(value, Is.EqualTo(sentinel), $"Sentinel should be returned for invalid key {invalidKey}");
            }
        }

        [Test]
        public void GetValueOrSentinel_ShouldReturnCorrectValues()
        {
            // Arrange
            var keys = new ulong[] { 100, 200, 300, 400 };
            var values = new double[] { 1.1, 2.2, 3.3, 4.4 };
            var sentinel = -999.0;
            using var hashMap = new PtrHashDictionaryU64<double>(keys, values, sentinel);

            // Act & Assert - Valid keys
            Assert.That(hashMap.GetValueOrSentinel(100), Is.EqualTo(1.1));
            Assert.That(hashMap.GetValueOrSentinel(200), Is.EqualTo(2.2));
            Assert.That(hashMap.GetValueOrSentinel(300), Is.EqualTo(3.3));
            Assert.That(hashMap.GetValueOrSentinel(400), Is.EqualTo(4.4));
            
            // Invalid keys
            Assert.That(hashMap.GetValueOrSentinel(150), Is.EqualTo(sentinel));
            Assert.That(hashMap.GetValueOrSentinel(999), Is.EqualTo(sentinel));
        }

        [Test]
        public void GetValuesStream_WithAllValidKeys_ShouldReturnCorrectValues()
        {
            // Arrange
            var keys = Enumerable.Range(1, 200).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => $"item_{k}").ToArray();
            var sentinel = "NOT_FOUND";
            using var hashMap = new PtrHashDictionaryU64<string>(keys, values, sentinel);

            // Test with subset of keys in different order
            var queryKeys = new ulong[] { 50, 10, 150, 5, 200, 1, 100 };
            var results = new string[queryKeys.Length];
            var expected = queryKeys.Select(k => $"item_{k}").ToArray();

            // Act
            hashMap.GetValuesStream(queryKeys, results);

            // Assert
            Assert.That(results, Is.EqualTo(expected), "Stream should return correct values for all valid keys");
        }

        [Test]
        public void GetValuesStream_WithMixedValidInvalidKeys_ShouldReturnCorrectValues()
        {
            // Arrange
            var keys = new ulong[] { 1, 3, 5, 7, 9 };
            var values = new int[] { 10, 30, 50, 70, 90 };
            var sentinel = -1;
            using var hashMap = new PtrHashDictionaryU64<int>(keys, values, sentinel);

            var queryKeys = new ulong[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }; // Mix of valid and invalid
            var results = new int[queryKeys.Length];
            var expected = new int[] { 10, -1, 30, -1, 50, -1, 70, -1, 90, -1 };

            // Act
            hashMap.GetValuesStream(queryKeys, results);

            // Assert
            Assert.That(results, Is.EqualTo(expected), "Stream should handle mixed valid/invalid keys correctly");
        }

        [Test]
        public void GetValuesStream_WithDifferentPrefetchDistances_ShouldProduceSameResults()
        {
            // Arrange
            var keys = Enumerable.Range(1, 300).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => (int)(k * 3)).ToArray();
            var sentinel = -999;
            using var hashMap = new PtrHashDictionaryU64<int>(keys, values, sentinel);

            var queryKeys = keys.Take(100).ToArray();
            var results1 = new int[queryKeys.Length];
            var results2 = new int[queryKeys.Length];

            // Act
            hashMap.GetValuesStream(queryKeys, results1, prefetchDistance: 16);
            hashMap.GetValuesStream(queryKeys, results2, prefetchDistance: 64);

            // Assert
            Assert.That(results1, Is.EqualTo(results2), 
                "Different prefetch distances should produce the same results");
        }

        [Test]
        public void StreamVsPointLookups_ShouldReturnIdenticalResults()
        {
            // Arrange
            var keys = Enumerable.Range(1, 100).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => k.ToString()).ToArray();
            var sentinel = "EMPTY";
            using var hashMap = new PtrHashDictionaryU64<string>(keys, values, sentinel);

            var queryKeys = keys.Where((_, i) => i % 3 == 0).ToArray(); // Every 3rd key
            
            // Act
            var pointResults = queryKeys.Select(k => hashMap.GetValueOrSentinel(k)).ToArray();
            
            var streamResults = new string[queryKeys.Length];
            hashMap.GetValuesStream(queryKeys, streamResults);

            // Assert
            Assert.That(streamResults, Is.EqualTo(pointResults), 
                "Stream lookups should match individual point lookups");
        }

        [Test]
        public void StringHashMap_ShouldWorkCorrectly()
        {
            // Arrange
            var keys = new string[] { "apple", "banana", "cherry", "date", "elderberry" };
            var values = new int[] { 1, 2, 3, 4, 5 };
            var sentinel = -1;
            using var hashMap = new PtrHashDictionaryString<int>(keys, values, sentinel);

            // Act & Assert - Valid keys
            Assert.That(hashMap.TryGetValue("apple", out int value1), Is.True);
            Assert.That(value1, Is.EqualTo(1));
            
            Assert.That(hashMap.TryGetValue("cherry", out int value2), Is.True);
            Assert.That(value2, Is.EqualTo(3));
            
            Assert.That(hashMap.TryGetValue("elderberry", out int value3), Is.True);
            Assert.That(value3, Is.EqualTo(5));
            
            // Invalid keys
            Assert.That(hashMap.TryGetValue("grape", out int value4), Is.False);
            Assert.That(value4, Is.EqualTo(sentinel));
        }

        [Test]
        public void StringHashMap_StreamLookup_ShouldWorkCorrectly()
        {
            // Arrange
            var keys = new string[] { "red", "green", "blue", "yellow", "purple", "orange" };
            var values = new string[] { "#FF0000", "#00FF00", "#0000FF", "#FFFF00", "#800080", "#FFA500" };
            var sentinel = "#UNKNOWN";
            using var hashMap = new PtrHashDictionaryString<string>(keys, values, sentinel);

            var queryKeys = new string[] { "red", "invalid", "blue", "missing", "yellow", "purple" };
            var results = new string[queryKeys.Length];
            var expected = new string[] { "#FF0000", "#UNKNOWN", "#0000FF", "#UNKNOWN", "#FFFF00", "#800080" };

            // Act
            hashMap.GetValuesStream(queryKeys, results);

            // Assert
            Assert.That(results, Is.EqualTo(expected), "String keys should work correctly with streaming");
        }

        [Test]
        public void GetValuesStream_WithEmptyInput_ShouldHandleGracefully()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3 };
            var values = new string[] { "a", "b", "c" };
            using var hashMap = new PtrHashDictionaryU64<string>(keys, values, "EMPTY");

            var queryKeys = new ulong[0];
            var results = new string[0];

            // Act & Assert (should not throw)
            Assert.DoesNotThrow(() => hashMap.GetValuesStream(queryKeys, results));
        }

        [Test]
        public void GetValuesStream_WithMismatchedSpans_ShouldThrowException()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3 };
            var values = new string[] { "a", "b", "c" };
            using var hashMap = new PtrHashDictionaryU64<string>(keys, values, "ERROR");

            var queryKeys = new ulong[] { 1, 2 };
            var results = new string[3]; // Different length

            // Act & Assert
            Assert.Throws<ArgumentException>(() => 
                hashMap.GetValuesStream(queryKeys, results));
        }

        [Test]
        public void Dispose_ShouldPreventFurtherOperations()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3 };
            var values = new string[] { "a", "b", "c" };
            var hashMap = new PtrHashDictionaryU64<string>(keys, values, "DISPOSED");

            // Act
            hashMap.Dispose();

            // Assert
            Assert.Throws<ObjectDisposedException>(() => hashMap.TryGetValue(1, out _));
            Assert.Throws<ObjectDisposedException>(() => 
            {
                var queryKeys = new ulong[] { 1 };
                var results = new string[1];
                hashMap.GetValuesStream(queryKeys, results);
            });
        }

        [Test]
        public void LargeDataset_ShouldPerformCorrectly()
        {
            // Arrange
            const int size = 5000;
            var keys = Enumerable.Range(1, size).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => $"value_{k}").ToArray();
            var sentinel = "MISSING";
            using var hashMap = new PtrHashDictionaryU64<string>(keys, values, sentinel);

            // Test random subset
            var random = new Random(42);
            var testKeys = Enumerable.Range(0, 1000)
                .Select(_ => keys[random.Next(keys.Length)])
                .ToArray();

            // Act - Single lookups
            var singleResults = testKeys.Select(k => hashMap.GetValueOrSentinel(k)).ToArray();

            // Act - Stream lookups
            var streamResults = new string[testKeys.Length];
            hashMap.GetValuesStream(testKeys, streamResults);

            // Assert
            Assert.That(streamResults, Is.EqualTo(singleResults), 
                "Stream and single lookup results should match for large dataset");
            
            foreach (var result in streamResults)
            {
                Assert.That(result, Does.StartWith("value_"), 
                    "All results should be valid (no sentinel values for valid keys)");
            }
        }

        [Test]
        public void DifferentParameterSets_ShouldWorkCorrectly()
        {
            // Arrange
            var keys = Enumerable.Range(1, 200).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => (int)k).ToArray();
            var sentinel = -1;

            // Act
            using var hashMapFast = new PtrHashDictionaryU64<int>(keys, values, sentinel, PtrHashParams.DefaultFast);
            using var hashMapBalanced = new PtrHashDictionaryU64<int>(keys, values, sentinel, PtrHashParams.DefaultBalanced);

            // Test subset of keys
            var testKeys = keys.Where((_, i) => i % 10 == 0).ToArray();
            
            var fastResults = testKeys.Select(k => hashMapFast.GetValueOrSentinel(k)).ToArray();
            var balancedResults = testKeys.Select(k => hashMapBalanced.GetValueOrSentinel(k)).ToArray();

            // Assert
            Assert.That(fastResults, Is.EqualTo(balancedResults), 
                "Different parameter sets should return same values");
            Assert.That(fastResults, Is.EqualTo(testKeys.Select(k => (int)k).ToArray()), 
                "All lookups should return correct values");
        }

        [Test]
        public void GenericHashMap_WithCustomHasher_ShouldWorkCorrectly()
        {
            // Arrange
            var keys = Enumerable.Range(1, 100).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => k.ToString()).ToArray();
            var sentinel = "NOT_FOUND";
            
            using var hashMap = new PtrHashDictionary<ulong, string, StrongerIntHasher>(keys, values, sentinel);

            // Act & Assert
            foreach (var (key, expectedValue) in keys.Zip(values))
            {
                bool found = hashMap.TryGetValue(key, out string actualValue);
                Assert.That(found, Is.True, $"Key {key} should be found with custom hasher");
                Assert.That(actualValue, Is.EqualTo(expectedValue), $"Value should match for key {key}");
            }
        }
    }
}