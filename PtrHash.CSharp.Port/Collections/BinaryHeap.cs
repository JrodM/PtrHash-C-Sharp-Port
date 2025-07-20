using System;
using System.Collections.Generic;

namespace PtrHash.CSharp.Port.Collections
{
    /// <summary>
    /// Binary max-heap implementation for eviction queue
    /// Maintains (bucket_size, bucket_id) pairs with bucket_size as priority
    /// </summary>
    public sealed class BinaryHeap<T> where T : IComparable<T>
    {
        private readonly List<T> _items;
        
        public BinaryHeap()
        {
            _items = new List<T>();
        }
        
        public BinaryHeap(int capacity)
        {
            _items = new List<T>(capacity);
        }
        
        public int Count => _items.Count;
        
        public bool IsEmpty => _items.Count == 0;
        
        public void Push(T item)
        {
            _items.Add(item);
            BubbleUp(_items.Count - 1);
        }
        
        public T Pop()
        {
            if (_items.Count == 0)
                throw new InvalidOperationException("Heap is empty");
                
            var result = _items[0];
            var lastIndex = _items.Count - 1;
            
            if (lastIndex > 0)
            {
                _items[0] = _items[lastIndex];
                _items.RemoveAt(lastIndex);
                BubbleDown(0);
            }
            else
            {
                _items.Clear();
            }
            
            return result;
        }
        
        public T? PopOrDefault()
        {
            if (_items.Count == 0)
                return default(T);
            return Pop();
        }
        
        public T Peek()
        {
            if (_items.Count == 0)
                throw new InvalidOperationException("Heap is empty");
            return _items[0];
        }
        
        public void Clear()
        {
            _items.Clear();
        }
        
        private void BubbleUp(int index)
        {
            while (index > 0)
            {
                var parentIndex = (index - 1) / 2;
                if (_items[index].CompareTo(_items[parentIndex]) <= 0)
                    break;
                    
                (_items[index], _items[parentIndex]) = (_items[parentIndex], _items[index]);
                index = parentIndex;
            }
        }
        
        private void BubbleDown(int index)
        {
            while (true)
            {
                var leftChild = 2 * index + 1;
                var rightChild = 2 * index + 2;
                var largest = index;
                
                if (leftChild < _items.Count && _items[leftChild].CompareTo(_items[largest]) > 0)
                    largest = leftChild;
                    
                if (rightChild < _items.Count && _items[rightChild].CompareTo(_items[largest]) > 0)
                    largest = rightChild;
                    
                if (largest == index)
                    break;
                    
                (_items[index], _items[largest]) = (_items[largest], _items[index]);
                index = largest;
            }
        }
    }
}