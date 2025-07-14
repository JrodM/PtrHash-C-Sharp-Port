using NUnit.Framework;
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Linq;

namespace PtrHash.CSharp.Port.Tests
{
    [TestFixture]
    public class PtrHashMapTests
    {
        [Test]
        public void Constructor_WithValidKeyValuePairs_ShouldCreateValidHashMap()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5 };
            var values = new string[] { "one", "two", "three", "four", "five" };
            var sentinel = "NOT_FOUND";

            // Act
            using var hashMap = new PtrHashMapU64<string>(keys, values, sentinel);

            // Assert
            Assert.That(hashMap.Sentinel, Is.EqualTo(sentinel));
            var info = hashMap.GetInfo();
            Assert.That(info.KeyCount, Is.EqualTo((nuint)5));
        }

        [Test]
        public void Constructor_WithMismatchedArrays_ShouldThrowException()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3 };
            var values = new string[] { "one", "two" }; // Different length

            // Act & Assert
            Assert.Throws<ArgumentException>(() => 
                new PtrHashMapU64<string>(keys, values, "NOT_FOUND"));
        }

        [Test]
        public void TryGetValue_WithValidKeys_ShouldReturnCorrectValues()
        {
            // Arrange
            var keys = new ulong[] { 10, 20, 30, 40, 50 };
            var values = new int[] { 100, 200, 300, 400, 500 };
            using var hashMap = new PtrHashMapU64<int>(keys, values, -1);

            // Act & Assert
            foreach (var (key, expectedValue) in keys.Zip(values))
            {
                bool found = hashMap.TryGetValue(key, out int actualValue);
                Assert.That(found, Is.True, $"Key {key} should be found");
                Assert.That(actualValue, Is.EqualTo(expectedValue), $"Value for key {key} should match");
            }
        }

        [Test]
        public void TryGetValue_WithInvalidKeys_ShouldReturnSentinel()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3 };
            var values = new string[] { "a", "b", "c" };
            var sentinel = "MISSING";
            using var hashMap = new PtrHashMapU64<string>(keys, values, sentinel);

            // Act
            bool found1 = hashMap.TryGetValue(999, out string value1);
            bool found2 = hashMap.TryGetValue(0, out string value2);

            // Assert
            Assert.That(found1, Is.False);
            Assert.That(value1, Is.EqualTo(sentinel));
            Assert.That(found2, Is.False);
            Assert.That(value2, Is.EqualTo(sentinel));
        }

        [Test]
        public void GetValueOrSentinel_ShouldReturnCorrectValues()
        {
            // Arrange
            var keys = new ulong[] { 100, 200, 300 };
            var values = new double[] { 1.1, 2.2, 3.3 };
            var sentinel = -999.0;
            using var hashMap = new PtrHashMapU64<double>(keys, values, sentinel);

            // Act & Assert
            Assert.That(hashMap.GetValueOrSentinel(100), Is.EqualTo(1.1));
            Assert.That(hashMap.GetValueOrSentinel(200), Is.EqualTo(2.2));
            Assert.That(hashMap.GetValueOrSentinel(300), Is.EqualTo(3.3));
            Assert.That(hashMap.GetValueOrSentinel(999), Is.EqualTo(sentinel));
        }

        [Test]
        public void GetValuesStream_WithValidKeys_ShouldReturnCorrectValues()
        {
            // Arrange
            var keys = Enumerable.Range(1, 100).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => $"value_{k}").ToArray();
            var sentinel = "NOT_FOUND";
            using var hashMap = new PtrHashMapU64<string>(keys, values, sentinel);

            // Test with subset of keys
            var queryKeys = new ulong[] { 5, 10, 15, 20, 25 };
            var results = new string[queryKeys.Length];

            // Act
            hashMap.GetValuesStream(queryKeys, results);

            // Assert
            for (int i = 0; i < queryKeys.Length; i++)
            {
                var expectedValue = $"value_{queryKeys[i]}";
                Assert.That(results[i], Is.EqualTo(expectedValue), 
                    $"Stream result for key {queryKeys[i]} should match");
            }
        }

        [Test]
        public void GetValuesStream_WithMixedValidInvalidKeys_ShouldReturnCorrectValues()
        {
            // Arrange
            var keys = new ulong[] { 1, 3, 5, 7, 9 };
            var values = new int[] { 10, 30, 50, 70, 90 };
            var sentinel = -1;
            using var hashMap = new PtrHashMapU64<int>(keys, values, sentinel);

            var queryKeys = new ulong[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }; // Mix of valid and invalid
            var results = new int[queryKeys.Length];
            var expected = new int[] { 10, -1, 30, -1, 50, -1, 70, -1, 90, -1 };

            // Act
            hashMap.GetValuesStream(queryKeys, results);

            // Assert
            Assert.That(results, Is.EqualTo(expected));
        }

        [Test]
        public void GetValuesStream_WithDifferentPrefetchDistances_ShouldProduceSameResults()
        {
            // Arrange
            var keys = Enumerable.Range(1, 200).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => (int)(k * 2)).ToArray();
            var sentinel = -999;
            using var hashMap = new PtrHashMapU64<int>(keys, values, sentinel);

            var queryKeys = keys.Take(50).ToArray();
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
        public void StringHashMap_ShouldWorkCorrectly()
        {
            // Arrange
            var keys = new string[] { "apple", "banana", "cherry", "date" };
            var values = new int[] { 1, 2, 3, 4 };
            var sentinel = -1;
            using var hashMap = new PtrHashMapString<int>(keys, values, sentinel);

            // Act & Assert
            Assert.That(hashMap.TryGetValue("apple", out int value1), Is.True);
            Assert.That(value1, Is.EqualTo(1));
            
            Assert.That(hashMap.TryGetValue("banana", out int value2), Is.True);
            Assert.That(value2, Is.EqualTo(2));
            
            Assert.That(hashMap.TryGetValue("unknown", out int value3), Is.False);
            Assert.That(value3, Is.EqualTo(sentinel));
        }

        [Test]
        public void StringHashMap_StreamLookup_ShouldWorkCorrectly()
        {
            // Arrange
            var keys = new string[] { "red", "green", "blue", "yellow", "purple" };
            var values = new string[] { "#FF0000", "#00FF00", "#0000FF", "#FFFF00", "#800080" };
            var sentinel = "#UNKNOWN";
            using var hashMap = new PtrHashMapString<string>(keys, values, sentinel);

            var queryKeys = new string[] { "red", "invalid", "blue", "unknown", "yellow" };
            var results = new string[queryKeys.Length];
            var expected = new string[] { "#FF0000", "#UNKNOWN", "#0000FF", "#UNKNOWN", "#FFFF00" };

            // Act
            hashMap.GetValuesStream(queryKeys, results);

            // Assert
            Assert.That(results, Is.EqualTo(expected));
        }

        [Test]
        public void GetValuesStream_WithEmptyInput_ShouldHandleGracefully()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3 };
            var values = new string[] { "a", "b", "c" };
            using var hashMap = new PtrHashMapU64<string>(keys, values, "EMPTY");

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
            using var hashMap = new PtrHashMapU64<string>(keys, values, "ERROR");

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
            var hashMap = new PtrHashMapU64<string>(keys, values, "DISPOSED");

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
            const int size = 10000;
            var keys = Enumerable.Range(1, size).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => $"item_{k}").ToArray();
            var sentinel = "MISSING";
            using var hashMap = new PtrHashMapU64<string>(keys, values, sentinel);

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
                "Stream and single lookup results should match");
            
            foreach (var result in streamResults)
            {
                Assert.That(result, Does.StartWith("item_"), 
                    "All results should be valid (no sentinel values for valid keys)");
            }
        }
    }
}