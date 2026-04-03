# PtrHash C# Port

A high-performance C# port of [PtrHash](https://github.com/RagnarGrootKoerkamp/ptrhash), a minimal perfect hash function (MPHF) optimized for query throughput at RAM speed.

> **PtrHash: Minimal Perfect Hashing at RAM Throughput**  
> by Ragnar Groot Koerkamp, ETH Zurich  
> Paper: [arXiv:2502.15539](https://arxiv.org/abs/2502.15539)

## What is PtrHash?

PtrHash is a minimal perfect hash function that bijectively maps n distinct keys to {0,...,n-1}. It prioritizes query throughput over space efficiency, making it ideal for applications where lookup speed is critical. The original Rust implementation achieves **2.5 ns/key** when multi-threaded, while this C# port achieves **2.09 ns/key** single-threaded - achieving comparable performance to the original's best results.

## Performance Comparison

Based on benchmarks on AMD Ryzen AI 5 340:

### 1. Construction Performance (DataStructureConstructionBenchmark)
**What it tests**: Time to build the hash table from scratch with random ulong keys

| Dataset | HashSet<ulong> | Native Multi-Part | Native Single-Part | Port Multi-Part | Port Single-Part | Port vs Native (Multi) |
|---------|-----------------|-------------------|-------------------|-----------------|------------------|------------------------|
| 1K | 4.3 μs | 4,204 μs | 4,213 μs | 52.4 μs | 52.0 μs | **80x faster** |
| 10K | 127 μs | 5,173 μs | 5,138 μs | 791 μs | 758 μs | **6.5x faster** |
| 100K | 1,955 μs | 7,002 μs | 7,006 μs | 3,763 μs | 8,621 μs | **1.9x faster** |
| 1M | 31,166 μs | 26,654 μs | 27,137 μs | 42,719 μs | 107,287 μs | **1.6x slower** |
| 10M | 679,907 μs | 203,923 μs | 208,566 μs | 365,561 μs | 2,002,703 μs | **1.8x slower** |

**Construction Efficiency Analysis**:
| Dataset | HashSet Baseline | Native Multi-Part | Port Multi-Part | Port Single-Part | Best Choice |
|---------|------------------|-------------------|-----------------|------------------|-------------|
| 1K-10K | ~100 μs | ~4,200 μs | ~400 μs | ~400 μs | **Port** (10x faster) |
| 100K | 1,955 μs | 7,002 μs | 3,763 μs | 8,621 μs | **Port Multi-Part** |
| 1M+ | 31-680 ms | 27-204 ms | 43-366 ms | 107-2,003 ms | **Native Multi-Part** |

**Key Findings:**
- **Small datasets (<100K)**: Port dominates native due to P/Invoke overhead
- **Large datasets (1M+)**: Native wins, but port multi-part stays competitive
- **Single-part construction penalty**: 2.3-5.5x slower than multi-part at scale
- **Trade-off confirmed**: Single-part sacrifices construction speed for optimal query performance
- **Construction bottleneck**: Port is 1.6-1.8x slower than native at scale

### 2. Raw PtrHash Performance Analysis (NativeVsPortPerformanceBenchmark)
**Test Details**:
- **What**: Raw PtrHash methods comparing minimal vs perfect hashing
- **Dataset**: 2M random ulong keys
- **Lookups**: 1K, 50K, 100K, 1M lookups with 50% hit rate
- **Methods**: Point vs stream, minimal (GetIndex) vs perfect hash (GetIndexNoRemap)

**Point Lookup Performance (.NET 8.0)**:
| Lookups | Native Multi (baseline) | Port Multi GetIndex | Port Multi NoRemap | Port Single GetIndex | Port Single NoRemap | Best Port Speedup |
|---------|------------------------|--------------------|--------------------|---------------------|--------------------|--------------------|
| **1K** | 4.12 μs (4.12 ns) | 2.18 μs (2.18 ns) | **2.08 μs (2.08 ns)** | 1.83 μs (1.83 ns) | **1.68 μs (1.68 ns)** | **2.45x faster** |
| **50K** | 271.5 μs (5.43 ns) | 121.7 μs (2.43 ns) | **112.4 μs (2.25 ns)** | 104.0 μs (2.08 ns) | **88.1 μs (1.76 ns)** | **3.08x faster** |
| **100K** | 409.3 μs (4.09 ns) | 234.4 μs (2.34 ns) | **209.3 μs (2.09 ns)** | 194.2 μs (1.94 ns) | **169.2 μs (1.69 ns)** | **2.42x faster** |
| **1M** | 4,217 μs (4.22 ns) | 2,327 μs (2.33 ns) | **2,322 μs (2.32 ns)** | 2,111 μs (2.11 ns) | **1,715 μs (1.72 ns)** | **2.46x faster** |

**Stream Performance (.NET 8.0)**:
| Lookups | Native Multi Stream | Port Multi GetIndex | Port Multi NoRemap | Port Single GetIndex | Port Single NoRemap | Best Port vs Native |
|---------|---------------------|--------------------|--------------------|---------------------|--------------------|--------------------|
| **1K** | 2.39 μs (2.39 ns) | 2.36 μs (2.36 ns) | **2.23 μs (2.23 ns)** | 1.95 μs (1.95 ns) | **1.78 μs (1.78 ns)** | **1.34x faster** |
| **50K** | 118.6 μs (2.37 ns) | 125.0 μs (2.50 ns) | **118.1 μs (2.36 ns)** | 101.1 μs (2.02 ns) | **98.3 μs (1.97 ns)** | **1.21x faster** |
| **100K** | 235.1 μs (2.35 ns) | 245.2 μs (2.45 ns) | **219.7 μs (2.20 ns)** | 203.5 μs (2.04 ns) | **180.2 μs (1.80 ns)** | **1.30x faster** |
| **1M** | 2,417 μs (2.42 ns) | 2,554 μs (2.55 ns) | **2,292 μs (2.29 ns)** | 2,088 μs (2.09 ns) | **1,931 μs (1.93 ns)** | **1.25x faster** |

**Perfect Hash (GetIndexNoRemap) Performance Gains**:
| Lookups | Multi-Part Improvement | Single-Part Improvement | Range Trade-off |
|---------|----------------------|------------------------|-----------------|
| **1K** | **5.0% faster** | **8.9% faster** | **[0, n×1.01] vs [0, n-1]** |
| **50K** | **8.1% faster** | **17.9% faster** | **[0, n×1.01] vs [0, n-1]** |
| **100K** | **11.9% faster** | **14.8% faster** | **[0, n×1.01] vs [0, n-1]** |
| **1M** | **0.2% faster** | **23.1% faster** | **[0, n×1.01] vs [0, n-1]** |

**Key Findings:**
- **Perfect vs Minimal Hash**: GetIndexNoRemap is 5-23% faster using ~1% extra slots
- **Single-Part optimal**: Best for point lookups despite slower construction
- **Streaming competitive**: Port matches native streaming performance

## Limitations

This C# port does not support:
- **External-memory construction (sharding)**: The original supports datasets with >10^10 keys by sharding to disk