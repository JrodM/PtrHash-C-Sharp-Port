using System;

namespace PtrHash.CSharp.Interop.PtrHash
{
    /// <summary>
    /// Information about a constructed PtrHash
    /// </summary>
    public readonly struct PtrHashInfo
    {
        public nuint KeyCount { get; }
        public double BitsPerKey { get; }
        public nuint MaxIndex { get; }

        public PtrHashInfo(nuint keyCount, double bitsPerKey, nuint maxIndex)
        {
            KeyCount = keyCount;
            BitsPerKey = bitsPerKey;
            MaxIndex = maxIndex;
        }
    }

    /// <summary>
    /// Exception thrown during PtrHash construction or operation
    /// </summary>
    public class PtrHashException : Exception
    {
        public PtrHashException(string message) : base(message) { }
        public PtrHashException(string message, Exception innerException) : base(message, innerException) { }
    }

    public interface IPtrHash<TKey> : IDisposable
    {
        PtrHashInfo GetInfo();
        nuint GetIndex(TKey key);
        nuint GetIndexNoRemap(TKey key);
        void GetIndicesBatch(ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal = true);
        void GetIndicesStream(ReadOnlySpan<TKey> keys, Span<nuint> results, uint prefetchDistance = 32, bool minimal = true);
    }
}