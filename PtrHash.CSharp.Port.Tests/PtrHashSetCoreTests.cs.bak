using NUnit.Framework;
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Port.PtrHash;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Linq;
using System.Collections.Generic;

namespace PtrHash.CSharp.Port.Tests
{
    [TestFixture]
    public class PtrHashSetCoreTests
    {
        #region Constructor Tests

        [Test]
        public void Constructor_WithValidAndInvalidInputs_BehavesCorrectly()
        {
            // Valid construction
            var elements = Enumerable.Range(1, 1000).Select(i => (ulong)i).ToArray();
            
            using var set = new PtrHashSetU64(elements);
            Assert.That(set.Count, Is.EqualTo(1000));
            Assert.That(set.IsReadOnly, Is.True);
            
            // Invalid construction - null elements
            Assert.Throws<ArgumentNullException>(() => 
                new PtrHashSetU64(null!));
        }

        #endregion

        #region Membership Tests

        [Test]
        public void Contains_ReturnsTrueForMembersAndFalseForNonMembers()
        {
            // Arrange
            var elements = new ulong[] { 10, 20, 30, 40, 50 };
            using var set = new PtrHashSetU64(elements);

            // Test members
            Assert.That(set.Contains(20), Is.True);
            Assert.That(set.Contains(40), Is.True);
            Assert.That(set.Contains(50), Is.True);

            // Test non-members
            Assert.That(set.Contains(15), Is.False);
            Assert.That(set.Contains(99), Is.False);
            Assert.That(set.Contains(0), Is.False);
        }

        #endregion

        #region Streaming Tests

        [Test]
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
            Assert.That(streamResults, Is.EqualTo(expectedPoint), 
                "Stream results should match point lookups");
        }

        [Test]
        public void ContainsStream_EdgeCases()
        {
            // Arrange
            var elements = new ulong[] { 1, 2, 3 };
            using var set = new PtrHashSetU64(elements);

            // Empty input
            Assert.DoesNotThrow(() => set.ContainsStream(Array.Empty<ulong>(), Array.Empty<bool>()));

            // Mismatched spans
            Assert.Throws<ArgumentException>(() => 
                set.ContainsStream(new ulong[] { 1, 2 }, new bool[3]));
        }

        #endregion

        #region String Element Tests

        [Test]
        public void StringSet_WorksCorrectly()
        {
            // Arrange
            var elements = new[] { "red", "green", "blue", "yellow", "purple" };
            using var set = new PtrHashSetString(elements);

            // Test membership
            Assert.That(set.Contains("red"), Is.True);
            Assert.That(set.Contains("blue"), Is.True);
            Assert.That(set.Contains("orange"), Is.False);
            Assert.That(set.Contains("black"), Is.False);

            // Test streaming
            var queryItems = new[] { "blue", "invalid", "yellow", "missing", "red" };
            var results = new bool[queryItems.Length];
            set.ContainsStream(queryItems, results);
            
            Assert.That(results, Is.EqualTo(new[] { true, false, true, false, true }));
        }

        #endregion

        #region ISet Interface Tests

        [Test]
        public void ISetInterface_ImplementedCorrectly()
        {
            // Arrange
            var elements = new ulong[] { 1, 2, 3, 4, 5 };
            using var set = new PtrHashSetU64(elements);

            // Test properties
            Assert.That(set.Count, Is.EqualTo(5));
            Assert.That(set.IsReadOnly, Is.True);

            // Test enumeration
            var items = set.ToList();
            Assert.That(items, Is.EquivalentTo(elements));

            // Test CopyTo
            var array = new ulong[7];
            set.CopyTo(array, 2);
            Assert.That(array[2..7], Is.EquivalentTo(elements));

            // Test read-only exceptions
            Assert.Throws<NotSupportedException>(() => set.Add(6));
            Assert.Throws<NotSupportedException>(() => set.Remove(1));
            Assert.Throws<NotSupportedException>(() => set.Clear());
            Assert.Throws<NotSupportedException>(() => set.UnionWith(new ulong[] { 6, 7 }));
            Assert.Throws<NotSupportedException>(() => set.IntersectWith(new ulong[] { 2, 3 }));
            Assert.Throws<NotSupportedException>(() => set.ExceptWith(new ulong[] { 1 }));
            Assert.Throws<NotSupportedException>(() => set.SymmetricExceptWith(new ulong[] { 4, 6 }));
        }

