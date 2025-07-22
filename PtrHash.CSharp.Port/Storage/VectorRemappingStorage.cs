using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Runtime.Intrinsics.X86;

namespace PtrHash.CSharp.Port.Storage
{
    /// <summary>
    /// Simple vector-based remapping storage using aligned native memory for uint values.
    /// Corresponds to Rust's Vec&lt;u32&gt; backing storage.
    /// </summary>
    public unsafe class VectorRemappingStorage : IMutableRemappingStorage
    {
        private readonly uint* _values;
        private readonly int _length;
        private bool _disposed;

        private VectorRemappingStorage(uint* values, int length)
        {
            _values = values;
            _length = length;
        }

        ~VectorRemappingStorage()
        {
            Dispose(false);
        }

        /// <summary>
        /// Create a new VectorRemappingStorage from the given values.
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
            var memory = NativeMemory.AlignedAlloc((nuint)byteSize, 64); // 64-byte aligned
            var ptr = (uint*)memory;
            
            for (int i = 0; i < length; i++)
            {
                ptr[i] = (uint)values[i];
            }
            
            return new VectorRemappingStorage(ptr, length);
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

        public int SizeInBytes => _length * sizeof(uint);

        public static string Name => "Vec<u32>";

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        private void Dispose(bool disposing)
        {
            if (!_disposed && _values != null)
            {
                NativeMemory.AlignedFree(_values);
                _disposed = true;
            }
        }
    }

    /// <summary>
    /// Compact vector-based remapping storage using aligned native memory for ushort values.
    /// More memory efficient for smaller values.
    /// </summary>
    public unsafe class CompactVectorRemappingStorage : IMutableRemappingStorage
    {
        private readonly ushort* _values;
        private readonly int _length;
        private bool _disposed;

        private CompactVectorRemappingStorage(ushort* values, int length)
        {
            _values = values;
            _length = length;
        }

        ~CompactVectorRemappingStorage()
        {
            Dispose(false);
        }

        /// <summary>
        /// Create a new CompactVectorRemappingStorage from the given values.
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
            
            for (int i = 0; i < length; i++)
            {
                ptr[i] = (ushort)values[i];
            }
            
            return new CompactVectorRemappingStorage(ptr, length);
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

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        private void Dispose(bool disposing)
        {
            if (!_disposed && _values != null)
            {
                NativeMemory.AlignedFree(_values);
                _disposed = true;
            }
        }
    }

    /// <summary>
    /// Ultra-compact vector-based remapping storage using aligned native memory for byte values.
    /// Most memory efficient for very small values.
    /// </summary>
    public unsafe class ByteVectorRemappingStorage : IMutableRemappingStorage
    {
        private readonly byte* _values;
        private readonly int _length;
        private bool _disposed;

        public ByteVectorRemappingStorage(ReadOnlySpan<ulong> values)
        {
            var length = values.Length;
            var byteSize = length * sizeof(byte);
            var memory = NativeMemory.AlignedAlloc((nuint)byteSize, 16); // 16-byte aligned
            var ptr = (byte*)memory;
            
            for (int i = 0; i < length; i++)
            {
                if (values[i] > byte.MaxValue)
                    throw new ArgumentException($"Value {values[i]} exceeds byte.MaxValue");
                ptr[i] = (byte)values[i];
            }
            
            _values = ptr;
            _length = length;
        }

        ~ByteVectorRemappingStorage()
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
            return new ByteVectorRemappingStorage(values);
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

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        private void Dispose(bool disposing)
        {
            if (!_disposed && _values != null)
            {
                NativeMemory.AlignedFree(_values);
                _disposed = true;
            }
        }
    }
}