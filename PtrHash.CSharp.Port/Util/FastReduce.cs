using System;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Port.Util
{
    /// <summary>
    /// FastReduce instance for pre-computed modular reduction - matches Rust's FastReduce struct
    /// </summary>
    internal readonly struct FastReduceInstance
    {
        private readonly nuint d;
        
        public FastReduceInstance(nuint modulus)
        {
            d = modulus;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint Reduce(ulong hash)
        {
            // Rust: mul_high(self.d, h) = (d as u128 * h as u128) >> 64
            return (nuint)((UInt128)d * (UInt128)hash >> 64);
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public (nuint reduced, ulong remainder) ReduceWithRemainder(ulong hash)
        {
            var result = (UInt128)d * (UInt128)hash;
            return ((nuint)(result >> 64), (ulong)result);
        }
    }
    
    /// <summary>
    /// Fast modular reduction operations for hash table sizing - exact Rust implementation
    /// </summary>
    public static class FastReduce
    {
        /// <summary>
        /// FastReduce - exact implementation from Rust reduce.rs
        /// Uses mul_high(self.d, h) which is ((a as u128 * b as u128) >> 64) as u64
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static nuint Reduce(ulong hash, nuint n)
        {
            var d = (ulong)n;
            return (nuint)MulHigh(d, hash);
        }

        /// <summary>
        /// Rust mul_high function: ((a as u128 * b as u128) >> 64) as u64
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static ulong MulHigh(ulong a, ulong b)
        {
            return (ulong)(((UInt128)a * b) >> 64);
        }

        /// <summary>
        /// FastMod32 for smaller moduli - exact implementation from Rust
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static uint Reduce32(ulong hash, uint n)
        {
            var d = (ulong)n;
            var m = (ulong.MaxValue / d) + 1;
            var lowbits = m * hash;
            return (uint)(((UInt128)lowbits * d) >> 64);
        }

        /// <summary>
        /// Multiply a UInt128 by u64 and return the upper 64 bits of the result.
        /// Rust: mul128_u64 function
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static ulong Mul128U64(UInt128 lowbits, ulong d)
        {
            var botHalf = ((lowbits & ulong.MaxValue) * d) >> 64;
            var topHalf = (lowbits >> 64) * d;
            var bothHalves = botHalf + topHalf;
            return (ulong)(bothHalves >> 64);
        }
    }
}