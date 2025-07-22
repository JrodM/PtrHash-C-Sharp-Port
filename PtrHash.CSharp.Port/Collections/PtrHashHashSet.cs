using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;

namespace PtrHash.CSharp.Port.Collections
{
    /// <summary>
    /// A hash set implementation using PtrHash as the underlying mapping structure.
    /// Provides O(1) lookups with perfect hashing for a fixed set of items.
    /// </summary>
    public class PtrHashHashSet<T, THasher> : ISet<T>, IDisposable
        where THasher : struct, IKeyHasher<T>
        where T : notnull
    {
        private readonly PtrHash<T, THasher> _ptrHash;
        private readonly T[] _itemsByIndex;
        private readonly T[] _originalItems;
        private readonly bool[] _occupied;
        private bool _disposed;

        /// <summary>
        /// Creates a new PtrHashHashSet from the given items
        /// </summary>
        /// <param name="items">Array of unique items</param>
        /// <param name="parameters">PtrHash construction parameters</param>
        public PtrHashHashSet(T[] items, PtrHashParams? parameters = null)
        {
            if (items == null) throw new ArgumentNullException(nameof(items));

            _originalItems = (T[])items.Clone();
            _ptrHash = new PtrHash<T, THasher>(items, parameters ?? PtrHashParams.DefaultFast);
            var info = _ptrHash.GetInfo();
            int maxIndex = (int)info.MaxIndex;

            _itemsByIndex = new T[maxIndex];
            _occupied = new bool[maxIndex];

            // Initialize all slots
            for (int i = 0; i < maxIndex; i++)
            {
                _itemsByIndex[i] = default(T)!;
                _occupied[i] = false;
            }

            // Map items to their hash indices
            for (int i = 0; i < items.Length; i++)
            {
                int idx = (int)_ptrHash.GetIndex(items[i]);
                _itemsByIndex[idx] = items[i];
                _occupied[idx] = true;
            }
        }

        #region ISet<T> Implementation

        public int Count => _originalItems.Length;

        public bool IsReadOnly => true;

        public bool Add(T item)
        {
            throw new NotSupportedException("PtrHashHashSet is read-only. Items cannot be added after construction.");
        }

        void ICollection<T>.Add(T item) => Add(item);

        public void Clear()
        {
            throw new NotSupportedException("PtrHashHashSet is read-only. Items cannot be removed after construction.");
        }

        public bool Contains(T item)
        {
            ThrowIfDisposed();
            
            int idx = (int)_ptrHash.GetIndex(item);
            
            // Verify the item matches and the slot is occupied
            return idx < _itemsByIndex.Length && 
                   _occupied[idx] && 
                   EqualityComparer<T>.Default.Equals(_itemsByIndex[idx], item);
        }

        public void CopyTo(T[] array, int arrayIndex)
        {
            if (array == null) throw new ArgumentNullException(nameof(array));
            if (arrayIndex < 0) throw new ArgumentOutOfRangeException(nameof(arrayIndex));
            if (array.Length - arrayIndex < Count) throw new ArgumentException("Destination array is too small.");

            Array.Copy(_originalItems, 0, array, arrayIndex, _originalItems.Length);
        }

        public void ExceptWith(IEnumerable<T> other)
        {
            throw new NotSupportedException("PtrHashHashSet is read-only. Items cannot be removed after construction.");
        }

        public IEnumerator<T> GetEnumerator()
        {
            return ((IEnumerable<T>)_originalItems).GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();

        public void IntersectWith(IEnumerable<T> other)
        {
            throw new NotSupportedException("PtrHashHashSet is read-only. Items cannot be modified after construction.");
        }

        public bool IsProperSubsetOf(IEnumerable<T> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            
            var otherSet = other as ISet<T> ?? new HashSet<T>(other);
            return Count < otherSet.Count && IsSubsetOf(otherSet);
        }

        public bool IsProperSupersetOf(IEnumerable<T> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            
            var otherSet = other as ISet<T> ?? new HashSet<T>(other);
            return Count > otherSet.Count && IsSupersetOf(otherSet);
        }

        public bool IsSubsetOf(IEnumerable<T> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            
            var otherSet = other as ISet<T> ?? new HashSet<T>(other);
            return _originalItems.All(item => otherSet.Contains(item));
        }

        public bool IsSupersetOf(IEnumerable<T> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            
            return other.All(item => Contains(item));
        }

        public bool Overlaps(IEnumerable<T> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            
            return other.Any(item => Contains(item));
        }

        public bool Remove(T item)
        {
            throw new NotSupportedException("PtrHashHashSet is read-only. Items cannot be removed after construction.");
        }

        public bool SetEquals(IEnumerable<T> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            
            var otherSet = other as ISet<T> ?? new HashSet<T>(other);
            return Count == otherSet.Count && _originalItems.All(item => otherSet.Contains(item));
        }

        public void SymmetricExceptWith(IEnumerable<T> other)
        {
            throw new NotSupportedException("PtrHashHashSet is read-only. Items cannot be modified after construction.");
        }

        public void UnionWith(IEnumerable<T> other)
        {
            throw new NotSupportedException("PtrHashHashSet is read-only. Items cannot be added after construction.");
        }

        #endregion

        /// <summary>
        /// Performs batch lookup using streaming for better performance on large datasets
        /// </summary>
        /// <param name="items">Items to check</param>
        /// <param name="results">Output array for results (must be same length as items)</param>
        public void ContainsStream(ReadOnlySpan<T> items, Span<bool> results)
        {
            ThrowIfDisposed();
            
            int n = items.Length;
            if (n == 0) return;
            if (n != results.Length)
                throw new ArgumentException("Item and result spans must have the same length");

            // Use stack allocation for small arrays, heap for large ones
            Span<nuint> indices = n <= 1024
                ? stackalloc nuint[n]
                : new nuint[n];

            // Get all indices using streaming
            _ptrHash.GetIndicesStream(items, indices, minimal: true);
            
            // Process indices and verify items match
            ProcessIndices(items, indices, results);
        }

        /// <summary>
        /// Gets information about the underlying PtrHash structure
        /// </summary>
        public PtrHashInfo GetInfo() => _ptrHash.GetInfo();

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private void ProcessIndices(
            ReadOnlySpan<T> items,
            ReadOnlySpan<nuint> indices,
            Span<bool> results)
        {
            var comparer = EqualityComparer<T>.Default;
            
            for (int i = 0; i < items.Length; i++)
            {
                int idx = (int)indices[i];
                var item = items[i];
                
                // Bounds check, occupancy check, and item verification
                results[i] = idx >= 0 && 
                           idx < _itemsByIndex.Length && 
                           _occupied[idx] && 
                           comparer.Equals(item, _itemsByIndex[idx]);
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private void ThrowIfDisposed()
        {
            if (_disposed)
                throw new ObjectDisposedException(nameof(PtrHashHashSet<T, THasher>));
        }

        public void Dispose()
        {
            if (!_disposed)
            {
                _ptrHash?.Dispose();
                _disposed = true;
            }
        }
    }

    /// <summary>
    /// Convenience class for UInt64 items using StrongerIntHasher
    /// </summary>
    public class PtrHashHashSetU64 : PtrHashHashSet<ulong, StrongerIntHasher>
    {
        public PtrHashHashSetU64(ulong[] items, PtrHashParams? parameters = null)
            : base(items, parameters)
        {
        }
    }

    /// <summary>
    /// Convenience class for string items using StringHasher
    /// </summary>
    public class PtrHashHashSetString : PtrHashHashSet<string, StringHasher>
    {
        public PtrHashHashSetString(string[] items, PtrHashParams? parameters = null)
            : base(items, parameters)
        {
        }
    }
}