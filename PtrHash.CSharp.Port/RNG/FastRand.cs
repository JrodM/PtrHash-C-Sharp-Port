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
            // Auto-seed like Rust's fastrand using system entropy
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
        /// Generate next random u64 (matching fastrand behavior exactly)
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong NextUInt64()
        {
            // Constants for WyRand taken from: https://github.com/wangyi-fudan/wyhash/blob/master/wyhash.h#L151
            // Updated for the final v4.2 implementation with improved constants for better entropy output.
            const ulong WY_CONST_0 = 0x2d35_8dcc_aa6c_78a5;
            const ulong WY_CONST_1 = 0x8bb8_4b93_962e_acc9;

            var s = unchecked(_state + WY_CONST_0);
            _state = s;
            
            // 64x64 -> 128 bit multiplication using native UInt128
            var t = (UInt128)s * (UInt128)(s ^ WY_CONST_1);
            return (ulong)t ^ (ulong)(t >> 64);
        }
        
        /// <summary>
        /// Generate random long (for compatibility)
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public long NextInt64()
        {
            return (long)NextUInt64();
        }
        
        /// <summary>
        /// Generate random int in range [0, max)
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public int Next(int max)
        {
            if (max <= 0)
                throw new ArgumentOutOfRangeException(nameof(max));
            
            // Use rejection sampling to avoid bias
            var range = (ulong)max;
            var limit = ulong.MaxValue / range * range;
            
            ulong value;
            do
            {
                value = NextUInt64();
            } while (value >= limit);
            
            return (int)(value % range);
        }
        
        /// <summary>
        /// Generate random byte
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public byte NextByte()
        {
            return (byte)Next(256);
        }
    }
}