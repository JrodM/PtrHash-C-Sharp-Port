using System;
using PtrHash.CSharp.Port.BucketFunctions;

namespace PtrHash.CSharp.Port.PtrHash
{
    /// <summary>
    /// Parameters for PtrHash construction with bucket function support
    /// </summary>
    public readonly struct PtrHashParams
    {
        public double Alpha { get; init; }
        public double Lambda { get; init; }
        public bool Minimal { get; init; }
        public bool SinglePart { get; init; }
        public IBucketFunction? BucketFunction { get; init; }

        /// <summary>
        /// Default fast parameters: 3.0 bits/key, optimized for query speed
        /// Uses Linear bucket function like Rust default_fast()
        /// </summary>
        public static PtrHashParams DefaultFast => new()
        {
            Alpha = 0.99,
            Lambda = 3.0,
            Minimal = true,
            SinglePart = false,  // Multi-part like Rust default
            BucketFunction = new Linear()
        };

        /// <summary>
        /// Default balanced parameters: 2.4 bits/key, balanced trade-off
        /// Uses CubicEps bucket function like Rust default_balanced()
        /// </summary>
        public static PtrHashParams DefaultBalanced => new()
        {
            Alpha = 0.99,  // Match Rust default_balanced
            Lambda = 3.5,  // Match Rust default_balanced
            Minimal = true,
            SinglePart = false,
            BucketFunction = new CubicEps()
        };
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