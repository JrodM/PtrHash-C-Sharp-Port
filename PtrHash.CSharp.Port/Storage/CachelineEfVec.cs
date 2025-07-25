using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics.X86;

namespace PtrHash.CSharp.Port.Storage
{
    /// <summary>
    /// A vector of CachelineEf that implements IList for 64-bit values.
    /// Provides efficient storage and lookup for sorted 40-bit values using
    /// Elias-Fano encoding with cacheline alignment.
    /// </summary>
    public readonly unsafe struct CachelineEfVec : IList<ulong>, IReadOnlyList<ulong>, IDisposable, IRemappingStorage<CachelineEfVec>
    {
        private readonly CachelineEf[] _ef;
        private readonly int _length;


        /// <summary>
        /// Construct a new CachelineEfVec for the given sorted values.
        /// Throws if any cacheline would span too large a range.
        /// </summary>
        public static CachelineEfVec New(ReadOnlySpan<ulong> values)
        {
            return TryNew(values);
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
            get => Index(index);
            set => throw new NotSupportedException("CachelineEfVec is read-only");
        }

        /// <summary>
        /// Number of values stored.
        /// </summary>
        public int Count => _length;

        /// <summary>
        /// The number of values stored (matches Rust len() method).
        /// </summary>
        public int Length => _length;

        /// <summary>
        /// Always true - CachelineEfVec is read-only.
        /// </summary>
        public bool IsReadOnly => true;

        /// <summary>
        /// Get the value at the given index in the vector (matches Rust index() method).
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong Index(int index)
        {
            return _ef[index / CachelineEf.L].Index(index % CachelineEf.L);
        }

        /// <summary>
        /// Get the value at the specified index without bounds checking.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong IndexUnchecked(int index)
        {
            return _ef[index / CachelineEf.L].IndexUnchecked(index % CachelineEf.L);
        }

        /// <summary>
        /// Prefetch the cacheline containing the given element.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void Prefetch(int index)
        {
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
            for (int i = 0; i < _length; i++)
            {
                yield return this[i];
            }
        }

        IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();

        public readonly void Dispose()
        {
            // Nothing to dispose for struct - CachelineEf structs handle their own cleanup
        }

        // IRemappingStorage implementation
        public static CachelineEfVec TryNew(ReadOnlySpan<ulong> values)
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
                    throw new ArgumentException($"Cacheline {i} spans too large a range");
                    
                ef[i] = cacheline.Value;
            }

            return new CachelineEfVec(ef, values.Length);
        }

        public static string Name => "CacheLineEF";
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ulong Index(CachelineEfVec self, int index) => self._ef[index / CachelineEf.L].Index(index % CachelineEf.L);
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void Prefetch(CachelineEfVec self, int index)
        {
            // Prefetch the relevant cacheline - CachelineEf is already cache-aligned
            if (Sse.IsSupported && index < self._length)
            {
                var cachelineIndex = index / CachelineEf.L;
                if (cachelineIndex < self._ef.Length)
                {
                    // Prefetch the cacheline data structure itself
                    unsafe
                    {
                        fixed (CachelineEf* ptr = &self._ef[cachelineIndex])
                        {
                            Sse.Prefetch0(ptr);
                        }
                    }
                }
            }
        }
        
        public static int GetSizeInBytes(CachelineEfVec self)
        {
            // Each CachelineEf is exactly 64 bytes (cache line size)
            return self._ef.Length * 64;
        }
    }
}