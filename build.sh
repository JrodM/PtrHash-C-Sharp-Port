#!/bin/bash
set -e

echo "Building PtrHash Rust library and C# projects..."

# Build Rust library first
echo
echo "[1/4] Building Rust library (release)..."
cargo build --release

# Build C# library  
echo
echo "[2/4] Building C# interop library..."
dotnet build CSharpInterop/PtrHashNative.csproj --configuration Release

# Build tests
echo
echo "[3/4] Building C# tests..."
dotnet build CSharInterop.Tests/CSharpInterop.Tests.csproj --configuration Release

# Build benchmarks
echo
echo "[4/4] Building benchmarks..."
dotnet build Benchmarks/PtrHash.Benchmarks.csproj --configuration Release

echo
echo "SUCCESS: All projects built successfully!"
echo
echo "Next steps:"
echo "  Run tests:      dotnet test CSharInterop.Tests"
echo "  Run benchmarks: dotnet run --project Benchmarks -- lookup"
echo