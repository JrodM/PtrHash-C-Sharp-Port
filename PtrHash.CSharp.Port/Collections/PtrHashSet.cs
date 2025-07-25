using System;
using System.Buffers;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.BucketFunctions;
using PtrHash.CSharp.Port.Storage;

namespace PtrHash.CSharp.Port.Collections
{
    /// <summary>
    /// A high-performance set implementation using PtrHash as the underlying mapping structure.
    /// Provides O(1) lookups with perfect hashing for a fixed set of elements.
    /// Consolidates the functionality of both PtrHashSet and PtrHashHashSet.
    /// </summary>
    public class PtrHashSet<TKey, THasher, TBucketFunction, TRemappingStorage> : ISet<TKey>, IDisposable
        where THasher : struct, IKeyHasher<TKey>
        where TBucketFunction : struct, IBucketFunction
        where TRemappingStorage : struct, IRemappingStorage<TRemappingStorage>
        where TKey : notnull
    {
        private readonly PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage> _ptrHash;
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
            if (elements.Length == 0) throw new ArgumentException("Elements cannot be empty", nameof(elements));

            _comparer = comparer ?? EqualityComparer<TKey>.Default;
            _originalElements = new TKey[elements.Length];
            Array.Copy(elements, _originalElements, elements.Length);

            // Validate uniqueness
            var uniqueElements = new HashSet<TKey>(_comparer);
            foreach (var element in elements)
            {
                if (!uniqueElements.Add(element))
                    throw new ArgumentException($"Duplicate element found: {element}", nameof(elements));
            }

            // Build PtrHash with the unique elements
            _ptrHash = new PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage>(elements, parameters ?? PtrHashParams.DefaultFast);

            // Create lookup array indexed by hash result
            _elementLookup = new TKey[_ptrHash.GetInfo().MaxIndex];

            // Populate lookup array using streaming for better performance
            var indices = ArrayPool<nuint>.Shared.Rent(elements.Length);
            try
            {
                var indicesSpan = indices.AsSpan(0, elements.Length);
                _ptrHash.GetIndicesStream(elements, indicesSpan, minimal: true);

                for (int i = 0; i < elements.Length; i++)
                {
                    _elementLookup[indicesSpan[i]] = elements[i];
                }
            }
            finally
            {
                ArrayPool<nuint>.Shared.Return(indices);
            }
        }

        /// <summary>
        /// Creates a new PtrHashSet from the given collection
        /// </summary>
        public PtrHashSet(IEnumerable<TKey> collection, PtrHashParams? parameters = null, IEqualityComparer<TKey>? comparer = null)
            : this(collection.ToArray(), parameters, comparer)
        {
        }

        public int Count => _originalElements.Length;
        public bool IsReadOnly => true;

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public bool Contains(TKey item)
        {
            if (item == null) return false;

            var index = _ptrHash.GetIndex(item);
            return index < (nuint)_elementLookup.Length &&
                   _comparer.Equals(_elementLookup[index], item);
        }

