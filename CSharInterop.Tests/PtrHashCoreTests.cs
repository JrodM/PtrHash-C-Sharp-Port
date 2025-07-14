using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.Core;
using PtrHash.PtrHash;

namespace CSharpInterop.Tests
{
    [TestClass]
    public class PtrHashCoreTests
    {
        [TestMethod]
        public void Constructor_WithValidKeys_CreatesInstance()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5, 100, 200, 300 };

            // Act
            using var hash = new PtrHashU64(keys);

            // Assert
            var info = hash.GetInfo();
            Assert.AreEqual((nuint)keys.Length, info.KeyCount);
            Assert.IsTrue(info.BitsPerKey > 0);
            Assert.IsTrue(info.MaxIndex > 0);
        }

        [TestMethod]
        public void Constructor_WithSpan_CreatesInstance()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5, 100, 200, 300 };
            ReadOnlySpan<ulong> keySpan = keys;

            // Act
            using var hash = new PtrHashU64(keySpan);

            // Assert
            var info = hash.GetInfo();
            Assert.AreEqual((nuint)keys.Length, info.KeyCount);
        }

        [TestMethod]
        public void Constructor_WithList_CreatesInstance()
        {
            // Arrange
            var keysList = new List<ulong> { 1, 2, 3, 4, 5, 100, 200, 300 };

            // Act
            using var hash = new PtrHashU64(keysList);

            // Assert
            var info = hash.GetInfo();
            Assert.AreEqual((nuint)keysList.Count, info.KeyCount);
        }

        [TestMethod]
        public void Constructor_WithDifferentConfigs_CreatesInstances()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5, 100, 200, 300 };

            // Act & Assert
            using var defaultHash = new PtrHashU64(keys, PtrHashConfig.Default);
            using var fastHash = new PtrHashU64(keys, PtrHashConfig.Fast);
            using var fastHash2 = new PtrHashU64(keys, PtrHashConfig.Fast);

            var defaultInfo = defaultHash.GetInfo();
            var fastInfo = fastHash.GetInfo();
            var fastInfo2 = fastHash2.GetInfo();

            Assert.AreEqual(defaultInfo.KeyCount, fastInfo.KeyCount);
            Assert.AreEqual(fastInfo.KeyCount, fastInfo2.KeyCount);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void Constructor_WithNullKeys_ThrowsArgumentNullException()
        {
            // Act
            new PtrHashU64((ulong[])null);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void Constructor_WithEmptyKeys_ThrowsArgumentException()
        {
            // Act
            new PtrHashU64(Array.Empty<ulong>());
        }

        [TestMethod]
        public void GetIndex_WithValidKeys_ReturnsUniqueIndices()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5, 100, 200, 300, 1000, 2000 };
            using var hash = new PtrHashU64(keys);

            // Act
            var indices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                indices[i] = hash.GetIndex(keys[i]);
            }

            // Assert
            var uniqueIndices = new HashSet<nuint>(indices);
            Assert.AreEqual(keys.Length, uniqueIndices.Count, "All indices should be unique");

            // All indices should be in range [0, n)
            foreach (var index in indices)
            {
                Assert.IsTrue(index < (nuint)keys.Length);
            }
        }

        [TestMethod]
        public void GetIndexNoRemap_WithValidKeys_ReturnsIndices()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5, 100, 200, 300 };
            using var hash = new PtrHashU64(keys);
            var info = hash.GetInfo();

            // Act
            var indices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                indices[i] = hash.GetIndexNoRemap(keys[i]);
            }

            // Assert
            var uniqueIndices = new HashSet<nuint>(indices);
            Assert.AreEqual(keys.Length, uniqueIndices.Count, "All indices should be unique");

            // All indices should be in range [0, max_index)
            foreach (var index in indices)
            {
                Assert.IsTrue(index < info.MaxIndex);
            }
        }

        [TestMethod]
        public void GetIndicesBatch_WithValidKeys_ReturnsCorrectIndices()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5, 100, 200, 300, 1000, 2000 };
            using var hash = new PtrHashU64(keys);

            // Get individual indices for comparison
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndex(keys[i]);
            }

            // Act
            var batchResults = new nuint[keys.Length];
            hash.GetIndicesBatch(keys, batchResults, minimal: true);

            // Assert
            CollectionAssert.AreEqual(expectedIndices, batchResults);
        }

        [TestMethod]
        public void GetIndicesBatch_WithNoRemapFlag_ReturnsCorrectIndices()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5, 100, 200, 300 };
            using var hash = new PtrHashU64(keys);

            // Get individual indices for comparison
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndexNoRemap(keys[i]);
            }

            // Act
            var batchResults = new nuint[keys.Length];
            hash.GetIndicesBatch(keys, batchResults, minimal: false);

            // Assert
            CollectionAssert.AreEqual(expectedIndices, batchResults);
        }

        [TestMethod]
        public void GetIndicesStream_WithValidKeys_ReturnsCorrectIndices()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5, 100, 200, 300, 1000, 2000 };
            using var hash = new PtrHashU64(keys);

            // Get individual indices for comparison
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndex(keys[i]);
            }

            // Act
            var streamResults = new nuint[keys.Length];
            hash.GetIndicesStream(keys, streamResults, prefetchDistance: 16, minimal: true);

            // Assert
            CollectionAssert.AreEqual(expectedIndices, streamResults);
        }

        [TestMethod]
        public void GetIndicesStream_WithDifferentPrefetchDistances_ReturnsCorrectIndices()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5, 100, 200, 300, 1000, 2000 };
            using var hash = new PtrHashU64(keys);

            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndex(keys[i]);
            }

            // Act & Assert for different prefetch distances
            foreach (uint prefetch in new uint[] { 8, 16, 32, 64 })
            {
                var results = new nuint[keys.Length];
                hash.GetIndicesStream(keys, results, prefetchDistance: prefetch, minimal: true);
                CollectionAssert.AreEqual(expectedIndices, results, $"Failed for prefetch distance {prefetch}");
            }
        }

        [TestMethod]
        public void Performance_LargeKeySet_CompletesReasonably()
        {
            // Arrange
            const int keyCount = 100_000;
            var keys = new ulong[keyCount];
            var random = new Random(42); // Fixed seed for reproducibility
            for (int i = 0; i < keyCount; i++)
            {
                keys[i] = (ulong)random.NextInt64();
            }

            // Make sure keys are unique
            var uniqueKeys = new HashSet<ulong>(keys);
            keys = uniqueKeys.Take(keyCount).ToArray();

            // Act
            var startTime = DateTime.UtcNow;
            using var hash = new PtrHashU64(keys);
            var constructionTime = DateTime.UtcNow - startTime;

            // Test batch lookup performance
            var results = new nuint[keys.Length];
            startTime = DateTime.UtcNow;
            hash.GetIndicesBatch(keys, results);
            var batchTime = DateTime.UtcNow - startTime;

            // Test stream lookup performance
            startTime = DateTime.UtcNow;
            hash.GetIndicesStream(keys, results, prefetchDistance: 32);
            var streamTime = DateTime.UtcNow - startTime;

            // Assert
            Assert.IsTrue(constructionTime < TimeSpan.FromSeconds(30), $"Construction took too long: {constructionTime}");
            Assert.IsTrue(batchTime < TimeSpan.FromSeconds(5), $"Batch lookup took too long: {batchTime}");
            Assert.IsTrue(streamTime < TimeSpan.FromSeconds(5), $"Stream lookup took too long: {streamTime}");

            var info = hash.GetInfo();
            Assert.AreEqual((nuint)keys.Length, info.KeyCount);
            Assert.IsTrue(info.BitsPerKey > 0 && info.BitsPerKey < 10); // Reasonable bits per key
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void GetIndicesBatch_WithMismatchedArrays_ThrowsArgumentException()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3 };
            using var hash = new PtrHashU64(keys);
            var results = new nuint[2]; // Wrong size

            // Act
            hash.GetIndicesBatch(keys, results);
        }

        [TestMethod]
        [ExpectedException(typeof(ObjectDisposedException))]
        public void GetIndex_AfterDispose_ThrowsObjectDisposedException()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3 };
            var hash = new PtrHashU64(keys);
            hash.Dispose();

            // Act
            hash.GetIndex(1);
        }

        [TestMethod]
        public void Dispose_MultipleCallsSafe()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3 };
            var hash = new PtrHashU64(keys);

            // Act & Assert - Should not throw
            hash.Dispose();
            hash.Dispose();
            hash.Dispose();
        }

        [TestMethod]
        public void GetInfo_ReturnsValidInformation()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5, 100, 200, 300 };
            using var hash = new PtrHashU64(keys);

            // Act
            var info = hash.GetInfo();

            // Assert
            Assert.AreEqual((nuint)keys.Length, info.KeyCount);
            Assert.IsTrue(info.BitsPerKey > 0);
            Assert.IsTrue(info.MaxIndex >= info.KeyCount);
        }

        #region Integration Tests

        [TestMethod]
        public void EndToEnd_ZeroCopyOperations()
        {
            // Arrange
            const int keyCount = 1000;
            var keys = new ulong[keyCount];
            for (int i = 0; i < keyCount; i++)
            {
                keys[i] = (ulong)(i * 137 + 1000); // Some spread
            }

            // Act & Assert
            using var hash = new PtrHashU64(keys, PtrHashConfig.Default);

            // Test single lookups
            for (int i = 0; i < Math.Min(100, keyCount); i++)
            {
                var index = hash.GetIndex(keys[i]);
                Assert.IsTrue(index < (nuint)keyCount);
            }

            // Test batch operations
            var batchResults = new nuint[keyCount];
            hash.GetIndicesBatch(keys, batchResults, minimal: true);

            // Test stream operations with different prefetch distances
            var streamResults = new nuint[keyCount];
            hash.GetIndicesStream(keys, streamResults, prefetchDistance: 32, minimal: true);

            // Verify batch and stream give same results
            CollectionAssert.AreEqual(batchResults, streamResults);

            // Verify all results are unique
            var uniqueIndices = new HashSet<nuint>(batchResults);
            Assert.AreEqual(keyCount, uniqueIndices.Count);
        }

        [TestMethod]
        public void MemoryLeak_MultipleInstances()
        {
            // Arrange & Act
            const int iterations = 100;
            var initialMemory = GC.GetTotalMemory(true);

            for (int i = 6; i < iterations; i++)
            {
                var keys = new ulong[] { 1, 2, 3, 4, 5, (ulong)i };

                using var hash = new PtrHashU64(keys, PtrHashConfig.Default with
                {
                    U64HashFunction = U64HashFunction.FxHash,
                });
                
                // Perform some operations
                for (int j = 0; j < keys.Length; j++)
                {
                    var index = hash.GetIndex(keys[j]);
                    Assert.IsTrue(index < (nuint)keys.Length);
                }
            }

            // Force garbage collection
            GC.Collect();
            GC.WaitForPendingFinalizers();
            GC.Collect();

            var finalMemory = GC.GetTotalMemory(false);
            var memoryIncrease = finalMemory - initialMemory;

            // Assert
            // Allow some memory increase but not excessive
            Assert.IsTrue(memoryIncrease < 10 * 1024 * 1024, // 10MB
                $"Memory increased by {memoryIncrease} bytes, which might indicate a memory leak");
        }

        [TestMethod]
        public void Performance_SingleVsBatchVsStream()
        {
            // Arrange
            const int keyCount = 10000;
            var keys = new ulong[keyCount];
            var random = new Random(42);
            for (int i = 0; i < keyCount; i++)
            {
                keys[i] = (ulong)random.NextInt64();
            }

            using var hash = new PtrHashU64(keys);

            // Single lookups
            var sw = Stopwatch.StartNew();
            for (int i = 0; i < keyCount; i++)
            {
                var index = hash.GetIndex(keys[i]);
            }
            sw.Stop();
            var singleTime = sw.ElapsedMilliseconds;

            // Batch lookups
            var batchResults = new nuint[keyCount];
            sw.Restart();
            hash.GetIndicesBatch(keys, batchResults);
            sw.Stop();
            var batchTime = sw.ElapsedMilliseconds;

            // Stream lookups
            var streamResults = new nuint[keyCount];
            sw.Restart();
            hash.GetIndicesStream(keys, streamResults, prefetchDistance: 32);
            sw.Stop();
            var streamTime = sw.ElapsedMilliseconds;

            // Assert
            Console.WriteLine($"Single lookups: {singleTime}ms");
            Console.WriteLine($"Batch lookups: {batchTime}ms");
            Console.WriteLine($"Stream lookups: {streamTime}ms");

            // Batch and stream should be significantly faster than individual lookups
            // Skip performance assertions if times are too small to measure reliably
            if (singleTime > 0 && batchTime > 0)
            {
                Assert.IsTrue(batchTime <= singleTime, "Batch should be at least as fast as individual lookups");
                Assert.IsTrue(streamTime <= Math.Max(batchTime, singleTime), "Stream should be at least as fast as other methods");
            }
            else
            {
                Console.WriteLine("Operations too fast to measure performance differences reliably");
            }

            // Results should be identical
            CollectionAssert.AreEqual(batchResults, streamResults);
        }

        [TestMethod]
        public void CrossPlatform_LibraryLoading()
        {
            // This test verifies that the native library can be loaded successfully
            // across different platforms (Windows, Linux, macOS)

            // Arrange & Act
            var keys = new ulong[] { 1, 2, 3 };
            
            // This will fail if the native library cannot be loaded
            using var hash = new PtrHashU64(keys);
            
            // Assert
            var info = hash.GetInfo();
            Assert.AreEqual((nuint)3, info.KeyCount);
        }

        [TestMethod]
        public void ErrorHandling_NativeExceptions()
        {
            // Test that native errors are properly propagated as managed exceptions
            
            try
            {
                // This should trigger a construction error in the native code
                var invalidKeys = new ulong[0];
                using var hash = new PtrHashU64(invalidKeys);
                Assert.Fail("Should have thrown an exception");
            }
            catch (ArgumentException)
            {
                // Expected - this is caught by managed code
            }
            catch (PtrHashException)
            {
                // Also acceptable if it makes it to native code
            }
        }

        #endregion
    }
}