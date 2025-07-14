using System;
using System.IO.Hashing;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Port.KeyHashers
{
    /// <summary>
    /// XXH3 hasher for ulong keys using System.IO.Hashing for strong hash quality
    /// </summary>
    public readonly struct Xxh3Hasher : IKeyHasher<ulong>
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong Hash(ulong key, ulong seed)
        {
            Span<byte> keyBytes = stackalloc byte[8];
            BitConverter.TryWriteBytes(keyBytes, key);
            return XxHash3.HashToUInt64(keyBytes, (long)seed);
        }
    }
}