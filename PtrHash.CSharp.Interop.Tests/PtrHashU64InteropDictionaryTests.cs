using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Linq;
using System.Numerics;
using PtrHash.CSharp.Interop.PtrHash;
using PtrHash.CSharp.Interop.InteropDictionary;
using PtrHash.CSharp.Interop.Native;
using PtrHash.CSharp.Interop.Tests;

namespace PtrHash.CSharp.Interop.Tests
{
    [TestClass]
    public class PtrHashU64InteropDictionaryTests
    {
        [TestMethod]
        public void TryGetValue_WithValidAndInvalidKeys_ReturnsCorrectResults()
        {
            var keys = Enumerable.Range(0, 1000).Select(i => (ulong)i * 10).ToArray();
            var values = Enumerable.Range(0, 1000).Select(i => (long)i).ToArray();
            var sentinel = -1L;

            var parameters = TestUtilities.GetTestParams();
            using var ptrHash = new PtrHashU64InteropDictionary<long>(keys, values, sentinel, parameters);

            for (int i = 0; i < keys.Length; i++)
            {
                Assert.IsTrue(ptrHash.TryGetValue(keys[i], out var value));
                Assert.AreEqual(values[i], value);
            }

            Assert.IsFalse(ptrHash.TryGetValue(999999, out var notFoundValue));
            Assert.AreEqual(sentinel, notFoundValue);
            Assert.IsFalse(ptrHash.TryGetValue(1, out notFoundValue));
            Assert.AreEqual(sentinel, notFoundValue);
            Assert.IsFalse(ptrHash.TryGetValue(ulong.MaxValue, out notFoundValue));
            Assert.AreEqual(sentinel, notFoundValue);
        }

        [TestMethod]
        public void TryGetValueStream_WithValidKeys_ReturnsCorrectResults()
        {
            var keys = Enumerable.Range(0, 1000).Select(i => (ulong)i * 10).ToArray();
            var values = Enumerable.Range(0, 1000).Select(i => (long)i).ToArray();
            var sentinel = -1L;

            var parameters = TestUtilities.GetTestParams();
            using var ptrHash = new PtrHashU64InteropDictionary<long>(keys, values, sentinel, parameters);

            var queryKeys = new ulong[keys.Length * 2];
            var expectedValues = new long[keys.Length * 2];
            for (int i = 0; i < keys.Length; i++)
            {
                queryKeys[i * 2] = keys[i];
                expectedValues[i * 2] = values[i];
                queryKeys[i * 2 + 1] = keys[i] + 1;
                expectedValues[i * 2 + 1] = sentinel;
            }

            var resultValues = new long[queryKeys.Length];

            ptrHash.TryGetValueStream(queryKeys, resultValues);

            // Check each result individually for better error diagnosis
            for (int i = 0; i < queryKeys.Length; i++)
            {
                Assert.AreEqual(
                    expectedValues[i], 
                    resultValues[i], 
                    $"Value mismatch at index {i} for key {queryKeys[i]}"
                );
            }
        }

        [TestMethod]
        public void TryGetValueStream_WithNotFoundKeys_ReturnsSentinel()
        {
            var keys = Enumerable.Range(0, 1000).Select(i => (ulong)i * 10).ToArray();
            var values = Enumerable.Range(0, 1000).Select(i => (long)i).ToArray();
            var sentinel = -1L;

            var parameters = TestUtilities.GetTestParams();
            using var ptrHash = new PtrHashU64InteropDictionary<long>(keys, values, sentinel, parameters);

            var queryKeys = Enumerable.Range(0, 1000).Select(i => (ulong)i * 10 + 1).ToArray();
            var resultValues = new long[queryKeys.Length];

            ptrHash.TryGetValueStream(queryKeys, resultValues);

            foreach (var value in resultValues)
            {
                Assert.AreEqual(sentinel, value);
            }
        }

        [TestMethod]
        public void EdgeCases_EmptyKeysAndDifferentValueTypes()
        {
            // Empty input test - skip actual creation because PtrHashU64 doesn't support empty keys
            // Instead, verify that it correctly throws an exception
            var emptyKeys = Array.Empty<ulong>();
            var emptyValues = Array.Empty<int>();
            var sentinel = -1;

            var parameters = TestUtilities.GetTestParams();
            
            Assert.ThrowsException<ArgumentException>(() => 
            {
                using var emptyHash = new PtrHashU64InteropDictionary<int>(emptyKeys, emptyValues, sentinel, parameters);
            });

            // Test with different value types
            var keys = new ulong[] { 1, 2, 3 };
            var doubleValues = new double[] { 1.1, 2.2, 3.3 };
            var doubleSentinel = double.NaN;

            using var doubleHash = new PtrHashU64InteropDictionary<double>(keys, doubleValues, doubleSentinel, parameters);
            
            Assert.IsTrue(doubleHash.TryGetValue(1, out var val1));
            Assert.AreEqual(1.1, val1);
            Assert.IsFalse(doubleHash.TryGetValue(4, out var val4));
            Assert.IsTrue(double.IsNaN(val4));
        }

        [TestMethod]
        public void Performance_BasicSIMDOperations_Work()
        {
            const int size = 20_000;
            var keys = Enumerable.Range(0, size).Select(i => (ulong)(i * 10)).ToArray();
            var values = Enumerable.Range(0, size).Select(i => (int)i).ToArray();
            var sentinel = -1;

            var parameters = TestUtilities.GetTestParams();
            using var ptrHash = new PtrHashU64InteropDictionary<int>(keys, values, sentinel, parameters);

            var queryKeys = keys.Take(10_000).Concat(keys.Select(k => k + 1).Take(10_000)).ToArray();
            var results = new int[queryKeys.Length];
            ptrHash.TryGetValueStream(queryKeys, results);
        }
    }
}
