#!/bin/bash

# Unified script to generate and compare JIT vs AOT assembly
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

# Go to PtrHash root directory
cd "$(dirname "$0")/../.."

# Clean up previous output files
echo "Cleaning up previous files..."
rm -f ASM_generated/jit/${OUTPUT_PREFIX}_*.asm
rm -f ASM_generated/aot/${OUTPUT_PREFIX}_*.asm

# Create test project directory
TEST_DIR="Benchmarks/DisasmTest"
mkdir -p $TEST_DIR

echo "Creating DisasmTest project..."
cat > $TEST_DIR/DisasmTest.csproj << 'EOF'
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net8.0</TargetFramework>
    <AllowUnsafeBlocks>true</AllowUnsafeBlocks>
    <Optimize>true</Optimize>
    <PlatformTarget>x64</PlatformTarget>
    <PublishAot>false</PublishAot>
  </PropertyGroup>

  <ItemGroup>
    <ProjectReference Include="../../PtrHash.CSharp.Port/PtrHash.CSharp.Port.csproj" />
  </ItemGroup>
</Project>
EOF

cat > $TEST_DIR/Program.cs << 'EOF'
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.BucketFunctions;

class Program
{
    static void Main()
    {
        // Create test data with random unique keys
        var random = new Random(42);
        var keySet = new HashSet<ulong>();
        while (keySet.Count < 5000)
            keySet.Add((ulong)random.NextInt64(1, long.MaxValue));
        var keys = keySet.ToArray();
            
        var ptrhash = new PtrHash<ulong, FxHasher, Linear>(keys, PtrHashParams.DefaultFast);
        
        var lookupKeys = new ulong[1000];
        for (int i = 0; i < lookupKeys.Length; i++)
            lookupKeys[i] = (ulong)(i + 1);
            
        var results = new nuint[lookupKeys.Length];
        
        // Force JIT compilation and call target methods
        RunTest(ptrhash, lookupKeys, results);
        
        Console.WriteLine("Test complete");
        ptrhash.Dispose();
    }
    
    [MethodImpl(MethodImplOptions.NoInlining)]
    static void RunTest(PtrHash<ulong, FxHasher, Linear> ptrhash, ulong[] lookupKeys, nuint[] results)
    {
        // Call the method we want to analyze
        ptrhash.GetIndicesStreamPrefetch(lookupKeys, results, minimal: true);
    }
}
EOF

echo ""
echo "============================================"
echo "Generating JIT Assembly"
echo "============================================"

# Set up environment for JIT disassembly
export COMPlus_JitDisasm="$FUNCTION_PATTERN"
export COMPlus_JitDiffableDasm=1
export COMPlus_JitDisasmIncludeFilename=1
export DOTNET_EnableAVX512F=0

echo "Building and running with JIT disassembly..."
cd $TEST_DIR
dotnet run -c Release > ../../ASM_generated/jit/${OUTPUT_PREFIX}_full_output.asm 2>&1
cd ../..

# Extract the methods we care about
echo "Extracting target methods from JIT output..."
if grep -q "GetIndices" ASM_generated/jit/${OUTPUT_PREFIX}_full_output.asm; then
    grep -A 1000 "GetIndices" ASM_generated/jit/${OUTPUT_PREFIX}_full_output.asm > ASM_generated/jit/${OUTPUT_PREFIX}_methods.asm
    echo "JIT assembly generated: ASM_generated/jit/${OUTPUT_PREFIX}_methods.asm"
else
    echo "Warning: No GetIndices methods found in JIT output"
    echo "Check ASM_generated/jit/${OUTPUT_PREFIX}_full_output.asm for available methods"
fi

echo ""
echo "============================================"
echo "Generating AOT Assembly"
echo "============================================"

# Update project for AOT compilation
cat > $TEST_DIR/DisasmTest.csproj << 'EOF'
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net8.0</TargetFramework>
    <AllowUnsafeBlocks>true</AllowUnsafeBlocks>
    <Optimize>true</Optimize>
    <PlatformTarget>x64</PlatformTarget>
    <PublishAot>true</PublishAot>
    <StripSymbols>false</StripSymbols>
  </PropertyGroup>

  <ItemGroup>
    <ProjectReference Include="../../PtrHash.CSharp.Port/PtrHash.CSharp.Port.csproj" />
  </ItemGroup>
