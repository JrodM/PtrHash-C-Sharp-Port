using System;

namespace PtrHash.CSharp.Port.Util
{
    /// <summary>
    /// Bucket information for eviction queue priority
    /// Implements IComparable to work with BinaryHeap (max-heap by bucket size)
    /// </summary>
    public readonly struct BucketInfo : IComparable<BucketInfo>, IEquatable<BucketInfo>
    {
        public readonly nuint BucketSize;
        public readonly nuint BucketId;
        
        public BucketInfo(nuint bucketSize, nuint bucketId)
        {
            BucketSize = bucketSize;
            BucketId = bucketId;
        }
        
        public int CompareTo(BucketInfo other)
        {
            // Compare by bucket size first (larger size has higher priority)
            var sizeCompare = BucketSize.CompareTo(other.BucketSize);
            if (sizeCompare != 0)
                return sizeCompare;
                
            // If sizes are equal, compare by bucket ID for deterministic ordering
            return BucketId.CompareTo(other.BucketId);
        }
        
        public bool Equals(BucketInfo other)
        {
            return BucketSize == other.BucketSize && BucketId == other.BucketId;
        }
        
        public override bool Equals(object? obj)
        {
            return obj is BucketInfo other && Equals(other);
        }
        
        public override int GetHashCode()
        {
            return HashCode.Combine(BucketSize, BucketId);
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
            return $"BucketInfo(size: {BucketSize}, id: {BucketId})";
        }
    }
}