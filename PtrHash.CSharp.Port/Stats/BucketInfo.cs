using System;

namespace PtrHash.CSharp.Port.Stats
{
    /// <summary>
    /// Bucket information for eviction queue priority
    /// Implements IComparable to work with BinaryHeap (max-heap by bucket size)
    /// </summary>
    public readonly struct BucketInfo : IComparable<BucketInfo>, IEquatable<BucketInfo>
    {
        public nuint Size { get; }
        public nuint BucketId { get; }
        
        public BucketInfo(nuint size, nuint bucketId)
        {
            Size = size;
            BucketId = bucketId;
        }
        
        public int CompareTo(BucketInfo other)
        {
            // BinaryHeap in Rust is a max-heap, so we want larger sizes first
            // Return negative for larger sizes to get max-heap behavior
            var sizeCompare = other.Size.CompareTo(Size); // Reverse for max-heap
            if (sizeCompare != 0)
                return sizeCompare;
                
            // If sizes are equal, compare by bucket ID for deterministic ordering
            return other.BucketId.CompareTo(BucketId); // Reverse for deterministic order
        }
        
        public bool Equals(BucketInfo other)
        {
            return Size == other.Size && BucketId == other.BucketId;
        }
        
        public override bool Equals(object? obj)
        {
            return obj is BucketInfo other && Equals(other);
        }
        
        public override int GetHashCode()
        {
            return HashCode.Combine(Size, BucketId);
        }
        
        public static bool operator ==(BucketInfo left, BucketInfo right)
        {
            return left.Equals(right);
        }
        
        public static bool operator !=(BucketInfo left, BucketInfo right)
        {
            return !left.Equals(right);
        }
        
        public override string ToString()
        {
            return $"BucketInfo(size: {Size}, id: {BucketId})";
        }
    }
}