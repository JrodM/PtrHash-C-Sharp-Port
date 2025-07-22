using System;
using System.Numerics;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics;
using System.Runtime.Intrinsics.X86;
using PtrHash.CSharp.Port.KeyHashers;

namespace PtrHash.CSharp.Port.KeyHashers
{
    /// <summary>
    /// FxHash implementation for fast hashing of ulong keys
    /// Based on Rust's FxHash which is designed for speed over cryptographic security
    /// </summary>
    public readonly struct FxHasher : IKeyHasher<ulong>
    {
        private const ulong FX_HASH_SEED = 0x51_7c_c1_b7_27_22_0a_95;
        private const ulong ROTATE = 5;
        private const ulong MULTIPLY = 0x51_7c_c1_b7_27_22_0a_95;

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public HashValue Hash(ulong key, ulong seed)
        {
            // Exact Rust FxHasher64 algorithm:
            // For a fresh hasher with seed, state starts as seed
            // Then: state = state.rotate_left(ROTATE).bitxor(key).wrapping_mul(SEED64)
            ulong hash = seed;
            hash = RotateLeft(hash, ROTATE) ^ key;
            hash = hash.WrappingMul(FX_HASH_SEED);
            return new HashValue(hash);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static ulong RotateLeft(ulong value, ulong count)
        {
            return (value << (int)(count & 63)) | (value >> (int)(64 - (count & 63)));
        }

    }

    /// <summary>
    /// Extensions for wrapping arithmetic operations
    /// </summary>
    public static class ArithmeticExtensions
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ulong WrappingMul(this ulong a, ulong b)
        {
            unchecked
            {
                return a * b;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static ulong WrappingAdd(this ulong a, ulong b)
        {
            unchecked
            {
                return a + b;
            }
        }
    }
}