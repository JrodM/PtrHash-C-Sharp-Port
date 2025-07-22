using System;
using PtrHash.CSharp.Port.BucketFunctions;
using PtrHash.CSharp.Port.Storage;

namespace PtrHash.CSharp.Port.Core
{
    /// <summary>
    /// Parameters for PtrHash construction with bucket function support
    /// Matches Rust PtrHashParams struct
    /// </summary>
    public readonly struct PtrHashParams
    {
        public double Alpha { get; init; }
        public double Lambda { get; init; }
        public bool Minimal { get; init; }
        public bool SinglePart { get; init; }
        public IBucketFunction? BucketFunction { get; init; }
        
        /// <summary>
        /// Remapping storage type selector - matches Rust's F generic parameter
        /// Controls space/speed tradeoff for remapping table
        /// </summary>
        public RemappingStorageType StorageType { get; init; }

        /// <summary>
        /// Default fast parameters: 3.0 bits/key, optimized for query speed
        /// Uses Linear bucket function and Vec&lt;u32&gt; storage (matches Rust default)
        /// </summary>
        public static PtrHashParams DefaultFast => new()
        {
            Alpha = 0.99,
            Lambda = 3.0,
            Minimal = true,
            SinglePart = false,  // Multi-part mode
            BucketFunction = new Linear(),
            StorageType = RemappingStorageType.VecU32
        };

        /// <summary>
        /// Default balanced parameters: 2.4 bits/key, balanced trade-off
        /// Uses CubicEps bucket function and CacheLineEF storage (matches Rust balanced config)
        /// </summary>
        public static PtrHashParams DefaultBalanced => new()
        {
            Alpha = 0.99,  // Space efficiency parameter
            Lambda = 3.5,  // Expected bucket size parameter
            Minimal = true,
            SinglePart = false,
            BucketFunction = new CubicEps(),
            StorageType = RemappingStorageType.CacheLineEF
        };
        
        /// <summary>
        /// Most compact parameters: 2.1 bits/key, maximum compression
        /// Uses CubicEps bucket function and EliasFano storage (matches Rust compact config)
        /// </summary>
        public static PtrHashParams DefaultCompact => new()
        {
            Alpha = 0.99,
            Lambda = 3.5,
            Minimal = true,
            SinglePart = false,
            BucketFunction = new CubicEps(),
            StorageType = RemappingStorageType.EliasFano
        };
    }

    /// <summary>
    /// Remapping storage type selection - matches Rust's F generic parameter options
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
        /// Vec&lt;u32&gt; - 32-bit values, Rust default, good balance
        /// </summary>
        VecU32,
        
        /// <summary>
        /// Vec&lt;u64&gt; - 64-bit values, supports largest numbers
        /// </summary>
        VecU64,
        
        /// <summary>
        /// CacheLineEF - Cache-line optimized Elias-Fano encoding, most compact for sparse sorted data
        /// Matches Rust CachelineEfVec type
        /// </summary>
        CacheLineEF,
        
        /// <summary>
        /// EliasFano - Standard Elias-Fano compressed encoding, maximum compression
        /// </summary>
        EliasFano,
        
        /// <summary>
        /// Auto - Automatically select optimal storage based on data characteristics
        /// Uses RemappingStorageFactory.CreateOptimal() 
        /// </summary>
        Auto
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