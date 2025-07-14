using System;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.Core;
using PtrHash.PtrHash;

namespace CSharpInterop.Tests
{
    [TestClass]
    public class StringHashTests
    {
        [TestMethod]
        public void Constructor_WithValidStringKeys_CreatesInstance()
        {
            // Arrange
            var keys = new string[] { "hello", "world", "test", "ptrhash", "minimal", "perfect", "hash", "function" };

            // Act
            using var hash = new PtrHashString(keys);

            // Assert
            var info = hash.GetInfo();
            Assert.AreEqual((nuint)keys.Length, info.KeyCount);
            Assert.IsTrue(info.BitsPerKey > 0);
            Assert.IsTrue(info.MaxIndex > 0);
        }

        [TestMethod]
        public void Constructor_WithList_CreatesInstance()
        {
            // Arrange
            var keysList = new List<string> { "hello", "world", "test", "ptrhash", "minimal", "perfect", "hash", "function" };

            // Act
            using var hash = new PtrHashString(keysList);

            // Assert
            var info = hash.GetInfo();
            Assert.AreEqual((nuint)keysList.Count, info.KeyCount);
        }

        [TestMethod]
        public void Constructor_WithDifferentConfigs_CreatesInstances()
        {
            // Arrange
            var keys = new string[] { "hello", "world", "test", "ptrhash" };

            // Act & Assert
            using var defaultHash = new PtrHashString(keys, PtrHashConfig.Default);
            using var fastHash = new PtrHashString(keys, PtrHashConfig.Fast);

            var defaultInfo = defaultHash.GetInfo();
            var fastInfo = fastHash.GetInfo();

            Assert.AreEqual(defaultInfo.KeyCount, fastInfo.KeyCount);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void Constructor_WithNullKeys_ThrowsArgumentNullException()
        {
            // Act
            new PtrHashString((string[])null);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void Constructor_WithEmptyKeys_ThrowsArgumentException()
        {
            // Act
            new PtrHashString(Array.Empty<string>());
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void Constructor_WithNullStringInArray_ThrowsArgumentException()
        {
            // Arrange
            var keys = new string[] { "hello", null, "world" };

            // Act
            new PtrHashString(keys);
        }

        [TestMethod]
        public void GetIndex_WithValidStringKeys_ReturnsUniqueIndices()
        {
            // Arrange
            var keys = new string[] { "hello", "world", "test", "ptrhash", "minimal", "perfect", "hash", "function" };
            using var hash = new PtrHashString(keys);

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
        public void GetIndex_WithUtf8Bytes_ReturnsCorrectIndices()
        {
            // Arrange
            var keys = new string[] { "hello", "world", "test", "müller", "🚀", "café" };
            using var hash = new PtrHashString(keys);

            // Act & Assert
            for (int i = 0; i < keys.Length; i++)
            {
                var expectedIndex = hash.GetIndex(keys[i]);
                var utf8Bytes = Encoding.UTF8.GetBytes(keys[i]);
                var actualIndex = hash.GetIndex(utf8Bytes);
                
                Assert.AreEqual(expectedIndex, actualIndex, $"Index mismatch for key: {keys[i]}");
            }
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void GetIndex_WithNullString_ThrowsArgumentNullException()
        {
            // Arrange
            var keys = new string[] { "hello", "world" };
            using var hash = new PtrHashString(keys);

            // Act
            hash.GetIndex((string)null);
        }

        [TestMethod]
        public void GetIndicesBatch_WithValidStringKeys_ReturnsCorrectIndices()
        {
            // Arrange
            var keys = new string[] { "hello", "world", "test", "ptrhash", "minimal", "perfect" };
            using var hash = new PtrHashString(keys);

            // Get individual indices for comparison
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndex(keys[i]);
            }

            // Act
            var batchResults = new nuint[keys.Length];
            hash.GetIndicesBatch(keys, batchResults);

            // Assert
            CollectionAssert.AreEqual(expectedIndices, batchResults);
        }

        [TestMethod]
        public void GetIndicesBatch_WithUtf8Keys_ReturnsCorrectIndices()
        {
            // Arrange
            var keys = new string[] { "hello", "world", "test", "müller", "🚀" };
            using var hash = new PtrHashString(keys);

            var utf8Keys = keys.Select(k => (ReadOnlyMemory<byte>)Encoding.UTF8.GetBytes(k)).ToArray();

            // Get individual indices for comparison
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndex(keys[i]);
            }

            // Act
            var batchResults = new nuint[keys.Length];
            hash.GetIndicesBatch(utf8Keys, batchResults);

            // Assert
            CollectionAssert.AreEqual(expectedIndices, batchResults);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void GetIndicesBatch_WithNullKeys_ThrowsArgumentNullException()
        {
            // Arrange
            var keys = new string[] { "hello", "world" };
            using var hash = new PtrHashString(keys);
            var results = new nuint[2];

            // Act
            hash.GetIndicesBatch((string[])null, results);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void GetIndicesBatch_WithMismatchedArrays_ThrowsArgumentException()
        {
            // Arrange
            var keys = new string[] { "hello", "world", "test" };
            using var hash = new PtrHashString(keys);
            var results = new nuint[2]; // Wrong size

            // Act
            hash.GetIndicesBatch(keys, results);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void GetIndicesBatch_WithNullStringInArray_ThrowsArgumentException()
        {
            // Arrange
            var keys = new string[] { "hello", "world" };
            using var hash = new PtrHashString(keys);
            var lookupKeys = new string[] { "hello", null };
            var results = new nuint[2];

            // Act
            hash.GetIndicesBatch(lookupKeys, results);
        }

        [TestMethod]
        public void GetInfo_ReturnsValidInformation()
        {
            // Arrange
            var keys = new string[] { "hello", "world", "test", "ptrhash" };
            using var hash = new PtrHashString(keys);

            // Act
            var info = hash.GetInfo();

            // Assert
            Assert.AreEqual((nuint)keys.Length, info.KeyCount);
            Assert.IsTrue(info.BitsPerKey > 0);
            Assert.IsTrue(info.MaxIndex >= info.KeyCount);
        }

        [TestMethod]
        public void Performance_LargeStringKeySet_CompletesReasonably()
        {
            // Arrange
            const int keyCount = 10_000;
            var keys = new string[keyCount];
            var random = new Random(42); // Fixed seed for reproducibility
            
            // Generate unique string keys
            var uniqueKeys = new HashSet<string>();
            while (uniqueKeys.Count < keyCount)
            {
                var key = GenerateRandomString(random, random.Next(5, 20));
                uniqueKeys.Add(key);
            }
            keys = uniqueKeys.ToArray();

            // Act
            var startTime = DateTime.UtcNow;
            using var hash = new PtrHashString(keys);
            var constructionTime = DateTime.UtcNow - startTime;

            // Test batch lookup performance
            var results = new nuint[keys.Length];
            startTime = DateTime.UtcNow;
            hash.GetIndicesBatch(keys, results);
            var batchTime = DateTime.UtcNow - startTime;

            // Assert
            Assert.IsTrue(constructionTime < TimeSpan.FromSeconds(60), $"Construction took too long: {constructionTime}");
            Assert.IsTrue(batchTime < TimeSpan.FromSeconds(10), $"Batch lookup took too long: {batchTime}");

            var info = hash.GetInfo();
            Assert.AreEqual((nuint)keys.Length, info.KeyCount);
            Assert.IsTrue(info.BitsPerKey > 0 && info.BitsPerKey < 15); // Reasonable bits per key for strings
        }

        [TestMethod]
        [ExpectedException(typeof(ObjectDisposedException))]
        public void GetIndex_AfterDispose_ThrowsObjectDisposedException()
        {
            // Arrange
            var keys = new string[] { "hello", "world" };
            var hash = new PtrHashString(keys);
            hash.Dispose();

            // Act
            hash.GetIndex("hello");
        }

        [TestMethod]
        public void Dispose_MultipleCallsSafe()
        {
            // Arrange
            var keys = new string[] { "hello", "world" };
            var hash = new PtrHashString(keys);

            // Act & Assert - Should not throw
            hash.Dispose();
            hash.Dispose();
            hash.Dispose();
        }

        [TestMethod]
        public void Unicode_StringKeys_WorkCorrectly()
        {
            // Arrange
            var keys = new string[] 
            { 
                "hello", 
                "世界", 
                "🌍", 
                "café", 
                "naïve", 
                "Ελληνικά",
                "русский",
                "العربية"
            };

            // Act
            using var hash = new PtrHashString(keys);

            // Assert
            var indices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                indices[i] = hash.GetIndex(keys[i]);
            }

            var uniqueIndices = new HashSet<nuint>(indices);
            Assert.AreEqual(keys.Length, uniqueIndices.Count, "All indices should be unique for Unicode strings");

            // Test UTF-8 byte equivalence
            for (int i = 0; i < keys.Length; i++)
            {
                var stringIndex = hash.GetIndex(keys[i]);
                var utf8Index = hash.GetIndex(Encoding.UTF8.GetBytes(keys[i]));
                Assert.AreEqual(stringIndex, utf8Index, $"String and UTF-8 indices should match for: {keys[i]}");
            }
        }

        private static string GenerateRandomString(Random random, int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var result = new char[length];
            for (int i = 0; i < length; i++)
            {
                result[i] = chars[random.Next(chars.Length)];
            }
            return new string(result);
        }
    }
}