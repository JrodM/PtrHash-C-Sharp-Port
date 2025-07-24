using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Interop.PtrHash;
using PtrHash.CSharp.Interop.Native;
using PtrHash.CSharp.Interop.Tests;

namespace PtrHash.CSharp.Interop.Tests
{
    [TestClass]
    public class PtrHashCoreTests
    {
        [TestMethod]
        public void Constructor_WithValidKeys_CreatesInstance()
        {
            var keys = TestUtilities.GenerateTestU64Keys();
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            TestUtilities.AssertValidPtrHashInfo(hash.GetInfo(), keys.Length);
        }

        [TestMethod]
        public void Constructor_WithDifferentConfigs_CreatesInstances()
        {
            var keys = TestUtilities.GenerateTestU64Keys();
            using var defaultHash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            using var customHash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams(hashFunction: 2));
            
            Assert.AreEqual(defaultHash.GetInfo().KeyCount, customHash.GetInfo().KeyCount);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void Constructor_WithNullKeys_ThrowsArgumentException()
        {
            new PtrHashInteropU64((ulong[])null);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void Constructor_WithEmptyKeys_ThrowsArgumentException()
        {
            new PtrHashInteropU64(Array.Empty<ulong>());
        }

        [TestMethod]
        public void GetIndex_WithValidKeys_ReturnsUniqueIndices()
        {
            var keys = TestUtilities.GenerateTestU64Keys(10_000);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var indices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                indices[i] = hash.GetIndex(keys[i]);
            }
            
            TestUtilities.AssertUniqueIndicesInRange(keys, indices, (nuint)keys.Length);
        }

        [TestMethod]
        public void GetIndexNoRemap_WithValidKeys_ReturnsIndices()
        {
            var keys = TestUtilities.GenerateTestU64Keys();
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            var info = hash.GetInfo();
            
            var indices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                indices[i] = hash.GetIndexNoRemap(keys[i]);
            }
            
            TestUtilities.AssertUniqueIndicesInRange(keys, indices, info.MaxIndex);
        }

        [TestMethod]
        public void GetIndicesBatch_WithValidKeys_ReturnsCorrectIndices()
        {
            var keys = TestUtilities.GenerateTestU64Keys(10_000);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndex(keys[i]);
            }
            
            var batchResults = new nuint[keys.Length];
            hash.GetIndicesBatch(keys, batchResults, minimal: true);
            
            CollectionAssert.AreEqual(expectedIndices, batchResults);
        }

        [TestMethod]
        public void GetIndicesBatch_WithNoRemapFlag_ReturnsCorrectIndices()
        {
            var keys = TestUtilities.GenerateTestU64Keys();
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndexNoRemap(keys[i]);
            }
            
            var batchResults = new nuint[keys.Length];
            hash.GetIndicesBatch(keys, batchResults, minimal: false);
            
            CollectionAssert.AreEqual(expectedIndices, batchResults);
        }

        [TestMethod]
        public void GetIndicesStream_WithValidKeys_ReturnsCorrectIndices()
        {
            var keys = TestUtilities.GenerateTestU64Keys(10);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndex(keys[i]);
            }
            
            var streamResults = new nuint[keys.Length];
            hash.GetIndicesStream(keys, streamResults, prefetchDistance: 16, minimal: true);
            
            CollectionAssert.AreEqual(expectedIndices, streamResults);
        }

        [TestMethod]
        public void GetIndicesStream_WithDifferentPrefetchDistances_ReturnsCorrectIndices()
        {
            var keys = TestUtilities.GenerateTestU64Keys(10);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndex(keys[i]);
            }
            
            foreach (uint prefetch in new uint[] { 8, 16, 32 })
            {
                var results = new nuint[keys.Length];
                hash.GetIndicesStream(keys, results, prefetchDistance: prefetch, minimal: true);
                CollectionAssert.AreEqual(expectedIndices, results, $"Failed for prefetch distance {prefetch}");
            }
        }

        [TestMethod]
        public void Performance_BasicFunctionality_Works()
        {
            var keys = TestUtilities.GenerateUniqueRandomKeys(25_000);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var results = new nuint[keys.Length];
            hash.GetIndicesBatch(keys, results);
            hash.GetIndicesStream(keys, results, prefetchDistance: 32);
            
            TestUtilities.AssertValidPtrHashInfo(hash.GetInfo(), keys.Length);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void GetIndicesBatch_WithMismatchedArrays_ThrowsArgumentException()
        {
            var keys = TestUtilities.GenerateTestU64Keys(3);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            var results = new nuint[2];
            hash.GetIndicesBatch(keys, results);
        }

        [TestMethod]
        public void GetInfo_ReturnsValidInformation()
        {
            var keys = TestUtilities.GenerateTestU64Keys();
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            TestUtilities.AssertValidPtrHashInfo(hash.GetInfo(), keys.Length);
        }

        [TestMethod]
        public void EndToEnd_AllOperationsWork()
        {
            var keys = TestUtilities.GenerateUniqueRandomKeys(50_000);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var batchResults = new nuint[keys.Length];
            hash.GetIndicesBatch(keys, batchResults, minimal: true);
            
            var streamResults = new nuint[keys.Length];
            hash.GetIndicesStream(keys, streamResults, prefetchDistance: 32, minimal: true);
            
            CollectionAssert.AreEqual(batchResults, streamResults);
            TestUtilities.AssertUniqueIndicesInRange(keys, batchResults, (nuint)keys.Length);
        }
    }
}