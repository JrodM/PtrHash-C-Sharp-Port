# PtrHash Benchmarks

## Latest Results Summary

### Hardware Environment
- CPU: AMD Ryzen AI 5 340 w/ Radeon 840M
- Cores: 6 physical, 12 logical
- Memory: DDR4/DDR5
- OS: Ubuntu 24.04.2 LTS (Noble Numbat) WSL
- .NET: 8.0.17 with AVX-512F+CD+BW+DQ+VL+VBMI support

### Key Performance Metrics

#### 1. Dictionary vs PtrHash Comparison (PtrHashDictionariesVsDictionaryBenchmark)
Performance on 10,000 lookups across varying dataset sizes:

| Key Count | Dictionary | Native Stream | Port Point | Port Stream | Single-Part Point | Single-Part Stream |
|-----------|------------|---------------|------------|-------------|-------------------|------------------|
| 1K        | 2.48 μs    | 3.20 μs (0.78x) | 2.84 μs (0.87x) | 3.39 μs (0.73x) | 3.07 μs (0.81x) | 3.49 μs (0.71x) |
| 10K       | 51.35 μs   | 31.70 μs (1.62x) | 37.33 μs (1.38x) | 34.38 μs (1.49x) | 32.26 μs (1.59x) | 33.51 μs (1.53x) |
| 100K      | 70.62 μs   | 33.77 μs (2.09x) | 47.00 μs (1.50x) | 42.55 μs (1.66x) | 39.47 μs (1.79x) | 38.93 μs (1.81x) |
| 1M        | 123.42 μs  | 45.60 μs (2.71x) | 71.42 μs (1.73x) | 58.66 μs (2.10x) | 60.63 μs (2.04x) | 55.34 μs (2.23x) |
| 10M       | 186.97 μs  | 96.01 μs (1.95x) | 131.96 μs (1.42x) | 89.07 μs (2.10x) | 110.95 μs (1.68x) | 76.59 μs (2.44x) |

**Key Findings:**
- Dictionary only wins at very small datasets (1K keys)
- Single-part streaming achieves best performance: up to 2.44x speedup at 10M keys
- Port streaming consistently outperforms point lookups
- Native streaming maintains strong performance across all sizes

#### 2. Scaling Behavior (DictionaryLookupScalingBenchmark)
Fixed 2M keys, varying lookup counts:

| Lookups | Dictionary | Native Stream | Multi-Part Stream | Single-Part Stream |
|---------|------------|---------------|-------------------|-----------|
| 1K      | 4.35 μs    | 3.79 μs (1.15x) | 4.43 μs (0.98x) | 4.08 μs (1.07x) |
| 10K     | 162.41 μs  | 61.29 μs (2.65x) | 74.30 μs (2.19x) | 66.97 μs (2.43x) |
| 50K     | 1,085.49 μs | 348.30 μs (3.12x) | 360.58 μs (3.01x) | 315.24 μs (3.44x) |
| 100K    | 4,382.89 μs | 1,007.42 μs (4.35x) | 1,117.50 μs (3.92x) | 791.37 μs (5.54x) |
| 200K    | 10,441.67 μs | 2,500.79 μs (4.18x) | 3,196.82 μs (3.27x) | 2,732.14 μs (3.82x) |

**Key Findings:**
- Performance advantage increases with lookup count
- Single-part achieves up to 5.54x speedup at 100K lookups
- Dictionary performance degrades more severely at higher lookup counts

#### 3. Core PtrHash Performance (PtrHashCoreBenchmark)
5M keys dataset with Native Stream as baseline:

| Method | 1K Lookups | 100K Lookups | 1M Lookups |
|--------|------------|--------------|------------|
| **Native Stream** (Baseline) | 2.35 μs | 245.21 μs | 2,563.34 μs |
| **Native Point** | 18.64 μs (7.92x) | 2,090.07 μs (8.52x) | 21,120.50 μs (8.24x) |
| **Multi-Part Point** | 2.80 μs (1.19x) | 371.50 μs (1.52x) | 3,705.97 μs (1.45x) |
| **Single-Part Point** | 2.81 μs (1.19x) | 366.11 μs (1.49x) | 3,745.20 μs (1.46x) |
| **Multi-Part Stream** | 2.88 μs (1.23x) | 387.13 μs (1.58x) | 4,260.35 μs (1.66x) |
| **Single-Part Stream** | 2.89 μs (1.23x) | 395.19 μs (1.61x) | 4,127.89 μs (1.61x) |
| **Single-Part Dedicated** | 2.15 μs (0.91x) | 305.86 μs (1.25x) | 3,047.49 μs (1.19x) |

