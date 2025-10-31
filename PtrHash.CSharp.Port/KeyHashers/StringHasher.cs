using System;
using System.IO.Hashing;
using System.Numerics;
using System.Runtime.CompilerServices;
using System.Text;
using PtrHash.CSharp.Port.KeyHashers;

namespace PtrHash.CSharp.Port.KeyHashers
{
    public readonly struct StringHasher : IKeyHasher<string>
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static HashValue Hash(string key, ulong seed)
        {
            if (key == null)
                throw new ArgumentNullException(nameof(key));
            
            if (key.Length <= 128)
            {
                Span<byte> buffer = stackalloc byte[Encoding.UTF8.GetMaxByteCount(key.Length)];
                int bytesWritten = Encoding.UTF8.GetBytes(key, buffer);
                return new HashValue(XxHash3.HashToUInt64(buffer[..bytesWritten], (long)seed));
            }
            else
            {
                var bytes = Encoding.UTF8.GetBytes(key);
                return new HashValue(XxHash3.HashToUInt64(bytes, (long)seed));
            }
        }

    }
}