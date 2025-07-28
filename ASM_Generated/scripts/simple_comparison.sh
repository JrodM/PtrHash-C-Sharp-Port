#!/bin/bash

# Simple script to compare JIT vs AOT performance and generate assembly for GetIndicesStreamPrefetch

echo "========================================"
echo "Simple JIT vs AOT Performance Comparison"
echo "========================================"

cd "$(dirname "$0")/.."  # Go to ASM_Generated directory

# Ensure output directories exist
mkdir -p jit aot

echo "Building JIT version..."
dotnet build -c Release

echo -e "\nRunning JIT performance test..."
echo "JIT Results:"
echo "============"
DOTNET_EnableAVX512F=0 dotnet run -c Release

echo -e "\nBuilding AOT version..."
DOTNET_EnableAVX512F=0 dotnet publish -c Release -r linux-x64 \
    /p:PublishAot=true \
    /p:StripSymbols=false \
    2>&1 | grep -E "(error|warning|succeeded|failed)"

BINARY_PATH="bin/Release/net8.0/linux-x64/publish/ASM_Analysis"
if [ -f "$BINARY_PATH" ]; then
    echo -e "\nRunning AOT performance test..."
    echo "AOT Results:"
    echo "============"
    "$BINARY_PATH"
    
    echo -e "\nBinary information:"
    echo "=================="
    echo "Size: $(ls -lh "$BINARY_PATH" | awk '{print $5}')"
    echo "Type: $(file "$BINARY_PATH" | cut -d: -f2)"
    
    # Quick assembly extraction for comparison
    echo -e "\nExtracting key assembly differences..."
    echo "====================================="
    
    # Extract GetIndicesStreamPrefetch methods from AOT binary
    echo "Extracting GetIndicesStreamPrefetch from AOT binary..."
    objdump -d "$BINARY_PATH" | \
        sed -n '/GetIndicesStreamPrefetch/,/^$/p' > aot/simple_streamprefetch.asm
    
    # Count instructions
    PREFETCH_INSTRUCTIONS=$(grep -c "^\s*[0-9a-f]\+:" aot/simple_streamprefetch.asm || echo "0")
    
    echo "GetIndicesStreamPrefetch AOT instructions: $PREFETCH_INSTRUCTIONS"
    
    if [ "$PREFETCH_INSTRUCTIONS" -gt 0 ]; then
        echo "Assembly sample (first 20 lines):"
        head -20 aot/simple_streamprefetch.asm
        echo "... (see aot/simple_streamprefetch.asm for full output)"
    else
        echo "No GetIndicesStreamPrefetch methods found in AOT binary"
        echo "Checking available symbols..."
        objdump -t "$BINARY_PATH" | grep -i "getindices" | head -10
    fi
    
else
    echo "AOT build failed - binary not found at $BINARY_PATH"
    exit 1
fi

echo -e "\nComparison Summary:"
echo "=================="
echo "- JIT: Dynamic compilation with runtime optimizations"
echo "- AOT: Ahead-of-time compilation with static optimizations"
echo "- Both tests use the same GetIndicesStreamPrefetch methods"
echo "- Performance differences may be due to:"
echo "  * Inlining decisions"
echo "  * Loop unrolling"
echo "  * Vectorization"
echo "  * Cache locality optimizations"
echo ""
echo "Assembly files generated:"
echo "- aot/simple_streamprefetch.asm: AOT GetIndicesStreamPrefetch assembly"
echo ""
echo "For detailed analysis, run:"
echo "  ./scripts/generate_unified_asm.sh"