</Project>
EOF

echo "Building AOT version..."
cd $TEST_DIR
DOTNET_EnableAVX512F=0 dotnet publish -c Release -r linux-x64 \
    /p:PublishAot=true \
    /p:StripSymbols=false
cd ../..

# Extract assembly from the AOT binary
echo "Extracting AOT assembly..."
BINARY_PATH="$TEST_DIR/bin/Release/net8.0/linux-x64/publish/DisasmTest"
if [[ -f "$BINARY_PATH" ]]; then
    # Disassemble the binary and extract symbols
    objdump -t "$BINARY_PATH" | grep -E "(GetIndices|PtrHash.*GetIndices)" > ASM_generated/aot/${OUTPUT_PREFIX}_symbols.txt || true
    
    # Generate full disassembly
    objdump -d "$BINARY_PATH" > ASM_generated/aot/${OUTPUT_PREFIX}_full_disasm.asm
    
    # Extract specific function assembly
    if [[ -s ASM_generated/aot/${OUTPUT_PREFIX}_symbols.txt ]]; then
        echo "Found AOT symbols, extracting assembly..."
        
        # Extract GetIndicesStreamPrefetchSinglePart
        if grep -q "GetIndicesStreamPrefetchSinglePart" ASM_generated/aot/${OUTPUT_PREFIX}_symbols.txt; then
            SINGLEPART_ADDR=$(grep "GetIndicesStreamPrefetchSinglePart" ASM_generated/aot/${OUTPUT_PREFIX}_symbols.txt | head -1 | awk '{print $1}')
            grep -A 300 "$SINGLEPART_ADDR" ASM_generated/aot/${OUTPUT_PREFIX}_full_disasm.asm | head -300 > ASM_generated/aot/${OUTPUT_PREFIX}_singlepart.asm || true
        fi
        
        # Extract GetIndicesStreamPrefetchMultiPart  
        if grep -q "GetIndicesStreamPrefetchMultiPart" ASM_generated/aot/${OUTPUT_PREFIX}_symbols.txt; then
            MULTIPART_ADDR=$(grep "GetIndicesStreamPrefetchMultiPart" ASM_generated/aot/${OUTPUT_PREFIX}_symbols.txt | head -1 | awk '{print $1}')
            grep -A 300 "$MULTIPART_ADDR" ASM_generated/aot/${OUTPUT_PREFIX}_full_disasm.asm | head -300 > ASM_generated/aot/${OUTPUT_PREFIX}_multipart.asm || true
        fi
        
        # Create combined methods file
        cat ASM_generated/aot/${OUTPUT_PREFIX}_singlepart.asm ASM_generated/aot/${OUTPUT_PREFIX}_multipart.asm > ASM_generated/aot/${OUTPUT_PREFIX}_methods.asm 2>/dev/null || true
        
        echo "AOT assembly generated: ASM_generated/aot/${OUTPUT_PREFIX}_methods.asm"
    else
        echo "Warning: No matching symbols found in AOT binary"
    fi
else
    echo "Error: AOT binary not found at $BINARY_PATH"
fi

echo ""
echo "============================================"
echo "Generation Complete"
echo "============================================"
echo "JIT output: ASM_generated/jit/${OUTPUT_PREFIX}_methods.asm"
echo "AOT output: ASM_generated/aot/${OUTPUT_PREFIX}_methods.asm"
echo "Full JIT:   ASM_generated/jit/${OUTPUT_PREFIX}_full_output.asm"
echo "Full AOT:   ASM_generated/aot/${OUTPUT_PREFIX}_full_disasm.asm"
echo ""
echo "To compare:"
echo "  diff ASM_generated/jit/${OUTPUT_PREFIX}_methods.asm ASM_generated/aot/${OUTPUT_PREFIX}_methods.asm"
echo "  or use your preferred diff tool"