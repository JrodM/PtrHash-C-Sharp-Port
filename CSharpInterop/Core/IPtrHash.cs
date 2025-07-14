using System;

namespace PtrHash.Core
{
    /// <summary>
    /// Base interface for all PtrHash implementations with full functionality
    /// </summary>
    public interface IPtrHash<TKey> : IDisposable
    {
        /// <summary>
        /// Get information about this hash function
        /// </summary>
        PtrHashInfo GetInfo();

        /// <summary>
        /// Get the minimal perfect hash index for a single key
        /// </summary>
        nuint GetIndex(TKey key);

        /// <summary>
        /// Get the non-minimal hash index for a single key (may be >= n)
        /// </summary>
        nuint GetIndexNoRemap(TKey key);

        /// <summary>
        /// Batch lookup multiple keys with zero-copy operation
        /// </summary>
        void GetIndicesBatch(ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal = true);

        /// <summary>
        /// Stream lookup with prefetching for maximum throughput
        /// </summary>
        void GetIndicesStream(ReadOnlySpan<TKey> keys, Span<nuint> results, uint prefetchDistance = 32, bool minimal = true);
    }
}