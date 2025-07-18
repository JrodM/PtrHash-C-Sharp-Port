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
    /// A dictionary implementation using PtrHash as the underlying mapping structure.
    /// Provides O(1) lookups with perfect hashing for a fixed set of keys.
    /// </summary>
    public class PtrHashDictionary<TKey, TValue, THasher> : IDictionary<TKey, TValue>, IDisposable
        where THasher : struct, IKeyHasher<TKey>
        where TKey : notnull
    {
        private readonly PtrHash<TKey, THasher> _ptrHash;
        private readonly KeyValuePair<TKey, TValue>[] _keyValuePairs;
        private readonly TValue _sentinel;
        private readonly TKey[] _originalKeys;
        private readonly TValue[] _originalValues;
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
            _originalKeys = (TKey[])keys.Clone();
            _originalValues = (TValue[])values.Clone();
            _keyComparer = keyComparer ?? EqualityComparer<TKey>.Default;
            
            _ptrHash = new PtrHash<TKey, THasher>(keys, parameters ?? PtrHashParams.DefaultFast);
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

        public ICollection<TKey> Keys => _originalKeys.ToList().AsReadOnly();

        public ICollection<TValue> Values => _originalValues.ToList().AsReadOnly();

        public int Count => _originalKeys.Length;

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
            for (int i = 0; i < _originalKeys.Length; i++)
            {
                array[index++] = new KeyValuePair<TKey, TValue>(_originalKeys[i], _originalValues[i]);
            }
        }

        public IEnumerator<KeyValuePair<TKey, TValue>> GetEnumerator()
        {
            for (int i = 0; i < _originalKeys.Length; i++)
            {
                yield return new KeyValuePair<TKey, TValue>(_originalKeys[i], _originalValues[i]);
            }
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
            ThrowIfDisposed();
            
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
        /// Performs batch lookup using streaming for better performance on large datasets
        /// Uses cache-friendly chunking to eliminate allocations and improve performance
        /// </summary>
        /// <param name="keys">Keys to look up</param>
        /// <param name="values">Output array for values (must be same length as keys)</param>
        /// <param name="prefetchDistance">Prefetch distance for memory optimization</param>
        public void GetValuesStream(
            ReadOnlySpan<TKey> keys,
            Span<TValue> values,
            uint prefetchDistance = 32)
        {
            ThrowIfDisposed();
            
            if (keys.Length != values.Length)
                throw new ArgumentException("Key and value spans must have the same length");
            
            const int CHUNK_SIZE = 1024; // Cache-friendly chunk size (1024 × 8 bytes = 8KB on 64-bit)
            
            // Process in cache-friendly chunks to eliminate allocations
            for (int i = 0; i < keys.Length; i += CHUNK_SIZE)
            {
                var chunkSize = Math.Min(CHUNK_SIZE, keys.Length - i);
                Span<nuint> indices = stackalloc nuint[chunkSize]; // Always stack allocated
                
                var keyChunk = keys.Slice(i, chunkSize);
                var valueChunk = values.Slice(i, chunkSize);
                
                _ptrHash.GetIndicesStream(keyChunk, indices, minimal: true);
                ProcessIndices(keyChunk, indices, valueChunk);
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

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private void ThrowIfDisposed()
        {
            if (_disposed)
                throw new ObjectDisposedException(nameof(PtrHashDictionary<TKey, TValue, THasher>));
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
    public class PtrHashDictionaryU64<TValue> : PtrHashDictionary<ulong, TValue, StrongerIntHasher>
    {
        public PtrHashDictionaryU64(ulong[] keys, TValue[] values, TValue notFoundSentinel, PtrHashParams? parameters = null, IEqualityComparer<ulong>? keyComparer = null)
            : base(keys, values, notFoundSentinel, parameters, keyComparer)
        {
        }
    }

    /// <summary>
    /// Convenience class for string keys using StringHasher
    /// </summary>
    public class PtrHashDictionaryString<TValue> : PtrHashDictionary<string, TValue, StringHasher>
    {
        public PtrHashDictionaryString(string[] keys, TValue[] values, TValue notFoundSentinel, PtrHashParams? parameters = null, IEqualityComparer<string>? keyComparer = null)
            : base(keys, values, notFoundSentinel, parameters, keyComparer)
        {
        }
    }
}