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
        private readonly bool _ownsMemory;

        private UInt64VectorRemappingStorage(ulong* values, int length, bool ownsMemory)
        {
            _values = values;
            _length = length;
            _ownsMemory = ownsMemory;
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
                
                result = new UInt64VectorRemappingStorage(ptr, length, ownsMemory: true);
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

        public static void Serialize(UInt64VectorRemappingStorage self, System.IO.Stream stream)
        {
            unsafe
            {
                var span = new ReadOnlySpan<byte>(self._values, self._length * sizeof(ulong));
                stream.Write(span);
            }
        }

        public static UInt64VectorRemappingStorage Deserialize(System.IO.Stream stream, ulong byteSize)
        {
            var length = (int)(byteSize / sizeof(ulong));
            
            var memory = NativeMemory.AlignedAlloc((nuint)byteSize, 64);
            var ptr = (ulong*)memory;
            
            try
            {
                var buffer = new Span<byte>(ptr, (int)byteSize);
                stream.ReadExactly(buffer);
                
                return new UInt64VectorRemappingStorage(ptr, length, ownsMemory: true);
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                throw;
            }
        }

        public static unsafe UInt64VectorRemappingStorage CreateFromMemoryMap(byte* ptr, ulong byteSize)
        {
            var length = (int)(byteSize / sizeof(ulong));
            return new UInt64VectorRemappingStorage((ulong*)ptr, length, ownsMemory: false);
        }

        /// <summary>
        /// Dispose of the native memory. Must be called explicitly since structs cannot have finalizers.
        /// </summary>
        public readonly void Dispose()
        {
            if (_ownsMemory && _values != null)
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
        private readonly bool _ownsMemory;

        private UInt32VectorRemappingStorage(uint* values, int length, bool ownsMemory)
        {
            _values = values;
            _length = length;
            _ownsMemory = ownsMemory;
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
                
                result = new UInt32VectorRemappingStorage(ptr, length, ownsMemory: true);
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

        public static void Serialize(UInt32VectorRemappingStorage self, System.IO.Stream stream)
        {
            unsafe
            {
                if (self._length == 0)
                    return;
                    
                var span = new ReadOnlySpan<byte>(self._values, self._length * sizeof(uint));
                stream.Write(span);
            }
        }

        public static UInt32VectorRemappingStorage Deserialize(System.IO.Stream stream, ulong byteSize)
        {
            if (byteSize == 0)
            {
                return new UInt32VectorRemappingStorage(null, 0, ownsMemory: false);
            }
            
            var length = (int)(byteSize / sizeof(uint));
            
            // Check if stream has enough data
            if (stream.CanSeek)
            {
                var remainingBytes = stream.Length - stream.Position;
                if ((ulong)remainingBytes < byteSize)
                {
                    throw new InvalidOperationException($"Stream does not have enough data. Need {byteSize} bytes but only {remainingBytes} remaining.");
                }
            }
            
            var memory = NativeMemory.AlignedAlloc((nuint)byteSize, 64);
            var ptr = (uint*)memory;
            
            try
            {
                var buffer = new Span<byte>(ptr, (int)byteSize);
                stream.ReadExactly(buffer);
                
                return new UInt32VectorRemappingStorage(ptr, length, ownsMemory: true);
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                throw;
            }
        }

        public static unsafe UInt32VectorRemappingStorage CreateFromMemoryMap(byte* ptr, ulong byteSize)
        {
            var length = (int)(byteSize / sizeof(uint));
            return new UInt32VectorRemappingStorage((uint*)ptr, length, ownsMemory: false);
        }

        /// <summary>
        /// Dispose of the native memory. Must be called explicitly since structs cannot have finalizers.
        /// </summary>
        public readonly void Dispose()
        {
            if (_ownsMemory && _values != null)
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
        private readonly bool _ownsMemory;

        private UShort16VectorRemappingStorage(ushort* values, int length, bool ownsMemory)
        {
            _values = values;
            _length = length;
            _ownsMemory = ownsMemory;
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
                
                result = new UShort16VectorRemappingStorage(ptr, length, ownsMemory: true);
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

        public static void Serialize(UShort16VectorRemappingStorage self, System.IO.Stream stream)
        {
            unsafe
            {
                var span = new ReadOnlySpan<byte>(self._values, self._length * sizeof(ushort));
                stream.Write(span);
            }
        }

        public static UShort16VectorRemappingStorage Deserialize(System.IO.Stream stream, ulong byteSize)
        {
            var length = (int)(byteSize / sizeof(ushort));
            
            var memory = NativeMemory.AlignedAlloc((nuint)byteSize, 32);
            var ptr = (ushort*)memory;
            
            try
            {
                var buffer = new Span<byte>(ptr, (int)byteSize);
                stream.ReadExactly(buffer);
                
                return new UShort16VectorRemappingStorage(ptr, length, ownsMemory: true);
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                throw;
            }
        }

        public static unsafe UShort16VectorRemappingStorage CreateFromMemoryMap(byte* ptr, ulong byteSize)
        {
            var length = (int)(byteSize / sizeof(ushort));
            return new UShort16VectorRemappingStorage((ushort*)ptr, length, ownsMemory: false);
        }

        /// <summary>
        /// Dispose of the native memory. Must be called explicitly since structs cannot have finalizers.
        /// </summary>
        public readonly void Dispose()
        {
            if (_ownsMemory && _values != null)
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
        private readonly bool _ownsMemory;

        private Byte8VectorRemappingStorage(byte* values, int length, bool ownsMemory)
        {
            _values = values;
            _length = length;
            _ownsMemory = ownsMemory;
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
                
                result = new Byte8VectorRemappingStorage(ptr, length, ownsMemory: true);
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

        public static void Serialize(Byte8VectorRemappingStorage self, System.IO.Stream stream)
        {
            unsafe
            {
                var span = new ReadOnlySpan<byte>(self._values, self._length);
                stream.Write(span);
            }
        }

        public static Byte8VectorRemappingStorage Deserialize(System.IO.Stream stream, ulong byteSize)
        {
            var length = (int)byteSize; // For byte storage, byteSize == length
            
            var memory = NativeMemory.AlignedAlloc((nuint)byteSize, 16);
            var ptr = (byte*)memory;
            
            try
            {
                var buffer = new Span<byte>(ptr, (int)byteSize);
                stream.ReadExactly(buffer);
                
                return new Byte8VectorRemappingStorage(ptr, length, ownsMemory: true);
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                throw;
            }
        }

        public static unsafe Byte8VectorRemappingStorage CreateFromMemoryMap(byte* ptr, ulong byteSize)
        {
            var length = (int)byteSize; // For byte storage, byteSize == length
            return new Byte8VectorRemappingStorage(ptr, length, ownsMemory: false);
        }

        /// <summary>
        /// Dispose of the native memory. Must be called explicitly since structs cannot have finalizers.
        /// </summary>
        public readonly void Dispose()
        {
            if (_ownsMemory && _values != null)
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
        private readonly bool _ownsMemory;

        private CachelineEfVec(CachelineEf* ef, int numCachelines, int length, bool ownsMemory)
        {
            _ef = ef;
            _numCachelines = numCachelines;
            _length = length;
            _ownsMemory = ownsMemory;
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

        public static void Serialize(CachelineEfVec self, System.IO.Stream stream)
        {
            unsafe
            {
                var span = new ReadOnlySpan<byte>(self._ef, self._numCachelines * sizeof(CachelineEf));
                stream.Write(span);
            }
        }

        public static CachelineEfVec Deserialize(System.IO.Stream stream, ulong byteSize)
        {
            // ByteSize is the total bytes, calculate cachelines
            var numCachelines = (int)(byteSize / (ulong)sizeof(CachelineEf));
            // Calculate the actual number of values (L values per cacheline)
            var length = numCachelines * CachelineEf.L;
            
            var memory = NativeMemory.AlignedAlloc((nuint)byteSize, 64);
            var ptr = (CachelineEf*)memory;
            
            try
            {
                var buffer = new Span<byte>(ptr, (int)byteSize);
                stream.ReadExactly(buffer);
                
                return new CachelineEfVec(ptr, numCachelines, length, ownsMemory: true);
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                throw;
            }
        }

        public static unsafe CachelineEfVec CreateFromMemoryMap(byte* ptr, ulong byteSize)
        {
            // ByteSize is the total bytes, calculate cachelines
            var numCachelines = (int)(byteSize / (ulong)sizeof(CachelineEf));
            // Calculate the actual number of values (L values per cacheline)
            var length = numCachelines * CachelineEf.L;
            return new CachelineEfVec((CachelineEf*)ptr, numCachelines, length, ownsMemory: false);
        }

        /// <summary>
        /// Dispose of the native memory. Must be called explicitly since structs cannot have finalizers.
        /// </summary>
        public readonly void Dispose()
        {
            if (_ownsMemory && _ef != null)
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

                result = new CachelineEfVec(ptr, numCachelines, values.Length, ownsMemory: true);
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