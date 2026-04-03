using System;
using System.Buffers;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using PtrHash.CSharp.Interop.Native;
using PtrHash.CSharp.Interop.PtrHash.Dispatchers;
using PtrHashImpl = PtrHash.CSharp.Interop.PtrHash;

namespace PtrHash.CSharp.Interop.InteropDictionary
{
    /// <summary>
    /// Generic PtrHash-based dictionary that works with any key type through the dispatcher system
    /// </summary>
    public class PtrHashInteropDictionary<TKey, TValue, TDispatcher> : IDictionary<TKey, TValue>, IDisposable
        where TDispatcher : struct, IDispatcher<TKey>
    {
        private readonly PtrHashImpl.PtrHashInterop<TKey, TDispatcher> _ptrHash;
        private readonly TKey[] _keysByIndex;
        private readonly TValue[] _valuesByIndex;
        private readonly TValue _sentinel;
        private readonly IEqualityComparer<TKey> _keyComparer;
        private bool _disposed;

        public TValue Sentinel => _sentinel;

        public TValue this[TKey key] 
        { 
            get => TryGetValue(key, out var value) ? value : throw new KeyNotFoundException($"Key '{key}' not found");
            set => throw new NotSupportedException("PtrHashInteropDictionary is read-only");
        }

        public ICollection<TKey> Keys => throw new NotImplementedException("Keys collection not implemented");
        public ICollection<TValue> Values => throw new NotImplementedException("Values collection not implemented");
        public int Count { get; private set; }
        public bool IsReadOnly => true;

        public PtrHashInteropDictionary(
            ReadOnlySpan<TKey> keys,
            ReadOnlySpan<TValue> values,
            TValue notFoundSentinel,
            PtrHashNative.FFIParams? parameters = null,
            IEqualityComparer<TKey>? keyComparer = null)
        {
            if (keys.Length != values.Length)
                throw new ArgumentException("Keys and values must have same length");

            _sentinel = notFoundSentinel;
            _keyComparer = keyComparer ?? EqualityComparer<TKey>.Default;
            _ptrHash = new PtrHashImpl.PtrHashInterop<TKey, TDispatcher>(keys, parameters);
            var info = _ptrHash.GetInfo();
            int maxIndex = (int)info.MaxIndex;

            _keysByIndex = new TKey[maxIndex + 1];
            _valuesByIndex = new TValue[maxIndex + 1];

            for (int i = 0; i <= maxIndex; i++)
            {
                _keysByIndex[i] = default(TKey)!;
                _valuesByIndex[i] = _sentinel;
            }

            for (int i = 0; i < keys.Length; i++)
            {
                int idx = (int)_ptrHash.GetIndexNoRemap(keys[i]);
                _keysByIndex[idx] = keys[i];
                _valuesByIndex[idx] = values[i];
            }

            Count = keys.Length;
        }

        /// <summary>
        /// Convenience constructor that takes arrays
        /// </summary>
        public PtrHashInteropDictionary(
            TKey[] keys,
            TValue[] values,
            TValue notFoundSentinel,
            PtrHashNative.FFIParams? parameters = null)
            : this(keys.AsSpan(), values.AsSpan(), notFoundSentinel, parameters)
        {
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public bool TryGetValue(TKey key, out TValue value)
        {
            var index = (int)_ptrHash.GetIndexNoRemap(key);
            
            if ((uint)index < (uint)_keysByIndex.Length)
            {
                var storedKey = _keysByIndex[index];
                if (_keyComparer.Equals(storedKey, key))
                {
                    value = _valuesByIndex[index];
                    return !EqualityComparer<TValue>.Default.Equals(value, _sentinel);
                }
            }
            
            value = _sentinel;
            return false;
        }

        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        public void TryGetValueStream(ReadOnlySpan<TKey> keys, Span<TValue> values, uint prefetchDistance = 32)
        {
            if (keys.Length != values.Length)
                throw new ArgumentException("Keys and values spans must have the same length");

            if (keys.IsEmpty)
                return;

            const int MAX_STACK_SIZE = 4096; // 32KB on stack (8 bytes × 4096)
            
            if (keys.Length <= MAX_STACK_SIZE)
            {
                // Small datasets: single allocation on stack
                Span<nuint> indices = stackalloc nuint[keys.Length];
                _ptrHash.GetIndicesStream(keys, indices, prefetchDistance, false);
                ProcessIndices(keys, indices, values);
            }
            else
            {
                // Large datasets: rent from array pool to avoid stack overflow
                var indices = ArrayPool<nuint>.Shared.Rent(keys.Length);
                try
                {
                    var indicesSpan = indices.AsSpan(0, keys.Length);
                    _ptrHash.GetIndicesStream(keys, indicesSpan, prefetchDistance, false);
                    ProcessIndices(keys, indicesSpan, values);
                }
                finally
                {
                    ArrayPool<nuint>.Shared.Return(indices);
                }
            }
        }


        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private void ProcessIndices(
            ReadOnlySpan<TKey> keys,
            ReadOnlySpan<nuint> indices,
            Span<TValue> values)
        {
            for (int i = 0; i < keys.Length; i++)
            {
                var index = (int)indices[i];
                
                    if ((uint)index < (uint)_keysByIndex.Length)
                {
                    var storedKey = _keysByIndex[index];
                    if (_keyComparer.Equals(keys[i], storedKey))
                    {
                        values[i] = _valuesByIndex[index];
                        continue;
                    }
                }
                
                values[i] = _sentinel;
            }
        }


        public void Add(TKey key, TValue value) 
            => throw new NotSupportedException("PtrHashInteropDictionary is read-only");
        
        public bool Remove(TKey key) 
            => throw new NotSupportedException("PtrHashInteropDictionary is read-only");
        
        public void Add(KeyValuePair<TKey, TValue> item) 
            => throw new NotSupportedException("PtrHashInteropDictionary is read-only");
        
        public bool Remove(KeyValuePair<TKey, TValue> item) 
            => throw new NotSupportedException("PtrHashInteropDictionary is read-only");
        
        public void Clear() 
            => throw new NotSupportedException("PtrHashInteropDictionary is read-only");

        public bool ContainsKey(TKey key) 
            => TryGetValue(key, out _);

        public bool Contains(KeyValuePair<TKey, TValue> item)
            => TryGetValue(item.Key, out var value) && EqualityComparer<TValue>.Default.Equals(value, item.Value);

        public void CopyTo(KeyValuePair<TKey, TValue>[] array, int arrayIndex)
            => throw new NotImplementedException("CopyTo not implemented");

        public IEnumerator<KeyValuePair<TKey, TValue>> GetEnumerator()
            => throw new NotImplementedException("Enumeration not implemented");

        IEnumerator IEnumerable.GetEnumerator() 
            => GetEnumerator();

        public void Dispose()
        {
            if (!_disposed)
            {
                _ptrHash?.Dispose();
                _disposed = true;
            }
        }
    }
}