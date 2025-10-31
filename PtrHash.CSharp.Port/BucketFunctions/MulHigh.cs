using System;

namespace PtrHash.CSharp.Port.BucketFunctions
{
    internal static class MulHigh
    {
        /// <summary>
        /// Computes the high 64 bits of a * b (equivalent to ((a as u128 * b as u128) >> 64) as u64)
        /// </summary>
        public static ulong Multiply(ulong a, ulong b)
        {
            return (ulong)(((UInt128)a * b) >> 64);
        }
    }
}