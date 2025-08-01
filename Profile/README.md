# C# PtrHash Construction Profiler

This tool helps profile and analyze C# PtrHash construction performance to identify bottlenecks causing slow construction times.

## Quick Start

### Manual Tracing (Recommended)

```bash
# Terminal 1: Start the profiler
cd Profile
dotnet run

# Choose option 1 (Multi-Part - the slow one)

# Terminal 2: Start tracing
cd Profile  
./start-trace.sh

# Back to Terminal 1: Press any key to start benchmarking
# Wait for benchmarks to complete

# Terminal 2: Stop tracing
./stop-trace.sh
```

### Auto Tracing

```bash
cd Profile
dotnet run -- 1000000 --auto-trace
```

## Usage

```bash
# Profile with different key counts
dotnet run -- 100000           # 100K keys
dotnet run -- 1000000          # 1M keys  
dotnet run -- 10000000         # 10M keys

# Manual tracing workflow
dotnet run                      # Defaults to 1M keys
# Then use start-trace.sh / stop-trace.sh

# Auto tracing (experimental)
dotnet run -- 1000000 --auto-trace
```

## Profiling Options

When you run `dotnet run`, you'll get these choices:

1. **C# Port Multi-Part** (The Bottleneck - ~910ms)
2. **C# Port Single-Part** 
3. **Both Multi-Part and Single-Part**
4. **Repeated Multi-Part** (3 runs for averaging)

## Analysis Focus Areas

When analyzing the `.nettrace` files, focus on:

### 🔍 **Key Bottlenecks to Investigate:**
- **Array pooling overhead** - `ArrayPool.Rent()` / `Return()` calls
- **Bucket sorting performance** - `SortBucketsInPart` method
- **Pilot finding loops** - `FindBestPilotWithEvictionInPart`
- **BitVec operations** - `PartitionedBitVec` / `BitVec` methods
- **Memory allocations** - High GC pressure (211KB allocated)
- **Construction algorithm** - Compare to native baseline performance

### 📊 **Target Performance:**
- **Current C# Port**: ~910ms, ~211KB allocated
- **Goal**: Identify and eliminate the bottlenecks causing slow construction

## Analysis Tools

1. **Visual Studio**: File → Open → `ptrhash-construction-*.nettrace`
2. **PerfView**: Download from Microsoft, open .nettrace file
3. **speedscope.app**: Upload .nettrace file for web-based analysis
4. **dotnet-trace**: `dotnet trace analyze ptrhash-construction-*.nettrace`

## Expected Findings

The profiling should reveal:
- Where the 4.56x construction time difference comes from
- Why C# port allocates 620x more memory (211KB vs 341B)
- Whether array pooling is helping or hurting performance
- Specific algorithm bottlenecks in the C# implementation

## Fixing the Benchmark Test Name

The benchmark test name should be updated from:
```
PtrHashNative_MultiPart_FxHasher_Construction
```
to:
```
PtrHashNative_MultiPart_FxHasher_Linear_U32Vec_Construction
```

This makes it consistent with the C# port naming convention.