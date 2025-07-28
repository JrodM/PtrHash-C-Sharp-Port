#!/bin/bash

# Script to generate JIT assembly for PtrHash GetIndicesStreamPrefetch methods
# Usage: ./generate_jit_asm.sh

echo "Generating JIT assembly for GetIndicesStreamPrefetch methods..."

cd "$(dirname "$0")/.."  # Go to ASM_Generated directory

# Set up environment for JIT disassembly
export COMPlus_JitDisasm="*GetIndicesStreamPrefetch*"
export COMPlus_JitDiffableDasm=1
export COMPlus_JitDisasmIncludeFilename=1

# Disable AVX-512 for consistency
export DOTNET_EnableAVX512F=0

# Ensure output directory exists
mkdir -p jit

echo "Building ASM_Analysis project..."
dotnet build -c Release

echo "Running with JIT disassembly..."
dotnet run -c Release > jit/jit_output_full.asm 2>&1

# Extract the methods we care about
echo "Extracting GetIndicesStreamPrefetch methods..."
grep -A 200 "GetIndicesStreamPrefetch" jit/jit_output_full.asm > jit/jit_getindex_methods.asm

# Also extract streaming vs single lookup comparisons
echo "Extracting comparison methods..."
grep -A 100 -E "(GetIndicesStream|GetIndex)" jit/jit_output_full.asm > jit/jit_comparison_methods.asm

echo "JIT assembly generated in:"
echo "  - jit/jit_getindex_methods.asm (GetIndicesStreamPrefetch methods)"
echo "  - jit/jit_comparison_methods.asm (All GetIndex* methods for comparison)"
echo "  - jit/jit_output_full.asm (Complete output)"
echo "Done!"