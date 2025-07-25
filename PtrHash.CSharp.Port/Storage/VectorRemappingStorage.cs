using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics.X86;
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
        /// Create a new UInt64VectorRemappingStorage from the given values.
        /// Throws if allocation fails.
        /// </summary>
        public static UInt64VectorRemappingStorage TryNew(ReadOnlySpan<ulong> values)
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
                
                return new UInt64VectorRemappingStorage(ptr, length);
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                throw;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ulong Index(UInt64VectorRemappingStorage self, int index)
        {
            return self._values[index];
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void Prefetch(UInt64VectorRemappingStorage self, int index)
        {
            // Native memory prefetch using software prefetch hint
            if (Sse.IsSupported && index < self._length)
            {
                Sse.Prefetch0(&self._values[index]);
            }
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
        /// Create a new UInt32VectorRemappingStorage from the given values.
        /// Throws if any value exceeds uint.MaxValue.
        /// </summary>
        public static UInt32VectorRemappingStorage TryNew(ReadOnlySpan<ulong> values)
        {
            for (int i = 0; i < values.Length; i++)
            {
                if (values[i] > uint.MaxValue)
                    throw new ArgumentException($"Value {values[i]} exceeds uint.MaxValue");
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
                
                return new UInt32VectorRemappingStorage(ptr, length);
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                throw;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ulong Index(UInt32VectorRemappingStorage self, int index)
        {
            return self._values[index];
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void Prefetch(UInt32VectorRemappingStorage self, int index)
        {
            // Native memory prefetch using software prefetch hint
            if (Sse.IsSupported && index < self._length)
            {
                Sse.Prefetch0(&self._values[index]);
            }
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
        /// Create a new UShort16VectorRemappingStorage from the given values.
        /// Throws if any value exceeds ushort.MaxValue.
        /// </summary>
        public static UShort16VectorRemappingStorage TryNew(ReadOnlySpan<ulong> values)
        {
            for (int i = 0; i < values.Length; i++)
            {
                if (values[i] > ushort.MaxValue)
                    throw new ArgumentException($"Value {values[i]} exceeds ushort.MaxValue");
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
                
                return new UShort16VectorRemappingStorage(ptr, length);
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                throw;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ulong Index(UShort16VectorRemappingStorage self, int index)
        {
            return self._values[index];
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void Prefetch(UShort16VectorRemappingStorage self, int index)
        {
            // Native memory prefetch using software prefetch hint
            if (Sse.IsSupported && index < self._length)
            {
                Sse.Prefetch0(&self._values[index]);
            }
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

        public static Byte8VectorRemappingStorage TryNew(ReadOnlySpan<ulong> values)
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
                        throw new ArgumentException($"Value {values[i]} exceeds byte.MaxValue");
                    ptr[i] = (byte)values[i];
                }
                
                return new Byte8VectorRemappingStorage(ptr, length);
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                throw;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ulong Index(Byte8VectorRemappingStorage self, int index)
        {
            return self._values[index];
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void Prefetch(Byte8VectorRemappingStorage self, int index)
        {
            // Native memory prefetch using software prefetch hint
            if (Sse.IsSupported && index < self._length)
            {
                Sse.Prefetch0(&self._values[index]);
            }
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
}