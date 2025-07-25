#!/bin/bash

# Script to generate AOT assembly for PtrHash methods
# Usage: ./generate_aot_asm.sh

echo "Generating AOT assembly for PtrHash methods..."

cd "$(dirname "$0")/.."  # Go to PtrHash root directory

# Check if DisasmTest exists from JIT script
TEST_DIR="Benchmarks/DisasmTest"
if [ ! -d "$TEST_DIR" ]; then
    echo "Error: Run generate_jit_asm.sh first to create test project"
    exit 1
fi

# Build AOT version
echo "Building AOT version (this may take a minute)..."
cd $TEST_DIR
DOTNET_EnableAVX512F=0 dotnet publish -c Release -r linux-x64 \
    /p:PublishAot=true \
    /p:StripSymbols=false \
    /p:IlcGenerateMapFile=true \
    /p:IlcInstructionSet=native

# Check if build succeeded
if [ ! -f "bin/Release/net8.0/linux-x64/publish/DisasmTest" ]; then
    echo "AOT build failed!"
    exit 1
fi

# Verify binary has symbols
if file bin/Release/net8.0/linux-x64/publish/DisasmTest | grep -q "stripped"; then
    echo "Warning: Binary is stripped, symbols may not be available"
fi

# Extract full objdump
echo "Extracting AOT assembly..."
objdump -d bin/Release/net8.0/linux-x64/publish/DisasmTest > ../../ASM_generated/aot_full.asm

# Find and extract specific methods
echo "Finding GetIndex methods..."
cd ../..

# Extract method symbols
nm Benchmarks/DisasmTest/bin/Release/net8.0/linux-x64/publish/DisasmTest | grep -i "getindices" > ASM_generated/aot_symbols.txt

# Extract GetIndicesStreamPrefetch methods
echo "Extracting GetIndicesStreamPrefetch methods..."

# SinglePart version
objdump -d Benchmarks/DisasmTest/bin/Release/net8.0/linux-x64/publish/DisasmTest | \
    sed -n '/GetIndicesStreamPrefetchSinglePart>/,/^$/p' | \
    head -500 > ASM_generated/aot_singlepart_prefetch.asm

# MultiPart version  
objdump -d Benchmarks/DisasmTest/bin/Release/net8.0/linux-x64/publish/DisasmTest | \
    sed -n '/GetIndicesStreamPrefetchMultiPart>/,/^$/p' | \
    head -500 > ASM_generated/aot_multipart_prefetch.asm

# Also extract regular GetIndex methods if present
objdump -d Benchmarks/DisasmTest/bin/Release/net8.0/linux-x64/publish/DisasmTest | \
    grep -A 200 -E "GetIndex[^S]" > ASM_generated/aot_getindex_point.asm 2>/dev/null || true

# Clean up huge files
rm -f ASM_generated/aot_full.asm

# Summary
echo ""
echo "AOT assembly files generated:"
echo "  - aot_symbols.txt: Symbol table for methods"
echo "  - aot_singlepart_prefetch.asm: SinglePart StreamPrefetch implementation"
echo "  - aot_multipart_prefetch.asm: MultiPart StreamPrefetch implementation"
echo "  - aot_getindex_point.asm: Point lookup methods (if found)"
echo ""
echo "Done!"