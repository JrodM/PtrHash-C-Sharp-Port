# PtrHash Algorithm Comparison: Rust vs C# Port

## Overview

This document provides a detailed comparison of the build/construction algorithms between the Rust implementation and C# port of PtrHash. The analysis focuses on algorithmic differences that could explain slower construction performance in the C# port.

## 1. Overall Algorithm Flow

### Rust Implementation
1. **Global seed retry loop**: Try up to 10 different global seeds
2. **Parallel shard/part construction**: Process parts in parallel using rayon
3. **Per-part algorithm**:
   - Sort hashes by bucket within part
   - Process buckets in size order (largest first)
   - Use binary heap for eviction queue
   - Try collision-free pilot first (hot path)
   - Find minimal collision pilot if needed
   - Evict and reprocess colliding buckets
4. **Remap free slots**: Build remap table for minimal perfect hashing

### C# Implementation
The C# port follows the same high-level structure but with some key differences in implementation details.

## 2. Key Algorithm Differences

### 2.1 Hash Sorting and Partitioning

**Rust**:
- Uses radix sort for O(n) sorting of hashes
- Sorts all hashes globally first, then finds part boundaries
- Checks for duplicates in parallel using `par_windows`

**C#**:
- Uses `Array.Sort` which is O(n log n) comparison sort
- Converts ReadOnlySpan to array for parallel processing
- Sequential duplicate checking with HashSet (adds overhead)

### 2.2 Bucket Processing Within Parts

**Rust**:
- `sort_buckets` returns sorted hashes AND maintains original hash-bucket mapping
- Processes buckets using the sorted hash array directly
- Uses unsafe pointer arithmetic for performance

**C#**:
- `SortBucketsInPart` creates new sorted hash array
- Uses ArrayPool for temporary allocations
- More allocations and copies compared to Rust

### 2.3 Pilot Search Algorithm

**Rust**:
- Size-specialized functions for buckets with 1-8 elements (compile-time optimization)
- Processes 4 hashes at a time to reduce branch misses
- Direct unsafe access to bitvec without bounds checking

**C#**:
- Size-specialized dispatch but all call the same underlying method
- Same 4x chunking optimization
- BitVec access has method call overhead

### 2.4 Eviction and Collision Handling

**Rust**:
- Uses BinaryHeap from standard library (highly optimized)
- Recent array to prevent eviction cycles
- Random starting pilot to prevent patterns
- Efficient closure for duplicate slot checking

**C#**:
- Custom BinaryHeap implementation (may be less optimized)
- Same recent array mechanism
- Same random pilot starting point
- Duplicate checking creates temporary array each time

### 2.5 Memory Access Patterns

**Rust**:
- Direct BitSlice access with minimal overhead
- Prefetching optimizations in query methods
- Cache-aligned memory allocations

**C#**:
- PartitionedBitVec adds indirection layer
- Manual cache alignment for pilots array
- More method call overhead

## 3. Performance-Critical Differences

### 3.1 Sorting Performance
- **Rust radix sort**: O(n) time complexity
- **C# Array.Sort**: O(n log n) time complexity
- For 1M+ keys, this is a significant difference

### 3.2 Memory Allocations
- **Rust**: Minimal allocations, reuses buffers
- **C#**: More allocations despite using ArrayPool
  - Converting ReadOnlySpan to array
  - Creating new sorted hash arrays
  - Temporary arrays for duplicate checking

### 3.3 Parallel Processing
- **Rust**: Uses rayon with work-stealing scheduler
- **C#**: Uses Parallel.For with fixed partitioning
- Rust's approach may have better load balancing

### 3.4 Hot Path Optimizations
- **Rust**: Aggressive inlining and unsafe code
- **C#**: MethodImplOptions.AggressiveInlining used but still has more overhead

## 4. Algorithmic Correctness

The C# port appears to correctly implement the core PtrHash algorithm:
- Same bucket processing order (largest first)
- Same pilot search strategy (0-255 sequential)
- Same eviction and collision resolution
- Same recent bucket tracking to prevent cycles
- Same termination conditions

## 5. Recommendations for C# Performance

1. **Replace Array.Sort with radix sort**: Implement a radix sort for O(n) sorting
2. **Reduce allocations**: 
   - Avoid converting ReadOnlySpan to array
   - Reuse buffers more aggressively
   - Consider using stackalloc for small temporary arrays
3. **Optimize BitVec access**: 
   - Consider unsafe implementation for hot paths
   - Reduce method call overhead
4. **Improve parallel scheduling**: 
   - Consider custom work-stealing implementation
   - Better load balancing for uneven part sizes
5. **Profile and optimize hot paths**:
   - Focus on SlotInPartHp calculations
   - Optimize duplicate slot checking
   - Consider SIMD for batch operations

## 6. Conclusion

The C# port correctly implements the PtrHash algorithm but has several performance inefficiencies:
- O(n log n) sorting instead of O(n)
- More memory allocations and copies
- Additional method call overhead
- Less optimized data structures (custom BinaryHeap vs std)

These differences compound, especially for large key sets, explaining the slower construction performance. The algorithm itself is sound, but the implementation needs optimization to match Rust's performance.