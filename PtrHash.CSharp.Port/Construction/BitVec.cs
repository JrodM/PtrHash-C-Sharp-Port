using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Numerics;

namespace PtrHash.CSharp.Port.Construction
{
    /// <summary>
    /// High-performance bit vector implementation using unmanaged memory
    /// Matches Rust's BitVec performance with zero-overhead bit operations
    /// </summary>
    public sealed unsafe class BitVec : IDisposable
    {
        private ulong* _bits;
        private readonly nuint _length;
        private readonly int _numWords;
        private bool _disposed;
        
        private const int BITS_PER_WORD = 64;
        private const int LOG2_BITS_PER_WORD = 6; // log2(64)
        
        public BitVec(nuint length)
        {
            _length = length;
            _numWords = (int)((length + BITS_PER_WORD - 1) / BITS_PER_WORD);
            
            // Allocate unmanaged memory
            var sizeInBytes = _numWords * sizeof(ulong);
            _bits = (ulong*)NativeMemory.Alloc((nuint)sizeInBytes);
            
            // Clear the memory
            NativeMemory.Clear(_bits, (nuint)sizeInBytes);
        }
        
        // Constructor for external unmanaged memory (no allocation)
        internal BitVec(nuint length, ulong* bits)
        {
            _length = length;
            _numWords = (int)((length + BITS_PER_WORD - 1) / BITS_PER_WORD);
            _bits = bits;
            _disposed = true; // Don't free external memory
        }
        
        public nuint Length => _length;
        
        /// <summary>
        /// Get raw pointer for maximum performance in hot paths
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong* GetBitsPtr() => _bits;
        
        /// <summary>
        /// Standard safe Get - includes bounds checking
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public bool Get(nuint index)
        {
            if (index >= _length)
                throw new IndexOutOfRangeException();
                
            var wordIndex = index >> LOG2_BITS_PER_WORD;
            var bitIndex = (int)(index & (BITS_PER_WORD - 1));
            return (_bits[wordIndex] & (1UL << bitIndex)) != 0;
        }
        
        /// <summary>
        /// Unsafe unchecked Get for hot paths - no bounds checking
        /// Matches Rust's get_unchecked() performance
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public bool GetUnchecked(nuint index)
        {
            var wordIndex = index >> LOG2_BITS_PER_WORD;
            var bitIndex = (int)(index & (BITS_PER_WORD - 1));
            return (_bits[wordIndex] & (1UL << bitIndex)) != 0;
        }
        
        /// <summary>
        /// Standard safe Set - includes bounds checking
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void Set(nuint index, bool value)
        {
            if (index >= _length)
                throw new IndexOutOfRangeException();
                
            var wordIndex = index >> LOG2_BITS_PER_WORD;
            var bitIndex = (int)(index & (BITS_PER_WORD - 1));
            var mask = 1UL << bitIndex;
            
            if (value)
                _bits[wordIndex] |= mask;
            else
                _bits[wordIndex] &= ~mask;
        }
        
        /// <summary>
        /// Unsafe unchecked Set for hot paths - no bounds checking
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public void SetUnchecked(nuint index, bool value)
        {
            var wordIndex = index >> LOG2_BITS_PER_WORD;
            var bitIndex = (int)(index & (BITS_PER_WORD - 1));
            var mask = 1UL << bitIndex;
            
            if (value)
                _bits[wordIndex] |= mask;
            else
                _bits[wordIndex] &= ~mask;
        }
        
        public nuint CountOnes()
        {
            nuint count = 0;
            for (int i = 0; i < _numWords; i++)
            {
                count += (nuint)BitOperations.PopCount(_bits[i]);
            }
            return count;
        }
        
        public nuint CountZeros()
        {
            return _length - CountOnes();
        }
        
        /// <summary>
        /// Efficiently iterates over only the zero bits (unset bits) in the bit vector.
        /// Iterates over zero bit positions with O(number_of_zeros) complexity
        /// instead of O(total_bits) by using bit manipulation to skip over set bits.
        /// </summary>
        /// <returns>An enumerable of indices where bits are zero</returns>
        public IEnumerable<nuint> IterZeros()
        {
            // Process each word by accessing through safe methods
            for (int wordIndex = 0; wordIndex < _numWords; wordIndex++)
            {
                var word = GetWord(wordIndex);
                var baseIndex = (nuint)(wordIndex * BITS_PER_WORD);
                
                // Skip words that are all 1s - major optimization for sparse bit vectors
                if (word == ulong.MaxValue)
                    continue;
                
                // Invert the word so we can find zero bits using trailing zero count
                var invertedWord = ~word;
                
                // Process all zero bits in this word
                while (invertedWord != 0)
                {
                    // Find the position of the next zero bit
                    var trailingZeros = BitOperations.TrailingZeroCount(invertedWord);
                    var bitIndex = baseIndex + (nuint)trailingZeros;
                    
                    // Only yield if within the actual bit vector length
                    if (bitIndex < _length)
                    {
                        yield return bitIndex;
                    }
                    else
                    {
                        // We've gone past the end of the bit vector, stop processing this word
                        yield break;
                    }
                    
                    // Clear the bit we just found to continue searching
                    invertedWord &= invertedWord - 1;
                }
            }
        }
        
        /// <summary>
        /// Helper method to get a word - keeps unsafe code out of iterator
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private ulong GetWord(int index)
        {
            return _bits[index];
        }
        
        public void Clear()
        {
            NativeMemory.Clear(_bits, (nuint)(_numWords * sizeof(ulong)));
        }
        
        public void Dispose()
        {
            if (!_disposed && _bits != null)
            {
                NativeMemory.Free(_bits);
                _bits = null;
                _disposed = true;
            }
            GC.SuppressFinalize(this);
        }
        
        ~BitVec()
        {
            Dispose();
        }
    }
}