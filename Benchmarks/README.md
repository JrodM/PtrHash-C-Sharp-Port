# PtrHash Benchmarks

## Latest Results Summary

### Hardware Environment
- CPU: AMD Ryzen AI 5 340 w/ Radeon 840M
- Cores: 6 physical, 12 logical
- Memory: DDR4/DDR5
- OS: Ubuntu 24.04.2 LTS (Noble Numbat) WSL
- .NET: 8.0.17 with AVX-512F+CD+BW+DQ+VL+VBMI support

> **Note**: These benchmarks use static abstract interface methods for optimal monomorphism and zero virtual call overhead.

### Key Performance Metrics

#### 1. Dictionary vs PtrHash Comparison (DictionaryImplementationComparisonBenchmark)

**Test Setup**: 
- **Lookup pattern**: 10,000 lookups with 50% hit rate (5K hits, 5K misses)
- **Key distribution**: Misses are generated to ensure they're not in the dataset
- **Baseline**: Standard Dictionary TryGetValue

| Key Count | Dictionary | Native Stream | Port Multi-Part Point | Port Multi-Part Stream | Port Single-Part Point | Port Single-Part Stream |
|-----------|------------|---------------|----------------------|------------------------|------------------------|------------------------|
| 10K       | 36.16 μs   | 43.66 μs (1.21x) | 28.41 μs (0.78x) | 39.13 μs (1.08x) | 28.46 μs (0.79x) | 72.04 μs (2.00x) |
| 100K      | 63.10 μs   | 49.55 μs (0.78x) | 44.68 μs (0.70x) | 43.34 μs (0.68x) | 36.85 μs (0.58x) | 37.61 μs (0.59x) |
| 1M        | 92.09 μs   | 54.49 μs (0.59x) | 68.66 μs (0.74x) | 71.66 μs (0.78x) | 55.60 μs (0.60x) | 91.80 μs (0.99x) |
| 10M       | 186.72 μs  | 85.43 μs (0.46x) | 116.90 μs (0.63x) | 93.57 μs (0.51x) | 102.13 μs (0.55x) | 112.70 μs (0.60x) |

**Key Findings:**
- Dictionary competitive only at smallest dataset (10K)
- PtrHash dominates at scale: Native stream achieves **2.18x speedup** at 10M keys
- Single-part point lookups excel at mid-range (100K): **1.71x faster** than Dictionary
- Multi-part stream surprisingly competitive, often beating point lookups
- All PtrHash variants show zero memory allocations during lookups

#### 2. Scaling Behavior (DictionaryLookupScalingBenchmark)
Fixed 2M keys, varying lookup counts (50% hit rate):

| Lookups | Dictionary | Native Multi | Native Single | Multi-Part Stream | Single-Part Stream | Single-Part U64 |
|---------|------------|--------------|---------------|-------------------|-------------------|----------------|
| 1K      | 4.07 μs    | 4.22 μs (0.96x) | 4.34 μs (0.94x) | 5.67 μs (0.72x) | 5.10 μs (0.80x) | 5.03 μs (0.81x) |
| 50K     | 1,152 μs   | 370 μs (3.11x) | 369 μs (3.12x) | 392 μs (2.94x) | 309 μs (3.73x) | 328 μs (3.51x) |
| 100K    | 4,695 μs   | 1,437 μs (3.27x) | 1,313 μs (3.58x) | 1,097 μs (4.28x) | 886 μs (5.30x) | 901 μs (5.21x) |
| 1M      | 56,922 μs  | 18,429 μs (3.09x) | 18,773 μs (3.03x) | 17,218 μs (3.31x) | 16,649 μs (3.42x) | 17,002 μs (3.35x) |
| 10M     | 563,027 μs | 181,922 μs (3.09x) | 179,927 μs (3.13x) | 172,874 μs (3.26x) | 165,114 μs (3.41x) | 164,662 μs (3.42x) |

**Key Findings:**
- Small lookup counts favor Dictionary, but PtrHash quickly dominates
- **Best performance**: Single-part stream achieves up to **5.30x speedup** at 100K lookups
- Performance advantage stabilizes around **3.4x** for very large lookup counts
- All PtrHash variants significantly outperform Dictionary at scale
- Native and port performance are very competitive

#### 3. Core PtrHash Performance (NativeVsPortPerformanceBenchmark)

**Test Setup**: 
- **Dataset**: 5M unique random keys generated with fixed seed
- **Lookup pattern**: 50% hit rate - half the lookups are keys present in the dataset, half are random keys not in the dataset
- **Key distribution**: Lookup keys are shuffled using Fisher-Yates to ensure random hit/miss distribution
- **Baseline**: Native multi-part point lookups

**Results for .NET 8.0 Runtime:**

