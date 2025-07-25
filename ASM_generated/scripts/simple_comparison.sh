#!/bin/bash

# Simple script to capture actual method performance and assembly

echo "Creating test program..."

cat > test_getindex.cs << 'EOF'
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;

class Program
{
    static void Main()
    {
        var random = new Random(42);
        var keySet = new HashSet<ulong>();
        while (keySet.Count < 5000)
            keySet.Add((ulong)random.NextInt64(1, long.MaxValue));
        var keys = keySet.ToArray();
        
        var ptrhash = new PtrHash<ulong, FxHasher>(keys, PtrHashParams.DefaultFast);
        var lookupKeys = keys.Take(1000).ToArray();
        var results = new nuint[lookupKeys.Length];
        
        // Warm up
        for (int i = 0; i < 1000; i++)
        {
            ptrhash.GetIndicesStreamPrefetch(lookupKeys, results, minimal: true);
        }
        
        // Time it
        var sw = Stopwatch.StartNew();
        for (int i = 0; i < 10000; i++)
        {
            ptrhash.GetIndicesStreamPrefetch(lookupKeys, results, minimal: true);
        }
        sw.Stop();
        
        Console.WriteLine($"Time per call: {sw.Elapsed.TotalMicroseconds / 10000:F2} μs");
        Console.WriteLine($"Is JIT: {!RuntimeInformation.IsOSPlatform(OSPlatform.Create("BROWSER"))}");
        
        ptrhash.Dispose();
    }
}
EOF

# Create project file
cat > test_project.csproj << 'EOF'
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net8.0</TargetFramework>
    <AllowUnsafeBlocks>true</AllowUnsafeBlocks>
    <Optimize>true</Optimize>
  </PropertyGroup>
  <ItemGroup>
    <ProjectReference Include="../PtrHash.CSharp.Port/PtrHash.CSharp.Port.csproj" />
  </ItemGroup>
</Project>
EOF

echo "Running with JIT..."
DOTNET_EnableAVX512F=0 dotnet run -c Release

echo -e "\nBuilding AOT..."
DOTNET_EnableAVX512F=0 dotnet publish -c Release -r linux-x64 /p:PublishAot=true 2>&1 | grep -v "warning"

if [ -f "bin/Release/net8.0/linux-x64/publish/test_project" ]; then
    echo -e "\nRunning with AOT..."
    ./bin/Release/net8.0/linux-x64/publish/test_project
else
    echo "AOT build failed"
fi

# Cleanup
rm -f test_getindex.cs test_project.csproj
rm -rf bin obj