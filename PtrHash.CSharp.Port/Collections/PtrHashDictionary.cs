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
            
            _ptrHash = new PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage>(keys, parameters ?? PtrHashParams.DefaultFast);
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
                int idx = (int)_ptrHash.GetIndex(keys[i]);
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
            var idx = (int)_ptrHash.GetIndex(key);
            
            // Single bounds check and cache-friendly access
            if ((uint)idx < (uint)_keyValuePairs.Length)
            {
                ref var kvp = ref _keyValuePairs[idx];
                // Use cached comparer - faster than EqualityComparer.Default lookup
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
        /// Gets the value associated with the specified key, or sentinel if not found
        /// </summary>
        /// <param name="key">The key to look up</param>
        /// <returns>The value if found, or sentinel if not found</returns>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public TValue GetValueOrSentinel(TKey key)
        {
            var idx = (int)_ptrHash.GetIndex(key);
            
            // Single bounds check and cache-friendly access
            if ((uint)idx < (uint)_keyValuePairs.Length)
            {
                ref var kvp = ref _keyValuePairs[idx];
                if (_keyComparer.Equals(kvp.Key, key))
                {
                    return kvp.Value;
                }
            }
            
            return _sentinel;
        }

        /// <summary>
        /// Performs batch lookup using streaming with SSE prefetch for better performance on large datasets
        /// Uses cache-friendly chunking to eliminate allocations and improve performance
        /// </summary>
        /// <param name="keys">Keys to look up</param>
        /// <param name="values">Output array for values (must be same length as keys)</param>
        public void TryGetValueStream(
            ReadOnlySpan<TKey> keys,
            Span<TValue> values)
        {
            if (keys.Length != values.Length)
                throw new ArgumentException("Key and value spans must have the same length");
            
            const int MAX_STACK_SIZE = 4096; // 32KB on stack (8 bytes × 4096)
            
            if (keys.Length <= MAX_STACK_SIZE)
            {
                // Small datasets: single allocation on stack
                Span<nuint> indices = stackalloc nuint[keys.Length];
                _ptrHash.GetIndicesStreamPrefetch(keys, indices, minimal: true);
                ProcessIndices(keys, indices, values);
            }
            else
            {
                // Large datasets: rent from array pool to avoid stack overflow
                var indices = ArrayPool<nuint>.Shared.Rent(keys.Length);
                try
                {
                    var indicesSpan = indices.AsSpan(0, keys.Length);
                    _ptrHash.GetIndicesStreamPrefetch(keys, indicesSpan, minimal: true);
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
            for (int i = 0; i < keys.Length; i++)
            {
                var idx = (int)indices[i];
                
                if ((uint)idx < (uint)_keyValuePairs.Length)
                {
                    ref var kvp = ref _keyValuePairs[idx];
                    if (_keyComparer.Equals(keys[i], kvp.Key))
                    {
                        values[i] = kvp.Value;
                        continue;
                    }
                }
                
                values[i] = _sentinel;
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
    /// Convenience class for UInt64 keys using StrongerIntHasher
    /// </summary>
    public class PtrHashDictionaryU64<TValue> : PtrHashDictionary<ulong, TValue, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>
    {
        public PtrHashDictionaryU64(ulong[] keys, TValue[] values, TValue notFoundSentinel, PtrHashParams? parameters = null, IEqualityComparer<ulong>? keyComparer = null)
            : base(keys, values, notFoundSentinel, parameters, keyComparer)
        {
        }

    }

    /// <summary>
    /// Convenience class for string keys using StringHasher
    /// </summary>
    public class PtrHashDictionaryString<TValue> : PtrHashDictionary<string, TValue, StringHasher, Linear, UInt32VectorRemappingStorage>
    {
        public PtrHashDictionaryString(string[] keys, TValue[] values, TValue notFoundSentinel, PtrHashParams? parameters = null, IEqualityComparer<string>? keyComparer = null)
            : base(keys, values, notFoundSentinel, parameters, keyComparer)
        {
        }

    }
}