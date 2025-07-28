#!/bin/bash

# Unified script to generate and compare JIT vs AOT assembly using ASM_Analysis project
# Usage: ./generate_unified_asm.sh [function_pattern] [output_prefix]
# Example: ./generate_unified_asm.sh "*GetIndicesStreamPrefetch*" prefetch_analysis

set -e

# Default function pattern if not provided
FUNCTION_PATTERN="${1:-*GetIndicesStreamPrefetch*}"
OUTPUT_PREFIX="${2:-analysis}"

echo "============================================"
echo "PtrHash Assembly Generation and Comparison"
echo "============================================"
echo "Function pattern: $FUNCTION_PATTERN"
echo "Output prefix: $OUTPUT_PREFIX"
echo ""

# Go to ASM_Generated directory
cd "$(dirname "$0")/.."

# Clean up previous output files
echo "Cleaning up previous files..."
rm -f jit/${OUTPUT_PREFIX}_*.asm
rm -f aot/${OUTPUT_PREFIX}_*.asm

# Ensure output directories exist
mkdir -p jit aot

echo ""
echo "============================================"
echo "Generating JIT Assembly"
echo "============================================"

# Set up environment for JIT disassembly
export COMPlus_JitDisasm="$FUNCTION_PATTERN"
export COMPlus_JitDiffableDasm=1
export COMPlus_JitDisasmIncludeFilename=1
export DOTNET_EnableAVX512F=0

echo "Building ASM_Analysis project..."
dotnet build -c Release

echo "Running with JIT disassembly..."
dotnet run -c Release > jit/${OUTPUT_PREFIX}_full_output.asm 2>&1

# Extract the methods we care about
echo "Extracting target methods from JIT output..."
if grep -q "GetIndices" jit/${OUTPUT_PREFIX}_full_output.asm; then
    grep -A 1000 "GetIndices" jit/${OUTPUT_PREFIX}_full_output.asm > jit/${OUTPUT_PREFIX}_methods.asm
    echo "JIT assembly generated: jit/${OUTPUT_PREFIX}_methods.asm"
else
    echo "Warning: No GetIndices methods found in JIT output"
    echo "Check jit/${OUTPUT_PREFIX}_full_output.asm for available methods"
fi

echo ""
echo "============================================"
echo "Generating AOT Assembly"
echo "============================================"

echo "Building AOT version..."
DOTNET_EnableAVX512F=0 dotnet publish -c Release -r linux-x64 \
    /p:PublishAot=true \
    /p:StripSymbols=false \
    /p:IlcGenerateMapFile=true \
    /p:IlcInstructionSet=native

# Extract assembly from the AOT binary
echo "Extracting AOT assembly..."
BINARY_PATH="bin/Release/net8.0/linux-x64/publish/ASM_Analysis"
if [[ -f "$BINARY_PATH" ]]; then
    # Disassemble the binary and extract symbols
    objdump -t "$BINARY_PATH" | grep -E "(GetIndices|Test.*GetIndices)" > aot/${OUTPUT_PREFIX}_symbols.txt || true
    
    # Generate full disassembly
    objdump -d "$BINARY_PATH" > aot/${OUTPUT_PREFIX}_full_disasm.asm
    
    # Extract specific function assembly based on symbols found
    if [[ -s aot/${OUTPUT_PREFIX}_symbols.txt ]]; then
        echo "Found AOT symbols, extracting assembly..."
        
        # Extract GetIndicesStreamPrefetch methods
        objdump -d "$BINARY_PATH" | \
            sed -n '/GetIndicesStreamPrefetch/,/^$/p' > aot/${OUTPUT_PREFIX}_streamprefetch.asm
        
        # Extract GetIndicesStream methods (without prefetch)
        objdump -d "$BINARY_PATH" | \
            sed -n '/GetIndicesStream[^P]/,/^$/p' > aot/${OUTPUT_PREFIX}_stream.asm
        
        # Extract single GetIndex methods
        objdump -d "$BINARY_PATH" | \
            grep -A 100 -E "GetIndex[^e].*>:" > aot/${OUTPUT_PREFIX}_point.asm 2>/dev/null || true
        
        # Create combined methods file
        cat aot/${OUTPUT_PREFIX}_streamprefetch.asm aot/${OUTPUT_PREFIX}_stream.asm aot/${OUTPUT_PREFIX}_point.asm > aot/${OUTPUT_PREFIX}_methods.asm 2>/dev/null || true
        
        echo "AOT assembly generated: aot/${OUTPUT_PREFIX}_methods.asm"
    else
        echo "Warning: No matching symbols found in AOT binary"
        echo "Attempting pattern-based extraction..."
        objdump -d "$BINARY_PATH" | grep -A 200 -E "(GetIndex|Test)" > aot/${OUTPUT_PREFIX}_methods.asm || true
    fi
else
    echo "Error: AOT binary not found at $BINARY_PATH"
    exit 1
fi

echo ""
echo "============================================"
echo "Generation Complete"
echo "============================================"
echo "JIT output: jit/${OUTPUT_PREFIX}_methods.asm"
echo "AOT output: aot/${OUTPUT_PREFIX}_methods.asm"
echo "Full JIT:   jit/${OUTPUT_PREFIX}_full_output.asm"
echo "Full AOT:   aot/${OUTPUT_PREFIX}_full_disasm.asm"
echo ""
echo "Binary size: $(ls -lh "$BINARY_PATH" | awk '{print $5}')"
echo ""
echo "To compare:"
echo "  diff jit/${OUTPUT_PREFIX}_methods.asm aot/${OUTPUT_PREFIX}_methods.asm"
echo "  or use your preferred diff tool"
echo ""
echo "Individual method files (AOT):"
echo "  - aot/${OUTPUT_PREFIX}_streamprefetch.asm: GetIndicesStreamPrefetch implementations"  
echo "  - aot/${OUTPUT_PREFIX}_stream.asm: GetIndicesStream implementations (no prefetch)"
echo "  - aot/${OUTPUT_PREFIX}_point.asm: Single GetIndex implementations"