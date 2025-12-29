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
using System.Runtime.InteropServices;

namespace PtrHash.CSharp.Port.Collections
{
    /// <summary>
    /// A dictionary implementation using PtrHash as the underlying mapping structure.
    /// Provides O(1) lookups with perfect hashing for a fixed set of keys.
    /// </summary>
    public class PtrHashDictionary<TKey, TValue, THasher, TBucketFunction, TRemappingStorage> : IDictionary<TKey, TValue>, IDisposable
        where THasher : struct, IKeyHasher<TKey>
        where TBucketFunction : struct, IBucketFunction
        where TRemappingStorage : struct, IRemappingStorage<TRemappingStorage>
        where TKey : notnull
    {
        private readonly PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage> _ptrHash;
        private readonly KeyValuePair<TKey, TValue>[] _keyValuePairs;
        private readonly TValue _sentinel;
        private readonly IEqualityComparer<TKey> _keyComparer;
        private bool _disposed;
        
        const int MAX_STACK_SIZE = 4096; // 32KB on stack (8 bytes × 4096)
        
        /// <summary>
        /// The sentinel value returned for keys not found in the dictionary
        /// </summary>
        public TValue Sentinel => _sentinel;

        /// <summary>
        /// Creates a new PtrHashDictionary from the given keys and values
        /// </summary>
        /// <param name="keys">Array of unique keys</param>
        /// <param name="values">Array of values corresponding to keys</param>
        /// <param name="notFoundSentinel">Value to return when key is not found</param>
        /// <param name="parameters">PtrHash construction parameters</param>
        /// <param name="keyComparer">Custom equality comparer for keys (optional, uses default if null)</param>
        public PtrHashDictionary(
            TKey[] keys,
            TValue[] values,
            TValue notFoundSentinel,
            PtrHashParams? parameters = null,
            IEqualityComparer<TKey>? keyComparer = null)
        {
            if (keys == null) throw new ArgumentNullException(nameof(keys));
            if (values == null) throw new ArgumentNullException(nameof(values));
            if (keys.Length != values.Length)
                throw new ArgumentException("Keys and values must have same length");

            _sentinel = notFoundSentinel;
            _keyComparer = keyComparer ?? EqualityComparer<TKey>.Default;
            
            // Use single-part mode for optimal point lookup performance (based on benchmarks)
            var optimizedParams = parameters ?? new PtrHashParams
            {
                Alpha = 0.99,
                Lambda = 3.0,
                Minimal = true,
                SinglePart = true,
            };
            
            _ptrHash = new PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage>(keys, optimizedParams);
            var info = _ptrHash.GetInfo();
            int maxIndex = (int)info.MaxIndex;

            _keyValuePairs = new KeyValuePair<TKey, TValue>[maxIndex];

            // Initialize all slots with default values
            for (int i = 0; i < maxIndex; i++)
            {
                _keyValuePairs[i] = new KeyValuePair<TKey, TValue>(default(TKey)!, _sentinel);
            }

            // Map keys to their hash indices and store key-value pairs
            for (int i = 0; i < keys.Length; i++)
            {
                int idx = (int)_ptrHash.GetIndexNoRemap(keys[i]);
                _keyValuePairs[idx] = new KeyValuePair<TKey, TValue>(keys[i], values[i]);
            }
        }


        #region IDictionary<TKey, TValue> Implementation

        public TValue this[TKey key]
        {
            get
            {
                if (TryGetValue(key, out TValue value))
                    return value;
                throw new KeyNotFoundException($"Key '{key}' was not found in the dictionary.");
            }
            set => throw new NotSupportedException("PtrHashDictionary is read-only. Values cannot be modified after construction.");
        }

        public ICollection<TKey> Keys => _keyValuePairs.Where(kvp => !EqualityComparer<TKey>.Default.Equals(kvp.Key, default(TKey)!)).Select(kvp => kvp.Key).ToList().AsReadOnly();

        public ICollection<TValue> Values => _keyValuePairs.Where(kvp => !EqualityComparer<TKey>.Default.Equals(kvp.Key, default(TKey)!)).Select(kvp => kvp.Value).ToList().AsReadOnly();

        public int Count => _keyValuePairs.Count(kvp => !EqualityComparer<TKey>.Default.Equals(kvp.Key, default(TKey)!));

        public bool IsReadOnly => true;

        public void Add(TKey key, TValue value)
        {
            throw new NotSupportedException("PtrHashDictionary is read-only. Items cannot be added after construction.");
        }

        public void Add(KeyValuePair<TKey, TValue> item)
        {
            throw new NotSupportedException("PtrHashDictionary is read-only. Items cannot be added after construction.");
        }

        public void Clear()
        {
            throw new NotSupportedException("PtrHashDictionary is read-only. Items cannot be removed after construction.");
        }

        public bool Contains(KeyValuePair<TKey, TValue> item)
        {
            return TryGetValue(item.Key, out TValue value) && EqualityComparer<TValue>.Default.Equals(value, item.Value);
        }

        public bool ContainsKey(TKey key)
        {
            return TryGetValue(key, out _);
        }

        public void CopyTo(KeyValuePair<TKey, TValue>[] array, int arrayIndex)
        {
            if (array == null) throw new ArgumentNullException(nameof(array));
            if (arrayIndex < 0) throw new ArgumentOutOfRangeException(nameof(arrayIndex));
            if (array.Length - arrayIndex < Count) throw new ArgumentException("Destination array is too small.");

            int index = arrayIndex;
            foreach (var kvp in _keyValuePairs.Where(kvp => !EqualityComparer<TKey>.Default.Equals(kvp.Key, default(TKey)!)))
            {
                array[index++] = kvp;
            }
        }

        public IEnumerator<KeyValuePair<TKey, TValue>> GetEnumerator()
        {
            return _keyValuePairs.Where(kvp => !EqualityComparer<TKey>.Default.Equals(kvp.Key, default(TKey)!)).GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();

        public bool Remove(TKey key)
        {
            throw new NotSupportedException("PtrHashDictionary is read-only. Items cannot be removed after construction.");
        }

        public bool Remove(KeyValuePair<TKey, TValue> item)
        {
            throw new NotSupportedException("PtrHashDictionary is read-only. Items cannot be removed after construction.");
        }

        /// <summary>
        /// Attempts to get the value associated with the specified key
        /// </summary>
        /// <param name="key">The key to look up</param>
        /// <param name="value">The value if found, or default if not found</param>
        /// <returns>True if the key was found, false otherwise</returns>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public bool TryGetValue(TKey key, out TValue value)
        {
            var idx = (int)_ptrHash.GetIndexNoRemap(key);
            
            // Single bounds check
            if ((uint)idx < (uint)_keyValuePairs.Length)
            {
                ref var kvp = ref _keyValuePairs[idx];
                
                if (_keyComparer.Equals(kvp.Key, key))
                {
                    value = kvp.Value;
                    return true;
                }
            }
            
            value = _sentinel;
            return false;
        }

        #endregion


        /// <summary>
        /// Performs batch lookup using streaming for better performance on large datasets.
        /// Uses GetIndicesStream (no prefetch) for optimal performance.
        /// </summary>
        /// <param name="keys">Keys to look up</param>
        /// <param name="values">Output array for values (must be same length as keys)</param>
        public void TryGetValueStream(
            ReadOnlySpan<TKey> keys,
            Span<TValue> values)
        {
            if (keys.Length != values.Length)
                throw new ArgumentException("Key and value spans must have the same length");
            
            if (keys.Length <= MAX_STACK_SIZE)
            {
                Span<nuint> indices = stackalloc nuint[keys.Length];
                _ptrHash.GetIndicesStream(keys, indices, minimal: false);
                ProcessIndices(keys, indices, values);
            }
            else
            {
                var indices = ArrayPool<nuint>.Shared.Rent(keys.Length);
                try
                {
                    var indicesSpan = indices.AsSpan(0, keys.Length);
                    _ptrHash.GetIndicesStream(keys, indicesSpan, minimal: false);
                    ProcessIndices(keys, indicesSpan, values);
                }
                finally
                {
                    ArrayPool<nuint>.Shared.Return(indices);
                }
            }
        }

        /// <summary>
        /// Gets information about the underlying PtrHash structure
        /// </summary>
        public PtrHashInfo GetInfo() => _ptrHash.GetInfo();

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private void ProcessIndices(
            ReadOnlySpan<TKey> keys,
            ReadOnlySpan<nuint> indices,
            Span<TValue> values)
        {
            // Hoist fields into locals
            var kvps = _keyValuePairs;
            var comparer = _keyComparer;
            var sentinel = _sentinel;
            int kvpCount = kvps.Length;
            int len = keys.Length;

            // Get raw refs to spans to remove bounds checks
            ref TKey keyRef = ref MemoryMarshal.GetReference(keys);
            ref nuint idxRef = ref MemoryMarshal.GetReference(indices);
            ref TValue valRef = ref MemoryMarshal.GetReference(values);

            for (int i = 0; i < len; i++)
            {
                nuint uidx = Unsafe.Add(ref idxRef, i);
                
                TValue result = sentinel;
                
                if (uidx < (nuint)kvpCount)
                {
                    ref var kvp = ref kvps[(int)uidx];

                    if (comparer.Equals(Unsafe.Add(ref keyRef, i), kvp.Key))
                        result = kvp.Value;
                }

                Unsafe.Add(ref valRef, i) = result;
            }
        }

        public void Dispose()
        {
            Dispose(disposing: true);
            GC.SuppressFinalize(this);
        }

        ~PtrHashDictionary()
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
}