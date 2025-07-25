# JIT Optimizations to Match AOT Performance

## 1. **Eliminate Interface Dispatch**
Replace `IBucketFunction` with concrete types or use generics:
```csharp
// Instead of:
if (_bucketFunction.IsLinear)

// Use:
private readonly bool _isLinearBucket; // Cache at construction
if (_isLinearBucket)
```

## 2. **Manual Loop Unrolling**
Process multiple items per iteration:
```csharp
// Process 4 items at once
while (processed + 4 <= mainLoopEnd)
{
    // Prefetch batch
    Sse.Prefetch0(_pilots + bucketBufPtr[(processed + PREFETCH_DISTANCE) & mask]);
    Sse.Prefetch0(_pilots + bucketBufPtr[(processed + PREFETCH_DISTANCE + 1) & mask]);
    Sse.Prefetch0(_pilots + bucketBufPtr[(processed + PREFETCH_DISTANCE + 2) & mask]);
    Sse.Prefetch0(_pilots + bucketBufPtr[(processed + PREFETCH_DISTANCE + 3) & mask]);
    
    // Process current batch
    // ... process 4 items ...
    
    processed += 4;
}
```

## 3. **Aggressive Inlining**
Force inline all hot path methods:
```csharp
[MethodImpl(MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization)]
private nuint BucketInPart(ulong high) { ... }
```

## 4. **Prefetch Distance Tuning**
```csharp
// AOT might use different prefetch distance
const int PREFETCH_DISTANCE = 64; // Try larger distance
```

## 5. **Memory Layout Optimization**
Ensure ring buffers are cache-aligned:
```csharp
// Align to cache line
Span<HashValue> nextHashes = stackalloc HashValue[PREFETCH_DISTANCE + 8];
var aligned = (HashValue*)((nint)(nextHashes.GetPinnableReference()) + 63 & ~63);
```

## 6. **Branch-Free Code**
Replace conditional logic with arithmetic:
```csharp
// Instead of: if (useMinimal && slot >= _numKeys)
// Use: var isRemap = (int)(slot >= _numKeys) & useMinimal;
```

## 7. **Profile-Guided Optimization**
Use environment variables to guide JIT:
```bash
export COMPlus_TC_QuickJitForLoops=0
export COMPlus_TC_CallCountThreshold=1
export COMPlus_JitMinOpts=0
export COMPlus_TieredPGO=1
```