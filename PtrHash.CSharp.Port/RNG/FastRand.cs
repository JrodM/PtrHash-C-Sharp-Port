using System;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Port.RNG
{
    /// <summary>
    /// FastRand implementation matching Rust's fastrand crate
    /// This is a fast non-cryptographic PRNG based on the WyHash algorithm
    /// </summary>
    public sealed class FastRand
    {
        private ulong _state;
        
        /// <summary>
        /// Create FastRand with auto-seeding (matching fastrand::Rng::new())
        /// </summary>
        public FastRand()
        {
            // Auto-seed using system entropy
            _state = (ulong)Environment.TickCount64 ^ (ulong)DateTime.UtcNow.Ticks;
            if (_state == 0) _state = 1; // Ensure non-zero state
        }
        
        /// <summary>
        /// Create FastRand with specific seed
        /// </summary>
        public FastRand(ulong seed)
        {
            _state = seed;
            if (_state == 0) _state = 1; // Ensure non-zero state
        }
        
        /// <summary>
        /// Generate next random u64
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong gen_u64()
        {
            // Constants for WyRand taken from: https://github.com/wangyi-fudan/wyhash/blob/master/wyhash.h#L151
            const ulong WY_CONST_0 = 0x2d35_8dcc_aa6c_78a5;
            const ulong WY_CONST_1 = 0x8bb8_4b93_962e_acc9;

            var s = unchecked(_state + WY_CONST_0);
            _state = s;
            
            // 64x64 -> 128 bit multiplication using native UInt128
            var t = (UInt128)s * (UInt128)(s ^ WY_CONST_1);
            return (ulong)t ^ (ulong)(t >> 64);
        }
        
        /// <summary>
        /// Generate random u32
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public uint gen_u32()
        {
            return (uint)gen_u64();
        }
        
        /// <summary>
        /// Generate random u32 in range [0, n)
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public uint gen_mod_u32(uint n)
        {
            // Adapted from: https://lemire.me/blog/2016/06/30/fast-random-shuffling/
            // Lemire's fast modular reduction algorithm
            uint r = gen_u32();
            uint hi = mul_high_u32(r, n);
            uint lo = unchecked(r * n);
            if (lo < n) 
            {
                uint t = unchecked((uint)(-(int)n) % n);
                while (lo < t) 
                {
                    r = gen_u32();
                    hi = mul_high_u32(r, n);
                    lo = unchecked(r * n);
                }
            }
            return hi;
        }
        
        /// <summary>
        /// Computes (a * b) >> 32
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static uint mul_high_u32(uint a, uint b)
        {
            return (uint)(((ulong)a * (ulong)b) >> 32);
        }
        
        /// <summary>
        /// Generate random u8
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public byte u8()
        {
            // u8 from u32 truncation
            return (byte)gen_u32();
        }

        // Legacy C# naming for compatibility
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong NextUInt64() => gen_u64();
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public long NextInt64() => (long)gen_u64();
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public byte NextByte() => u8();
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public int Next(int max)
        {
            if (max <= 0)
                throw new ArgumentOutOfRangeException(nameof(max));
            
            return (int)gen_mod_u32((uint)max);
        }
    }
}