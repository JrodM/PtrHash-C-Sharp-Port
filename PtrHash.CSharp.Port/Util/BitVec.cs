using System;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Port.Util
{
    /// <summary>
    /// High-performance bit vector implementation equivalent to Rust's BitVec
    /// Uses ulong array for efficient bit operations
    /// </summary>
    public sealed class BitVec
    {
        private readonly ulong[] _bits;
        private readonly nuint _length;
        
        private const int BITS_PER_WORD = 64;
        private const int LOG2_BITS_PER_WORD = 6; // log2(64)
        
        public BitVec(nuint length)
        {
            _length = length;
            var numWords = (length + BITS_PER_WORD - 1) / BITS_PER_WORD;
            _bits = new ulong[numWords];
        }
        
        public nuint Length => _length;
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public bool Get(nuint index)
        {
            if (index >= _length)
                throw new IndexOutOfRangeException();
                
            var wordIndex = index >> LOG2_BITS_PER_WORD;
            var bitIndex = (int)(index & (BITS_PER_WORD - 1));
            return (_bits[wordIndex] & (1UL << bitIndex)) != 0;
        }
        
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
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public unsafe bool GetUnchecked(nuint index)
        {
            var wordIndex = index >> LOG2_BITS_PER_WORD;
            var bitIndex = (int)(index & (BITS_PER_WORD - 1));
            return (_bits[wordIndex] & (1UL << bitIndex)) != 0;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public unsafe void SetUnchecked(nuint index, bool value)
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
            for (nuint i = 0; i < (nuint)_bits.Length; i++)
            {
                count += (nuint)System.Numerics.BitOperations.PopCount(_bits[i]);
            }
            return count;
        }
        
        public void Clear()
        {
            Array.Clear(_bits, 0, _bits.Length);
        }
    }
}