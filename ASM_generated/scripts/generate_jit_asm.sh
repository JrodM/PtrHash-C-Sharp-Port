#!/bin/bash

# Script to generate JIT assembly for PtrHash methods
# Usage: ./generate_jit_asm.sh

echo "Generating JIT assembly for PtrHash methods..."

cd "$(dirname "$0")/.."  # Go to PtrHash root directory

# Set up environment for JIT disassembly
export COMPlus_JitDisasm="*GetIndicesStreamPrefetch*"
export COMPlus_JitDiffableDasm=1
export COMPlus_JitDisasmIncludeFilename=1

# Disable AVX-512 for consistency
export DOTNET_EnableAVX512F=0

# Create test project directory
TEST_DIR="Benchmarks/DisasmTest"
mkdir -p $TEST_DIR

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
        
        // Force JIT compilation
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

# Build and run with JIT disassembly
echo "Building and running with JIT disassembly..."
cd $TEST_DIR
dotnet run -c Release > ../../ASM_generated/jit_output_full.asm 2>&1
cd ../..

# Extract the methods we care about
echo "Extracting GetIndex methods..."
grep -A 1000 "GetIndex" ASM_generated/jit_output_full.asm > ASM_generated/jit_getindex_methods.asm

# Clean up temp files but keep the test directory for AOT script
rm -f ASM_generated/jit_output_full.asm

echo "JIT assembly generated in: ASM_generated/jit_getindex_methods.asm"
echo "Done!"