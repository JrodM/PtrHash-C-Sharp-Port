using System;
using System.Collections.Generic;
using System.Linq;

namespace PtrHash.CSharp.Port.Construction
{
    public class PartitionedBitVec : IDisposable
    {
        private readonly BitVec[] _parts;
        private readonly nuint _slotsPerPart;
        private bool _disposed;
        
        public PartitionedBitVec(nuint parts, nuint slotsPerPart)
        {
            _parts = new BitVec[parts];
            _slotsPerPart = slotsPerPart;
            for (int i = 0; i < (int)parts; i++)
            {
                _parts[i] = new BitVec(slotsPerPart);
            }
        }
        
        public bool Get(nuint globalSlot)
        {
            var part = globalSlot / _slotsPerPart;
            var localSlot = globalSlot % _slotsPerPart;
            return _parts[part].Get(localSlot);
        }
        
        public void Set(nuint globalSlot, bool value)
        {
            var part = globalSlot / _slotsPerPart;
            var localSlot = globalSlot % _slotsPerPart;
            _parts[part].Set(localSlot, value);
        }
        
        public nuint CountOnes()
        {
            nuint total = 0;
            foreach (var part in _parts)
            {
                total += part.CountOnes();
            }
            return total;
        }
        
        public nuint CountZeros()
        {
            nuint total = 0;
            foreach (var part in _parts)
            {
                total += part.Length - part.CountOnes();
            }
            return total;
        }
        
        public nuint TotalLength => (nuint)_parts.Length * _slotsPerPart;
        
        public void Clear()
        {
            foreach (var part in _parts)
            {
                part.Clear();
            }
        }
        
        public BitVec[] Parts => _parts;
        
        public BitVec GetPart(int partIndex) => _parts[partIndex];
        
        /// <summary>
        /// Iterates over zero bits across all parts, yielding global indices.
        /// taken.iter().enumerate().flat_map(|(p, t)| t.iter_zeros().map(move |i| offset + i))
        /// </summary>
        /// <returns>An enumerable of global indices where bits are zero</returns>
        public IEnumerable<nuint> IterZeros()
        {
            for (int partIndex = 0; partIndex < _parts.Length; partIndex++)
            {
                var offset = (nuint)partIndex * _slotsPerPart;
                foreach (var localIndex in _parts[partIndex].IterZeros())
                {
                    yield return offset + localIndex;
                }
            }
        }
        
        /// <summary>
        /// Iterates over zero bits in a specific part, yielding local indices within that part.
        /// </summary>
        /// <param name="partIndex">The part to iterate over</param>
        /// <returns>An enumerable of local indices where bits are zero in the specified part</returns>
        public IEnumerable<nuint> IterZerosInPart(int partIndex)
        {
            if (partIndex < 0 || partIndex >= _parts.Length)
                throw new ArgumentOutOfRangeException(nameof(partIndex));
                
            return _parts[partIndex].IterZeros();
        }
        
        public void Dispose()
        {
            if (!_disposed)
            {
                foreach (var part in _parts)
                {
                    part?.Dispose();
                }
                _disposed = true;
            }
        }
    }
}