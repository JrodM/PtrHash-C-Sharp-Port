using System;
using System.Numerics;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using PtrHash.Core;
using PtrHashImpl = PtrHash.PtrHash;

namespace PtrHash.SentinelHashMap
{

    public class SentinelPtrHashU64<TValue> : ISentinelHashMap<ulong, TValue>
    {
        private readonly PtrHashImpl.PtrHashU64 _ptrHash;
        private readonly ulong[]    _keysByIndex;
        private readonly TValue[]   _valuesByIndex;
        public readonly TValue      _sentinel;
        private bool                _disposed;

        TValue ISentinelHashMap<ulong, TValue>.Sentinel => _sentinel;

        /// <summary>
        /// The sentinel value used for keys not found in the hash map
        /// </summary>
        public TValue Sentinel => _sentinel;



        public SentinelPtrHashU64(
            Span<ulong> keys,
            Span<TValue> values,
            TValue   notFoundSentinel,
            PtrHashConfig config = default)
        {
            if (keys == null) throw new ArgumentNullException(nameof(keys));
            if (values == null) throw new ArgumentNullException(nameof(values));
            if (keys.Length != values.Length)
                throw new ArgumentException("Keys and values must have same length");

            _sentinel = notFoundSentinel;
            _ptrHash = new PtrHashImpl.PtrHashU64(keys, config);
            var info     = _ptrHash.GetInfo();
            int maxIndex = (int)info.MaxIndex;

            _keysByIndex   = new ulong[maxIndex + 1];
            _valuesByIndex = new TValue[maxIndex + 1];

            for (int i = 0; i <= maxIndex; i++)
            {
                _keysByIndex[i]   = 0UL;
                _valuesByIndex[i] = _sentinel;
            }

            for (int i = 0; i < keys.Length; i++)
            {
                int idx = (int)_ptrHash.GetIndex(keys[i]);
                int temp = (int)_ptrHash.GetIndexNoRemap(keys[i]);
                _keysByIndex[idx]   = keys[i];
                _valuesByIndex[idx] = values[i];
            }
        }

        public bool TryGetValue(ulong key, out TValue value)
        {
            if (_disposed) throw new ObjectDisposedException(nameof(SentinelPtrHashU64<TValue>));
            int idx = (int)_ptrHash.GetIndex(key);
            if (_keysByIndex[idx] != key)
            {
                value = _sentinel;
                return false;
            }
            value = _valuesByIndex[idx];
            return true;
        }

        public void TryGetValueStream(
            ReadOnlySpan<ulong> keys,
            Span<TValue>        values,
            uint                prefetchDistance = 32)
        {
            if (_disposed) throw new ObjectDisposedException(nameof(SentinelPtrHashU64<TValue>));
            int n = keys.Length;
            if (n == 0) return;
            if (n != values.Length)
                throw new ArgumentException("Key and value spans must have the same length");

            Span<nuint> indices = n <= 1024
                ? stackalloc nuint[n]
                : new nuint[n];

            _ptrHash.GetIndicesStream(keys, indices, prefetchDistance, minimal: true);
            ProcessIndices(keys, indices, values);
        }

        public SentinelPerformanceInfo GetPerformanceInfo()
            => new SentinelPerformanceInfo
            {
                SupportsSimd      = Vector.IsHardwareAccelerated,
                VectorWidth       = Vector<ulong>.Count,
                SentinelValue     = _sentinel,
                ValuesArrayLength = _valuesByIndex.Length
            };

        private void ProcessIndices(
            ReadOnlySpan<ulong> keys,
            ReadOnlySpan<nuint> indices,
            Span<TValue> values)
        {
            int n = keys.Length;
            int i = 0;

            for (; i < n; i++)
            {
                int idx = (int)indices[i];
                var key = keys[i];
                
                // If index is out of bounds or key does not match, use sentinel
                if (idx < 0 || idx >= _keysByIndex.Length)
                {
                    values[i] = _sentinel;
                }
                else
                {
                    values[i] = (key == _keysByIndex[idx])
                        ? _valuesByIndex[idx]
                        : _sentinel;
                }
            }
        }

        public void Dispose()
        {
            if (!_disposed)
            {
                _ptrHash.Dispose();
                _disposed = true;
            }
        }
    }
}