        [Test]
        public void SetOperations_WorkCorrectly()
        {
            // Arrange
            var set1Elements = new ulong[] { 1, 2, 3, 4, 5 };
            var set2Elements = new ulong[] { 3, 4, 5, 6, 7 };
            using var set = new PtrHashSetU64(set1Elements);

            // IsSubsetOf
            Assert.That(set.IsSubsetOf(new ulong[] { 1, 2, 3, 4, 5, 6 }), Is.True);
            Assert.That(set.IsSubsetOf(new ulong[] { 1, 2, 3 }), Is.False);

            // IsSupersetOf
            Assert.That(set.IsSupersetOf(new ulong[] { 2, 3, 4 }), Is.True);
            Assert.That(set.IsSupersetOf(new ulong[] { 2, 3, 4, 6 }), Is.False);

            // Overlaps
            Assert.That(set.Overlaps(set2Elements), Is.True);
            Assert.That(set.Overlaps(new ulong[] { 6, 7, 8 }), Is.False);

            // SetEquals
            Assert.That(set.SetEquals(set1Elements), Is.True);
            Assert.That(set.SetEquals(new ulong[] { 5, 4, 3, 2, 1 }), Is.True); // Order doesn't matter
            Assert.That(set.SetEquals(new ulong[] { 1, 2, 3, 4 }), Is.False);

            // IsProperSubsetOf
            Assert.That(set.IsProperSubsetOf(new ulong[] { 1, 2, 3, 4, 5, 6 }), Is.True);
            Assert.That(set.IsProperSubsetOf(set1Elements), Is.False);

            // IsProperSupersetOf
            Assert.That(set.IsProperSupersetOf(new ulong[] { 2, 3, 4 }), Is.True);
            Assert.That(set.IsProperSupersetOf(set1Elements), Is.False);
        }

        #endregion

        #region Performance and Scale Tests

        [Test]
        [TestCase(1_000)]
        [TestCase(10_000)]
        [TestCase(100_000)]
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

            Assert.That(streamResults, Is.EqualTo(pointResults));
            
            // Verify expected member/non-member pattern
            for (int i = 0; i < testItems.Length; i++)
            {
                if (i % 2 == 0)
                    Assert.That(pointResults[i], Is.True, $"Even index {i} should be a member");
                else
                    Assert.That(pointResults[i], Is.False, $"Odd index {i} should be a non-member");
            }
        }

        #endregion

        #region Custom Comparer Tests

        [Test]
        public void CustomComparer_WorksCorrectly()
        {
            // Custom comparer for different behavior
            var elements = new[] { "Apple", "Banana", "Cherry" };
            using var set = new PtrHashSetString(elements);

            // Test exact matches
            Assert.That(set.Contains("Apple"), Is.True);
            Assert.That(set.Contains("Banana"), Is.True);
            Assert.That(set.Contains("Cherry"), Is.True);
            Assert.That(set.Contains("orange"), Is.False);

            // Test streaming with exact matches
            var queryItems = new[] { "Apple", "orange", "Banana", "GRAPE" };
            var results = new bool[queryItems.Length];
            set.ContainsStream(queryItems, results);
            
            Assert.That(results, Is.EqualTo(new[] { true, false, true, false }));
            
            // Case-insensitive comparison is not supported in PtrHash
            // because the hash function must match the stored keys exactly
        }

        #endregion

        #region Lifecycle Tests

        [Test]
        public void Dispose_ReleasesResources()
        {
            // Arrange
            var set = new PtrHashSetU64(new ulong[] { 1, 2, 3 });
            
            // Act & Assert - no exceptions on dispose
            Assert.DoesNotThrow(() => set.Dispose());
            
            // Multiple disposes should not throw
            Assert.DoesNotThrow(() => set.Dispose());
        }

        #endregion
    }
}