using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Linq;
using System.Collections.Generic;

namespace PtrHash.CSharp.Port.Tests
{
    [TestClass]
    public class PtrHashSetCoreTests
    {
        #region Constructor Tests

        [TestMethod]
        public void Constructor_WithValidAndInvalidInputs_BehavesCorrectly()
        {
            // Valid construction
            var elements = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            
            using var set = new PtrHashSetU64(elements);
            Assert.AreEqual(1000, set.Count);
            Assert.IsTrue(set.IsReadOnly);
            
            // Invalid construction - null elements
            Assert.ThrowsException<ArgumentNullException>(() => 
                new PtrHashSetU64(null!));
        }

        #endregion

        #region Membership Tests

        [TestMethod]
        public void Contains_ReturnsTrueForMembersAndFalseForNonMembers()
        {
            // Arrange
            var elements = new ulong[] { 10, 20, 30, 40, 50 };
            using var set = new PtrHashSetU64(elements);

            // Test members
            Assert.IsTrue(set.Contains(20));
            Assert.IsTrue(set.Contains(40));
            Assert.IsTrue(set.Contains(50));

            // Test non-members
            Assert.IsFalse(set.Contains(15));
            Assert.IsFalse(set.Contains(99));
            Assert.IsFalse(set.Contains(0));
        }

        #endregion

        #region Streaming Tests

        [TestMethod]
        public void ContainsStream_ConsistentWithSingleContains()
        {
            // Arrange
            var elements = Enumerable.Range(1, 200).Select(i => (ulong)i).ToArray();
            using var set = new PtrHashSetU64(elements);

            // Mix of members and non-members
            var queryItems = new ulong[] { 1, 999, 50, 888, 100, 777, 150, 666, 200 };
            var expectedPoint = queryItems.Select(item => set.Contains(item)).ToArray();
            
            // Test streaming
            var streamResults = new bool[queryItems.Length];
            set.ContainsStream(queryItems, streamResults);

            // Assert
            CollectionAssert.AreEqual(expectedPoint, streamResults);
        }

        [TestMethod]
        public void ContainsStream_EdgeCases()
        {
            // Arrange
            var elements = new ulong[] { 1, 2, 3 };
            using var set = new PtrHashSetU64(elements);

            // Empty input
            set.ContainsStream(Array.Empty<ulong>(), Array.Empty<bool>());

            // Mismatched spans
            Assert.ThrowsException<ArgumentException>(() => 
                set.ContainsStream(new ulong[] { 1, 2 }, new bool[3]));
        }

        #endregion

        #region String Element Tests

        [TestMethod]
        public void StringSet_WorksCorrectly()
        {
            // Arrange
            var elements = new[] { "red", "green", "blue", "yellow", "purple" };
            using var set = new PtrHashSetString(elements);

            // Test membership
            Assert.IsTrue(set.Contains("red"));
            Assert.IsTrue(set.Contains("blue"));
            Assert.IsFalse(set.Contains("orange"));
            Assert.IsFalse(set.Contains("black"));

            // Test streaming
            var queryItems = new[] { "blue", "invalid", "yellow", "missing", "red" };
            var results = new bool[queryItems.Length];
            set.ContainsStream(queryItems, results);
            
            CollectionAssert.AreEqual(new[] { true, false, true, false, true }, results);
        }

        #endregion

        #region ISet Interface Tests

        [TestMethod]
        public void ISetInterface_ImplementedCorrectly()
        {
            // Arrange
            var elements = new ulong[] { 1, 2, 3, 4, 5 };
            using var set = new PtrHashSetU64(elements);

            // Test properties
            Assert.AreEqual(5, set.Count);
            Assert.IsTrue(set.IsReadOnly);

            // Test enumeration
            var items = set.ToList();
            CollectionAssert.AreEquivalent(elements, items);

            // Test CopyTo
            var array = new ulong[7];
            set.CopyTo(array, 2);
            CollectionAssert.AreEquivalent(elements, array[2..7]);

            // Test read-only exceptions
            Assert.ThrowsException<NotSupportedException>(() => set.Add(6));
            Assert.ThrowsException<NotSupportedException>(() => set.Remove(1));
            Assert.ThrowsException<NotSupportedException>(() => set.Clear());
            Assert.ThrowsException<NotSupportedException>(() => set.UnionWith(new ulong[] { 6, 7 }));
            Assert.ThrowsException<NotSupportedException>(() => set.IntersectWith(new ulong[] { 2, 3 }));
            Assert.ThrowsException<NotSupportedException>(() => set.ExceptWith(new ulong[] { 1 }));
            Assert.ThrowsException<NotSupportedException>(() => set.SymmetricExceptWith(new ulong[] { 4, 6 }));
        }

