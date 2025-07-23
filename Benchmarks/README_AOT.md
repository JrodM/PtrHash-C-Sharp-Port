# Running PtrHash Benchmarks with Native AOT

This guide explains how to run benchmarks comparing JIT vs Native AOT performance.

## Prerequisites

- .NET 8 SDK or later
- Native AOT prerequisites for your platform:
  - **Linux**: `sudo apt-get install clang zlib1g-dev` (Ubuntu/Debian)
  - **Windows**: Visual Studio 2022 with C++ workload
  - **macOS**: Xcode command line tools

## Running Benchmarks

### Standard JIT + AOT Comparison

The benchmarks are configured to automatically run both JIT and Native AOT versions:

```bash
cd Benchmarks
dotnet run -c Release -- core
```

This will run the core benchmarks on both:
- .NET 8 JIT (baseline)
- .NET 8 Native AOT

### Publishing for Native AOT Only

To create a standalone Native AOT executable:

```bash
# Linux x64
dotnet publish -c Release -r linux-x64 --self-contained

# Windows x64
dotnet publish -c Release -r win-x64 --self-contained

# macOS ARM64 (Apple Silicon)
dotnet publish -c Release -r osx-arm64 --self-contained
```

Then run the native executable directly:
```bash
./bin/Release/net8.0/linux-x64/publish/PtrHash.Benchmarks core
```

## Performance Optimizations Applied

1. **Native AOT Compilation**
   - Ahead-of-time compilation to native code
   - No JIT overhead
   - More aggressive optimizations

2. **Hardware Intrinsics**
   - SSE/SSE2 enabled
   - AVX/AVX2 enabled
   - Used for memory prefetching

3. **Server GC**
   - Better throughput for multi-threaded workloads
   - Larger heap segments

4. **Profile-Guided Optimization (PGO)**
   - Enabled via environment variables
   - Tiered compilation with profiling

## Expected Performance Improvements

- **Native AOT**: 10-30% faster than JIT
- **Prefetch optimizations**: 2-5x faster for streaming when data not in cache
- **Overall**: C# port should be within 20-40% of Rust performance with these optimizations

## Interpreting Results

BenchmarkDotNet will show results like:

```
| Method                      | Job        | Mean     | Error   | Ratio |
|---------------------------- |----------- |---------:|--------:|------:|
| MultiPart_Stream_Prefetch   | .NET 8.0   | 45.23 ms | 0.89 ms |  1.00 |
| MultiPart_Stream_Prefetch   | NativeAOT  | 38.67 ms | 0.72 ms |  0.85 |
```

Where:
- **Job** column shows JIT (.NET 8.0) vs AOT (NativeAOT)
- **Ratio** shows relative performance (lower is better)
- **Mean** is the average execution time

## Troubleshooting

If Native AOT compilation fails:

1. Ensure you have the required native toolchain installed
2. Check for unsupported features (reflection, dynamic code generation)
3. Review the ILC (IL Compiler) warnings during publish

For detailed AOT diagnostics:
```bash
dotnet publish -c Release -r linux-x64 --self-contained -p:IlcGenerateStackTraceData=true -p:IlcTrimMetadata=false
```