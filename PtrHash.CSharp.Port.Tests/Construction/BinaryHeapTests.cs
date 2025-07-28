using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.Construction;

namespace PtrHash.CSharp.Port.Tests.Construction
{
    [TestClass]
    public class BinaryHeapTests
    {
        private class TestItem : IComparable<TestItem>
        {
            public int Priority { get; set; }
            public string Value { get; set; }

            public TestItem(int priority, string value)
            {
                Priority = priority;
                Value = value;
            }

            public int CompareTo(TestItem? other)
            {
                if (other == null) return 1;
                return Priority.CompareTo(other.Priority);
            }
        }

        [TestMethod]
        public void Constructor_CreatesEmptyHeap()
        {
            var heap = new BinaryHeap<int>();
            Assert.AreEqual(0, heap.Count);
            Assert.IsTrue(heap.IsEmpty);
        }

        [TestMethod]
        public void Constructor_WithCapacity_CreatesEmptyHeap()
        {
            var heap = new BinaryHeap<int>(100);
            Assert.AreEqual(0, heap.Count);
            Assert.IsTrue(heap.IsEmpty);
        }

        [TestMethod]
        public void Push_SingleItem_IncreasesCount()
        {
            var heap = new BinaryHeap<int>();
            heap.Push(5);
            
            Assert.AreEqual(1, heap.Count);
            Assert.IsFalse(heap.IsEmpty);
        }

        [TestMethod]
        public void Pop_SingleItem_ReturnsItem()
        {
            var heap = new BinaryHeap<int>();
            heap.Push(5);
            
            var item = heap.Pop();
            Assert.AreEqual(5, item);
            Assert.AreEqual(0, heap.Count);
            Assert.IsTrue(heap.IsEmpty);
        }

        [TestMethod]
        public void Pop_EmptyHeap_ThrowsException()
        {
            var heap = new BinaryHeap<int>();
            Assert.ThrowsException<InvalidOperationException>(() => heap.Pop());
        }

        [TestMethod]
        public void MaxHeap_ReturnsItemsInDescendingOrder()
        {
            var heap = new BinaryHeap<int>();
            var items = new[] { 3, 1, 4, 1, 5, 9, 2, 6, 5, 3 };
            
            foreach (var item in items)
            {
                heap.Push(item);
            }
            
            var result = new List<int>();
            while (!heap.IsEmpty)
            {
                result.Add(heap.Pop());
            }
            
            // Should be in descending order (max heap)
            var expected = items.OrderByDescending(x => x).ToList();
            CollectionAssert.AreEqual(expected, result);
        }

        [TestMethod]
        public void Peek_ReturnsMaxWithoutRemoving()
        {
            var heap = new BinaryHeap<int>();
            heap.Push(5);
            heap.Push(10);
            heap.Push(3);
            
            var max = heap.Peek();
            Assert.AreEqual(10, max);
            Assert.AreEqual(3, heap.Count); // Count should not change
            
            // Verify item is still there
            var popped = heap.Pop();
            Assert.AreEqual(10, popped);
        }

        [TestMethod]
        public void Peek_EmptyHeap_ThrowsException()
        {
            var heap = new BinaryHeap<int>();
            Assert.ThrowsException<InvalidOperationException>(() => heap.Peek());
        }

        [TestMethod]
        public void Clear_RemovesAllItems()
        {
            var heap = new BinaryHeap<int>();
            for (int i = 0; i < 10; i++)
            {
                heap.Push(i);
            }
            
            heap.Clear();
            Assert.AreEqual(0, heap.Count);
            Assert.IsTrue(heap.IsEmpty);
        }

        [TestMethod]
        public void ComplexType_WorksCorrectly()
        {
            var heap = new BinaryHeap<TestItem>();
            
            heap.Push(new TestItem(3, "three"));
            heap.Push(new TestItem(1, "one"));
            heap.Push(new TestItem(4, "four"));
            heap.Push(new TestItem(1, "another one"));
            heap.Push(new TestItem(5, "five"));
            
            var result = new List<int>();
            while (!heap.IsEmpty)
            {
                result.Add(heap.Pop().Priority);
            }
            
            // Should be in descending order
            CollectionAssert.AreEqual(new[] { 5, 4, 3, 1, 1 }, result);
        }

        [TestMethod]
        public void DuplicateValues_HandledCorrectly()
        {
            var heap = new BinaryHeap<int>();
            
            heap.Push(5);
            heap.Push(5);
            heap.Push(5);
            heap.Push(3);
            heap.Push(7);
            
            Assert.AreEqual(5, heap.Count);
            
            var result = new List<int>();
            while (!heap.IsEmpty)
            {
                result.Add(heap.Pop());
            }
            
            CollectionAssert.AreEqual(new[] { 7, 5, 5, 5, 3 }, result);
        }

        [TestMethod]
        public void LargeHeap_MaintainsHeapProperty()
        {
            var heap = new BinaryHeap<int>();
            var random = new Random(42);
            var items = new List<int>();
            
            // Add 1000 random items
            for (int i = 0; i < 1000; i++)
            {
                var item = random.Next(0, 100);
                items.Add(item);
                heap.Push(item);
            }
            
            Assert.AreEqual(1000, heap.Count);
            
            // Pop all items and verify they come out in descending order
            var previous = int.MaxValue;
            while (!heap.IsEmpty)
            {
                var current = heap.Pop();
                Assert.IsTrue(current <= previous, "Heap property violated");
                previous = current;
            }
        }

        [TestMethod]
        public void PushPop_Interleaved_WorksCorrectly()
        {
            var heap = new BinaryHeap<int>();
            
            heap.Push(5);
            heap.Push(10);
            Assert.AreEqual(10, heap.Pop());
            
            heap.Push(15);
            heap.Push(3);
            Assert.AreEqual(15, heap.Pop());
            Assert.AreEqual(5, heap.Pop());
            
            heap.Push(7);
            Assert.AreEqual(7, heap.Pop());
            Assert.AreEqual(3, heap.Pop());
            
            Assert.IsTrue(heap.IsEmpty);
        }

        [TestMethod]
        public void NegativeNumbers_HandledCorrectly()
        {
            var heap = new BinaryHeap<int>();
            
            heap.Push(-5);
            heap.Push(10);
            heap.Push(-15);
            heap.Push(0);
            heap.Push(-3);
            
            var result = new List<int>();
            while (!heap.IsEmpty)
            {
                result.Add(heap.Pop());
            }
            
            CollectionAssert.AreEqual(new[] { 10, 0, -3, -5, -15 }, result);
        }
    }
}