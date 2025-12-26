using Microsoft.VisualStudio.TestTools.UnitTesting;
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
            var success = CachelineEf.TryNew(values, out var cacheline);

            // Assert
            Assert.IsTrue(success, "CachelineEf creation should succeed");
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
            var success = CachelineEf.TryNew(values, out var cacheline);

            // Assert
            Assert.IsTrue(success, "CachelineEf creation should succeed");
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
            var success = CachelineEf.TryNew(values, out var result);

            // Assert
            Assert.IsFalse(success, "Should return false for values spanning too large a range");
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
            var success = CachelineEfVec.TryNew(values, out var vec);
            Assert.IsTrue(success, "CachelineEfVec creation should succeed");

            // Assert - using IRemappingStorage interface
            for (int i = 0; i < 100; i++)
            {
                Assert.AreEqual(values[i], (ulong)CachelineEfVec.Index(vec, (nuint)i), $"Value at index {i} should match");
            }
        }

        [TestMethod]
        public void CachelineEfVec_IRemappingStorage_WorksCorrectly()
        {
            // Arrange
            var values = new ulong[] { 100, 200, 300, 400, 500 };
            var success = CachelineEfVec.TryNew(values, out var vec);
            Assert.IsTrue(success, "CachelineEfVec creation should succeed");

            // Act & Assert - test IRemappingStorage interface
            Assert.AreEqual("CacheLineEF", CachelineEfVec.Name);
            Assert.IsTrue(CachelineEfVec.GetSizeInBytes(vec) > 0);
            
            // Test indexing
            for (int i = 0; i < values.Length; i++)
            {
                Assert.AreEqual(values[i], (ulong)CachelineEfVec.Index(vec, (nuint)i), $"Value at index {i} should match");
            }
        }

        [TestMethod]
        public void CachelineEfVec_Dispose_WorksCorrectly()
        {
            // Arrange
            var values = new ulong[] { 100, 200, 300 };
            var success = CachelineEfVec.TryNew(values, out var vec);
            Assert.IsTrue(success, "CachelineEfVec creation should succeed");

            // Act & Assert - should not throw
            vec.Dispose();
        }
    }
}