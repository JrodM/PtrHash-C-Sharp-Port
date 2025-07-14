using System;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Port.Util
{
    /// <summary>
    /// Fast modular reduction operations for hash table sizing
    /// </summary>
    public static class FastReduce
    {
        /// <summary>
        /// Fast modular reduction using multiplication and shift
        /// Equivalent to hash % n but faster for powers of 2 and other cases
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static nuint Reduce(ulong hash, nuint n)
        {
            // For power of 2, use bitwise AND
            if (IsPowerOfTwo(n))
            {
                return (nuint)(hash & ((ulong)n - 1));
            }
            
            // General case: use division
            return (nuint)(hash % (ulong)n);
        }

        /// <summary>
        /// Fast 32-bit modular reduction
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static uint Reduce32(ulong hash, uint n)
        {
            if (IsPowerOfTwo(n))
            {
                return (uint)(hash & (n - 1));
            }
            
            return (uint)(hash % n);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static bool IsPowerOfTwo(nuint value)
        {
            return value != 0 && (value & (value - 1)) == 0;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static bool IsPowerOfTwo(uint value)
        {
            return value != 0 && (value & (value - 1)) == 0;
        }
    }
}