using System;
using System.IO.Hashing;
using System.Numerics;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Port.KeyHashers;

namespace PtrHash.CSharp.Port.KeyHashers
{
    /// <summary>
    /// XXH3 hasher for ulong keys using System.IO.Hashing for strong hash quality
    /// </summary>
    public readonly struct Xxh3Hasher : IKeyHasher<ulong>
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static HashValue Hash(ulong key, ulong seed)
        {
            Span<byte> keyBytes = stackalloc byte[8];
            BitConverter.TryWriteBytes(keyBytes, key);
            return new HashValue(XxHash3.HashToUInt64(keyBytes, (long)seed));
        }

    }
}