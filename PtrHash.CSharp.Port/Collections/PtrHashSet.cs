using System;
using System.Buffers;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;

namespace PtrHash.CSharp.Port.Collections
{
    /// <summary>
    /// A high-performance read-only set implementation using PtrHash as the underlying structure.
    /// Provides O(1) lookups with perfect hashing for a fixed set of elements.
    /// </summary>
    public class PtrHashSet<TKey, THasher> : ISet<TKey>, IDisposable
        where THasher : struct, IKeyHasher<TKey>
        where TKey : notnull
    {
        private readonly PtrHash<TKey, THasher> _ptrHash;
        private readonly TKey[] _elementLookup;
        private readonly TKey[] _originalElements;
        private readonly IEqualityComparer<TKey> _comparer;
        private bool _disposed;

        /// <summary>
        /// Creates a new PtrHashSet from the given elements
        /// </summary>
        /// <param name="elements">Array of unique elements</param>
        /// <param name="parameters">PtrHash construction parameters</param>
        /// <param name="comparer">Custom equality comparer for elements (optional, uses default if null)</param>
        public PtrHashSet(
            TKey[] elements,
            PtrHashParams? parameters = null,
            IEqualityComparer<TKey>? comparer = null)
        {
            if (elements == null) throw new ArgumentNullException(nameof(elements));

            _originalElements = (TKey[])elements.Clone();
            _comparer = comparer ?? EqualityComparer<TKey>.Default;
            
            _ptrHash = new PtrHash<TKey, THasher>(elements, parameters ?? PtrHashParams.DefaultFast);
            var info = _ptrHash.GetInfo();
            int maxIndex = (int)info.MaxIndex;

            _elementLookup = new TKey[maxIndex];

            // Map elements to their hash indices
            for (int i = 0; i < elements.Length; i++)
            {
                int idx = (int)_ptrHash.GetIndex(elements[i]);
                _elementLookup[idx] = elements[i];
            }
        }

        #region ISet<TKey> Implementation

        public int Count => _originalElements.Length;

        public bool IsReadOnly => true;

        /// <summary>
        /// Determines whether the set contains the specified element
        /// </summary>
        /// <param name="item">The element to search for</param>
        /// <returns>True if the element is found, false otherwise</returns>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public bool Contains(TKey item)
        {
            var idx = (int)_ptrHash.GetIndex(item);
            
            // Single bounds check and cache-friendly access
            if ((uint)idx < (uint)_elementLookup.Length)
            {
                return _comparer.Equals(_elementLookup[idx], item);
            }
            
            return false;
        }

        /// <summary>
        /// Performs batch membership testing using streaming for better performance on large datasets
        /// </summary>
        /// <param name="items">Items to test for membership</param>
        /// <param name="results">Output array for results (must be same length as items)</param>
        public void ContainsStream(
            ReadOnlySpan<TKey> items,
            Span<bool> results)
        {
            if (items.Length != results.Length)
                throw new ArgumentException("Items and results spans must have the same length");
            
            const int MAX_STACK_SIZE = 4096; // 32KB on stack (8 bytes × 4096)
            
            if (items.Length <= MAX_STACK_SIZE)
            {
                // Small datasets: single allocation on stack
                Span<nuint> indices = stackalloc nuint[items.Length];
                _ptrHash.GetIndicesStream(items, indices, minimal: true);
                ProcessIndices(items, indices, results);
            }
            else
            {
                // Large datasets: rent from array pool to avoid stack overflow
                var indices = ArrayPool<nuint>.Shared.Rent(items.Length);
                try
                {
                    var indicesSpan = indices.AsSpan(0, items.Length);
                    _ptrHash.GetIndicesStream(items, indicesSpan, minimal: true);
                    ProcessIndices(items, indicesSpan, results);
                }
                finally
                {
                    ArrayPool<nuint>.Shared.Return(indices);
                }
            }
        }


        public void CopyTo(TKey[] array, int arrayIndex)
        {
            if (array == null) throw new ArgumentNullException(nameof(array));
            if (arrayIndex < 0) throw new ArgumentOutOfRangeException(nameof(arrayIndex));
            if (array.Length - arrayIndex < Count) throw new ArgumentException("Destination array is too small.");

            Array.Copy(_originalElements, 0, array, arrayIndex, _originalElements.Length);
        }

        public IEnumerator<TKey> GetEnumerator()
        {
            return ((IEnumerable<TKey>)_originalElements).GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();

        #endregion

        #region Set Operations (Read-Only)

        public bool IsProperSubsetOf(IEnumerable<TKey> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            var otherSet = other.ToHashSet(_comparer);
            return Count < otherSet.Count && IsSubsetOf(otherSet);
        }

        public bool IsProperSupersetOf(IEnumerable<TKey> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            var otherSet = other.ToHashSet(_comparer);
            return Count > otherSet.Count && IsSupersetOf(otherSet);
        }

        public bool IsSubsetOf(IEnumerable<TKey> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            var otherSet = other.ToHashSet(_comparer);
            return _originalElements.All(element => otherSet.Contains(element));
        }

        public bool IsSupersetOf(IEnumerable<TKey> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            return other.All(Contains);
        }

        public bool Overlaps(IEnumerable<TKey> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            return other.Any(Contains);
        }

        public bool SetEquals(IEnumerable<TKey> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            var otherSet = other.ToHashSet(_comparer);
            return Count == otherSet.Count && _originalElements.All(element => otherSet.Contains(element));
        }

        #endregion

        #region Unsupported Operations (Read-Only)

        public bool Add(TKey item)
        {
            throw new NotSupportedException("PtrHashSet is read-only. Items cannot be added after construction.");
        }

        void ICollection<TKey>.Add(TKey item)
        {
            throw new NotSupportedException("PtrHashSet is read-only. Items cannot be added after construction.");
        }

        public void Clear()
        {
            throw new NotSupportedException("PtrHashSet is read-only. Items cannot be removed after construction.");
        }

        public bool Remove(TKey item)
        {
            throw new NotSupportedException("PtrHashSet is read-only. Items cannot be removed after construction.");
        }

        public void ExceptWith(IEnumerable<TKey> other)
        {
            throw new NotSupportedException("PtrHashSet is read-only. Set operations that modify the set are not supported.");
        }

        public void IntersectWith(IEnumerable<TKey> other)
        {
            throw new NotSupportedException("PtrHashSet is read-only. Set operations that modify the set are not supported.");
        }

        public void SymmetricExceptWith(IEnumerable<TKey> other)
        {
            throw new NotSupportedException("PtrHashSet is read-only. Set operations that modify the set are not supported.");
        }

        public void UnionWith(IEnumerable<TKey> other)
        {
            throw new NotSupportedException("PtrHashSet is read-only. Set operations that modify the set are not supported.");
        }

        #endregion

        /// <summary>
        /// Gets information about the underlying PtrHash structure
        /// </summary>
        public PtrHashInfo GetInfo() => _ptrHash.GetInfo();

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private void ProcessIndices(
            ReadOnlySpan<TKey> items,
            ReadOnlySpan<nuint> indices,
            Span<bool> results)
        {
            for (int i = 0; i < items.Length; i++)
            {
                var idx = (int)indices[i];
                
                if ((uint)idx < (uint)_elementLookup.Length)
                {
                    results[i] = _comparer.Equals(items[i], _elementLookup[idx]);
                }
                else
                {
                    results[i] = false;
                }
            }
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
    /// Convenience class for UInt64 elements using StrongerIntHasher
    /// </summary>
    public class PtrHashSetU64 : PtrHashSet<ulong, StrongerIntHasher>
    {
        public PtrHashSetU64(ulong[] elements, PtrHashParams? parameters = null, IEqualityComparer<ulong>? comparer = null)
            : base(elements, parameters, comparer)
        {
        }
    }

    /// <summary>
    /// Convenience class for string elements using StringHasher
    /// </summary>
    public class PtrHashSetString : PtrHashSet<string, StringHasher>
    {
        public PtrHashSetString(string[] elements, PtrHashParams? parameters = null, IEqualityComparer<string>? comparer = null)
            : base(elements, parameters, comparer)
        {
        }
    }
}