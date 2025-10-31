using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using Microsoft.Win32.SafeHandles;
using PtrHash.CSharp.Port.Core;

namespace PtrHash.CSharp.Port.Storage
{
    /// <summary>
    /// Vector-based remapping storage using aligned native memory for ulong values.
    /// Corresponds to Rust's Vec&lt;u64&gt; backing storage.
    /// WARNING: This struct manages unmanaged memory and must be explicitly disposed!
    /// </summary>
    public unsafe struct UInt64VectorRemappingStorage : IRemappingStorage<UInt64VectorRemappingStorage>
    {
        private readonly ulong* _values;
        private readonly int _length;

        private UInt64VectorRemappingStorage(ulong* values, int length)
        {
            _values = values;
            _length = length;
        }

        /// <summary>
        /// Try to create a new UInt64VectorRemappingStorage from the given values.
        /// Returns false if allocation fails (enables retry with different seeds).
        /// Throws on programmer errors like invalid input format.
        /// </summary>
        public static bool TryNew(ReadOnlySpan<ulong> values, out UInt64VectorRemappingStorage result)
        {
            var length = values.Length;
            var byteSize = length * sizeof(ulong);
            
            var memory = NativeMemory.AlignedAlloc((nuint)byteSize, 64);
            var ptr = (ulong*)memory;
            
            try
            {
                for (int i = 0; i < length; i++)
                {
                    ptr[i] = values[i];
                }
                
                result = new UInt64VectorRemappingStorage(ptr, length);
                return true;
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                result = default;
                return false;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static nuint Index(UInt64VectorRemappingStorage self, nuint index)
        {
            return (nuint)self._values[index];
        }


        public static int GetSizeInBytes(UInt64VectorRemappingStorage self) => self._length * sizeof(ulong);

        public static string Name => "Vec<u64>";

        /// <summary>
        /// Dispose of the native memory. Must be called explicitly since structs cannot have finalizers.
        /// </summary>
        public readonly void Dispose()
        {
            if (_values != null)
            {
                NativeMemory.AlignedFree(_values);
            }
        }
    }

    /// <summary>
    /// Simple vector-based remapping storage using aligned native memory for uint values.
    /// Corresponds to Rust's Vec&lt;u32&gt; backing storage.
    /// WARNING: This struct manages unmanaged memory and must be explicitly disposed!
    /// </summary>
    public unsafe struct UInt32VectorRemappingStorage : IRemappingStorage<UInt32VectorRemappingStorage>
    {
        private readonly uint* _values;
        private readonly int _length;

        private UInt32VectorRemappingStorage(uint* values, int length)
        {
            _values = values;
            _length = length;
        }

        /// <summary>
        /// Try to create a new UInt32VectorRemappingStorage from the given values.
        /// Returns false if any value exceeds uint.MaxValue (enables retry with different seeds).
        /// Throws on programmer errors like invalid input format.
        /// </summary>
        public static bool TryNew(ReadOnlySpan<ulong> values, out UInt32VectorRemappingStorage result)
        {
            for (int i = 0; i < values.Length; i++)
            {
                if (values[i] > uint.MaxValue)
                {
                    result = default;
                    return false;
                }
            }

            var length = values.Length;
            var byteSize = length * sizeof(uint);
            
            var memory = NativeMemory.AlignedAlloc((nuint)byteSize, 64);
            var ptr = (uint*)memory;
            
            try
            {
                for (int i = 0; i < length; i++)
                {
                    ptr[i] = (uint)values[i];
                }
                
                result = new UInt32VectorRemappingStorage(ptr, length);
                return true;
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                result = default;
                return false;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static nuint Index(UInt32VectorRemappingStorage self, nuint index)
        {
            return (nuint)self._values[index];
        }


        public static int GetSizeInBytes(UInt32VectorRemappingStorage self) => self._length * sizeof(uint);

        public static string Name => "Vec<u32>";

        /// <summary>
        /// Dispose of the native memory. Must be called explicitly since structs cannot have finalizers.
        /// </summary>
        public readonly void Dispose()
        {
            if (_values != null)
            {
                NativeMemory.AlignedFree(_values);
            }
        }
    }

    /// <summary>
    /// Compact vector-based remapping storage using aligned native memory for ushort values.
    /// More memory efficient for smaller values.
    /// WARNING: This struct manages unmanaged memory and must be explicitly disposed!
    /// </summary>
    public unsafe struct UShort16VectorRemappingStorage : IRemappingStorage<UShort16VectorRemappingStorage>
    {
        private readonly ushort* _values;
        private readonly int _length;

        private UShort16VectorRemappingStorage(ushort* values, int length)
        {
            _values = values;
            _length = length;
        }

        /// <summary>
        /// Try to create a new UShort16VectorRemappingStorage from the given values.
        /// Returns false if any value exceeds ushort.MaxValue (enables retry with different seeds).
        /// Throws on programmer errors like invalid input format.
        /// </summary>
        public static bool TryNew(ReadOnlySpan<ulong> values, out UShort16VectorRemappingStorage result)
        {
            for (int i = 0; i < values.Length; i++)
            {
                if (values[i] > ushort.MaxValue)
                {
                    result = default;
                    return false;
                }
            }

            var length = values.Length;
            var byteSize = length * sizeof(ushort);
            var memory = NativeMemory.AlignedAlloc((nuint)byteSize, 32); // 32-byte aligned
            var ptr = (ushort*)memory;
            
            try
            {
                for (int i = 0; i < length; i++)
                {
                    ptr[i] = (ushort)values[i];
                }
                
                result = new UShort16VectorRemappingStorage(ptr, length);
                return true;
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                result = default;
                return false;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static nuint Index(UShort16VectorRemappingStorage self, nuint index)
        {
            return (nuint)self._values[index];
        }


        public static int GetSizeInBytes(UShort16VectorRemappingStorage self) => self._length * sizeof(ushort);

        public static string Name => "Vec<u16>";

        /// <summary>
        /// Dispose of the native memory. Must be called explicitly since structs cannot have finalizers.
        /// </summary>
        public readonly void Dispose()
        {
            if (_values != null)
            {
                NativeMemory.AlignedFree(_values);
            }
        }
    }

    /// <summary>
    /// Ultra-compact vector-based remapping storage using aligned native memory for byte values.
    /// Most memory efficient for very small values.
    /// WARNING: This struct manages unmanaged memory and must be explicitly disposed!
    /// </summary>
    public unsafe struct Byte8VectorRemappingStorage : IRemappingStorage<Byte8VectorRemappingStorage>
    {
        private readonly byte* _values;
        private readonly int _length;

        private Byte8VectorRemappingStorage(byte* values, int length)
        {
            _values = values;
            _length = length;
        }

        /// <summary>
        /// Try to create a new Byte8VectorRemappingStorage from the given values.
        /// Returns false if any value exceeds byte.MaxValue (enables retry with different seeds).
        /// Throws on programmer errors like invalid input format.
        /// </summary>
        public static bool TryNew(ReadOnlySpan<ulong> values, out Byte8VectorRemappingStorage result)
        {
            var length = values.Length;
            var byteSize = length * sizeof(byte);
            var memory = NativeMemory.AlignedAlloc((nuint)byteSize, 16); // 16-byte aligned
            var ptr = (byte*)memory;
            
            try
            {
                for (int i = 0; i < length; i++)
                {
                    if (values[i] > byte.MaxValue)
                    {
                        if (memory != null)
                            NativeMemory.AlignedFree(memory);
                        result = default;
                        return false;
                    }
                    ptr[i] = (byte)values[i];
                }
                
                result = new Byte8VectorRemappingStorage(ptr, length);
                return true;
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                result = default;
                return false;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static nuint Index(Byte8VectorRemappingStorage self, nuint index)
        {
            return (nuint)self._values[index];
        }


        public static int GetSizeInBytes(Byte8VectorRemappingStorage self) => self._length * sizeof(byte);

        public static string Name => "Vec<u8>";

        /// <summary>
        /// Dispose of the native memory. Must be called explicitly since structs cannot have finalizers.
        /// </summary>
        public readonly void Dispose()
        {
            if (_values != null)
            {
                NativeMemory.AlignedFree(_values);
            }
        }
    }

    /// <summary>
    /// A vector of CachelineEf that implements IRemappingStorage for 64-bit values.
    /// Provides efficient storage and lookup for sorted 40-bit values using
    /// Elias-Fano encoding with cacheline alignment.
    /// Uses native memory for maximum performance.
    /// WARNING: This struct manages unmanaged memory and must be explicitly disposed!
    /// </summary>
    public readonly unsafe struct CachelineEfVec : IRemappingStorage<CachelineEfVec>
    {
        private readonly CachelineEf* _ef;
        private readonly int _numCachelines;
        private readonly int _length;

        private CachelineEfVec(CachelineEf* ef, int numCachelines, int length)
        {
            _ef = ef;
            _numCachelines = numCachelines;
            _length = length;
        }

        /// <summary>
        /// Static method for IRemappingStorage interface
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static nuint Index(CachelineEfVec self, nuint index)
        {
            if (self._length == 0)
                return 0;
            
            return (nuint)self._ef[index / CachelineEf.L].Index((int)(index % CachelineEf.L));
        }
        
        /// <summary>
        /// Static method for IRemappingStorage interface
        /// </summary>
        public static int GetSizeInBytes(CachelineEfVec self) => self._numCachelines * sizeof(CachelineEf);
        
        /// <summary>
        /// Name for diagnostics
        /// </summary>
        public static string Name => "CacheLineEF";

        /// <summary>
        /// Dispose of the native memory. Must be called explicitly since structs cannot have finalizers.
        /// </summary>
        public readonly void Dispose()
        {
            if (_ef != null)
            {
                NativeMemory.AlignedFree(_ef);
            }
        }

        /// <summary>
        /// Try to construct a new CachelineEfVec for the given sorted values.
        /// Returns false if any cacheline would span too large a range (enables retry with different seeds).
        /// Throws on programmer errors like invalid input format.
        /// </summary>
        public static bool TryNew(ReadOnlySpan<ulong> values, out CachelineEfVec result)
        {
            var numCachelines = (values.Length + CachelineEf.L - 1) / CachelineEf.L;
            var byteSize = numCachelines * sizeof(CachelineEf);
            
            var memory = NativeMemory.AlignedAlloc((nuint)byteSize, 64);
            var ptr = (CachelineEf*)memory;
            
            try
            {
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
                    ptr[i] = cacheline;
                }

                result = new CachelineEfVec(ptr, numCachelines, values.Length);
                return true;
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                result = default;
                return false;
            }
        }
    }
}