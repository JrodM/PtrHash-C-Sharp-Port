using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Port.Storage;
using System;
using System.Linq;

namespace PtrHash.CSharp.Port.Tests
{
    [TestClass]
    public class CachelineEfTests
    {
        [TestMethod]
        public void CachelineEf_WithValidValues_CreatesCorrectly()
        {
            // Arrange
            var values = new ulong[] { 100, 200, 300, 400, 500 };

            // Act
            var cacheline = CachelineEf.TryNew(values);

            // Assert
            for (int i = 0; i < values.Length; i++)
            {
                Assert.AreEqual(values[i], cacheline.Index(i), $"Value at index {i} should match");
            }
        }

        [TestMethod]
        public void CachelineEf_WithMaxValues_HandlesCorrectly()
        {
            // Arrange - 44 values (max for a cacheline)
            var values = new ulong[CachelineEf.L];
            var baseValue = 1000UL;
            for (int i = 0; i < CachelineEf.L; i++)
            {
                values[i] = baseValue + (ulong)i * 100;
            }

            // Act
            var cacheline = CachelineEf.TryNew(values);

            // Assert
            for (int i = 0; i < values.Length; i++)
            {
                Assert.AreEqual(values[i], cacheline.Index(i), $"Value at index {i} should match");
            }
        }

        [TestMethod]
        public void CachelineEf_WithTooSparseValues_ReturnsNull()
        {
            // Arrange - values spanning too large a range
            var values = new ulong[] { 100, 100000000 }; // Very large gap

            // Act
            var result = CachelineEf.TryNew(values);

            // Assert
            Assert.IsNull(result, "Should return null for values spanning too large a range");
        }

        [TestMethod]
        public void CachelineEfVec_WithMultipleCachelines_WorksCorrectly()
        {
            // Arrange - more than 44 values to test multiple cachelines
            var values = new ulong[100];
            for (int i = 0; i < 100; i++)
            {
                values[i] = (ulong)i * 10 + 1000;
            }

            // Act
            var vec = CachelineEfVec.TryNew(values);

            // Assert
            Assert.AreEqual(100, vec.Count);
            for (int i = 0; i < 100; i++)
            {
                Assert.AreEqual(values[i], vec[i], $"Value at index {i} should match");
            }
        }

        [TestMethod]
        public void CachelineEfVec_ImplementsIListCorrectly()
        {
            // Arrange
            var values = new ulong[] { 100, 200, 300, 400, 500 };
            var vec = CachelineEfVec.TryNew(values);

            // Act & Assert
            Assert.IsTrue(vec.IsReadOnly);
            Assert.AreEqual(5, vec.Count);
            Assert.IsTrue(vec.Contains(300UL));
            Assert.IsFalse(vec.Contains(999UL));
            Assert.AreEqual(2, vec.IndexOf(300UL));
            Assert.AreEqual(-1, vec.IndexOf(999UL));

            // Test enumeration
            var enumerated = vec.ToArray();
            CollectionAssert.AreEqual(values, enumerated);
        }

        [TestMethod]
        public void CachelineEfVec_Prefetch_DoesNotThrow()
        {
            // Arrange
            var values = new ulong[] { 100, 200, 300, 400, 500 };
            var vec = CachelineEfVec.TryNew(values);

            // Act & Assert - should not throw
            vec.Prefetch(0);
            vec.Prefetch(2);
            vec.Prefetch(4);
        }

        [TestMethod]
        [ExpectedException(typeof(NotSupportedException))]
        public void CachelineEfVec_Add_ThrowsNotSupported()
        {
            var vec = CachelineEfVec.TryNew(new ulong[] { 100, 200 });
            vec.Add(300);
        }

        [TestMethod]
        [ExpectedException(typeof(NotSupportedException))]
        public void CachelineEfVec_Remove_ThrowsNotSupported()
        {
            var vec = CachelineEfVec.TryNew(new ulong[] { 100, 200 });
            vec.Remove(100);
        }
    }
}