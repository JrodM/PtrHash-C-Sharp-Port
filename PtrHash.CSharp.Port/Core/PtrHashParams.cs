using System;
using PtrHash.CSharp.Port.Storage;

namespace PtrHash.CSharp.Port.Core
{
    /// <summary>
    /// Parameters for PtrHash construction with bucket function support
    /// PtrHashParams struct
    /// </summary>
    public readonly struct PtrHashParams
    {
        public double Alpha { get; init; }
        public double Lambda { get; init; }
        public bool Minimal { get; init; }
        public bool SinglePart { get; init; }

        /// <summary>
        /// Default fast parameters: 3.0 bits/key, optimized for query speed
        /// </summary>
        public static PtrHashParams DefaultFast => new()
        {
            Alpha = 0.99,
            Lambda = 3.0,
            Minimal = true,
            SinglePart = false,
        };
        
        /// <summary>
        /// Most compact parameters: 2.1 bits/key, maximum compression
        /// Uses CacheLineEF storage
        /// </summary>
        public static PtrHashParams DefaultCompact => new()
        {
            Alpha = 0.99,
            Lambda = 3.5,
            Minimal = true,
            SinglePart = false
        };
    }

    /// <summary>
    /// Remapping storage type selection
    /// Controls space/speed tradeoff for the remapping table
    /// </summary>
    public enum RemappingStorageType
    {
        /// <summary>
        /// Vec&lt;u8&gt; - 8-bit values, most compact for small numbers
        /// </summary>
        VecU8,
        
        /// <summary>
        /// Vec&lt;u16&gt; - 16-bit values, good for medium numbers
        /// </summary>
        VecU16,
        
        /// <summary>
        /// Vec&lt;u32&gt; - 32-bit values, default.
        /// </summary>
        VecU32,
        
        /// <summary>
        /// Vec&lt;u64&gt; - 64-bit values, supports largest numbers
        /// </summary>
        VecU64,
        
        
        /// <summary>
        /// CacheLineEF - Standard Elias-Fano compressed encoding, maximum compression
        /// </summary>
        CacheLineEF,
    }

    /// <summary>
    /// Information about a constructed PtrHash
    /// </summary>
    public readonly struct PtrHashInfo(nuint keyCount, double bitsPerKey, nuint maxIndex)
    {
        public nuint KeyCount { get; } = keyCount;
        public double BitsPerKey { get; } = bitsPerKey;
        public nuint MaxIndex { get; } = maxIndex;
    }

    /// <summary>
    /// Exception thrown during PtrHash construction or operation
    /// </summary>
    public class PtrHashException : Exception
    {
        public PtrHashException(string message) : base(message) { }
        public PtrHashException(string message, Exception innerException) : base(message, innerException) { }
    }
}