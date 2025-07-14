using System;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Port.KeyHashers
{
    /// <summary>
    /// Stronger hash function for ulong keys based on splitmix64 algorithm
    /// Good for sequential patterns and better distribution
    /// </summary>
    public readonly struct StrongerIntHasher : IKeyHasher<ulong>
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong Hash(ulong key, ulong seed)
        {
            // Add seed to the key for seeded hashing
            ulong x = key.WrappingAdd(seed);
            
            // splitmix64 algorithm
            x = (x ^ (x >> 30)).WrappingMul(0xbf58476d1ce4e5b9UL);
            x = (x ^ (x >> 27)).WrappingMul(0x94d049bb133111ebUL);
            x = x ^ (x >> 31);
            
            return x;
        }
    }
}