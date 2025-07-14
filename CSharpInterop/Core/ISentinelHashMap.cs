using System;

namespace PtrHash.Core
{
    public struct SentinelPerformanceInfo
    {
        public bool SupportsSimd { get; init; }
        public int VectorWidth { get; init; }
        public object SentinelValue { get; init; }
        public int ValuesArrayLength { get; init; }
    }
    /// <summary>
    /// Interface for sentinel-based hash maps that return values directly
    /// </summary>
    public interface ISentinelHashMap<TKey, TValue> : IDisposable
    {
        /// <summary>
        /// The sentinel value returned for keys not found
        /// </summary>
        TValue Sentinel { get; }

        /// <summary>
        /// Try to get a value for a single key
        /// </summary>
        bool TryGetValue(TKey key, out TValue value);

        /// <summary>
        /// Get values for multiple keys using streaming with prefetching
        /// </summary>
        void TryGetValueStream(ReadOnlySpan<TKey> keys, Span<TValue> values, uint prefetchDistance = 32);

        /// <summary>
        /// Get performance information about SIMD capabilities
        /// </summary>
        SentinelPerformanceInfo GetPerformanceInfo();
    }
}