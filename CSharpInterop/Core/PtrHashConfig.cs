using System;

namespace PtrHash.Core
{
    /// <summary>
    /// Parameter sets for PtrHash construction
    /// </summary>
    public enum PtrHashParameterSet
    {
        /// <summary>
        /// Default parameters, uses 3.0 bits/key (default)
        /// </summary>
        Default = 0,
        
        /// <summary>
        /// Fast construction and queries, uses 3.0 bits/key (default_fast)
        /// </summary>
        Fast = 1
    }

    /// <summary>
    /// Hash function selection for U64 keys
    /// </summary>
    public enum U64HashFunction
    {
        /// <summary>
        /// FxHash - fast and good for most cases (default)
        /// </summary>
        FxHash = 0,
        
        /// <summary>
        /// Stronger hash for regular patterns like 0..1000
        /// </summary>
        StrongerIntHash = 1,
        
        /// <summary>
        /// GxHash optimized variant
        /// </summary>
        GxInt = 2,
        
        /// <summary>
        /// XXH3 - slower but very strong
        /// </summary>
        Xxh3Int = 3,
        
        /// <summary>
        /// No hashing - only for truly random keys
        /// </summary>
        NoHash = 4
    }

    /// <summary>
    /// Hash function selection for String keys
    /// </summary>
    public enum StringHashFunction
    {
        /// <summary>
        /// GxHash 64-bit (default)
        /// </summary>
        GxHash = 0,
        
        /// <summary>
        /// GxHash 128-bit for better collision resistance
        /// </summary>
        GxHash128 = 1,
        
        /// <summary>
        /// FxHash alternative
        /// </summary>
        FxHash = 2
    }

    /// <summary>
    /// Configuration for PtrHash construction
    /// </summary>
    public struct PtrHashConfig
    {
        public PtrHashParameterSet ParameterSet { get; set; }
        public bool SinglePart { get; set; }
        
        /// <summary>
        /// Lambda parameter for custom configurations (typical range: 2.0-5.0)
        /// Higher values = more space efficient but harder to construct
        /// </summary>
        public double? Lambda { get; set; }
        
        /// <summary>
        /// Hash function for U64 keys (overrides default for any parameter set)
        /// </summary>
        public U64HashFunction? U64HashFunction { get; set; }
        
        /// <summary>
        /// Hash function for String keys (overrides default for any parameter set)
        /// </summary>
        public StringHashFunction? StringHashFunction { get; set; }

        public static PtrHashConfig Default => new()
        {
            ParameterSet = PtrHashParameterSet.Default,
            SinglePart = false
        };

        public static PtrHashConfig Fast => new()
        {
            ParameterSet = PtrHashParameterSet.Fast,
            SinglePart = false
        };

    }

    /// <summary>
    /// Information about a PtrHash instance
    /// </summary>
    public readonly struct PtrHashInfo
    {
        public nuint KeyCount { get; }
        public double BitsPerKey { get; }
        public nuint MaxIndex { get; }

        internal PtrHashInfo(nuint keyCount, double bitsPerKey, nuint maxIndex)
        {
            KeyCount = keyCount;
            BitsPerKey = bitsPerKey;
            MaxIndex = maxIndex;
        }
    }

    /// <summary>
    /// Exception thrown by PtrHash operations
    /// </summary>
    public class PtrHashException : Exception
    {
        public PtrHashException(string message) : base(message) { }
        public PtrHashException(string message, Exception innerException) : base(message, innerException) { }
    }
}