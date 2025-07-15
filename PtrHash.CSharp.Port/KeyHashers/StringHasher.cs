using System;
using System.IO.Hashing;
using System.Runtime.CompilerServices;
using System.Text;
using PtrHash.CSharp.Port.Core;

namespace PtrHash.CSharp.Port.KeyHashers
{
    /// <summary>
    /// String hasher using XXH3 for high-quality string hashing
    /// </summary>
    public readonly struct StringHasher : IKeyHasher<string>
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public HashValue Hash(string key, ulong seed)
        {
            if (key == null)
                throw new ArgumentNullException(nameof(key));

            // For small strings, use stack allocation
            if (key.Length <= 128)
            {
                Span<byte> buffer = stackalloc byte[Encoding.UTF8.GetMaxByteCount(key.Length)];
                int bytesWritten = Encoding.UTF8.GetBytes(key, buffer);
                return new HashValue(XxHash3.HashToUInt64(buffer[..bytesWritten], (long)seed));
            }
            else
            {
                // For larger strings, fallback to allocation
                var bytes = Encoding.UTF8.GetBytes(key);
                return new HashValue(XxHash3.HashToUInt64(bytes, (long)seed));
            }
        }
    }
}