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
        static abstract ulong Index(TSelf self, int index);

        /// <summary>
        /// Prefetch the element at the given index for performance.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        static abstract void Prefetch(TSelf self, int index);

        /// <summary>
        /// Size of the storage in bytes.
        /// </summary>
        static abstract int GetSizeInBytes(TSelf self);

        /// <summary>
        /// Try to create a new instance from the given values.
        /// Throws if the values cannot be efficiently represented.
        /// </summary>
        static abstract TSelf TryNew(ReadOnlySpan<ulong> values);

        /// <summary>
        /// Human-readable name of this storage type.
        /// </summary>
        static abstract string Name { get; }

        /// <summary>
        /// Dispose of any resources held by this storage.
        /// </summary>
        new void Dispose();
    }
}