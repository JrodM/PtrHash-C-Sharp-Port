using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Interop.PtrHash;
using PtrHash.CSharp.Interop.Native;
using PtrHash.CSharp.Interop.Tests;

namespace PtrHash.CSharp.Interop.Tests
{
    [TestClass]
    public class StringHashTests
    {
        [TestMethod]
        public void Constructor_WithValidStringKeys_CreatesInstance()
        {
            var keys = TestUtilities.GenerateTestStringKeys();
            using var hash = new PtrHashInterop<string>(keys);
            TestUtilities.AssertValidPtrHashInfo(hash.GetInfo(), keys.Length);
        }

        [TestMethod]
        public void Constructor_WithList_CreatesInstance()
        {
            var keysList = TestUtilities.GenerateTestStringKeys();
            using var hash = new PtrHashInterop<string>(keysList);
            TestUtilities.AssertValidPtrHashInfo(hash.GetInfo(), keysList.Length);
        }

        [TestMethod]
        public void Constructor_WithDifferentConfigs_CreatesInstances()
        {
            var keys = TestUtilities.GenerateTestStringKeys(4);
            using var defaultHash = new PtrHashInterop<string>(keys, TestUtilities.GetTestParams());
            using var customHash = new PtrHashInterop<string>(keys, TestUtilities.GetTestParams(hashFunction: 2));
            
            Assert.AreEqual(defaultHash.GetInfo().KeyCount, customHash.GetInfo().KeyCount);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void Constructor_WithNullKeys_ThrowsArgumentNullException()
        {
            new PtrHashInterop<string>((string[])null);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void Constructor_WithEmptyKeys_ThrowsArgumentException()
        {
            new PtrHashInterop<string>(Array.Empty<string>());
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void Constructor_WithNullStringInArray_ThrowsArgumentException()
        {
            // Arrange
            var keys = new string[] { "hello", null, "world" };

            // Act
            new PtrHashInterop<string>(keys);
        }

        [TestMethod]
        public void GetIndex_WithValidStringKeys_ReturnsUniqueIndices()
        {
            var keys = TestUtilities.GenerateTestStringKeys();
            using var hash = new PtrHashInterop<string>(keys);
            
            var indices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                indices[i] = hash.GetIndex(keys[i]);
            }
            
            TestUtilities.AssertUniqueIndicesInRange(keys, indices, (nuint)keys.Length);
        }

        [TestMethod]
        public void GetIndex_WithUtf8Bytes_ReturnsCorrectIndices()
        {
            // Arrange
            var keys = new string[] { "hello", "world", "test", "müller", "🚀", "café" };
            using var hash = new PtrHashInterop<string>(keys);

            // Act & Assert
            for (int i = 0; i < keys.Length; i++)
            {
                var expectedIndex = hash.GetIndex(keys[i]);
                var utf8String = Encoding.UTF8.GetString(Encoding.UTF8.GetBytes(keys[i]));
                var actualIndex = hash.GetIndex(utf8String);
                
                Assert.AreEqual(expectedIndex, actualIndex, $"Index mismatch for key: {keys[i]}");
            }
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentNullException))]
        public void GetIndex_WithNullString_ThrowsArgumentNullException()
        {
            var keys = TestUtilities.GenerateTestStringKeys(2);
            using var hash = new PtrHashInterop<string>(keys);
            hash.GetIndex((string)null);
        }

        [TestMethod]
        public void GetIndicesBatch_WithValidStringKeys_ReturnsCorrectIndices()
        {
            var keys = TestUtilities.GenerateTestStringKeys().Take(6).ToArray();
            using var hash = new PtrHashInterop<string>(keys);
            
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndex(keys[i]);
            }
            
            var batchResults = new nuint[keys.Length];
            hash.GetIndicesBatch(keys, batchResults);
            
            CollectionAssert.AreEqual(expectedIndices, batchResults);
        }

        [TestMethod]
        public void GetIndicesBatch_WithUtf8Keys_ReturnsCorrectIndices()
        {
            // Arrange
            var keys = new string[] { "hello", "world", "test", "müller", "🚀" };
            using var hash = new PtrHashInterop<string>(keys);

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
        [ExpectedException(typeof(ArgumentNullException))]
        public void GetIndicesBatch_WithNullKeys_ThrowsArgumentNullException()
        {
            // Arrange
            var keys = new string[] { "hello", "world" };
            using var hash = new PtrHashInterop<string>(keys);
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
            using var hash = new PtrHashInterop<string>(keys);
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
            using var hash = new PtrHashInterop<string>(keys);
            var lookupKeys = new string[] { "hello", null };
            var results = new nuint[2];

            // Act
            hash.GetIndicesBatch(lookupKeys, results);
        }

        [TestMethod]
        public void GetInfo_ReturnsValidInformation()
        {
            var keys = TestUtilities.GenerateTestStringKeys(4);
            using var hash = new PtrHashInterop<string>(keys);
            TestUtilities.AssertValidPtrHashInfo(hash.GetInfo(), keys.Length);
        }

        [TestMethod]
        public void Performance_StringOperations_Work()
        {
            var random = new Random(42);
            var keys = new string[30_000];
            for (int i = 0; i < keys.Length; i++)
            {
                keys[i] = TestUtilities.GenerateRandomString(random, random.Next(5, 15));
            }
            
            using var hash = new PtrHashInterop<string>(keys);
            var results = new nuint[keys.Length];
            hash.GetIndicesBatch(keys, results);
            
            TestUtilities.AssertValidPtrHashInfo(hash.GetInfo(), keys.Length);
        }

        [TestMethod]
        [ExpectedException(typeof(ObjectDisposedException))]
        public void GetIndex_AfterDispose_ThrowsObjectDisposedException()
        {
            var keys = TestUtilities.GenerateTestStringKeys(2);
            var hash = new PtrHashInterop<string>(keys);
            hash.Dispose();
            hash.GetIndex(keys[0]);
        }

        [TestMethod]
        public void Dispose_MultipleCallsSafe()
        {
            var keys = TestUtilities.GenerateTestStringKeys(2);
            var hash = new PtrHashInterop<string>(keys);
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
            using var hash = new PtrHashInterop<string>(keys);

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
                var utf8String = Encoding.UTF8.GetString(Encoding.UTF8.GetBytes(keys[i]));
                var utf8Index = hash.GetIndex(utf8String);
                Assert.AreEqual(stringIndex, utf8Index, $"String and UTF-8 indices should match for: {keys[i]}");
            }
        }

    }
}