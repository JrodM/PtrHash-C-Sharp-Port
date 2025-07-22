using System;

namespace PtrHash.CSharp.Port.Storage
{
    /// <summary>
    /// Interface for remapping storage used in PtrHash.
    /// Corresponds to Rust's Packed trait.
    /// </summary>
    public interface IRemappingStorage : IDisposable
    {
        /// <summary>
        /// Get the value at the given index (uses unchecked access internally).
        /// </summary>
        ulong Index(int index);

        /// <summary>
        /// Prefetch the element at the given index for performance.
        /// </summary>
        void Prefetch(int index);

        /// <summary>
        /// Size of the storage in bytes.
        /// </summary>
        int SizeInBytes { get; }
    }

    /// <summary>
    /// Interface for mutable remapping storage that can be constructed.
    /// Corresponds to Rust's MutPacked trait.
    /// </summary>
    public interface IMutableRemappingStorage : IRemappingStorage
    {
        /// <summary>
        /// Try to create a new instance from the given values.
        /// Returns null if the values cannot be efficiently represented.
        /// </summary>
        static abstract IMutableRemappingStorage? TryNew(ReadOnlySpan<ulong> values);

        /// <summary>
        /// Human-readable name of this storage type.
        /// </summary>
        static abstract string Name { get; }
    }
}