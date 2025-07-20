using System;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Port.Util
{
    /// <summary>
    /// ChaCha8 implementation matching Rust's rand_chacha::ChaCha8Rng exactly.
    /// This is a 1-for-1 port from the Rust source code.
    /// </summary>
    public sealed class ChaCha8Rng
    {
        // ChaCha constants "expand 32-byte k"
        private const uint C0 = 0x61707865;
        private const uint C1 = 0x3320646e;
        private const uint C2 = 0x79622d32;
        private const uint C3 = 0x6b206574;

        // ChaCha state: constants + key + counter + nonce
        private readonly uint[] _state = new uint[16];
        private readonly uint[] _buffer = new uint[64]; // 4 blocks of 16 words each
        private int _index = 64; // Buffer position (64 = needs refill)

        /// <summary>
        /// Create ChaCha8Rng with seed (matching ChaCha8Rng::seed_from_u64)
        /// </summary>
        public ChaCha8Rng(ulong seed)
        {
            InitializeFromSeed(SeedToBytes(seed));
        }

        /// <summary>
        /// Convert u64 seed to 32-byte array (matching Rust's SeedableRng behavior)
        /// </summary>
        private static byte[] SeedToBytes(ulong seed)
        {
            var bytes = new byte[32];
            
            // Fill first 8 bytes with seed in little-endian
            bytes[0] = (byte)seed;
            bytes[1] = (byte)(seed >> 8);
            bytes[2] = (byte)(seed >> 16);
            bytes[3] = (byte)(seed >> 24);
            bytes[4] = (byte)(seed >> 32);
            bytes[5] = (byte)(seed >> 40);
            bytes[6] = (byte)(seed >> 48);
            bytes[7] = (byte)(seed >> 56);
            
            // Remaining 24 bytes stay zero (matching Rust behavior)
            return bytes;
        }

        /// <summary>
        /// Initialize ChaCha state from 32-byte seed
        /// </summary>
        private void InitializeFromSeed(byte[] seed)
        {
            if (seed.Length != 32)
                throw new ArgumentException("Seed must be 32 bytes");

            // Set constants
            _state[0] = C0;
            _state[1] = C1;
            _state[2] = C2;
            _state[3] = C3;

            // Set key (8 words from seed)
            for (int i = 0; i < 8; i++)
            {
                _state[4 + i] = ReadU32Le(seed, i * 4);
            }

            // Set counter and nonce to zero
            _state[12] = 0; // counter low
            _state[13] = 0; // counter high  
            _state[14] = 0; // nonce low
            _state[15] = 0; // nonce high
        }

        /// <summary>
        /// Read little-endian u32 from byte array
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static uint ReadU32Le(byte[] bytes, int offset)
        {
            return (uint)(bytes[offset] | 
                         (bytes[offset + 1] << 8) | 
                         (bytes[offset + 2] << 16) | 
                         (bytes[offset + 3] << 24));
        }

        /// <summary>
        /// Generate next random u64 (equivalent to rng.next_u64() in Rust)
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong NextUInt64()
        {
            if (_index >= 64)
            {
                RefillBuffer();
                _index = 0;
            }

            var low = _buffer[_index++];
            var high = _buffer[_index++];
            return ((ulong)high << 32) | low;
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

        /// <summary>
        /// Refill the output buffer (generates 4 blocks of 16 words each)
        /// </summary>
        private void RefillBuffer()
        {
            // Generate 4 blocks at once for better performance
            for (int block = 0; block < 4; block++)
            {
                var offset = block * 16;
                GenerateBlock(_buffer, offset);
                
                // Increment counter for next block
                _state[12]++;
                if (_state[12] == 0)
                    _state[13]++; // Handle overflow
            }
        }

        /// <summary>
        /// Generate a single ChaCha block (16 words)
        /// </summary>
        private void GenerateBlock(uint[] output, int offset)
        {
            // Copy initial state
            var x = new uint[16];
            Array.Copy(_state, x, 16);

            // Perform 8 rounds (ChaCha8 = 4 double rounds)
            for (int i = 0; i < 4; i++)
            {
                // Column rounds
                QuarterRound(x, 0, 4, 8, 12);
                QuarterRound(x, 1, 5, 9, 13);
                QuarterRound(x, 2, 6, 10, 14);
                QuarterRound(x, 3, 7, 11, 15);

                // Diagonal rounds
                QuarterRound(x, 0, 5, 10, 15);
                QuarterRound(x, 1, 6, 11, 12);
                QuarterRound(x, 2, 7, 8, 13);
                QuarterRound(x, 3, 4, 9, 14);
            }

            // Add initial state to final state
            for (int i = 0; i < 16; i++)
            {
                output[offset + i] = x[i] + _state[i];
            }
        }

        /// <summary>
        /// ChaCha quarter-round function
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static void QuarterRound(uint[] x, int a, int b, int c, int d)
        {
            x[a] += x[b]; x[d] ^= x[a]; x[d] = RotateLeft(x[d], 16);
            x[c] += x[d]; x[b] ^= x[c]; x[b] = RotateLeft(x[b], 12);
            x[a] += x[b]; x[d] ^= x[a]; x[d] = RotateLeft(x[d], 8);
            x[c] += x[d]; x[b] ^= x[c]; x[b] = RotateLeft(x[b], 7);
        }

        /// <summary>
        /// Left rotate 32-bit value
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static uint RotateLeft(uint value, int count)
        {
            return (value << count) | (value >> (32 - count));
        }
    }
}