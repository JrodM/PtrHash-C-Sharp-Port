using System;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Port.Core
{
    /// <summary>
    /// Represents a hash value with high and low parts, matching Rust's hash trait
    /// </summary>
    public readonly struct HashValue : IComparable<HashValue>
    {
        private readonly ulong _value;
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public HashValue(ulong value)
        {
            _value = value;
        }
        
        /// <summary>
        /// Get the high value - for u64 in Rust, this returns the full value
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong High() => _value;
        
        /// <summary>
        /// Get the low value - for u64 in Rust, this returns the full value
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong Low() => _value;
        
        /// <summary>
        /// Get the full 64-bit value
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong Full() => _value;
        
        // Implicit conversions
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static implicit operator HashValue(ulong value) => new(value);
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static implicit operator ulong(HashValue hash) => hash._value;
        
        // IComparable implementation for sorting
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public int CompareTo(HashValue other) => _value.CompareTo(other._value);
    }
}