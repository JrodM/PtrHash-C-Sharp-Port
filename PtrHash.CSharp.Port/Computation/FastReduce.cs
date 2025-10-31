using System;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Port.Computation
{
    /// <summary>
    /// FastReduce instance for pre-computed modular reduction
    /// </summary>
    internal readonly struct FastReduce
    {
        private readonly nuint d;
        
        public FastReduce(nuint modulus)
        {
            d = modulus;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint Reduce(ulong hash)
        {
            // mul_high(self.d, h) = (d as u128 * h as u128) >> 64 (PtrHash paper reduce function)
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