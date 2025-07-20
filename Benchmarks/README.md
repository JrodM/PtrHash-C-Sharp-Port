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
| 1K        | 2.40 μs    | 3.26 μs (0.74x) | 2.90 μs (0.83x) | 3.11 μs (0.77x) | 3.46 μs (0.69x) | 3.13 μs (0.77x) |
| 10K       | 44.66 μs   | 31.60 μs (1.41x) | 31.34 μs (1.42x) | 31.36 μs (1.42x) | 32.37 μs (1.38x) | 30.15 μs (1.48x) |
| 100K      | 71.92 μs   | 33.94 μs (2.12x) | 49.99 μs (1.44x) | 45.58 μs (1.58x) | 36.33 μs (1.98x) | 34.68 μs (2.07x) |
| 1M        | 116.91 μs  | 42.46 μs (2.75x) | 78.02 μs (1.50x) | 62.39 μs (1.87x) | 61.75 μs (1.89x) | 49.16 μs (2.38x) |
| 10M       | 189.95 μs  | 97.97 μs (1.94x) | 144.45 μs (1.31x) | 91.73 μs (2.07x) | 113.58 μs (1.67x) | 72.61 μs (2.62x) |

**Key Findings:**
- Dictionary only wins at very small datasets (1K keys)
- Single-part streaming achieves best performance: up to 2.62x speedup
- Port streaming consistently outperforms point lookups
- Native streaming maintains strong performance across all sizes

#### 2. Scaling Behavior (DictionaryLookupScalingBenchmark)
Fixed 2M keys, varying lookup counts:

| Lookups | Dictionary | Native Stream | Multi-Part Stream | Single-Part Stream |
|---------|------------|---------------|-------------------|-----------|
| 1K      | 4.40 μs    | 3.67 μs (1.20x) | 4.56 μs (0.97x) | 3.61 μs (1.22x) |
| 10K     | 137.26 μs  | 56.00 μs (2.45x) | 74.32 μs (1.85x) | 47.21 μs (2.91x) |
| 50K     | 978.28 μs  | 317.69 μs (3.08x) | 362.87 μs (2.70x) | 214.15 μs (4.57x) |
| 100K    | 4,520.25 μs | 905.88 μs (4.99x) | 1,114.22 μs (4.06x) | 699.95 μs (6.46x) |
| 200K    | 10,202.16 μs | 2,179.00 μs (4.68x) | 3,121.23 μs (3.27x) | 2,613.18 μs (3.90x) |

**Key Findings:**
- Performance advantage increases with lookup count
- Single-part achieves up to 6.46x speedup at 100K lookups
- Dictionary performance degrades more severely at higher lookup counts

#### 3. Core PtrHash Performance (PtrHashCoreBenchmark)
5M keys dataset with Native Stream as baseline:

| Method | 1K Lookups | 100K Lookups | 1M Lookups |
|--------|------------|--------------|------------|
| **Native Stream** (Baseline) | 2.34 μs | 240.58 μs | 2,606.10 μs |
| **Native Point** | 20.23 μs (8.64x) | 2,013.93 μs (8.37x) | 20,158.78 μs (7.74x) |
| **Multi-Part Point** | 5.62 μs (2.40x) | 701.80 μs (2.92x) | 7,079.86 μs (2.72x) |
| **Single-Part Point** | 2.59 μs (1.10x) | 354.22 μs (1.47x) | 3,634.62 μs (1.39x) |
| **Multi-Part Stream** | 5.90 μs (2.52x) | 725.15 μs (3.01x) | 7,469.91 μs (2.87x) |
| **Single-Part Stream** | 2.70 μs (1.15x) | 346.55 μs (1.44x) | 3,701.44 μs (1.42x) |

**Key Findings:**
- Native stream is fastest, establishes performance baseline
- Native point lookups are ~8x slower than streaming (no batching benefits)
- Single-part port achieves near-native streaming performance (1.1-1.4x slower)
- Multi-part has overhead but still outperforms native point lookups

#### 4. Construction Performance (ConstructionBenchmark)
HashSet as baseline across varying dataset sizes:

