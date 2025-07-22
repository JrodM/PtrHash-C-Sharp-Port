using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics.X86;
using PtrHash.CSharp.Port.Storage;

namespace PtrHash.CSharp.Port.Collections
{
    /// <summary>
    /// A vector of CachelineEf that implements IList for 64-bit values.
    /// Provides efficient storage and lookup for sorted 40-bit values using
    /// Elias-Fano encoding with cacheline alignment.
    /// </summary>
    public unsafe class CachelineEfVec : IList<ulong>, IReadOnlyList<ulong>, IDisposable
    {
        private readonly CachelineEf[] _ef;
        private readonly int _length;
        private bool _disposed;

        /// <summary>
        /// Try to construct a new CachelineEfVec for the given sorted values.
        /// Returns null if any cacheline would span too large a range.
        /// </summary>
        public static CachelineEfVec? TryNew(ReadOnlySpan<ulong> values)
        {
            if (values.Length == 0)
                throw new ArgumentException("Values cannot be empty");

            var numCachelines = (values.Length + CachelineEf.L - 1) / CachelineEf.L;
            var ef = new CachelineEf[numCachelines];

            for (int i = 0; i < numCachelines; i++)
            {
                var start = i * CachelineEf.L;
                var end = Math.Min(start + CachelineEf.L, values.Length);
                var chunk = values.Slice(start, end - start);
                
                var cacheline = CachelineEf.TryNew(chunk);
                if (cacheline == null)
                    return null;
                    
                ef[i] = cacheline.Value;
            }

            return new CachelineEfVec(ef, values.Length);
        }

        /// <summary>
        /// Construct a new CachelineEfVec for the given sorted values.
        /// Throws if any cacheline would span too large a range.
        /// </summary>
        public static CachelineEfVec New(ReadOnlySpan<ulong> values)
        {
            return TryNew(values) ?? throw new ArgumentException("Values are too sparse!");
        }

        private CachelineEfVec(CachelineEf[] ef, int length)
        {
            _ef = ef;
            _length = length;
        }

        /// <summary>
        /// Get the value at the specified index.
        /// </summary>
        public ulong this[int index]
        {
            get
            {
                if ((uint)index >= (uint)_length)
                    throw new ArgumentOutOfRangeException(nameof(index));
                
                return IndexUnchecked(index);
            }
            set => throw new NotSupportedException("CachelineEfVec is read-only");
        }

        /// <summary>
        /// Number of values stored.
        /// </summary>
        public int Count => _length;

        /// <summary>
        /// Always true - CachelineEfVec is read-only.
        /// </summary>
        public bool IsReadOnly => true;

        /// <summary>
        /// Get the value at the specified index without bounds checking.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong IndexUnchecked(int index)
        {
            ObjectDisposedException.ThrowIf(_disposed, this);
            return _ef[index / CachelineEf.L].IndexUnchecked(index % CachelineEf.L);
        }

        /// <summary>
        /// Prefetch the cacheline containing the given element.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void Prefetch(int index)
        {
            ObjectDisposedException.ThrowIf(_disposed, this);
            var cachelineIndex = index / CachelineEf.L;
            if ((uint)cachelineIndex < (uint)_ef.Length)
            {
                PrefetchCacheline(cachelineIndex);
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private void PrefetchCacheline(int cachelineIndex)
        {
            // Prefetch the cacheline into L1 cache
            fixed (CachelineEf* ptr = &_ef[cachelineIndex])
            {
                if (Sse.IsSupported)
                {
                    Sse.Prefetch0(ptr);
                }
            }
        }

        /// <summary>
        /// Get the size of the underlying data structure in bytes.
        /// </summary>
        public int SizeInBytes => _ef.Length * sizeof(CachelineEf);

        // IList<ulong> implementation - most operations are not supported for read-only collection
        public void Add(ulong item) => throw new NotSupportedException("CachelineEfVec is read-only");
        public void Clear() => throw new NotSupportedException("CachelineEfVec is read-only");
        public void Insert(int index, ulong item) => throw new NotSupportedException("CachelineEfVec is read-only");
        public bool Remove(ulong item) => throw new NotSupportedException("CachelineEfVec is read-only");
        public void RemoveAt(int index) => throw new NotSupportedException("CachelineEfVec is read-only");

        public bool Contains(ulong item)
        {
            return IndexOf(item) >= 0;
        }

        public void CopyTo(ulong[] array, int arrayIndex)
        {
            if (array == null)
                throw new ArgumentNullException(nameof(array));
            if (arrayIndex < 0)
                throw new ArgumentOutOfRangeException(nameof(arrayIndex));
            if (array.Length - arrayIndex < _length)
                throw new ArgumentException("Destination array is too small");

            for (int i = 0; i < _length; i++)
            {
                array[arrayIndex + i] = this[i];
            }
        }

        public int IndexOf(ulong item)
        {
            // Linear search - could be optimized with binary search for sorted data
            for (int i = 0; i < _length; i++)
            {
                if (this[i] == item)
                    return i;
            }
            return -1;
        }

        public IEnumerator<ulong> GetEnumerator()
        {
            ObjectDisposedException.ThrowIf(_disposed, this);
            
            for (int i = 0; i < _length; i++)
            {
                yield return this[i];
            }
        }

        IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();

        public void Dispose()
        {
            _disposed = true;
        }
    }
}