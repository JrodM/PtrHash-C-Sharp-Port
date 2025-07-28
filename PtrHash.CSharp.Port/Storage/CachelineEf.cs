using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using PtrHash.CSharp.Port.Construction;

namespace PtrHash.CSharp.Port.Storage
{

    //TODO: WARNING THIS IS NOT WELL TESTED. If you plan on using this, you should test more thoroughly. 
    
    /// <summary>
    /// A single cacheline that holds 44 Elias-Fano encoded 40-bit values in a range of size 256*84=21504.
    /// Aligned to 64 bytes to ensure it fits in a single cache line.
    /// </summary>
    [StructLayout(LayoutKind.Sequential, Pack = 1, Size = 64)]
    public unsafe struct CachelineEf
    {
        /// <summary>
        /// Number of values stored per cacheline
        /// </summary>
        public const int L = 44;

        /// <summary>
        /// 2*64 = 128 bits to indicate where 256 boundaries are crossed.
        /// There are 44 1-bits corresponding to the stored numbers, and the number
        /// of 0-bits before each number indicates the number of times 256 must be added.
        /// </summary>
        private ulong _highBoundaries0;
        private ulong _highBoundaries1;

        /// <summary>
        /// The offset of the first element, divided by 256.
        /// </summary>
        private uint _reducedOffset;

        /// <summary>
        /// Last 8 bits of each number.
        /// </summary>
        private fixed byte _lowBits[L];

        /// <summary>
        /// Try to construct a new CachelineEf for the given sorted values.
        /// Returns null if values span too large a range or are invalid.
        /// </summary>
        public static CachelineEf? TryNew(ReadOnlySpan<ulong> values)
        {
            if (values.Length == 0)
                throw new ArgumentException("List of values must not be empty");
            
            if (values.Length > L)
                throw new ArgumentException($"Number of values must be at most {L}, but is {values.Length}");

            var l = values.Length;
            
            // Check if range is too large
            if (values[l - 1] - values[0] > 256UL * (128 - L))
                return null;

            // Check if values exceed 40-bit limit
            if (values[l - 1] >= (1UL << 40))
                throw new ArgumentException($"Last value {values[l - 1]} is too large! Must be less than 2^40={1UL << 40}");

            var offset = values[0] >> 8;
            if (offset > uint.MaxValue)
                throw new ArgumentException("vals[0] does not fit in 40 bits");

            var result = new CachelineEf();
            result._reducedOffset = (uint)offset;
            result._highBoundaries0 = 0;
            result._highBoundaries1 = 0;

            // Set low bits and clear remaining
            for (int i = 0; i < L; i++)
            {
                if (i < values.Length)
                    result._lowBits[i] = (byte)(values[i] & 0xFF);
                else
                    result._lowBits[i] = 0;
            }

            // Set high boundaries  
            var last = 0;
            for (int i = 0; i < values.Length; i++)
            {
                if (i < last)
                    throw new ArgumentException($"Values are not sorted! {last} > {i}");
                last = i;
                
                var idx = (ulong)i + ((values[i] >> 8) - offset);
                if (idx >= 128)
                    throw new ArgumentException($"Value {values[i] - offset} is too large!");
                
                if (idx < 64)
                    result._highBoundaries0 |= 1UL << (int)idx;
                else
                    result._highBoundaries1 |= 1UL << (int)(idx - 64);
            }

            return result;
        }

        /// <summary>
        /// Construct a new CachelineEf for the given sorted values.
        /// Throws if values are invalid or span too large a range.
        /// </summary>
        public static CachelineEf New(ReadOnlySpan<ulong> values)
        {
            return TryNew(values) ?? throw new ArgumentException("Values are too sparse!");
        }

        /// <summary>
        /// Get the value at the given index within this cacheline.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public readonly ulong Index(int idx)
        {
            var p = System.Numerics.BitOperations.PopCount(_highBoundaries0);
            int onePos;
            
            if (idx < p)
            {
                onePos = SelectOperations.SelectInWord(_highBoundaries0, idx);
            }
            else
            {
                onePos = 64 + SelectOperations.SelectInWord(_highBoundaries1, idx - (int)p);
            }

            return 256UL * _reducedOffset + 256UL * (ulong)(onePos - idx) + _lowBits[idx];
        }

        /// <summary>
        /// Get the value at the given index without bounds checking.
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public readonly ulong IndexUnchecked(int idx)
        {
            var p = System.Numerics.BitOperations.PopCount(_highBoundaries0);
            int onePos;
            
            if (idx < p)
            {
                onePos = SelectOperations.SelectInWord(_highBoundaries0, idx);
            }
            else
            {
                onePos = 64 + SelectOperations.SelectInWord(_highBoundaries1, idx - (int)p);
            }

            return 256UL * _reducedOffset + 256UL * (ulong)(onePos - idx) + _lowBits[idx];
        }
    }
}