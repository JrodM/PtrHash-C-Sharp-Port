using System;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Port.Util
{
    /// <summary>
    /// Linear bucket function for mapping keys to buckets
    /// Simplified version supporting only linear mapping (no SquareEps or CubicEps)
    /// </summary>
    public readonly struct LinearBucketFunction
    {
        private readonly nuint _numBuckets;

        public LinearBucketFunction(nuint numBuckets)
        {
            _numBuckets = numBuckets;
        }

        public nuint NumBuckets => _numBuckets;

        /// <summary>
        /// Map a hash value to a bucket index using linear mapping
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetBucket(ulong hash)
        {
            return FastReduce.Reduce(hash, _numBuckets);
        }

        /// <summary>
        /// Get the slot index within a bucket for a given hash and pilot
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetSlot(ulong hash, byte pilot, nuint slotsPerBucket)
        {
            // Combine hash with pilot to get slot position within bucket
            ulong combined = hash ^ (ulong)pilot;
            return FastReduce.Reduce(combined, slotsPerBucket);
        }

        /// <summary>
        /// Get the global slot index for a hash, pilot, and bucket configuration
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetGlobalSlot(ulong hash, byte pilot, nuint slotsPerBucket)
        {
            nuint bucket = GetBucket(hash);
            nuint localSlot = GetSlot(hash, pilot, slotsPerBucket);
            return bucket * slotsPerBucket + localSlot;
        }
    }
}