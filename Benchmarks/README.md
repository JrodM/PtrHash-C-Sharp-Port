# PtrHash Benchmarks

This project contains comprehensive benchmarks comparing PtrHash minimal perfect hash function performance against standard .NET collections.

## Benchmark Categories

### 1. Lookup Performance (`PtrHashVsDictionaryBenchmark`)

Compares lookup performance between:
- **Dictionary lookup**: Standard `Dictionary<ulong, ulong>` access
- **PtrHash + Array**: Using PtrHash to index into an array of values
- **PtrHash Batch**: Batch processing multiple keys at once
- **PtrHash Stream**: Streaming with prefetching for maximum throughput

**Test Scenarios:**
- 1,000 keys
- 100,000 keys  
- 1,000,000 keys

### 2. Memory Usage (`MemoryUsageBenchmark`)

Measures memory consumption of:
- Dictionary storage
- PtrHash + Array storage (different configurations)
- Memory efficiency comparison

### 3. Construction Time (`ConstructionBenchmark`)

Compares construction performance:
- Dictionary initialization
- PtrHash construction with different parameter sets (Fast, Balanced, Compact)
- Single-part vs multi-part construction

## Running Benchmarks

### Prerequisites

1. .NET 8.0 or later
2. Native PtrHash library built (`cargo build --release`)

### Running Individual Benchmarks

```bash
# Lookup performance comparison
dotnet run --project Benchmarks lookup

# Memory usage comparison  
dotnet run --project Benchmarks memory

# Construction time comparison
dotnet run --project Benchmarks construct

# Run all benchmarks
dotnet run --project Benchmarks all
```

### Configuration

Benchmarks use BenchmarkDotNet with the following configuration:
- **Runtime**: .NET 8.0
- **Platform**: x64
- **Optimization**: Release mode with optimizations enabled
- **Memory diagnostics**: Enabled for allocation tracking
- **Results**: Exported to Markdown and HTML formats

## Expected Performance Characteristics

### Lookup Performance

**PtrHash advantages:**
- **Cache efficiency**: Array access has better cache locality than hash table traversal
- **No hash collisions**: Guaranteed O(1) access without collision resolution
- **Batch processing**: Vectorized operations for multiple lookups
- **Prefetching**: Stream processing saturates memory bandwidth

**Dictionary advantages:**
- **No construction cost**: Ready to use immediately
- **Dynamic updates**: Can add/remove keys at runtime
- **Memory locality**: Key-value pairs stored together

### Memory Usage

**Expected memory efficiency:**
- **PtrHash Fast**: ~3.0 bits per key + value array
- **PtrHash Balanced**: ~2.4 bits per key + value array  
- **PtrHash Compact**: ~2.1 bits per key + value array
- **Dictionary**: ~32-64 bytes per key-value pair (depending on load factor)

For large datasets (1M+ keys), PtrHash should use significantly less memory.

### Construction Time

**Expected patterns:**
- **Dictionary**: Fast initial construction, amortized over insertions
- **PtrHash**: Higher upfront cost, but optimized for read-heavy workloads
- **Compact config**: Slower construction but better memory efficiency

## Benchmark Results Analysis

Results are saved to `BenchmarkDotNet.Artifacts/results/` in multiple formats:

- **Console output**: Real-time results during execution
- **Markdown**: GitHub-compatible tables for documentation
- **HTML**: Rich formatted results with charts
- **CSV**: Raw data for further analysis

### Key Metrics

- **Mean execution time**: Average time per operation
- **Memory allocation**: Bytes allocated per operation
- **Throughput**: Operations per second
- **Relative performance**: Speedup/slowdown vs baseline

## Performance Tuning

### For Maximum Lookup Speed

1. Use **PtrHash Stream** with appropriate prefetch distance (32-64)
2. Consider **Fast parameter set** for speed over memory
3. Enable **single-part mode** if memory allows
4. Batch multiple lookups when possible

### For Memory Efficiency

1. Use **Compact parameter set** for smallest memory footprint
2. Compare against dictionary overhead for your key/value sizes
3. Consider compression if value array has patterns

### For Construction Speed

1. Use **Fast parameter set** for quickest construction
2. Consider **single-part mode** for simpler construction
3. Pre-allocate and sort keys if possible

## Platform-Specific Notes

### Windows
- Ensure `ptrhash.dll` is in the output directory
- May benefit from large page support for huge datasets

### Linux  
- Ensure `libptrhash.so` is accessible
- Consider CPU frequency scaling for consistent results

### macOS
- Ensure `libptrhash.dylib` is in the library path
- Metal/GPU memory may affect large allocations

## Troubleshooting

### Native Library Not Found
```
DllNotFoundException: Unable to load shared library 'ptrhash'
```
**Solution**: Build the Rust library with `cargo build --release` and ensure it's copied to the output directory.

### Out of Memory
**Solution**: Reduce key count or use Compact configuration for large datasets.

### Inconsistent Results
**Solution**: Run benchmarks multiple times, check for background processes, and ensure consistent CPU frequency.