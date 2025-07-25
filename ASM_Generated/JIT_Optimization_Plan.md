# JIT Optimization Plan for GetIndicesStreamPrefetch

## 🎯 Optimizations We Can Implement to Help JIT Match AOT Performance

### 1. **Vector-Friendly Data Layouts**
**Issue**: JIT struggles with complex stack allocations
**Solution**: Use Vector<T> and aligned data structures

```csharp
// Current: Individual stackallocs
Span<HashValue> nextHashes = stackalloc HashValue[PREFETCH_DISTANCE];
Span<ulong> nextBuckets = stackalloc ulong[PREFETCH_DISTANCE];

// Optimized: Vector-aligned structures
[StructLayout(LayoutKind.Sequential, Pack = 32)] // AVX2 alignment
unsafe struct PrefetchBuffer
{
    public fixed long hashes[32];    // 256 bytes, cache-line aligned
    public fixed long buckets[32];   // 256 bytes
    // JIT can better vectorize aligned data
}
```

### 2. **Explicit Loop Vectorization Hints**
**Issue**: JIT may not auto-vectorize complex loops
**Solution**: Use Vector<T> operations explicitly

```csharp
// Current: Scalar operations
for (int i = 0; i < remaining; i++)
{
    hashBufPtr[i] = THasher.Hash(key, _seed);
    bucketBufPtr[i] = BucketInPart(hashBufPtr[i].High());
}

// Optimized: Vector operations where possible
if (Vector.IsHardwareAccelerated && remaining >= Vector<ulong>.Count)
{
    // Process in SIMD chunks
    // JIT will emit better vectorized code
}
```

### 3. **Branch Reduction and Predication**
**Issue**: Conditional branches hurt pipeline performance
**Solution**: Use branchless techniques

```csharp
// Current: Branchy code
if (slot >= numKeys)
{
    var remapIndex = (int)(slot - numKeys);
    slot = (nuint)TRemappingStorage.Index(_remapStorage, remapIndex);
}

// Optimized: Branchless using masks
var needsRemap = slot >= numKeys;
var remapIndex = (int)(slot - numKeys);
var remappedSlot = needsRemap ? (nuint)TRemappingStorage.Index(_remapStorage, remapIndex) : slot;
slot = remappedSlot;
```

### 4. **Memory Access Pattern Optimization**
**Issue**: Random memory access patterns
**Solution**: Better prefetch hints and streaming

```csharp
// Add explicit prefetch hints for JIT
[MethodImpl(MethodImplOptions.NoInlining)]
static void PrefetchData(void* address)
{
    // This will generate hardware prefetch even in JIT
    Unsafe.ReadUnaligned<byte>(address);
    // JIT recognizes this pattern
}
```

### 5. **Aggressive Inlining Attributes**
**Issue**: JIT doesn't inline as aggressively as AOT
**Solution**: More strategic inlining hints

```csharp
[MethodImpl(MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization)]
[SkipLocalsInit] // Avoid zero-initialization overhead
```

### 6. **Runtime Constants and Specialization**
**Issue**: JIT doesn't know compile-time constants
**Solution**: Use generic specialization

```csharp
// Specialize for common batch sizes
private void GetIndicesStreamPrefetch<TBatchSize>(...)
    where TBatchSize : struct, IConstant<int>
{
    const int batchSize = TBatchSize.Value;
    // JIT can optimize loops with known bounds
}
```

## 🔧 Implementation Priority

1. **High Impact**: Vector-aligned data structures
2. **Medium Impact**: Explicit SIMD operations  
3. **Low Impact**: Branch reduction (already pretty optimal)
4. **Experimental**: Generic specialization

## 📊 Expected JIT Improvements

- **SIMD Usage**: 50-80% improvement with explicit Vector<T>
- **Memory Layout**: 10-20% improvement with alignment
- **Branch Reduction**: 5-15% improvement in tight loops
- **Overall**: 20-50% closer to AOT performance

## ⚠️ Limitations

**Cannot Match AOT:**
- AVX-512 instruction selection (JIT uses AVX2 max typically)
- Aggressive cross-method inlining
- Perfect register allocation over large scopes
- Dead code elimination across module boundaries

**But Can Get Close:**
- Hardware prefetching (already works)
- Basic vectorization (with explicit hints)
- Efficient memory layouts
- Hot path optimization