| Method | 1K Lookups | 100K Lookups |
|--------|------------|--------------|
| **Multi-Part Native Point** (Baseline) | 4.019 μs | 510.404 μs |
| **Multi-Part Port Point** | 2.360 μs (0.59x) | 330.281 μs (0.65x) |
| **Single-Part Native Point** | 4.095 μs (1.02x) | 524.281 μs (1.03x) |
| **Single-Part Port Point** | 1.829 μs (0.46x) | 266.156 μs (0.52x) |
| **Multi-Part Native Stream Prefetch32** | 2.344 μs (0.58x) | 250.141 μs (0.49x) |
| **Multi-Part Port Stream** | 2.340 μs (0.58x) | 319.100 μs (0.63x) |
| **Multi-Part Port StreamPrefetch** | 3.326 μs (0.83x) | 345.077 μs (0.68x) |
| **Single-Part Native Stream Prefetch32** | 2.329 μs (0.58x) | 253.099 μs (0.50x) |
| **Single-Part Port Stream** | 1.866 μs (0.46x) | 260.767 μs (0.51x) |
| **Single-Part Port StreamPrefetch** | 3.345 μs (0.83x) | 342.419 μs (0.67x) |

**Results for NativeAOT 8.0:**

| Method | 1K Lookups | 100K Lookups |
|--------|------------|--------------|
| **Multi-Part Native Point** | 7.689 μs (1.91x) | 772.548 μs (1.51x) |
| **Multi-Part Port Point** | 3.056 μs (0.76x) | 414.436 μs (0.81x) |
| **Single-Part Native Point** | 7.671 μs (1.91x) | 771.150 μs (1.51x) |
| **Single-Part Port Point** | 3.008 μs (0.75x) | 359.978 μs (0.71x) |
| **Multi-Part Native Stream Prefetch32** | 2.337 μs (0.58x) | 251.032 μs (0.49x) |
| **Multi-Part Port Stream** | 3.272 μs (0.81x) | 430.210 μs (0.84x) |
| **Multi-Part Port StreamPrefetch** | 3.544 μs (0.88x) | 363.799 μs (0.71x) |
| **Single-Part Native Stream Prefetch32** | 2.400 μs (0.60x) | 249.416 μs (0.49x) |
| **Single-Part Port Stream** | 2.927 μs (0.73x) | 389.879 μs (0.76x) |
| **Single-Part Port StreamPrefetch** | 3.618 μs (0.90x) | 363.961 μs (0.71x) |

**Key Findings:**
- **C# Port dominates**: Port consistently outperforms native in point lookups (0.46-0.52x faster on .NET 8.0)
- **Single-part wins**: Single-part port point lookups are the fastest method across all scenarios
- **Stream beats prefetch**: Regular streaming outperforms prefetch implementation due to simpler control flow
- **NativeAOT penalty**: Point lookups suffer ~2x slowdown on NativeAOT, but streaming remains competitive
- **Native streaming excellence**: Native prefetch32 provides best streaming performance (0.49-0.50x baseline)
- **Memory efficiency**: All methods show zero allocations except minor GC activity (1-3 bytes)

#### 4. Construction Performance (ConstructionBenchmark)
Construction time comparison across dataset sizes:

| Dataset | HashSet | Native Interop | Native StrongerHash | Port Multi-Part | Port Single-Part | Port Multi-Strong | Port Single-Strong |
|---------|---------|----------------|-------------------|-----------------|------------------|------------------|------------------|
| **1K** | 4.14 μs | 4,135 μs (1000x) | 4,047 μs (978x) | 75.9 μs (18.3x) | 103.3 μs (25.0x) | 79.6 μs (19.2x) | 69.0 μs (16.7x) |
| **10K** | 125.9 μs | 4,979 μs (39.5x) | 5,005 μs (39.8x) | 1,293 μs (10.3x) | 1,275 μs (10.1x) | 1,291 μs (10.3x) | 1,303 μs (10.4x) |
| **100K** | 1,969 μs | 6,831 μs (3.5x) | 6,729 μs (3.4x) | 8,194 μs (4.2x) | 14,023 μs (7.1x) | 8,269 μs (4.2x) | 13,923 μs (7.1x) |
| **1M** | 31,162 μs | 28,195 μs (0.90x) | 27,620 μs (0.89x) | 91,820 μs (2.9x) | 175,434 μs (5.6x) | 90,651 μs (2.9x) | 175,157 μs (5.6x) |
| **10M** | 748,173 μs | 194,728 μs (0.26x) | 195,794 μs (0.26x) | 862,783 μs (1.15x) | 2,618,727 μs (3.5x) | 888,808 μs (1.19x) | 2,642,235 μs (3.5x) |

**Memory Allocation Comparison:**