        /// <summary>
        /// Efficiently checks membership for multiple keys using streaming operations.
        /// Uses stack allocation for small datasets and ArrayPool for larger ones.
        /// </summary>
        public void ContainsStream(ReadOnlySpan<TKey> keys, Span<bool> results)
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            const int MAX_STACK_SIZE = 4096; // 32KB on stack
            if (keys.Length <= MAX_STACK_SIZE)
            {
                Span<nuint> indices = stackalloc nuint[keys.Length];
                _ptrHash.GetIndicesStreamPrefetch(keys, indices, minimal: true);
                ProcessIndicesForContains(keys, indices, results);
            }
            else
            {
                var indices = ArrayPool<nuint>.Shared.Rent(keys.Length);
                try
                {
                    var indicesSpan = indices.AsSpan(0, keys.Length);
                    _ptrHash.GetIndicesStreamPrefetch(keys, indicesSpan, minimal: true);
                    ProcessIndicesForContains(keys, indicesSpan, results);
                }
                finally
                {
                    ArrayPool<nuint>.Shared.Return(indices);
                }
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private void ProcessIndicesForContains(ReadOnlySpan<TKey> keys, ReadOnlySpan<nuint> indices, Span<bool> results)
        {
            for (int i = 0; i < keys.Length; i++)
            {
                var index = indices[i];
                results[i] = index < (nuint)_elementLookup.Length &&
                           _comparer.Equals(_elementLookup[index], keys[i]);
            }
        }

        public void CopyTo(TKey[] array, int arrayIndex)
        {
            if (array == null) throw new ArgumentNullException(nameof(array));
            if (arrayIndex < 0) throw new ArgumentOutOfRangeException(nameof(arrayIndex));
            if (array.Length - arrayIndex < Count) throw new ArgumentException("Destination array is too small");

            Array.Copy(_originalElements, 0, array, arrayIndex, Count);
        }

        public IEnumerator<TKey> GetEnumerator()
        {
            for (int i = 0; i < _originalElements.Length; i++)
            {
                yield return _originalElements[i];
            }
        }

        IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();

        // ISet<TKey> mutation methods - all throw NotSupportedException since this is a read-only set
        public bool Add(TKey item) => throw new NotSupportedException("PtrHashSet is read-only");
        void ICollection<TKey>.Add(TKey item) => throw new NotSupportedException("PtrHashSet is read-only");
        public bool Remove(TKey item) => throw new NotSupportedException("PtrHashSet is read-only");
        public void Clear() => throw new NotSupportedException("PtrHashSet is read-only");
        public void ExceptWith(IEnumerable<TKey> other) => throw new NotSupportedException("PtrHashSet is read-only");
        public void IntersectWith(IEnumerable<TKey> other) => throw new NotSupportedException("PtrHashSet is read-only");
        public void SymmetricExceptWith(IEnumerable<TKey> other) => throw new NotSupportedException("PtrHashSet is read-only");
        public void UnionWith(IEnumerable<TKey> other) => throw new NotSupportedException("PtrHashSet is read-only");

        // Set operation methods that return new results
        public bool IsProperSubsetOf(IEnumerable<TKey> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            var otherSet = other as ISet<TKey> ?? new HashSet<TKey>(other, _comparer);
            return Count < otherSet.Count && IsSubsetOf(otherSet);
        }

        public bool IsProperSupersetOf(IEnumerable<TKey> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            var otherSet = other as ISet<TKey> ?? new HashSet<TKey>(other, _comparer);
            return Count > otherSet.Count && IsSupersetOf(otherSet);
        }

        public bool IsSubsetOf(IEnumerable<TKey> other)
        {
            if (other == null) throw new ArgumentNullException(nameof(other));
            var otherSet = other as ISet<TKey> ?? new HashSet<TKey>(other, _comparer);
            return _originalElements.All(otherSet.Contains);
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
            var otherSet = other as ISet<TKey> ?? new HashSet<TKey>(other, _comparer);
            return Count == otherSet.Count && IsSupersetOf(otherSet);
        }

        // Static factory methods for common configurations
        public static PtrHashSet<TKey, THasher, TBucketFunction, TRemappingStorage> Create(
            IEnumerable<TKey> elements,
            PtrHashParams? parameters = null,
            IEqualityComparer<TKey>? comparer = null)
        {
            return new PtrHashSet<TKey, THasher, TBucketFunction, TRemappingStorage>(elements, parameters, comparer);
        }

        public void Dispose()
        {
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }

        ~PtrHashSet()
        {
            Dispose(disposing: false);
        }

        private void Dispose(bool disposing)
        {
            if (_disposed) return;

            if (disposing)
            {
                // Only safe to access managed objects here
                _ptrHash?.Dispose();
            }

            _disposed = true;
        }

    }

    /// <summary>
    /// Convenience aliases for common PtrHashSet configurations
    /// </summary>
    public static class PtrHashSet
    {
        /// <summary>
        /// Create a PtrHashSet for string elements using optimized defaults
        /// </summary>
        public static PtrHashSet<string, StringHasher, Linear, UInt32VectorRemappingStorage> CreateForStrings(
            IEnumerable<string> elements,
            PtrHashParams? parameters = null)
        {
            return new PtrHashSet<string, StringHasher, Linear, UInt32VectorRemappingStorage>(
                elements, parameters);
        }

        /// <summary>
        /// Create a PtrHashSet for ulong elements using optimized defaults
        /// </summary>
        public static PtrHashSet<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage> CreateForUInt64(
            IEnumerable<ulong> elements,
            PtrHashParams? parameters = null)
        {
            return new PtrHashSet<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>(
                elements, parameters);
        }

    }
}