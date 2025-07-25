# ASM_generated - Assembly Analysis Directory

This directory contains assembly output and analysis for comparing JIT vs AOT compilation of PtrHash methods.

## Contents

- `generate_jit_asm.sh` - Script to generate JIT assembly output
- `generate_aot_asm.sh` - Script to generate AOT assembly output  
- `jit_getindex_methods.asm` - JIT-compiled assembly for GetIndex methods
- `aot_getindex_methods.asm` - AOT-compiled assembly for GetIndex methods (generated when script is run)
- `AOT_vs_JIT_Analysis.md` - Comprehensive analysis of performance differences
- `JitOptimizations.md` - Specific optimizations to improve JIT performance

## Usage

### Generate JIT Assembly
```bash
./generate_jit_asm.sh
```
This will create a test project, compile with JIT, and extract assembly for all GetIndex-related methods.

### Generate AOT Assembly  
```bash
./generate_aot_asm.sh
```
This will create a test project, compile with AOT (NativeAOT), and extract assembly using objdump.

### Environment Variables for JIT

For best JIT performance when running benchmarks:
```bash
export COMPlus_TC_QuickJitForLoops=0
export COMPlus_TC_CallCountThreshold=1
export COMPlus_JitMinOpts=0
export COMPlus_TieredPGO=1
export DOTNET_TC_AggressiveTiering=1
export DOTNET_EnableAVX512F=0
```

## Key Findings

1. **AOT is 10-20% faster** for GetIndicesStreamPrefetch
2. **Main bottleneck**: Interface dispatch in JIT
3. **Solution**: Cache interface method results and use aggressive inlining

See `AOT_vs_JIT_Analysis.md` for detailed analysis.