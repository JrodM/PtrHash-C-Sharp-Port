using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics.X86;
using Microsoft.Win32.SafeHandles;
using PtrHash.CSharp.Port.Core;

namespace PtrHash.CSharp.Port.Storage
{
    /// <summary>
    /// Simple vector-based remapping storage using aligned native memory for uint values.
    /// Corresponds to Rust's Vec&lt;u32&gt; backing storage.
    /// </summary>
    public unsafe class UInt32VectorRemappingStorage : IRemappingStorage<UInt32VectorRemappingStorage>
    {
        private uint* _values;
        private readonly int _length;
        private bool _disposed;

        private UInt32VectorRemappingStorage(uint* values, int length)
        {
            _values = values;
            _length = length;
        }

        ~UInt32VectorRemappingStorage()
        {
            Dispose(false);
        }

        /// <summary>
        /// Create a new UInt32VectorRemappingStorage from the given values.
        /// Always succeeds as it can represent any uint values.
        /// </summary>
        public static IMutableRemappingStorage? TryNew(ReadOnlySpan<ulong> values)
        {
            for (int i = 0; i < values.Length; i++)
            {
                if (values[i] > uint.MaxValue)
                    return null; // Value too large for uint backing
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
        public ulong Index(int index)
        {
            return _values[index];
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void Prefetch(int index)
        {
            // Native memory prefetch using software prefetch hint
            if (Sse.IsSupported && index < _length)
            {
                Sse.Prefetch0(&_values[index]);
            }
        }

        public int SizeInBytes => _length * sizeof(uint);

        public static string Name => "Vec<u32>";

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ulong IndexStatic(UInt32VectorRemappingStorage self, int index) => self._values[index];

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        private void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (_values != null)
                {
                    NativeMemory.AlignedFree(_values);
                    _values = null;
                }
                _disposed = true;
            }
        }
    }

    /// <summary>
    /// Compact vector-based remapping storage using aligned native memory for ushort values.
    /// More memory efficient for smaller values.
    /// </summary>
    public unsafe class UShort16VectorRemappingStorage : IStaticRemappingStorage<UShort16VectorRemappingStorage>
    {
        private ushort* _values;
        private readonly int _length;
        private bool _disposed;

        private UShort16VectorRemappingStorage(ushort* values, int length)
        {
            _values = values;
            _length = length;
        }

        ~UShort16VectorRemappingStorage()
        {
            Dispose(false);
        }

        /// <summary>
        /// Create a new UShort16VectorRemappingStorage from the given values.
        /// Returns null if any value exceeds ushort.MaxValue.
        /// </summary>
        public static IMutableRemappingStorage? TryNew(ReadOnlySpan<ulong> values)
        {
            for (int i = 0; i < values.Length; i++)
            {
                if (values[i] > ushort.MaxValue)
                    return null; // Value too large for ushort backing
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
        public ulong Index(int index)
        {
            return _values[index];
        }

        public void Prefetch(int index)
        {
            // Native memory prefetch using software prefetch hint
            if (Sse.IsSupported && index < _length)
            {
                Sse.Prefetch0(&_values[index]);
            }
        }

        public int SizeInBytes => _length * sizeof(ushort);

        public static string Name => "Vec<u16>";
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ulong IndexStatic(UShort16VectorRemappingStorage self, int index) => self._values[index];

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        private void Dispose(bool disposing)
        {
            var ptr = System.Threading.Interlocked.Exchange(ref _values, null);
            if (ptr != null)
            {
                NativeMemory.AlignedFree(ptr);
                _disposed = true;
            }
        }
    }

    /// <summary>
    /// Ultra-compact vector-based remapping storage using aligned native memory for byte values.
    /// Most memory efficient for very small values.
    /// </summary>
    public unsafe class Byte8VectorRemappingStorage : IStaticRemappingStorage<Byte8VectorRemappingStorage>
    {
        private byte* _values;
        private readonly int _length;
        private bool _disposed;

        public Byte8VectorRemappingStorage(ReadOnlySpan<ulong> values)
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
                
                _values = ptr;
                _length = length;
            }
            catch
            {
                if (memory != null)
                    NativeMemory.AlignedFree(memory);
                throw;
            }
        }

        ~Byte8VectorRemappingStorage()
        {
            Dispose(false);
        }

        public static IMutableRemappingStorage? TryNew(ReadOnlySpan<ulong> values)
        {
            for (int i = 0; i < values.Length; i++)
            {
                if (values[i] > byte.MaxValue)
                    return null;
            }
            return new Byte8VectorRemappingStorage(values);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong Index(int index)
        {
            return _values[index];
        }

        public void Prefetch(int index)
        {
            // Native memory prefetch using software prefetch hint
            if (Sse.IsSupported && index < _length)
            {
                Sse.Prefetch0(&_values[index]);
            }
        }

        public int SizeInBytes => _length * sizeof(byte);

        public static string Name => "Vec<u8>";
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ulong IndexStatic(Byte8VectorRemappingStorage self, int index) => self._values[index];

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        private void Dispose(bool disposing)
        {
            var ptr = System.Threading.Interlocked.Exchange(ref _values, null);
            if (ptr != null)
            {
                NativeMemory.AlignedFree(ptr);
                _disposed = true;
            }
        }
    }
}