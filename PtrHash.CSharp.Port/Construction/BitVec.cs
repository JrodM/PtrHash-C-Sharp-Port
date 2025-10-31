using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Numerics;

namespace PtrHash.CSharp.Port.Construction
{
    /// <summary>
    /// bit vector implementation using unmanaged memory
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
            
            var sizeInBytes = _numWords * sizeof(ulong);
            _bits = (ulong*)NativeMemory.Alloc((nuint)sizeInBytes);
            
            NativeMemory.Clear(_bits, (nuint)sizeInBytes);
        }
        
        public nuint Length => _length;
        
        /// <summary>
        /// Includes bounds checking
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
        /// Unsafe unchecked i.e no bounds checking
        /// Matches get_unchecked()
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
        
        public nuint CountOnes()
        {
            nuint count = 0;
            for (int i = 0; i < _numWords; i++)
            {
                count += (nuint)BitOperations.PopCount(_bits[i]);
            }
            return count;
        }
        
        /// <summary>
        /// Efficiently iterates over only the zero bits (unset bits) in the bit vector.
        /// Iterates over zero bit positions with O(number_of_zeros) complexity
        /// instead of O(total_bits) by using bit manipulation to skip over set bits.
        /// </summary>
        /// <returns>An enumerable of indices where bits are zero</returns>
        public IEnumerable<nuint> IterZeros()
        {
            for (int wordIndex = 0; wordIndex < _numWords; wordIndex++)
            {
                var word = GetWord(wordIndex);
                var baseIndex = (nuint)(wordIndex * BITS_PER_WORD);
                
                if (word == ulong.MaxValue)
                    continue;
                
                var invertedWord = ~word;

                while (invertedWord != 0)
                {
                    var trailingZeros = BitOperations.TrailingZeroCount(invertedWord);
                    var bitIndex = baseIndex + (nuint)trailingZeros;
                    
                    // Only yield if within the actual bit vector length
                    if (bitIndex < _length)
                    {
                        yield return bitIndex;
                    }
                    else
                    {
                        yield break;
                    }
                    
                    // Clear the bit we just found to continue searching
                    invertedWord &= invertedWord - 1;
                }
            }
        }
        
        /// <summary>
        /// Keeps unsafe code out of iterator
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