using System;
using System.Numerics;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Port.KeyHashers;

namespace PtrHash.CSharp.Port.KeyHashers
{
    /// <summary>
    /// Stronger hash function for ulong keys
    /// Uses double multiplication with 128-bit intermediate
    /// </summary>
    public readonly struct StrongerIntHasher : IKeyHasher<ulong>
    {
        private const ulong C = 0x517cc1b727220a95UL; // FxHash constant
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public HashValue Hash(ulong key, ulong seed)
        {
            // Double multiplication algorithm:
            // let r = (*x as u64 ^ seed) as u128 * C as u128;
            // let low = r as u64;
            // let high = (r >> 64) as u64;
            // (low ^ high).wrapping_mul(C)
            
            var x = key ^ seed; // XOR with seed first
            var r = (UInt128)x * (UInt128)C; // 128-bit multiplication
            var low = (ulong)r;
            var high = (ulong)(r >> 64);
            return new HashValue((low ^ high).WrappingMul(C)); // XOR low/high, then multiply by C
        }

    }
}