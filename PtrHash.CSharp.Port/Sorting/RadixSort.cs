using System;
using System.Runtime.CompilerServices;
using System.Buffers;
using PtrHash.CSharp.Port.KeyHashers;

namespace PtrHash.CSharp.Port.Sorting
{
    /// <summary>
    /// Based on Rust's rdst::RadixSort used in the original implementation
    /// </summary>
    public static class RadixSort
    {
        private const int RADIX_BITS = 8;
        private const int RADIX_SIZE = 1 << RADIX_BITS;
        private const int RADIX_MASK = RADIX_SIZE - 1;

        /// <summary>
        /// In place radix sort for HashValue.
        /// Uses ping-pong buffering with temporary array for sorting passes
        /// </summary>
        public static void SortHashValues(Span<HashValue> data)
        {
            int n = data.Length;
            if (n <= 1) return;
            
            var pool = ArrayPool<HashValue>.Shared;
            var tempArray = pool.Rent(n);
            try
            {
                var temp = tempArray.AsSpan(0, n);
                Span<int> counts = stackalloc int[RADIX_SIZE];
                
                // Track which buffer contains the data
                bool dataInOriginal = true;
                
                // Process each byte (8 passes for 64 bit values)
                for (int shift = 0; shift < 64; shift += RADIX_BITS)
                {
                    counts.Clear();
                    
                    bool continueSort;
                    if (dataInOriginal)
                    {
                        continueSort = RadixPassHashValues(data, temp, shift, counts);
                    }
                    else
                    {
                        continueSort = RadixPassHashValues(temp, data, shift, counts);
                    }
                    
                    if (!continueSort)
                        break; // exit if remaining bits are all the same
                    
                    dataInOriginal = !dataInOriginal;
                }
                
                // Ensure result is in the original buffer
                if (!dataInOriginal)
                    temp.CopyTo(data);
            }
            finally
            {
                pool.Return(tempArray, false);
            }
        }
        
        /// <summary>
        /// Single radix sort pass for HashValue
        /// Returns false if all values have the same byte
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private static bool RadixPassHashValues(
            ReadOnlySpan<HashValue> source,
            Span<HashValue> dest,
            int shift,
            Span<int> counts)
        {
            // First pass: count occurrences and check if all bytes are the same
            ulong firstValue = source[0].Full();
            byte firstByte = (byte)((firstValue >> shift) & RADIX_MASK);
            bool allSame = true;
            
            for (int i = 0; i < source.Length; i++)
            {
                ulong v = source[i].Full();
                byte b = (byte)((v >> shift) & RADIX_MASK);
                counts[b]++;
                allSame &= (b == firstByte);
            }
            
            // Early exit if all bytes are the same
            if (allSame)
                return false;
            
            // Convert counts to offsets
            int offset = 0;
            for (int i = 0; i < RADIX_SIZE; i++)
            {
                int count = counts[i];
                counts[i] = offset;
                offset += count;
            }
            
            // Second pass: place elements in sorted order
            for (int i = 0; i < source.Length; i++)
            {
                var hv = source[i];
                ulong v = hv.Full();
                byte b = (byte)((v >> shift) & RADIX_MASK);
                dest[counts[b]++] = hv;
            }
            
            return true;
        }
    }
}