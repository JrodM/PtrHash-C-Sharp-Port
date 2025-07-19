namespace PtrHash.CSharp.Port.Core
{
    /// <summary>
    /// Interface for PtrHash minimal perfect hash function
    /// </summary>
    /// <typeparam name="TKey">Type of keys to hash</typeparam>
    public interface IPtrHash<TKey> : System.IDisposable
    {
        /// <summary>
        /// Get information about this hash function
        /// </summary>
        PtrHashInfo GetInfo();

        /// <summary>
        /// Get the minimal perfect hash index for a single key in [0, n) - auto-chooses optimal implementation
        /// </summary>
        nuint GetIndex(TKey key);

        /// <summary>
        /// Get the minimal perfect hash index for a single key in [0, n) using multi-part implementation
        /// </summary>
        nuint GetIndexMultiPart(TKey key);

        /// <summary>
        /// Get the minimal perfect hash index for a single key in [0, n) using single-part implementation
        /// </summary>
        nuint GetIndexSinglePart(TKey key);

        /// <summary>
        /// Get the non-minimal hash index for a single key in [0, max_index) - auto-chooses optimal implementation
        /// </summary>
        nuint GetIndexNoRemap(TKey key);

        /// <summary>
        /// Get the non-minimal hash index for a single key in [0, max_index) using multi-part implementation
        /// </summary>
        nuint GetIndexNoRemapMultiPart(TKey key);

        /// <summary>
        /// Get the non-minimal hash index for a single key in [0, max_index) using single-part implementation
        /// </summary>
        nuint GetIndexNoRemapSinglePart(TKey key);

        /// <summary>
        /// Stream lookup with prefetching for maximum throughput - auto-chooses optimal implementation
        /// </summary>
        void GetIndicesStream(System.ReadOnlySpan<TKey> keys, System.Span<nuint> results, bool minimal = true);

        /// <summary>
        /// Stream lookup using multi-part implementation
        /// </summary>
        void GetIndicesStreamMultiPart(System.ReadOnlySpan<TKey> keys, System.Span<nuint> results, bool minimal = true);

        /// <summary>
        /// Stream lookup using single-part implementation
        /// </summary>
        void GetIndicesStreamSinglePart(System.ReadOnlySpan<TKey> keys, System.Span<nuint> results, bool minimal = true);
    }
}