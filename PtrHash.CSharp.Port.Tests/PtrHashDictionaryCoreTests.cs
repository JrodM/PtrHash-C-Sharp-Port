using NUnit.Framework;
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PtrHash.CSharp.Port.Tests
{
    [TestFixture]
    public class PtrHashDictionaryCoreTests
    {
        #region Constructor Tests

        [Test]
        public void Constructor_WithValidAndInvalidInputs_BehavesCorrectly()
        {
            // Valid construction
            var keys = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => $"value_{k}").ToArray();
            var sentinel = "NOT_FOUND";
            
            using var dictionary = new PtrHashDictionaryU64<string>(keys, values, sentinel);
            Assert.That(dictionary.Sentinel, Is.EqualTo(sentinel));
            Assert.That(dictionary.Count, Is.EqualTo(1000));
            
            // Invalid construction - mismatched arrays
            Assert.Throws<ArgumentException>(() => 
                new PtrHashDictionaryU64<string>(new ulong[] { 1, 2, 3 }, new string[] { "a", "b" }, "ERROR"));
        }

        #endregion

        #region Lookup Tests

        [Test]
        public void Lookups_ReturnCorrectValuesForValidAndInvalidKeys()
        {
            // Arrange
            var keys = new ulong[] { 10, 20, 30, 40, 50 };
            var values = new int[] { 100, 200, 300, 400, 500 };
            var sentinel = -1;
            using var dictionary = new PtrHashDictionaryU64<int>(keys, values, sentinel);

            // Test valid keys
            Assert.That(dictionary.TryGetValue(20, out int value), Is.True);
            Assert.That(value, Is.EqualTo(200));
            Assert.That(dictionary.GetValueOrSentinel(40), Is.EqualTo(400));
            Assert.That(dictionary[30], Is.EqualTo(300));

            // Test invalid keys
            Assert.That(dictionary.TryGetValue(15, out int missingValue), Is.False);
            Assert.That(missingValue, Is.EqualTo(sentinel));
            Assert.That(dictionary.GetValueOrSentinel(99), Is.EqualTo(sentinel));
            Assert.Throws<KeyNotFoundException>(() => { var x = dictionary[99]; });
        }

        #endregion

        #region Streaming Tests

        [Test]
        public void GetValuesStream_ConsistentWithSingleLookups()
        {
            // Arrange
            var keys = Enumerable.Range(1, 200).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => $"item_{k}").ToArray();
            var sentinel = "NOT_FOUND";
            using var dictionary = new PtrHashDictionaryU64<string>(keys, values, sentinel);

            // Mix of valid and invalid keys
            var queryKeys = new ulong[] { 1, 999, 50, 888, 100, 777, 150, 666, 200 };
            var expectedPoint = queryKeys.Select(k => dictionary.GetValueOrSentinel(k)).ToArray();
            
            // Test streaming
            var streamResults = new string[queryKeys.Length];
            dictionary.GetValuesStream(queryKeys, streamResults);

            // Assert
            Assert.That(streamResults, Is.EqualTo(expectedPoint), 
                "Stream results should match point lookups");
        }

        [Test]
        public void GetValuesStream_EdgeCases()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3 };
            var values = new string[] { "a", "b", "c" };
            using var dictionary = new PtrHashDictionaryU64<string>(keys, values, "EMPTY");

            // Empty input
            Assert.DoesNotThrow(() => dictionary.GetValuesStream(Array.Empty<ulong>(), Array.Empty<string>()));

            // Mismatched spans
            Assert.Throws<ArgumentException>(() => 
                dictionary.GetValuesStream(new ulong[] { 1, 2 }, new string[3]));
        }

        #endregion

        #region String Key Tests

        [Test]
        public void StringDictionary_WorksCorrectly()
        {
            // Arrange
            var keys = new[] { "red", "green", "blue", "yellow", "purple" };
            var values = new[] { "#FF0000", "#00FF00", "#0000FF", "#FFFF00", "#800080" };
            var sentinel = "#UNKNOWN";
            using var dictionary = new PtrHashDictionaryString<string>(keys, values, sentinel);

            // Test point lookups
            Assert.That(dictionary["red"], Is.EqualTo("#FF0000"));
            Assert.That(dictionary.GetValueOrSentinel("missing"), Is.EqualTo(sentinel));

            // Test streaming
            var queryKeys = new[] { "blue", "invalid", "yellow" };
            var results = new string[queryKeys.Length];
            dictionary.GetValuesStream(queryKeys, results);
            
            Assert.That(results, Is.EqualTo(new[] { "#0000FF", "#UNKNOWN", "#FFFF00" }));
        }

        #endregion

        #region IDictionary Interface Tests

        [Test]
        public void IDictionaryInterface_ImplementedCorrectly()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5 };
            var values = new string[] { "one", "two", "three", "four", "five" };
            using var dictionary = new PtrHashDictionaryU64<string>(keys, values, "NONE");

            // Test properties
            Assert.That(dictionary.Count, Is.EqualTo(5));
            Assert.That(dictionary.IsReadOnly, Is.True);
            Assert.That(dictionary.Keys, Is.EquivalentTo(keys));
            Assert.That(dictionary.Values, Is.EquivalentTo(values));

            // Test read operations
            Assert.That(dictionary.ContainsKey(3), Is.True);
            Assert.That(dictionary.ContainsKey(10), Is.False);
            Assert.That(dictionary.Contains(new System.Collections.Generic.KeyValuePair<ulong, string>(2, "two")), Is.True);

            // Test enumeration
            var items = dictionary.ToList();
            Assert.That(items.Count, Is.EqualTo(5));

            // Test read-only exceptions
            Assert.Throws<NotSupportedException>(() => dictionary[1] = "new");
            Assert.Throws<NotSupportedException>(() => dictionary.Add(6, "six"));
            Assert.Throws<NotSupportedException>(() => dictionary.Remove(1));
            Assert.Throws<NotSupportedException>(() => dictionary.Clear());
        }

        #endregion

        #region Performance and Scale Tests

        [Test]
        [TestCase(1_000)]
        [TestCase(10_000)]
        [TestCase(100_000)]
        public void LargeScale_MaintainsCorrectness(int size)
        {
            // Arrange
            var keys = Enumerable.Range(1, size).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => (int)(k * 2)).ToArray();
            var sentinel = -1;
            using var dictionary = new PtrHashDictionaryU64<int>(keys, values, sentinel);

            // Sample test
            var random = new Random(42);
            var testKeys = Enumerable.Range(0, Math.Min(1000, size / 10))
                .Select(_ => keys[random.Next(size)])
                .ToArray();

            // Test point vs stream consistency
            var pointResults = testKeys.Select(k => dictionary.GetValueOrSentinel(k)).ToArray();
            var streamResults = new int[testKeys.Length];
            dictionary.GetValuesStream(testKeys, streamResults);

            Assert.That(streamResults, Is.EqualTo(pointResults));
            Assert.That(pointResults.All(v => v != sentinel), Is.True, 
                "All sampled keys should be found");
        }

        #endregion

        #region Lifecycle Tests

        [Test]
        public void Dispose_ReleasesResources()
        {
            // Arrange
            var dictionary = new PtrHashDictionaryU64<string>(
                new ulong[] { 1, 2, 3 }, 
                new string[] { "a", "b", "c" }, 
                "DISPOSED");
            
            // Act & Assert - no exceptions on dispose
            Assert.DoesNotThrow(() => dictionary.Dispose());
            
            // Multiple disposes should not throw
            Assert.DoesNotThrow(() => dictionary.Dispose());
        }

        #endregion
    }
}