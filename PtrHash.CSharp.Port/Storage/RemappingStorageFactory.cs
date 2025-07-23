using System;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Port.Collections;

namespace PtrHash.CSharp.Port.Storage
{
    /// <summary>
    /// Factory for creating optimal remapping storage based on data characteristics.
    /// Matches Rust's automatic selection of backing storage types.
    /// </summary>
    public static class RemappingStorageFactory
    {
        /// <summary>
        /// Create the most space-efficient remapping storage for the given values.
        /// Tries storage types in order of space efficiency:
        /// 1. CachelineEfVec - Most compact for sparse sorted values
        /// 2. CompactUInt32VectorRemappingStorage - For values that fit in ushort
        /// 3. UInt32VectorRemappingStorage - For values that fit in uint
        /// 4. Falls back to large vector if needed
        /// </summary>
        public static IMutableRemappingStorage CreateOptimal(ReadOnlySpan<ulong> values)
        {
            // Try CachelineEfVec first for maximum compression
            var cachelineEf = CachelineEfVec.TryNew(values);
            if (cachelineEf != null)
                return cachelineEf;

            // Try compact vector storage (16-bit values)
            var compactVector = UShort16VectorRemappingStorage.TryNew(values);
            if (compactVector != null)
                return compactVector;

            // Try standard vector storage (32-bit values)  
            var standardVector = UInt32VectorRemappingStorage.TryNew(values);
            if (standardVector != null)
                return standardVector;

            // Fall back to 64-bit vector (should always succeed)
            return CreateLargeVector(values);
        }

        /// <summary>
        /// Create a specific type of remapping storage.
        /// </summary>
        public static IMutableRemappingStorage? CreateSpecific<T>(ReadOnlySpan<ulong> values)
            where T : IMutableRemappingStorage
        {
            return T.TryNew(values);
        }

        /// <summary>
        /// Create CachelineEfVec storage specifically.
        /// </summary>
        public static CachelineEfVec? CreateCachelineEf(ReadOnlySpan<ulong> values)
        {
            return CachelineEfVec.TryNew(values);
        }

        /// <summary>
        /// Create standard uint vector storage.
        /// </summary>
        public static UInt32VectorRemappingStorage? CreateVector(ReadOnlySpan<ulong> values)
        {
            return UInt32VectorRemappingStorage.TryNew(values) as UInt32VectorRemappingStorage;
        }

        /// <summary>
        /// Create 64-bit vector storage (fallback that always works).
        /// </summary>
        private static IMutableRemappingStorage CreateLargeVector(ReadOnlySpan<ulong> values)
        {
            var array = new ulong[values.Length];
            values.CopyTo(array);
            return new ULong64VectorRemappingStorage(array);
        }
    }

    /// <summary>
    /// 64-bit vector storage - always works but uses more memory.
    /// </summary>
    internal class ULong64VectorRemappingStorage : IStaticRemappingStorage<ULong64VectorRemappingStorage>
    {
        private readonly ulong[] _values;

        internal ULong64VectorRemappingStorage(ulong[] values)
        {
            _values = values;
        }

        public static IMutableRemappingStorage? TryNew(ReadOnlySpan<ulong> values)
        {
            var array = new ulong[values.Length];
            values.CopyTo(array);
            return new ULong64VectorRemappingStorage(array);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong Index(int index) => _values[index];
        public void Prefetch(int index) { }
        public int SizeInBytes => _values.Length * sizeof(ulong);
        public static string Name => "Vec<u64>";
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ulong IndexStatic(ULong64VectorRemappingStorage self, int index) => self._values[index];

        public void Dispose()
        {
            // Managed arrays don't require disposal
        }
    }
}