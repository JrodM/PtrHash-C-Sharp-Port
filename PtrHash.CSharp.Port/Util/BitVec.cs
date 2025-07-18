using System;
using System.Runtime.CompilerServices;
using System.Buffers;

namespace PtrHash.CSharp.Port.Util
{
    /// <summary>
    /// High-performance bit vector implementation equivalent to Rust's BitVec
    /// Uses ulong array for efficient bit operations
    /// </summary>
    public sealed class BitVec : IDisposable
    {
        private ulong[] _bits;
        private readonly nuint _length;
        private readonly int _numWords;
        private readonly bool _isPooled;
        
        private const int BITS_PER_WORD = 64;
        private const int LOG2_BITS_PER_WORD = 6; // log2(64)
        
        public BitVec(nuint length)
        {
            _length = length;
            _numWords = (int)((length + BITS_PER_WORD - 1) / BITS_PER_WORD);
            _bits = ArrayPool<ulong>.Shared.Rent(_numWords);
            _isPooled = true;
            
            // Clear only the portion we're using
            Array.Clear(_bits, 0, _numWords);
        }
        
        // Constructor for external array (no pooling)
        internal BitVec(nuint length, ulong[] bits)
        {
            _length = length;
            _numWords = (int)((length + BITS_PER_WORD - 1) / BITS_PER_WORD);
            _bits = bits;
            _isPooled = false;
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
            // Only count bits in the words we're actually using
            for (int i = 0; i < _numWords; i++)
            {
                count += (nuint)System.Numerics.BitOperations.PopCount(_bits[i]);
            }
            return count;
        }
        
        public void Clear()
        {
            Array.Clear(_bits, 0, _numWords);
        }
        
        public void Dispose()
        {
            if (_isPooled && _bits != null)
            {
                ArrayPool<ulong>.Shared.Return(_bits, clearArray: false);
                _bits = null!;
            }
        }
    }
}