using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.Storage;
using PtrHash.CSharp.Port.Collections;
using System;
using System.Linq;

namespace PtrHash.CSharp.Port.Tests
{
    [TestClass]
    public class RemappingStorageTests
    {
        [TestMethod]
        public void RemappingStorageFactory_WithSparseValues_UsesCachelineEf()
        {
            // Arrange - sparse sorted values ideal for CachelineEf
            var values = new ulong[] { 1000, 1100, 1200, 1300, 1400 };

            // Act
            var storage = RemappingStorageFactory.CreateOptimal(values);

            // Assert
            Assert.IsInstanceOfType(storage, typeof(CachelineEfVec));
            for (int i = 0; i < values.Length; i++)
            {
                Assert.AreEqual(values[i], storage.Index(i));
            }
        }

        [TestMethod]
        public void RemappingStorageFactory_WithSmallValues_UsesCompactVector()
        {
            // Arrange - small values that fit in ushort but too dense for CachelineEf
            var values = Enumerable.Range(0, 1000).Select(i => (ulong)i).ToArray();

            // Act
            var storage = RemappingStorageFactory.CreateOptimal(values);

            // Assert
            Assert.IsInstanceOfType(storage, typeof(CompactVectorRemappingStorage));
            for (int i = 0; i < Math.Min(10, values.Length); i++)
            {
                Assert.AreEqual(values[i], storage.Index(i));
            }
        }

        [TestMethod]
        public void RemappingStorageFactory_WithMediumValues_UsesStandardVector()
        {
            // Arrange - values that fit in uint but not ushort
            var values = new ulong[] { 70000, 80000, 90000, 100000 };

            // Act
            var storage = RemappingStorageFactory.CreateOptimal(values);

            // Assert
            Assert.IsInstanceOfType(storage, typeof(VectorRemappingStorage));
            for (int i = 0; i < values.Length; i++)
            {
                Assert.AreEqual(values[i], storage.Index(i));
            }
        }

        [TestMethod]
        public void CachelineEfVec_ImplementsRemappingInterface()
        {
            // Arrange
            var values = new ulong[] { 1000, 1200, 1400, 1600, 1800 };

            // Act
            var storage = CachelineEfVec.TryNew(values) as IMutableRemappingStorage;

            // Assert
            Assert.IsNotNull(storage);
            Assert.AreEqual("CacheLineEF", ((IMutableRemappingStorage)storage.GetType()).Name);
            
            for (int i = 0; i < values.Length; i++)
            {
                Assert.AreEqual(values[i], storage.Index(i));
            }
        }

        [TestMethod]
        public void RemappingStorage_PrefetchDoesNotThrow()
        {
            // Arrange
            var values = new ulong[] { 100, 200, 300 };
            var cachelineEf = CachelineEfVec.TryNew(values);
            var vectorStorage = VectorRemappingStorage.TryNew(values);

            // Act & Assert - should not throw
            cachelineEf?.Prefetch(0);
            vectorStorage?.Prefetch(0);
        }

        [TestMethod]
        public void RemappingStorage_SizeInBytes_ReturnsReasonableValues()
        {
            // Arrange
            var values = new ulong[] { 100, 200, 300, 400, 500 };
            
            var cachelineEf = CachelineEfVec.TryNew(values);
            var compactVector = CompactVectorRemappingStorage.TryNew(values);
            var standardVector = VectorRemappingStorage.TryNew(values);

            // Act & Assert
            Assert.IsTrue(cachelineEf!.SizeInBytes > 0);
            Assert.IsTrue(compactVector!.SizeInBytes > 0);
            Assert.IsTrue(standardVector!.SizeInBytes > 0);

            // CachelineEf should be more compact for this sparse data
            Assert.IsTrue(cachelineEf.SizeInBytes <= standardVector.SizeInBytes);
        }
    }
}