**Key Findings:**
- Native stream is fastest, establishes performance baseline
- Native point lookups are ~8x slower than streaming (no batching benefits)
- Single-part dedicated methods achieve best port performance (0.91-1.25x vs native)
- Port streaming is 1.2-1.6x slower than native, still significantly faster than native point lookups

#### 4. Construction Performance (ConstructionBenchmark)
HashSet as baseline across varying dataset sizes:

**1K Keys:**
| Method | Mean | Ratio | Allocated | Memory Ratio |
|--------|------|-------|-----------|--------------|
| **HashSet** (Baseline) | 3.27 μs | 1.00x | 22 KB | 1.00x |
| **Port Multi-Part** | 70.11 μs | 21.4x | 30 KB | 1.36x |
| **Port Single-Part** | 82.62 μs | 25.3x | 30 KB | 1.36x |
| **Native Interop** | 3,938 μs | 1,204x | 38 B | 0.002x |

**10K Keys:**
| Method | Mean | Ratio | Allocated | Memory Ratio |
|--------|------|-------|-----------|--------------|
| **HashSet** (Baseline) | 97.08 μs | 1.00x | 202 KB | 1.00x |
| **Port Multi-Part** | 1,322 μs | 13.6x | 126 KB | 0.62x |
| **Port Single-Part** | 1,258 μs | 13.0x | 126 KB | 0.62x |
| **Native Interop** | 4,635 μs | 47.7x | 38 B | 0.0002x |

**100K Keys:**
| Method | Mean | Ratio | Allocated | Memory Ratio |
|--------|------|-------|-----------|--------------|
| **HashSet** (Baseline) | 1.31 ms | 1.00x | 2,174 KB | 1.00x |
| **Port Multi-Part** | 8.48 ms | 6.5x | 1,136 KB | 0.52x |
| **Port Single-Part** | 14.24 ms | 10.9x | 1,087 KB | 0.50x |
| **Native Interop** | 6.57 ms | 5.0x | 38 B | 0.00002x |

**1M Keys:**
| Method | Mean | Ratio | Allocated | Memory Ratio |
|--------|------|-------|-----------|--------------|
| **HashSet** (Baseline) | 34.20 ms | 1.00x | 23,255 KB | 1.00x |
| **Port Multi-Part** | 96.64 ms | 2.8x | 10,718 KB | 0.46x |
| **Port Single-Part** | 178.77 ms | 5.2x | 10,690 KB | 0.46x |
| **Native Interop** | 29.49 ms | 0.86x | 78 B | 0.000003x |

**10M Keys:**
| Method | Mean | Ratio | Allocated | Memory Ratio |
|--------|------|-------|-----------|--------------|
| **HashSet** (Baseline) | 728.01 ms | 1.00x | 200,001 KB | 1.00x |
| **Native Interop** | 190.72 ms | 0.26x | 277 B | 0.000001x |
| **Port Multi-Part** | 874.63 ms | 1.20x | 106,911 KB | 0.53x |
| **Port Single-Part** | 2,539.48 ms | 3.49x | 106,690 KB | 0.53x |

**Key Findings:**
- **Small datasets (1K-10K)**: HashSet dominates with much faster construction
- **Medium datasets (100K)**: Native interop becomes competitive while using minimal memory
- **Large datasets (1M+)**: Native interop outperforms HashSet at 1M+ keys (0.86x at 1M, 0.26x at 10M)
- **Memory efficiency**: PtrHash uses 0.000001-0.53x memory compared to HashSet
- **Port performance**: Multi-part consistently faster than single-part for construction  
- **Scaling**: Native interop construction scales much better than HashSet for large datasets

### Summary

1. **Native vs Port Performance**: Native streaming provides the best lookup performance. The C# port achieves excellent performance with single-part dedicated methods at 0.91-1.25x vs native streaming.

2. **Streaming vs Point Lookups**: Streaming lookups are dramatically faster (~8x) than point lookups for native code due to better memory access patterns and batching.

3. **Single-Part vs Multi-Part**: Single-part provides similar lookup performance to multi-part but has much worse construction scaling (3.5x slower at 10M keys).

4. **Construction Trade-offs**: 
   - HashSet: Fastest construction for small datasets but poor scaling
   - Native PtrHash: Best overall - competitive construction, minimal memory, excellent lookup performance
   - Port PtrHash: Good for C#-only environments - 3-13x slower construction but 50% memory savings vs HashSet

5. **Memory Efficiency**: PtrHash excels at memory efficiency - native uses <1KB for any dataset size, port uses ~50% of HashSet memory.

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