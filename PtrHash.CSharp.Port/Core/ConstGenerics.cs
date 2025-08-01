using System;

namespace PtrHash.CSharp.Port.Core
{
    #region Const Generic Interfaces
    /// <summary>
    /// Interface for compile-time boolean constants.
    /// Used to provide compile-time specialization similar to Rust's const generics.
    /// The JIT compiler creates separate method instances for each implementing type.
    /// </summary>
    public interface IBoolConstant 
    { 
        bool Value { get; } 
    }

    /// <summary>
    /// Interface for compile-time part configuration constants.
    /// Used to specialize PtrHash construction for single-part vs multi-part modes
    /// at compile time, eliminating runtime branches.
    /// </summary>
    public interface IPartConstant 
    { 
        bool IsSinglePart { get; } 
    }

    /// <summary>
    /// Interface for compile-time size constants.
    /// Used to specialize FindPilot methods for specific bucket sizes,
    /// enabling aggressive JIT optimizations like loop unrolling and bounds check elimination.
    /// </summary>
    public interface ISizeConstant 
    { 
        int Value { get; } 
    }
    #endregion

    #region Boolean Constants
    /// <summary>
    /// Compile-time constant indicating minimal perfect hashing should be used.
    /// When used as a generic parameter, the JIT eliminates all non-minimal code paths.
    /// </summary>
    public readonly struct UseMinimal : IBoolConstant 
    { 
        public bool Value => true; 
    }

    /// <summary>
    /// Compile-time constant indicating non-minimal perfect hashing should be used.
    /// When used as a generic parameter, the JIT eliminates all minimal-specific code paths.
    /// </summary>
    public readonly struct NoMinimal : IBoolConstant 
    { 
        public bool Value => false; 
    }
    #endregion

    #region Part Configuration Constants
    /// <summary>
    /// Compile-time constant for single-part PtrHash construction.
    /// Eliminates multi-part coordination overhead and enables more aggressive optimizations.
    /// </summary>
    public readonly struct SinglePart : IPartConstant 
    { 
        public bool IsSinglePart => true; 
    }

    /// <summary>
    /// Compile-time constant for multi-part PtrHash construction.
    /// Enables parallel construction across multiple parts for large datasets.
    /// </summary>
    public readonly struct MultiPart : IPartConstant 
    { 
        public bool IsSinglePart => false; 
    }
    #endregion

    #region Size Constants for FindPilot Specialization
    /// <summary>
    /// Compile-time constant for buckets containing exactly 1 element.
    /// The JIT creates a specialized FindPilotSlice method that:
    /// - Eliminates the 4x unrolled loop (r=0)
    /// - Uses a single element check in the remainder loop
    /// - Eliminates all bounds checking
    /// </summary>
    public readonly struct Size1 : ISizeConstant 
    { 
        public int Value => 1; 
    }

    /// <summary>
    /// Compile-time constant for buckets containing exactly 2 elements.
    /// The JIT creates a specialized FindPilotSlice method optimized for 2-element buckets.
    /// </summary>
    public readonly struct Size2 : ISizeConstant 
    { 
        public int Value => 2; 
    }

    /// <summary>
    /// Compile-time constant for buckets containing exactly 3 elements.
    /// The JIT creates a specialized FindPilotSlice method optimized for 3-element buckets.
    /// </summary>
    public readonly struct Size3 : ISizeConstant 
    { 
        public int Value => 3; 
    }

    /// <summary>
    /// Compile-time constant for buckets containing exactly 4 elements.
    /// The JIT creates a specialized FindPilotSlice method that:
    /// - Uses exactly one iteration of the 4x unrolled loop (r=4)
    /// - Eliminates the remainder loop completely
    /// - Provides optimal performance for the common 4-element case
    /// </summary>
    public readonly struct Size4 : ISizeConstant 
    { 
        public int Value => 4; 
    }

    /// <summary>
    /// Compile-time constant for buckets containing exactly 5 elements.
    /// The JIT creates a specialized FindPilotSlice method optimized for 5-element buckets.
    /// </summary>
    public readonly struct Size5 : ISizeConstant 
    { 
        public int Value => 5; 
    }

    /// <summary>
    /// Compile-time constant for buckets containing exactly 6 elements.
    /// The JIT creates a specialized FindPilotSlice method optimized for 6-element buckets.
    /// </summary>
    public readonly struct Size6 : ISizeConstant 
    { 
        public int Value => 6; 
    }

    /// <summary>
    /// Compile-time constant for buckets containing exactly 7 elements.
    /// The JIT creates a specialized FindPilotSlice method optimized for 7-element buckets.
    /// </summary>
    public readonly struct Size7 : ISizeConstant 
    { 
        public int Value => 7; 
    }

    /// <summary>
    /// Compile-time constant for buckets containing exactly 8 elements.
    /// The JIT creates a specialized FindPilotSlice method that:
    /// - Uses exactly two iterations of the 4x unrolled loop (r=8)
    /// - Eliminates the remainder loop completely
    /// - Provides optimal performance for larger buckets
    /// </summary>
    public readonly struct Size8 : ISizeConstant 
    { 
        public int Value => 8; 
    }

    /// <summary>
    /// Compile-time constant for buckets with dynamic/unknown sizes (> 8 elements).
    /// Falls back to runtime size determination using bucketHashes.Length.
    /// Used as the default case in the size-based dispatch switch statement.
    /// </summary>
    public readonly struct SizeGeneric : ISizeConstant 
    { 
        public int Value => -1; 
    }
    #endregion
}