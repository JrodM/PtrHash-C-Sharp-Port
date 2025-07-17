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
}