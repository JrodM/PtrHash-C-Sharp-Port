using System;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Port.Storage
{
    /// <summary>
    /// Simple vector-based remapping storage using uint arrays.
    /// Corresponds to Rust's Vec&lt;u32&gt; backing storage.
    /// </summary>
    public class VectorRemappingStorage : IMutableRemappingStorage
    {
        private readonly uint[] _values;

        private VectorRemappingStorage(uint[] values)
        {
            _values = values;
        }

        /// <summary>
        /// Create a new VectorRemappingStorage from the given values.
        /// Always succeeds as it can represent any uint values.
        /// </summary>
        public static IMutableRemappingStorage? TryNew(ReadOnlySpan<ulong> values)
        {
            var array = new uint[values.Length];
            for (int i = 0; i < values.Length; i++)
            {
                if (values[i] > uint.MaxValue)
                    return null; // Value too large for uint backing
                array[i] = (uint)values[i];
            }
            return new VectorRemappingStorage(array);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong Index(int index)
        {
            return _values[index];
        }

        public void Prefetch(int index)
        {
            // Arrays are already in memory, no special prefetch needed
        }

        public int SizeInBytes => _values.Length * sizeof(uint);

        public static string Name => "Vec<u32>";

        public void Dispose()
        {
            // Managed arrays don't require disposal
        }
    }

    /// <summary>
    /// Compact vector-based remapping storage using ushort arrays.
    /// More memory efficient for smaller values.
    /// </summary>
    public class CompactVectorRemappingStorage : IMutableRemappingStorage
    {
        private readonly ushort[] _values;

        private CompactVectorRemappingStorage(ushort[] values)
        {
            _values = values;
        }

        /// <summary>
        /// Create a new CompactVectorRemappingStorage from the given values.
        /// Returns null if any value exceeds ushort.MaxValue.
        /// </summary>
        public static IMutableRemappingStorage? TryNew(ReadOnlySpan<ulong> values)
        {
            var array = new ushort[values.Length];
            for (int i = 0; i < values.Length; i++)
            {
                if (values[i] > ushort.MaxValue)
                    return null; // Value too large for ushort backing
                array[i] = (ushort)values[i];
            }
            return new CompactVectorRemappingStorage(array);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong Index(int index)
        {
            return _values[index];
        }

        public void Prefetch(int index)
        {
            // Arrays are already in memory, no special prefetch needed
        }

        public int SizeInBytes => _values.Length * sizeof(ushort);

        public static string Name => "Vec<u16>";

        public void Dispose()
        {
            // Managed arrays don't require disposal
        }
    }

    /// <summary>
    /// Ultra-compact vector-based remapping storage using byte arrays.
    /// Most memory efficient for very small values.
    /// </summary>
    public class ByteVectorRemappingStorage : IMutableRemappingStorage
    {
        private readonly byte[] _values;

        public ByteVectorRemappingStorage(ReadOnlySpan<ulong> values)
        {
            _values = new byte[values.Length];
            for (int i = 0; i < values.Length; i++)
            {
                if (values[i] > byte.MaxValue)
                    throw new ArgumentException($"Value {values[i]} exceeds byte.MaxValue");
                _values[i] = (byte)values[i];
            }
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
            // Arrays are already in memory, no special prefetch needed
        }

        public int SizeInBytes => _values.Length * sizeof(byte);

        public static string Name => "Vec<u8>";

        public void Dispose()
        {
            // Managed arrays don't require disposal
        }
    }
}