using System;

namespace PtrHash.CSharp.Port.Util
{
    /// <summary>
    /// Helper class to mimic Rust's Vec<BitVec> functionality
    /// </summary>
    internal class PartitionedBitVec : IDisposable
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
        
        // Direct access to part's BitVec for local slot operations
        public bool GetLocal(nuint part, nuint localSlot)
        {
            return _parts[part].Get(localSlot);
        }
        
        public void SetLocal(nuint part, nuint localSlot, bool value)
        {
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
        
        // Clear all bits for reuse
        public void Clear()
        {
            foreach (var part in _parts)
            {
                part.Clear();
            }
        }
        
        // Access to individual parts for remap algorithm
        public BitVec[] Parts => _parts;
        
        // Get a specific part's BitVec
        public BitVec GetPart(int partIndex) => _parts[partIndex];
        
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