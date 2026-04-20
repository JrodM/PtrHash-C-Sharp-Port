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
using System.Runtime.Intrinsics.X86;

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
        where TKey : notnull, IEquatable<TKey>
    {
        private readonly PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage, SinglePart> _ptrHash;
        private readonly KeyValuePair<TKey, TValue>[] _keyValuePairs;
        private readonly TValue _sentinel;
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
        public PtrHashDictionary(
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
            
            var optimizedParams = parameters ?? new PtrHashParams
            {
                Alpha = 0.99,
                Lambda = 3.0,
                Minimal = true,
            };

            _ptrHash = new PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage, SinglePart>(keys, optimizedParams);
            var info = _ptrHash.GetInfo();
            int maxIndex = (int)info.MaxIndex;

            _keyValuePairs = new KeyValuePair<TKey, TValue>[maxIndex];

            for (int i = 0; i < maxIndex; i++)
            {
                _keyValuePairs[i] = new KeyValuePair<TKey, TValue>(default(TKey)!, _sentinel);
            }

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

            if ((uint)idx < (uint)_keyValuePairs.Length)
            {
                ref var kvp = ref _keyValuePairs[idx];

                if (key.Equals(kvp.Key))
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
        /// Updates the value at a specific index.
        /// </summary>
        /// <param name="index">The index to update</param>
        /// <param name="value">The new value</param>
        /// <exception cref="ArgumentOutOfRangeException">If index is out of range</exception>
        public void UpdateByIndex(int index, TValue value)
        {
            if ((uint)index >= (uint)_keyValuePairs.Length)
                throw new ArgumentOutOfRangeException(nameof(index), $"Index {index} is out of range [0, {_keyValuePairs.Length})");
            
            ref var kvp = ref _keyValuePairs[index];
            _keyValuePairs[index] = new KeyValuePair<TKey, TValue>(kvp.Key, value);
        }


        /// <summary>
        /// Two-pass prefetch batch lookup: pass 1 prefetches pilots to get indices,
        /// pass 2 prefetches the backing array to get key/value pairs.
        /// </summary>
        public void TryGetValueStream(
            ReadOnlySpan<TKey> keys,
            Span<TValue> values)
        {
            if (keys.Length != values.Length)
                throw new ArgumentException("Key and value spans must have the same length");

            if (keys.Length <= MAX_STACK_SIZE)
            {
                Span<nuint> indices = stackalloc nuint[keys.Length];
                _ptrHash.GetIndicesStreamPrefetch<NoMinimal, PrefetchDistance32>(keys, indices);
                ProcessIndicesPrefetch(keys, indices, values);
            }
            else
            {
                var indices = ArrayPool<nuint>.Shared.Rent(keys.Length);
                try
                {
                    var indicesSpan = indices.AsSpan(0, keys.Length);
                    _ptrHash.GetIndicesStreamPrefetch<NoMinimal, PrefetchDistance32>(keys, indicesSpan);
                    ProcessIndicesPrefetch(keys, indicesSpan, values);
                }
                finally
                {
                    ArrayPool<nuint>.Shared.Return(indices);
                }
            }
        }

        public PtrHashInfo GetInfo() => _ptrHash.GetInfo();

        private unsafe void ProcessIndicesPrefetch(
            ReadOnlySpan<TKey> keys,
            ReadOnlySpan<nuint> indices,
            Span<TValue> values)
        {
            const int B = 32;

            var sentinel = _sentinel;
            int len = keys.Length;
            int kvpLen = _keyValuePairs.Length;

            ref TKey keyRef = ref MemoryMarshal.GetReference(keys);
            ref nuint idxRef = ref MemoryMarshal.GetReference(indices);
            ref TValue valRef = ref MemoryMarshal.GetReference(values);
            ref KeyValuePair<TKey, TValue> kvpRef = ref MemoryMarshal.GetArrayDataReference(_keyValuePairs);

            // Init: prefetch the first B entries before processing any
            int initCount = Math.Min(B, len);
            for (int i = 0; i < initCount; i++)
            {
                nuint idx = Unsafe.Add(ref idxRef, i);
                if (idx < (nuint)kvpLen)
                    Sse.Prefetch0(Unsafe.AsPointer(ref Unsafe.Add(ref kvpRef, (nint)idx)));
            }

            // Main: process i, prefetch i+B
            int mainEnd = len - B;
            for (int i = 0; i < mainEnd; i++)
            {
                nuint prefetchIdx = Unsafe.Add(ref idxRef, i + B);
                if (prefetchIdx < (nuint)kvpLen)
                    Sse.Prefetch0(Unsafe.AsPointer(ref Unsafe.Add(ref kvpRef, (nint)prefetchIdx)));

                nuint idx = Unsafe.Add(ref idxRef, i);
                TValue result;
                if (idx < (nuint)kvpLen)
                {
                    ref var kvp = ref Unsafe.Add(ref kvpRef, (nint)idx);
                    result = Unsafe.Add(ref keyRef, i).Equals(kvp.Key) ? kvp.Value : sentinel;
                }
                else
                {
                    result = sentinel;
                }
                Unsafe.Add(ref valRef, i) = result;
            }

            // Drain: process remaining entries already prefetched
            for (int i = Math.Max(0, mainEnd); i < len; i++)
            {
                nuint idx = Unsafe.Add(ref idxRef, i);
                TValue result;
                if (idx < (nuint)kvpLen)
                {
                    ref var kvp = ref Unsafe.Add(ref kvpRef, (nint)idx);
                    result = Unsafe.Add(ref keyRef, i).Equals(kvp.Key) ? kvp.Value : sentinel;
                }
                else
                {
                    result = sentinel;
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