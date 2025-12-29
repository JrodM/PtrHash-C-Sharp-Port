using System;

namespace PtrHash.CSharp.Port.BucketFunctions
{
    /// <summary>
    /// `x * x * (1 + x)/2 * 255/256 + x/256`
    /// </summary>
    public struct CubicEps : IBucketFunction
    {
        public bool IsLinear => false;
        public bool BOutput => false;

        public void SetBucketsPerPart(ulong b)
        {
            // No op
        }

        public ulong Call(ulong x)
        {
            // x * x * (1 + x)/2
            ulong xxPlusX = Multiply(Multiply(x, x), (x >> 1) | (1ul << 63));
            return xxPlusX / 256 * 255 + x / 256;
        }

                /// <summary>
        /// Computes the high 64 bits of a * b (equivalent to ((a as u128 * b as u128) >> 64) as u64)
        /// </summary>
        public static ulong Multiply(ulong a, ulong b)
        {
            return (ulong)(((UInt128)a * b) >> 64);
        }
    }
}