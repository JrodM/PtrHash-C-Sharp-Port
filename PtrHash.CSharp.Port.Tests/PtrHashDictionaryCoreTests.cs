using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PtrHash.CSharp.Port.Tests
{
    [TestClass]
    public class PtrHashDictionaryCoreTests
    {
        #region Constructor Tests

        [TestMethod]
        public void Constructor_WithValidAndInvalidInputs_BehavesCorrectly()
        {
            // Valid construction
            var keys = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            var values = keys.Select(k => $"value_{k}").ToArray();
            var sentinel = "NOT_FOUND";
            
            using var dictionary = new PtrHashDictionaryU64<string>(keys, values, sentinel);
            Assert.AreEqual(sentinel, dictionary.Sentinel);
            Assert.AreEqual(1000, dictionary.Count);
            
            // Invalid construction - mismatched arrays
            Assert.ThrowsException<ArgumentException>(() => 
                new PtrHashDictionaryU64<string>(new ulong[] { 1, 2, 3 }, new string[] { "a", "b" }, "ERROR"));
        }

        #endregion

        #region Lookup Tests

        [TestMethod]
        public void Lookups_ReturnCorrectValuesForValidAndInvalidKeys()
        {
            // Arrange
            var keys = new ulong[] { 10, 20, 30, 40, 50 };
            var values = new int[] { 100, 200, 300, 400, 500 };
            var sentinel = -1;
            using var dictionary = new PtrHashDictionaryU64<int>(keys, values, sentinel);

            // Test valid keys
            Assert.IsTrue(dictionary.TryGetValue(20, out int value));
            Assert.AreEqual(200, value);
            Assert.AreEqual(400, dictionary.GetValueOrSentinel(40));
            Assert.AreEqual(300, dictionary[30]);

            // Test invalid keys
            Assert.IsFalse(dictionary.TryGetValue(15, out int missingValue));
            Assert.AreEqual(sentinel, missingValue);
            Assert.AreEqual(sentinel, dictionary.GetValueOrSentinel(99));
            Assert.ThrowsException<KeyNotFoundException>(() => { var x = dictionary[99]; });
        }

        #endregion

        #region Streaming Tests

        [TestMethod]
        public void TryGetValueStream_ConsistentWithSingleLookups()
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
            dictionary.TryGetValueStream(queryKeys, streamResults);

            // Assert
            CollectionAssert.AreEqual(expectedPoint, streamResults);
        }

        [TestMethod]
        public void TryGetValueStream_EdgeCases()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3 };
            var values = new string[] { "a", "b", "c" };
            using var dictionary = new PtrHashDictionaryU64<string>(keys, values, "EMPTY");

            // Empty input
            dictionary.TryGetValueStream(Array.Empty<ulong>(), Array.Empty<string>());

            // Mismatched spans
            Assert.ThrowsException<ArgumentException>(() => 
                dictionary.TryGetValueStream(new ulong[] { 1, 2 }, new string[3]));
        }

        #endregion

        #region String Key Tests

        [TestMethod]
        public void StringDictionary_WorksCorrectly()
        {
            // Arrange
            var keys = new[] { "red", "green", "blue", "yellow", "purple" };
            var values = new[] { "#FF0000", "#00FF00", "#0000FF", "#FFFF00", "#800080" };
            var sentinel = "#UNKNOWN";
            using var dictionary = new PtrHashDictionaryString<string>(keys, values, sentinel);

            // Test point lookups
            Assert.AreEqual("#FF0000", dictionary["red"]);
            Assert.AreEqual(sentinel, dictionary.GetValueOrSentinel("missing"));

            // Test streaming
            var queryKeys = new[] { "blue", "invalid", "yellow" };
            var results = new string[queryKeys.Length];
            dictionary.TryGetValueStream(queryKeys, results);
            
            CollectionAssert.AreEqual(new[] { "#0000FF", "#UNKNOWN", "#FFFF00" }, results);
        }

        #endregion

        #region IDictionary Interface Tests

        [TestMethod]
        public void IDictionaryInterface_ImplementedCorrectly()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5 };
            var values = new string[] { "one", "two", "three", "four", "five" };
            using var dictionary = new PtrHashDictionaryU64<string>(keys, values, "NONE");

            // Test properties
            Assert.AreEqual(5, dictionary.Count);
            Assert.IsTrue(dictionary.IsReadOnly);
            CollectionAssert.AreEquivalent(keys.ToArray(), dictionary.Keys.ToArray());
            CollectionAssert.AreEquivalent(values.ToArray(), dictionary.Values.ToArray());

            // Test read operations
            Assert.IsTrue(dictionary.ContainsKey(3));
            Assert.IsFalse(dictionary.ContainsKey(10));
            Assert.IsTrue(dictionary.Contains(new System.Collections.Generic.KeyValuePair<ulong, string>(2, "two")));

            // Test enumeration
            var items = dictionary.ToList();
            Assert.AreEqual(5, items.Count);

            // Test read-only exceptions
            Assert.ThrowsException<NotSupportedException>(() => dictionary[1] = "new");
            Assert.ThrowsException<NotSupportedException>(() => dictionary.Add(6, "six"));
            Assert.ThrowsException<NotSupportedException>(() => dictionary.Remove(1));
            Assert.ThrowsException<NotSupportedException>(() => dictionary.Clear());
        }

        #endregion

        #region Performance and Scale Tests

        [TestMethod]
        [DataRow(1_000)]
        [DataRow(10_000)]
        [DataRow(100_000)]
        //[DataRow(1_000_000)]
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
            dictionary.TryGetValueStream(testKeys, streamResults);

            CollectionAssert.AreEqual(pointResults, streamResults);
            Assert.IsTrue(pointResults.All(v => v != sentinel));
        }

        #endregion

        #region Lifecycle Tests

        [TestMethod]
        public void Dispose_ReleasesResources()
        {
            // Arrange
            var dictionary = new PtrHashDictionaryU64<string>(
                new ulong[] { 1, 2, 3 }, 
                new string[] { "a", "b", "c" }, 
                "DISPOSED");
            
            // Act & Assert - no exceptions on dispose
            dictionary.Dispose();
            
            // Multiple disposes should not throw
            dictionary.Dispose();
        }

        #endregion
    }
}