**1K Keys:**
| Method | Mean | Ratio | Allocated | Memory Ratio |
|--------|------|-------|-----------|--------------|
| **HashSet** (Baseline) | 3.30 μs | 1.00x | 22 KB | 1.00x |
| **Port Multi-Part** | 54.22 μs | 16.50x | 30 KB | 1.36x |
| **Port Single-Part** | 72.79 μs | 22.17x | 30 KB | 1.36x |
| **Native Interop** | 3,579 μs | 962.89x | 0.5 KB | 0.02x |

**10K Keys:**
| Method | Mean | Ratio | Allocated | Memory Ratio |
|--------|------|-------|-----------|--------------|
| **HashSet** (Baseline) | 84.42 μs | 1.00x | 202 KB | 1.00x |
| **Port Multi-Part** | 1,234 μs | 14.64x | 126 KB | 0.62x |
| **Port Single-Part** | 1,235 μs | 14.65x | 126 KB | 0.62x |
| **Native Interop** | 4,835 μs | 57.47x | 0.5 KB | 0.002x |

**100K Keys:**
| Method | Mean | Ratio | Allocated | Memory Ratio |
|--------|------|-------|-----------|--------------|
| **HashSet** (Baseline) | 1.30 ms | 1.00x | 2,174 KB | 1.00x |
| **Port Multi-Part** | 7.98 ms | 6.13x | 1,125 KB | 0.52x |
| **Port Single-Part** | 13.85 ms | 10.64x | 1,088 KB | 0.50x |
| **Native Interop** | 6.31 ms | 4.86x | 0.5 KB | 0.0002x |

**1M Keys:**
| Method | Mean | Ratio | Allocated | Memory Ratio |
|--------|------|-------|-----------|--------------|
| **HashSet** (Baseline) | 24.54 ms | 1.00x | 23,255 KB | 1.00x |
| **Port Multi-Part** | 91.88 ms | 3.74x | 10,715 KB | 0.46x |
| **Port Single-Part** | 169.38 ms | 6.90x | 10,690 KB | 0.46x |
| **Native Interop** | 25.37 ms | 1.03x | 0.5 KB | 0.00002x |

**10M Keys:**
| Method | Mean | Ratio | Allocated | Memory Ratio |
|--------|------|-------|-----------|--------------|
| **HashSet** (Baseline) | 668.35 ms | 1.00x | 200,001 KB | 1.00x |
| **Native Interop** | 175.03 ms | 0.26x | 1.1 KB | 0.000005x |
| **Port Multi-Part** | 842.30 ms | 1.26x | 106,911 KB | 0.53x |
| **Port Single-Part** | 2,430.82 ms | 3.64x | 106,690 KB | 0.53x |

**Key Findings:**
- **Small datasets (1K-10K)**: HashSet dominates with much faster construction
- **Medium datasets (100K)**: Native interop becomes competitive while using minimal memory
- **Large datasets (1M+)**: Native interop outperforms HashSet at 10M keys (0.26x)
- **Memory efficiency**: PtrHash uses 0.00002-0.53x memory compared to HashSet
- **Port performance**: Multi-part consistently faster than single-part for construction
- **Scaling**: Native interop construction scales better than HashSet for very large datasets

### Summary

1. **Native vs Port Performance**: Native streaming provides the best lookup performance. The C# port achieves excellent performance at 1.1-1.4x slower than native for single-part streaming.

2. **Streaming vs Point Lookups**: Streaming lookups are dramatically faster (~8x) than point lookups for native code due to better memory access patterns and batching.

3. **Single-Part vs Multi-Part**: Single-part provides ~2x better lookup performance and approaches native streaming speeds, while multi-part offers better construction scalability.

4. **Construction Trade-offs**: 
   - HashSet: Fastest construction but highest memory usage (2.1 MB for 100K keys)
   - PtrHash: 5-10x slower construction but 50-99.98% less memory usage
   - Choose based on your needs: frequent construction vs long-lived lookups

5. **Memory Efficiency**: PtrHash excels at memory efficiency - native uses < 1KB while port uses ~1MB for 100K keys, compared to HashSet's 2.1MB.

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