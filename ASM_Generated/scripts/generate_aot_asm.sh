#!/bin/bash

# Script to generate AOT assembly for PtrHash GetIndicesStreamPrefetch methods
# Usage: ./generate_aot_asm.sh

echo "Generating AOT assembly for GetIndicesStreamPrefetch methods..."

cd "$(dirname "$0")/.."  # Go to ASM_Generated directory

# Ensure output directory exists
mkdir -p aot

# Build AOT version
echo "Building AOT version (this may take a minute)..."
DOTNET_EnableAVX512F=0 dotnet publish -c Release -r linux-x64 \
    /p:PublishAot=true \
    /p:StripSymbols=false \
    /p:IlcGenerateMapFile=true \
    /p:IlcInstructionSet=native

# Check if build succeeded
BINARY_PATH="bin/Release/net8.0/linux-x64/publish/ASM_Analysis"
if [ ! -f "$BINARY_PATH" ]; then
    echo "AOT build failed!"
    exit 1
fi

# Verify binary has symbols
if file "$BINARY_PATH" | grep -q "stripped"; then
    echo "Warning: Binary is stripped, symbols may not be available"
fi

echo "Extracting AOT assembly..."

# Extract method symbols first
echo "Finding GetIndex methods..."
nm "$BINARY_PATH" | grep -i "getindices" > aot/aot_symbols.txt

# Extract all methods for analysis
echo "Extracting GetIndicesStreamPrefetch methods..."
objdump -d "$BINARY_PATH" | \
    sed -n '/GetIndicesStreamPrefetch/,/^$/p' > aot/aot_getindices_streamprefetch.asm

# Extract GetIndicesStream methods (without prefetch) for comparison
echo "Extracting GetIndicesStream methods..."
objdump -d "$BINARY_PATH" | \
    sed -n '/GetIndicesStream[^P]/,/^$/p' > aot/aot_getindices_stream.asm

# Extract single GetIndex methods for comparison
echo "Extracting GetIndex point methods..."
objdump -d "$BINARY_PATH" | \
    grep -A 100 -E "GetIndex[^e].*>:" > aot/aot_getindex_point.asm 2>/dev/null || true

# Extract all GetIndex related methods for comprehensive analysis
objdump -d "$BINARY_PATH" | \
    grep -A 50 -E "(GetIndex|TestGetIndices|TestSingle)" > aot/aot_getindex_methods.asm

# Create a summary of found methods
echo "Creating method summary..."
echo "AOT Assembly Analysis - Method Summary" > aot/method_summary.txt
echo "=======================================" >> aot/method_summary.txt
echo "" >> aot/method_summary.txt
echo "Symbol Table (GetIndices methods):" >> aot/method_summary.txt
cat aot/aot_symbols.txt >> aot/method_summary.txt
echo "" >> aot/method_summary.txt
echo "Files generated:" >> aot/method_summary.txt
echo "- aot_getindices_streamprefetch.asm: GetIndicesStreamPrefetch implementations" >> aot/method_summary.txt
echo "- aot_getindices_stream.asm: GetIndicesStream implementations (no prefetch)" >> aot/method_summary.txt
echo "- aot_getindex_point.asm: Single GetIndex implementations" >> aot/method_summary.txt
echo "- aot_getindex_methods.asm: All GetIndex related methods" >> aot/method_summary.txt

# Summary
echo ""
echo "AOT assembly files generated in aot/ directory:"
echo "  - aot_symbols.txt: Symbol table for GetIndex methods"
echo "  - aot_getindices_streamprefetch.asm: GetIndicesStreamPrefetch implementations"
echo "  - aot_getindices_stream.asm: GetIndicesStream implementations (no prefetch)"
echo "  - aot_getindex_point.asm: Single GetIndex implementations"
echo "  - aot_getindex_methods.asm: All GetIndex related methods"
echo "  - method_summary.txt: Summary of found methods"
echo ""
echo "Binary size: $(ls -lh "$BINARY_PATH" | awk '{print $5}')"
echo "Done!"