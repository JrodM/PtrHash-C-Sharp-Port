using System;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Port.Storage
{
    /// <summary>
    /// Unified interface for remapping storage with zero-overhead static dispatch.
    /// Combines the functionality of the previous three interfaces for monomorphic performance.
    /// Corresponds to Rust's Packed trait with compile-time dispatch.
    /// </summary>
    public interface IRemappingStorage<TSelf> : IDisposable
        where TSelf : struct, IRemappingStorage<TSelf>
    {
        /// <summary>
        /// Get the value at the specified index with zero-overhead static dispatch.
        /// This replaces both the instance Index() and static IndexStatic() methods.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        static abstract nuint Index(TSelf self, nuint index);


        /// <summary>
        /// Size of the storage in bytes.
        /// </summary>
        static abstract int GetSizeInBytes(TSelf self);

        /// <summary>
        /// Try to create a new instance from the given values.
        /// Returns false if values cannot be efficiently represented (enables retry with different seeds).
        /// Throws on programmer errors like invalid input format.
        /// </summary>
        static abstract bool TryNew(ReadOnlySpan<ulong> values, out TSelf result);

        /// <summary>
        /// Human-readable name of this storage type.
        /// </summary>
        static abstract string Name { get; }

        /// <summary>
        /// Serialize this storage to a stream.
        /// </summary>
        static abstract void Serialize(TSelf self, System.IO.Stream stream);

        /// <summary>
        /// Deserialize from a stream.
        /// </summary>
        static abstract TSelf Deserialize(System.IO.Stream stream, ulong byteSize);

        /// <summary>
        /// Create from memory-mapped data (zero-copy).
        /// </summary>
        static abstract unsafe TSelf CreateFromMemoryMap(byte* ptr, ulong byteSize);

        /// <summary>
        /// Dispose of any resources held by this storage.
        /// </summary>
        new void Dispose();
    }
}