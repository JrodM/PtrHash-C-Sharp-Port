using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Linq;
using System.Numerics;
using PtrHash.Core;
using PtrHash.SentinelHashMap;

namespace PtrHash.Tests
{
    [TestClass]
    public class SentinelHashmapTests
    {
        [TestMethod]
        public void TryGetValue_WithValidAndInvalidKeys_ReturnsCorrectResults()
        {
            var keys = Enumerable.Range(0, 1000).Select(i => (ulong)i * 10).ToArray();
            var values = Enumerable.Range(0, 1000).Select(i => (long)i).ToArray();
            var sentinel = -1L;

            var config = new PtrHashConfig 
            { 
                U64HashFunction = U64HashFunction.StrongerIntHash 
            };
            using var ptrHash = new SentinelPtrHashU64<long>(keys, values, sentinel, config);

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

            var config = new PtrHashConfig 
            { 
                U64HashFunction = U64HashFunction.StrongerIntHash 
            };
            using var ptrHash = new SentinelPtrHashU64<long>(keys, values, sentinel, config);

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

            var config = new PtrHashConfig 
            { 
                U64HashFunction = U64HashFunction.StrongerIntHash 
            };
            using var ptrHash = new SentinelPtrHashU64<long>(keys, values, sentinel, config);

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

            var config = new PtrHashConfig 
            { 
                U64HashFunction = U64HashFunction.StrongerIntHash 
            };
            
            Assert.ThrowsException<ArgumentException>(() => 
            {
                using var emptyHash = new SentinelPtrHashU64<int>(emptyKeys, emptyValues, sentinel, config);
            });

            // Test with different value types
            var keys = new ulong[] { 1, 2, 3 };
            var doubleValues = new double[] { 1.1, 2.2, 3.3 };
            var doubleSentinel = double.NaN;

            using var doubleHash = new SentinelPtrHashU64<double>(keys, doubleValues, doubleSentinel, config);
            
            Assert.IsTrue(doubleHash.TryGetValue(1, out var val1));
            Assert.AreEqual(1.1, val1);
            Assert.IsFalse(doubleHash.TryGetValue(4, out var val4));
            Assert.IsTrue(double.IsNaN(val4));
            
            // Test performance info
            var info = doubleHash.GetPerformanceInfo();
            Assert.IsTrue(info.SupportsSimd == Vector.IsHardwareAccelerated);
            Assert.AreEqual(Vector<ulong>.Count, info.VectorWidth);
        }

        [TestMethod]
        public void Performance_LargeDataSetWithSIMD()
        {
            // Test SIMD optimization with mixed found/not-found patterns
            const int size = 1000;
            var keys = Enumerable.Range(0, size).Select(i => (ulong)(i * 10)).ToArray();
            var values = Enumerable.Range(0, size).Select(i => (int)i).ToArray();
            var sentinel = -1;

            var config = new PtrHashConfig 
            { 
                U64HashFunction = U64HashFunction.StrongerIntHash,
                ParameterSet = PtrHashParameterSet.Fast,
                Lambda = 3.0,
                SinglePart = true
            };
            using var ptrHash = new SentinelPtrHashU64<int>(keys, values, sentinel, config);

            var queryKeys = new ulong[size];
            var expected = new int[size];
            
            // Create alternating found/not-found pattern to exercise SIMD
            for (int i = 0; i < size; i++)
            {
                if (i % 4 == 0)
                {
                    queryKeys[i] = keys[i] + 1; // Not found
                    expected[i] = sentinel;
                }
                else
                {
                    queryKeys[i] = keys[i]; // Found
                    expected[i] = values[i];
                }
            }

            var results = new int[size];
            ptrHash.TryGetValueStream(queryKeys, results);

            // Verify results
            for (int i = 0; i < size; i++)
            {
                Assert.AreEqual(expected[i], results[i], 
                    $"Value mismatch at index {i} for key {queryKeys[i]}");
            }
            
            // Verify performance info
            var info = ptrHash.GetPerformanceInfo();
            Assert.AreEqual(Vector.IsHardwareAccelerated, info.SupportsSimd);
        }
    }
}
