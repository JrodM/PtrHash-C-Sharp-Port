using System;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Port.Util
{
    /// <summary>
    /// FastMod32, using the low 32 bits of the hash.
    /// Taken from https://github.com/lemire/fastmod/blob/master/include/fastmod.h
    /// Matches Rust's FM32 implementation for slot reduction
    /// </summary>
    public readonly struct FM32
    {
        private readonly ulong d;
        private readonly ulong m;
        
        public FM32(nuint modulus)
        {
            d = (ulong)modulus;
            m = (ulong.MaxValue / d) + 1;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint Reduce(ulong hash)
        {
            var lowbits = m * hash;
            return (nuint)((UInt128)lowbits * (UInt128)d >> 64);
        }
    }
}