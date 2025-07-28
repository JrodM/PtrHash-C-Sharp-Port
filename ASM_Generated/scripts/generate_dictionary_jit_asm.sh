#!/bin/bash

# Script to generate JIT assembly for Dictionary Interface Overhead Analysis
# Usage: ./generate_dictionary_jit_asm.sh

echo "Generating JIT assembly for Dictionary Interface methods..."

cd "$(dirname "$0")/.."  # Go to ASM_Generated directory

# Set up environment for JIT disassembly - target our specific methods
export COMPlus_JitDisasm="*RunConcreteDictionaryTest*,*RunSealedDictionaryTest*,*RunInterfaceDictionaryTest*,*RunReadOnlyInterfaceDictionaryTest*,*TryGetValue*"
export COMPlus_JitDiffableDasm=1
export COMPlus_JitDisasmIncludeFilename=1

# Disable AVX-512 for consistency
export DOTNET_EnableAVX512F=0

# Ensure output directory exists
mkdir -p jit

echo "Building ASM_Analysis project..."
dotnet build -c Release

echo "Running with JIT disassembly..."

# Temporarily replace Program.cs to use our dictionary analysis
mv Program.cs Program_original.cs
cp DictionaryJitAnalysis.cs Program.cs

# Run the analysis
dotnet run -c Release > jit/dictionary_jit_full_output.asm 2>&1

# Restore original Program.cs
mv Program_original.cs Program.cs

# Extract the methods we care about
echo "Extracting Dictionary TryGetValue methods..."

# Extract concrete dictionary calls
echo "=== ConcreteDictionary TryGetValue ===" > jit/dictionary_methods_comparison.asm
grep -A 50 -B 5 "RunConcreteDictionaryTest" jit/dictionary_jit_full_output.asm >> jit/dictionary_methods_comparison.asm

echo "" >> jit/dictionary_methods_comparison.asm
echo "=== SealedDictionary TryGetValue ===" >> jit/dictionary_methods_comparison.asm
grep -A 50 -B 5 "RunSealedDictionaryTest" jit/dictionary_jit_full_output.asm >> jit/dictionary_methods_comparison.asm

echo "" >> jit/dictionary_methods_comparison.asm
echo "=== IDictionary TryGetValue ===" >> jit/dictionary_methods_comparison.asm
grep -A 50 -B 5 "RunInterfaceDictionaryTest" jit/dictionary_jit_full_output.asm >> jit/dictionary_methods_comparison.asm

echo "" >> jit/dictionary_methods_comparison.asm
echo "=== IReadOnlyDictionary TryGetValue ===" >> jit/dictionary_methods_comparison.asm
grep -A 50 -B 5 "RunReadOnlyInterfaceDictionaryTest" jit/dictionary_jit_full_output.asm >> jit/dictionary_methods_comparison.asm

# Also extract any TryGetValue method assemblies directly
echo "" >> jit/dictionary_methods_comparison.asm
echo "=== All TryGetValue Method Assemblies ===" >> jit/dictionary_methods_comparison.asm
grep -A 30 -B 5 "TryGetValue" jit/dictionary_jit_full_output.asm >> jit/dictionary_methods_comparison.asm

echo "JIT assembly generated in:"
echo "  - jit/dictionary_methods_comparison.asm (Dictionary method comparison)"
echo "  - jit/dictionary_jit_full_output.asm (Complete output)"
echo ""
echo "Analysis complete! Check the assembly for:"
echo "  1. Direct 'call' vs 'callvirt' instructions"
echo "  2. Interface dispatch overhead"
echo "  3. Sealed class optimizations"
echo "Done!"