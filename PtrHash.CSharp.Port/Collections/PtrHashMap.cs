using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;

namespace PtrHash.CSharp.Port.Collections
{
    /// <summary>
    /// A hash map implementation using PtrHash as the underlying mapping structure.
    /// Provides O(1) lookups with perfect hashing for a fixed set of keys.
    /// </summary>
    public class PtrHashMap<TKey, TValue, THasher> : IDisposable
        where THasher : struct, IKeyHasher<TKey>
    {
        private readonly PtrHash<TKey, THasher> _ptrHash;
        private readonly TKey[] _keysByIndex;
        private readonly TValue[] _valuesByIndex;
        private readonly TValue _sentinel;
        private bool _disposed;

        /// <summary>
        /// The sentinel value returned for keys not found in the hash map
        /// </summary>
        public TValue Sentinel => _sentinel;

        /// <summary>
        /// Creates a new PtrHashMap from the given keys and values
        /// </summary>
        /// <param name="keys">Array of unique keys</param>
        /// <param name="values">Array of values corresponding to keys</param>
        /// <param name="notFoundSentinel">Value to return when key is not found</param>
        /// <param name="parameters">PtrHash construction parameters</param>
        public PtrHashMap(
            TKey[] keys,
            TValue[] values,
            TValue notFoundSentinel,
            PtrHashParams? parameters = null)
        {
            if (keys == null) throw new ArgumentNullException(nameof(keys));
            if (values == null) throw new ArgumentNullException(nameof(values));
            if (keys.Length != values.Length)
                throw new ArgumentException("Keys and values must have same length");

            _sentinel = notFoundSentinel;
            _ptrHash = new PtrHash<TKey, THasher>(keys, parameters ?? PtrHashParams.DefaultFast);
            var info = _ptrHash.GetInfo();
            int maxIndex = (int)info.MaxIndex;

            _keysByIndex = new TKey[maxIndex];
            _valuesByIndex = new TValue[maxIndex];

            // Initialize all slots with default values
            for (int i = 0; i < maxIndex; i++)
            {
                _keysByIndex[i] = default(TKey)!;
                _valuesByIndex[i] = _sentinel;
            }

            // Map keys to their hash indices and store key-value pairs
            for (int i = 0; i < keys.Length; i++)
            {
                int idx = (int)_ptrHash.GetIndex(keys[i]);
                _keysByIndex[idx] = keys[i];
                _valuesByIndex[idx] = values[i];
            }
        }

        /// <summary>
        /// Attempts to get the value associated with the specified key
        /// </summary>
        /// <param name="key">The key to look up</param>
        /// <param name="value">The value if found, or sentinel if not found</param>
        /// <returns>True if the key was found, false otherwise</returns>
        public bool TryGetValue(TKey key, out TValue value)
        {
            ThrowIfDisposed();
            
            int idx = (int)_ptrHash.GetIndex(key);
            
            // Verify the key matches (handles hash collisions)
            if (idx < _keysByIndex.Length && EqualityComparer<TKey>.Default.Equals(_keysByIndex[idx], key))
            {
                value = _valuesByIndex[idx];
                return true;
            }
            
            value = _sentinel;
            return false;
        }

        /// <summary>
        /// Gets the value associated with the specified key, or sentinel if not found
        /// </summary>
        /// <param name="key">The key to look up</param>
        /// <returns>The value if found, or sentinel if not found</returns>
        public TValue GetValueOrSentinel(TKey key)
        {
            TryGetValue(key, out TValue value);
            return value;
        }

        /// <summary>
        /// Performs batch lookup using streaming for better performance on large datasets
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
            
            int n = keys.Length;
            if (n == 0) return;
            if (n != values.Length)
                throw new ArgumentException("Key and value spans must have the same length");

            // Use stack allocation for small arrays, heap for large ones
            Span<nuint> indices = n <= 1024
                ? stackalloc nuint[n]
                : new nuint[n];

            // Get all indices using streaming
            _ptrHash.GetIndicesStream(keys, indices, prefetchDistance, minimal: true);
            
            // Process indices and verify keys match
            ProcessIndices(keys, indices, values);
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
            var comparer = EqualityComparer<TKey>.Default;
            
            for (int i = 0; i < keys.Length; i++)
            {
                int idx = (int)indices[i];
                var key = keys[i];
                
                // Bounds check and key verification
                if (idx >= 0 && idx < _keysByIndex.Length && comparer.Equals(key, _keysByIndex[idx]))
                {
                    values[i] = _valuesByIndex[idx];
                }
                else
                {
                    values[i] = _sentinel;
                }
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private void ThrowIfDisposed()
        {
            if (_disposed)
                throw new ObjectDisposedException(nameof(PtrHashMap<TKey, TValue, THasher>));
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
    public class PtrHashMapU64<TValue> : PtrHashMap<ulong, TValue, StrongerIntHasher>
    {
        public PtrHashMapU64(ulong[] keys, TValue[] values, TValue notFoundSentinel, PtrHashParams? parameters = null)
            : base(keys, values, notFoundSentinel, parameters)
        {
        }
    }

    /// <summary>
    /// Convenience class for string keys using StringHasher
    /// </summary>
    public class PtrHashMapString<TValue> : PtrHashMap<string, TValue, StringHasher>
    {
        public PtrHashMapString(string[] keys, TValue[] values, TValue notFoundSentinel, PtrHashParams? parameters = null)
            : base(keys, values, notFoundSentinel, parameters)
        {
        }
    }
}