| Dataset | HashSet | Native Interop | Port Multi-Part | Port Single-Part |
|---------|---------|----------------|-----------------|------------------|
| **1K** | 22.2 KB | 102 B | 37.7 KB | 43.8 KB |
| **10K** | 202.3 KB | 102 B | 186.2 KB | 183.1 KB |
| **100K** | 2,173 KB | 102 B | 1,226 KB | 1,196 KB |
| **1M** | 23,255 KB | 108 B | 10,702 KB | 10,686 KB |
| **10M** | 200,001 KB | 341 B | 105,728 KB | 105,492 KB |

**Key Findings:**
- **Small datasets (1K-10K)**: HashSet dominates construction speed
- **Large datasets (1M+)**: Native interop significantly outperforms HashSet (0.26x at 10M keys)
- **C# Port**: Multi-part construction consistently faster than single-part
- **Memory efficiency**: Native uses minimal memory (~100B), Port uses ~50% of HashSet memory
- **Scalability**: Native shows excellent scaling, Port reasonable, HashSet poor at large scales
- **Hash functions**: StrongerHash vs FxHash shows minimal construction impact

### Summary

1. **C# Port Outperforms Native**: The C# port now consistently outperforms native interop for point lookups, achieving **54% better performance** (0.46x of native time) for single-part configurations. This demonstrates the power of modern .NET optimizations.

2. **Test Methodology**: All benchmarks use:
   - **50% hit rate**: Half the lookups are keys in the dataset, half are random misses
   - **Shuffled distribution**: Fisher-Yates shuffle ensures random hit/miss patterns
   - **Fixed seeds**: Reproducible results across runs
   - **Realistic scenarios**: Mimics real-world lookup patterns

3. **Performance Hierarchy**:
   - **Best**: Single-part port point lookups (1.829 μs for 1K lookups)
   - **Excellent**: Native streaming with prefetch (2.329 μs)
   - **Good**: Regular port streaming (1.866-2.340 μs)
   - **Slower**: Port prefetch implementation (3.3+ μs)

4. **Streaming vs Prefetch**: Counter-intuitively, regular streaming outperforms the prefetch implementation due to:
   - Simpler control flow
   - Better branch prediction
   - Less overhead from ring buffer management
   - Small dataset sizes that fit in cache

5. **NativeAOT Considerations**:
   - Point lookups suffer ~2x performance penalty on NativeAOT
   - Streaming performance remains competitive
   - Native interop calls are more expensive without JIT optimizations

6. **Scaling Excellence**: 
   - **Small datasets**: Dictionary competitive but PtrHash catches up quickly
   - **Large datasets**: PtrHash dominates with up to 5.30x speedup
   - **Construction**: Native excels at large scales (0.26x vs HashSet at 10M keys)

7. **Memory Efficiency**: 
   - **Near-zero allocations**: Only 1-3 bytes of GC activity during lookups
   - **Construction**: Native uses ~100B-1KB, Port uses ~50% of HashSet memory
   - **Space efficiency**: Both provide excellent memory utilization

8. **Best Practices**:
   - **For maximum performance**: Use single-part port point lookups
   - **For streaming workloads**: Use native with prefetch32
   - **For NativeAOT**: Consider native streaming over port point lookups
   - **For construction of large datasets**: Use native interop

### Running Benchmarks

```bash
# Show available benchmarks
dotnet run -c Release

# Run specific benchmarks
dotnet run -c Release -- dictionaries    # Dictionary comparisons
dotnet run -c Release -- dict-scaling    # Scaling behavior
dotnet run -c Release -- construct       # Construction performance
dotnet run -c Release -- core            # Core PtrHash methods

# Run all benchmarks
dotnet run -c Release -- all
```

### Notes
- All timings are in microseconds (μs)
- Ratios show speedup relative to baseline (Dictionary or Multi-Part)
- Results include memory diagnostics where available
- Multiple iterations ensure statistical significance











+--------------------------------------+-------------------------------------------------------------+
| Feature                              | Removes                                                     |
+--------------------------------------+-------------------------------------------------------------+
| DisableRuntimeMarshalling            | • Argument/runtime data marshalling code                    |
|                                      | • Pinning & buffer copying (strings, structs)               |
|                                      | • Security stack‑walk & runtime stub setup (~100 ns+)       |
+--------------------------------------+-------------------------------------------------------------+
| LibraryImport (source‑gen P/Invoke)  | • JIT‑emitted IL stub                                        |
|                                      | • Reflection‑based lookup of entrypoint                     |
|                                      | • Per‑call metadata checks                                  |
+--------------------------------------+-------------------------------------------------------------+
| SuppressGCTransition                 | • Thread GC mode switch (cooperative ⇄ preemptive) (~20 ns) |
+--------------------------------------+-------------------------------------------------------------+
| **Combined**                         | All of the above → ~10–20 ns raw call                        |
+--------------------------------------+-------------------------------------------------------------+
https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/integral-numeric-types#native-sized-integers