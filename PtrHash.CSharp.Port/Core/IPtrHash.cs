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
        /// Get the minimal perfect hash index for a single key in [0, n)
        /// </summary>
        nuint GetIndex(TKey key);

        /// <summary>
        /// Get the non-minimal hash index for a single key in [0, max_index)
        /// </summary>
        nuint GetIndexNoRemap(TKey key);

        /// <summary>
        /// Stream lookup with prefetching for maximum throughput
        /// </summary>
        void GetIndicesStream(System.ReadOnlySpan<TKey> keys, System.Span<nuint> results, uint prefetchDistance = 32, bool minimal = true);
    }
}