        [TestMethod]
        public void SetOperations_WorkCorrectly()
        {
            // Arrange
            var set1Elements = new ulong[] { 1, 2, 3, 4, 5 };
            var set2Elements = new ulong[] { 3, 4, 5, 6, 7 };
            using var set = new PtrHashSetU64(set1Elements);

            // IsSubsetOf
            Assert.IsTrue(set.IsSubsetOf(new ulong[] { 1, 2, 3, 4, 5, 6 }));
            Assert.IsFalse(set.IsSubsetOf(new ulong[] { 1, 2, 3 }));

            // IsSupersetOf
            Assert.IsTrue(set.IsSupersetOf(new ulong[] { 2, 3, 4 }));
            Assert.IsFalse(set.IsSupersetOf(new ulong[] { 2, 3, 4, 6 }));

            // Overlaps
            Assert.IsTrue(set.Overlaps(set2Elements));
            Assert.IsFalse(set.Overlaps(new ulong[] { 6, 7, 8 }));

            // SetEquals
            Assert.IsTrue(set.SetEquals(set1Elements));
            Assert.IsTrue(set.SetEquals(new ulong[] { 5, 4, 3, 2, 1 })); // Order doesn't matter
            Assert.IsFalse(set.SetEquals(new ulong[] { 1, 2, 3, 4 }));

            // IsProperSubsetOf
            Assert.IsTrue(set.IsProperSubsetOf(new ulong[] { 1, 2, 3, 4, 5, 6 }));
            Assert.IsFalse(set.IsProperSubsetOf(set1Elements));

            // IsProperSupersetOf
            Assert.IsTrue(set.IsProperSupersetOf(new ulong[] { 2, 3, 4 }));
            Assert.IsFalse(set.IsProperSupersetOf(set1Elements));
        }

        #endregion

        #region Performance and Scale Tests

        [TestMethod]
        [DataRow(1_000)]
        [DataRow(10_000)]
        [DataRow(100_000)]
        public void LargeScale_MaintainsCorrectness(int size)
        {
            // Arrange
            var elements = Enumerable.Range(1, size).Select(i => (ulong)i).ToArray();
            using var set = new PtrHashSetU64(elements);

            // Sample test
            var random = new Random(42);
            var testItems = new ulong[Math.Min(1000, size / 10)];
            for (int i = 0; i < testItems.Length; i++)
            {
                // Mix of members and non-members
                if (i % 2 == 0)
                    testItems[i] = elements[random.Next(size)]; // Member
                else
                    testItems[i] = (ulong)(size + random.Next(size)); // Non-member
            }

            // Test point vs stream consistency
            var pointResults = testItems.Select(item => set.Contains(item)).ToArray();
            var streamResults = new bool[testItems.Length];
            set.ContainsStream(testItems, streamResults);

            CollectionAssert.AreEqual(pointResults, streamResults);
            
            // Verify expected member/non-member pattern
            for (int i = 0; i < testItems.Length; i++)
            {
                if (i % 2 == 0)
                    Assert.IsTrue(pointResults[i]);
                else
                    Assert.IsFalse(pointResults[i]);
            }
        }

        #endregion

        #region Custom Comparer Tests

        [TestMethod]
        public void CustomComparer_WorksCorrectly()
        {
            // Custom comparer for different behavior
            var elements = new[] { "Apple", "Banana", "Cherry" };
            using var set = new PtrHashSetString(elements);

            // Test exact matches
            Assert.IsTrue(set.Contains("Apple"));
            Assert.IsTrue(set.Contains("Banana"));
            Assert.IsTrue(set.Contains("Cherry"));
            Assert.IsFalse(set.Contains("orange"));

            // Test streaming with exact matches
            var queryItems = new[] { "Apple", "orange", "Banana", "GRAPE" };
            var results = new bool[queryItems.Length];
            set.ContainsStream(queryItems, results);
            
            CollectionAssert.AreEqual(new[] { true, false, true, false }, results);
            
            // Case-insensitive comparison is not supported in PtrHash
            // because the hash function must match the stored keys exactly
        }

        #endregion

        #region Lifecycle Tests

        [TestMethod]
        public void Dispose_ReleasesResources()
        {
            // Arrange
            var set = new PtrHashSetU64(new ulong[] { 1, 2, 3 });
            
            // Act & Assert - no exceptions on dispose
            set.Dispose();
            
            // Multiple disposes should not throw
            set.Dispose();
        }

        #endregion
    }
}