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
    public readonly unsafe struct CachelineEfVec : IReadOnlyList<ulong>, IDisposable, IRemappingStorage<CachelineEfVec>
    {
        private readonly CachelineEf[] _ef;
        private readonly int _length;

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

        /// <summary>
        /// Try to construct a new CachelineEfVec for the given sorted values.
        /// Returns false if any cacheline would span too large a range (enables retry with different seeds).
        /// Throws on programmer errors like invalid input format.
        /// </summary>
        public static bool TryNew(ReadOnlySpan<ulong> values, out CachelineEfVec result)
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
                
                if (!CachelineEf.TryNew(chunk, out var cacheline))
                {
                    result = default;
                    return false;
                }
                ef[i] = cacheline;
            }

            result = new CachelineEfVec(ef, values.Length);
            return true;
        }

        public static string Name => "CacheLineEF";
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static nuint Index(CachelineEfVec self, nuint index) => (nuint)self._ef[index / CachelineEf.L].Index((int)(index % CachelineEf.L));
        
        
        public static int GetSizeInBytes(CachelineEfVec self)
        {
            // Each CachelineEf is exactly 64 bytes (cache line size)
            return self._ef.Length * 64;
        }
    }
}