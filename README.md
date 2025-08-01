# PtrHash C# Port

A high-performance C# port of [PtrHash](https://github.com/RagnarGrootKoerkamp/ptrhash), a minimal perfect hash function (MPHF) optimized for query throughput at RAM speed.

> **PtrHash: Minimal Perfect Hashing at RAM Throughput**  
> by Ragnar Groot Koerkamp, ETH Zurich  
> Paper: [arXiv:2502.15539](https://arxiv.org/abs/2502.15539)

## What is PtrHash?

PtrHash is a minimal perfect hash function that bijectively maps n distinct keys to {0,...,n-1}. It prioritizes query throughput over space efficiency, making it ideal for applications where lookup speed is critical. The original implementation achieves query speeds as low as 8 ns/key when streaming, approaching the theoretical memory bandwidth limit.

## Features

This C# port provides:

- **Blazing fast lookups**: 2.66 ns/key point lookups (faster than native due to no P/Invoke overhead)
- **Memory efficient**: 2.40 bits/key with default parameters
- **Zero allocations during queries**: GC-friendly for high-throughput scenarios
- **Pure C# implementation**: Fully managed code with no native dependencies
- **Native interop available**: P/Invoke bindings to compare against Rust implementation
- **Dictionary compatibility**: Drop-in replacement via `PtrHashDictionary<TKey>`

## Performance Comparison

Based on benchmarks on AMD Ryzen AI 5 340:

### 1. Construction Performance (ConstructionBenchmark)
**What it tests**: Time to build the hash table from scratch with random ulong keys

| Dataset | HashSet<ulong> | Native Multi-Part | Native Single-Part | Port Multi-Part | Port Single-Part | Best Port/Native |
|---------|-----------------|-------------------|-------------------|-----------------|------------------|------------------|
| 10K | 0.13 ms | 5.6 ms | 5.3 ms | 1.3 ms | 1.2 ms | 0.23x |
| 100K | 1.96 ms | 7.2 ms | 7.3 ms | 7.9 ms | 13.8 ms | 1.10x |
| 1M | 31.8 ms | 27.5 ms | 27.4 ms | 94.3 ms | 172.1 ms | 3.43x |
| 10M | 691.4 ms | 199.6 ms | 200.6 ms | 910.2 ms | 2,580.4 ms | 4.56x |

**Key Findings:**
- C# Port is faster than native for small datasets (10K) due to P/Invoke overhead
- Native dominates at scale with multi-part being fastest for construction
- Port single-part is slowest but optimized for query performance
- Multi-part constructs faster but has slightly slower queries
- **Optimization opportunity**: Construction is 4.56x slower than native at 10M keys

### 2. Dictionary vs PtrHashDictionary Point Lookups (DictionaryImplementationComparisonBenchmark)
**Test Details**:
- **What**: Comparing `Dictionary<ulong,ulong>` vs `PtrHashDictionary<ulong,ulong>` (both with key validation)
- **Dataset**: 10K to 10M random ulong keys
- **Lookups**: 10,000 point lookups per test with 50% hit rate (5K existing keys, 5K non-existent keys)
- **Method**: Uses `TryGetValue` for both implementations

| Key Count | Dictionary<K,V> | PtrHashDict Native | PtrHashDict Port | Best Speedup | Notes |
|-----------|-----------------|--------------------|--------------------|--------------|-------|
| 10K | 36.16 μs | 43.66 μs | 28.46 μs | 1.27x | Dictionary competitive at small scale |
| 100K | 63.10 μs | 49.55 μs | 36.85 μs | 1.71x | PtrHash advantage grows |
| 1M | 92.09 μs | 54.49 μs | 55.60 μs | 1.66x | Native faster at 1M |
| 10M | 186.72 μs | 85.43 μs | 102.13 μs | 1.83x | Both PtrHash versions dominate |

### 3. Scaling Analysis (DictionaryLookupScalingBenchmark)
**Test Details**:
- **What**: How performance scales with lookup count
- **Dataset**: Fixed 2M keys
- **Lookups**: Varying from 1K to 10M lookups with 50% hit rate
- **Comparison**: Dictionary vs Native interop vs C# port streaming

| Lookups | Dictionary<K,V> | PtrHashDict Native Stream | PtrHashDict Port Stream | Best Speedup |
|---------|-----------------|---------------------------|-------------------------|--------------|
| 1K | 4.07 μs | 4.34 μs | 5.10 μs | 0.94x |
| 50K | 1,152 μs | 369 μs | 309 μs | 3.73x |
| 100K | 4,695 μs | 1,313 μs | 886 μs | 5.30x |
| 1M | 56,922 μs | 18,773 μs | 16,649 μs | 3.42x |
| 10M | 563,027 μs | 179,927 μs | 165,114 μs | 3.41x |

### 4. Raw PtrHash Methods (NativeVsPortPerformanceBenchmark)
**Test Details**:
- **What**: Comparing raw PtrHash performance (no dictionary wrapper)
- **Dataset**: 5M random ulong keys
- **Lookups**: 100K lookups with 50% hit rate, shuffled with Fisher-Yates
- **Methods**: Point lookups vs streaming with/without prefetch

| Method | 100K Lookups | ns/lookup | vs Baseline |
|--------|--------------|-----------|-------------|
| **Native Multi-Part Point** (baseline) | 510.404 μs | 5.10 ns | 1.00x |
| **Native Single-Part Point** | 524.281 μs | 5.24 ns | 1.03x |
| **Native Stream Prefetch32** | 250.141 μs | 2.50 ns | 0.49x |
| **Port Multi-Part Point** | 330.281 μs | 3.30 ns | 0.65x |
| **Port Single-Part Point** | 266.156 μs | 2.66 ns | 0.52x |
| **Port Stream** | 260.767 μs | 2.61 ns | 0.51x |
| **Port StreamPrefetch** | 342.419 μs | 3.42 ns | 0.67x |

**Key Findings:**
- C# Port consistently outperforms native in point lookups (2.66ns vs 5.24ns)
- Native streaming with prefetch achieves best throughput (2.50ns)
- Port streaming without prefetch nearly matches native prefetch (2.61ns)

## Usage

### Basic Example

```csharp
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;

// Create PtrHash for ulong keys
var keys = new ulong[] { 123, 456, 789, /* ... */ };
var parameters = new PtrHashParams
{
    Alpha = 0.99,       // Load factor
    Lambda = 3.0,       // Average bucket size
    Minimal = true,     // Create minimal perfect hash
    SinglePart = true   // Use single-part construction
};

using var ptrHash = new PtrHash<ulong, FxHasher, Linear, UInt32VectorRemappingStorage>(keys, parameters);

// Query
ulong key = 456;
ulong index = ptrHash.GetIndex(key);  // Returns index in [0, n-1]
```

### Dictionary Replacement

```csharp
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.BucketFunctions;
using PtrHash.CSharp.Port.Storage;

// Generic form - full control over implementation
var dict = new PtrHashDictionary<string, int, StringHasher, Linear, UInt32VectorRemappingStorage>(
    keys: new[] { "hello", "world", "foo" },
    values: new[] { 42, 100, 123 },
    notFoundSentinel: -1
);

// Convenience class for string keys (same as above but simpler)
var dictString = new PtrHashDictionaryString<int>(
    keys: new[] { "hello", "world", "foo" },
    values: new[] { 42, 100, 123 },
    notFoundSentinel: -1
);

int value = dict["hello"];  // Returns 42
bool exists = dict.TryGetValue("world", out int val);  // Returns true, val = 100
bool missing = dict.TryGetValue("missing", out int sentinel);  // Returns false, sentinel = -1
```

#### PtrHashDictionary Design Tradeoffs

The `PtrHashDictionary` implementation makes specific tradeoffs optimized for general use:

**Current Design Choices:**
- **Single-part construction**: Prioritizes lookup speed over construction time. Multi-part would construct faster but have slower lookups.
- **Minimal Perfect Hash (MPH)**: Uses remapping to achieve minimal space. A non-minimal Perfect Hash (PH) would be ~9% faster for raw PtrHash lookups based on the paper (11.6ns vs 12.7ns).
- **Key validation**: Stores and compares original keys to handle lookups of keys not in the training set, as expected for a general-purpose dictionary.

**Optimization Opportunities:**
If your use case guarantees that:
1. All lookup keys were in the original training set
2. No validation is needed for out-of-set keys
3. You can accept wrong results for invalid keys

Then you could create a specialized implementation that:
- Skips key storage entirely
- Eliminates key comparison overhead
- Uses non-minimal perfect hashing (no remapping) for ~10% faster lookups at ~1% memory cost

Example specialized usage:
```csharp
// Hypothetical optimized version for known-key scenarios
public class PtrHashLookupTable<TValue>
{
    // Only stores values, no keys
    // Assumes all lookups are valid
    // ~50% less memory, faster lookups
}
```


## Key Optimizations

### C# Port Optimizations

The C# port implements several critical optimizations to achieve Rust-like performance:

1. **Monomorphism via Const Generics**: To match Rust's zero-cost abstractions, we use interface-based const generics (e.g., `IBucketFunction`, `IKeyHasher`, `IRemappingStorage`) that get specialized at compile time. This ensures the JIT generates optimized code paths for each concrete type combination, eliminating virtual dispatch overhead.

2. **Size-based Specialization**: FindPilot methods use const generic dispatch based on bucket size, allowing the JIT to inline and optimize for specific sizes (similar to Rust's monomorphization).

3. **Radix Sort**: Custom radix sort implementation for hash value sorting, avoiding generic comparison overhead.

4. **Array Pooling**: Extensive use of `ArrayPool<T>` to minimize allocations during construction.

5. **Unsafe Code**: Strategic use of unchecked array access and pointer arithmetic in hot paths.

6. **SIMD-friendly Loops**: 4x unrolled loops aligned with CPU vector operations.

### Native Interop Optimizations

The native interop achieves remarkably low overhead (~10-20 ns per call) through:

- **DisableRuntimeMarshalling**: Removes marshalling code, pinning, buffer copying, and security stack walks (saves ~100+ ns)
- **LibraryImport**: Source-generated P/Invoke eliminates JIT-emitted IL stubs and reflection-based lookups
- **SuppressGCTransition**: Avoids thread GC mode switches between cooperative and preemptive (saves ~20 ns)

These optimizations reduce P/Invoke overhead from hundreds of nanoseconds to just 10-20 ns, making native interop competitive for performance comparisons.

## Limitations

This C# port does not support:
- **External-memory construction (sharding)**: The original supports datasets with >10^10 keys by sharding to disk

**Note on Streaming**: The port includes streaming query support with prefetching (`GetIndicesStreamPrefetch`), but performance is suboptimal due to JIT optimization conflicts. Regular streaming without prefetch often performs better. NativeAOT shows improved prefetch performance closer to native.

## Building

```bash
# Build the entire solution
dotnet build -c Release

# Run tests
dotnet test

# Run benchmarks
cd Benchmarks
dotnet run -c Release -- all
```

## Project Structure

- `PtrHash.CSharp.Port/` - Pure C# implementation
  - `Core/` - Main PtrHash implementation
  - `KeyHashers/` - Hash function implementations (FxHash, xxHash, StrongerIntHasher)
  - `BucketFunctions/` - Bucket assignment functions (Linear, CubicEps)
  - `Storage/` - Remapping storage implementations (VectorRemappingStorage, CachelineEf)
  - `Collections/` - Dictionary wrapper
  - `Construction/` - Build-time data structures (BitVec, BinaryHeap)
  - `Sorting/` - Custom RadixSort implementation
- `PtrHash.CSharp.Interop/` - Native Rust bindings
  - `PtrHash/` - Interop wrapper and dispatchers
  - `Native/` - P/Invoke declarations
  - `src/` - Rust source code
- `PtrHash.CSharp.Port.Tests/` - Unit tests
- `PtrHash.CSharp.Interop.Tests/` - Interop tests
- `Benchmarks/` - Performance benchmarks
- `docs/` - Documentation and paper

## Contributing

Areas for improvement:
- Construction performance optimization (currently 4.56x slower than native at 10M keys)
- Improved prefetching performance for streaming queries
- Additional key types and hash functions
- External-memory construction (sharding) for massive datasets

## License

This project is licensed under the same terms as the original PtrHash implementation.

## Acknowledgments

- [Ragnar Groot Koerkamp](https://github.com/RagnarGrootKoerkamp) for the original PtrHash algorithm and implementation
- The [paper](https://arxiv.org/abs/2502.15539) provides comprehensive details on the algorithm

## Citations

If you use this implementation, please cite the original paper:

```bibtex
@article{koerkamp2025ptrhash,
  title={PtrHash: Minimal Perfect Hashing at RAM Throughput},
  author={Ragnar Groot Koerkamp},
  journal={arXiv preprint arXiv:2502.15539},
  year={2025}
}
```