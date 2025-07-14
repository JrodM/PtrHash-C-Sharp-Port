# PtrHash C# Interop

This directory contains C# bindings for the PtrHash minimal perfect hash function library, designed for high-performance zero-copy operations.

## Features

- **Zero-copy operations**: Minimal marshaling overhead using unsafe code and spans
- **High-performance APIs**: Single key lookup, batch processing, and streaming with prefetching
- **Memory-safe**: Proper disposal patterns and resource management
- **Cross-platform**: Works on Windows, Linux, and macOS
- **Type-safe**: Strongly-typed APIs for both u64 and string keys

## API Overview

### PtrHashU64

```csharp
// Construction from various sources
var keysArray = new ulong[] { 1, 2, 3, 4, 5 };
var keysList = new List<ulong> { 1, 2, 3, 4, 5 };
ReadOnlySpan<ulong> keysSpan = keysArray;

using var hash1 = new PtrHashU64(keysArray, PtrHashConfig.Default);  // From array
using var hash2 = new PtrHashU64(keysList, PtrHashConfig.Default);   // From List<T>
using var hash3 = new PtrHashU64(keysSpan, PtrHashConfig.Default);   // From span (zero-copy)

// Single key lookup
nuint index = hash1.GetIndex(key);

// Batch lookup (zero-copy)
var results = new nuint[keysArray.Length];
hash1.GetIndicesBatch(keysArray, results, minimal: true);

// Stream lookup with prefetching (highest performance)
hash1.GetIndicesStream(keysSpan, results, prefetchDistance: 32, minimal: true);
```

### PtrHashString

```csharp
// Construction from various sources
var keysArray = new string[] { "hello", "world", "test" };
var keysList = new List<string> { "hello", "world", "test" };
ReadOnlySpan<string> keysSpan = keysArray;

using var hash1 = new PtrHashString(keysArray, PtrHashConfig.Default);  // From array
using var hash2 = new PtrHashString(keysList, PtrHashConfig.Fast);      // From List<T>
using var hash3 = new PtrHashString(keysSpan, PtrHashConfig.Compact);   // From span (zero-copy)

// Single key lookup
nuint index = hash1.GetIndex("hello");

// Zero-copy UTF-8 lookup
var utf8Key = Encoding.UTF8.GetBytes("hello");
nuint index = hash1.GetIndex(utf8Key);

// Batch lookup from different sources
var results = new nuint[keysArray.Length];
hash1.GetIndicesBatch(keysArray, results);  // From array
hash2.GetIndicesBatch(keysList, results);   // From List<T>
hash3.GetIndicesBatch(keysSpan, results);   // From span (zero-copy)
```

## Configuration Options

### Parameter Sets

- **Default**: 3.0 bits/key, balanced trade-off (recommended)
- **Fast**: 3.0 bits/key, optimized for query speed  
- **Compact**: ~2.1 bits/key, optimized for space

### Single Part Mode

Set `SinglePart = true` for slightly faster queries when memory allows.

## Building

### Prerequisites

1. Rust toolchain (latest stable) - [Install Rust](https://rustup.rs/)
2. .NET 6.0 or later - [Install .NET](https://dotnet.microsoft.com/download)
3. MSBuild or dotnet CLI

### Automatic Build (Recommended)

The C# projects are configured to **automatically build the Rust library** as part of the .NET build process:

```bash
# This will automatically build Rust library first, then C# code
dotnet build CSharpInterop/PtrHashNative.csproj --configuration Release

# Run tests (automatically builds everything needed)
dotnet test CSharInterop.Tests/CSharpInterop.Tests.csproj

# Run benchmarks (automatically builds everything needed)
dotnet run --project Benchmarks/PtrHash.Benchmarks.csproj -- lookup
```

### Convenience Build Scripts

**Windows:**
```cmd
build.cmd
```

**Linux/macOS:**
```bash
./build.sh
```

### Manual Build Steps

If you prefer to build manually or the auto-build fails:

1. **Build the Rust library**:
   ```bash
   cargo build --release
   ```
   This creates the native library at `target/release/ptrhash.dll` (Windows), `target/release/libptrhash.so` (Linux), or `target/release/libptrhash.dylib` (macOS).

2. **Build the C# library**:
   ```bash
   dotnet build CSharpInterop/PtrHashNative.csproj --configuration Release
   ```

3. **Run tests**:
   ```bash
   dotnet test CSharInterop.Tests/CSharpInterop.Tests.csproj
   ```

### How Auto-Build Works

The auto-build system:

1. **Checks for Cargo**: Verifies `cargo` is available in PATH
2. **Builds Rust Library**: Runs `cargo build --release` before C# compilation
3. **Verifies Native Library**: Ensures the native library exists
4. **Copies to Output**: Automatically copies the native library to the C# output directory
5. **Cross-Platform**: Works on Windows (.dll), Linux (.so), and macOS (.dylib)

### Troubleshooting Auto-Build

**If you see "Cargo not found" warnings:**
- Install Rust: https://rustup.rs/
- Ensure `cargo` is in your PATH
- Restart your terminal/IDE after installation

**If the native library is not found:**
- Run `cargo build --release` manually in the root directory
- Check that `target/release/ptrhash.*` exists
- Verify the file extension matches your platform (.dll/.so/.dylib)

**If tests fail with DllNotFoundException:**
- The native library wasn't copied to the test output directory
- Try cleaning and rebuilding: `dotnet clean && dotnet build`
- Check the test output directory for the native library file

The build process automatically copies the native library to the output directory and handles cross-platform library naming.

## Performance Characteristics

- **Construction**: Typically 30s for 1 billion keys on modern hardware
- **Query throughput**: 
  - Single: ~21ns/key sequential access
  - Streaming: ~2.6ns/key with prefetching and multiple threads
  - Memory bandwidth limited on large datasets
- **Memory usage**: 2.1-3.0 bits per key depending on configuration

## Zero-Copy Design

The interop layer is designed to minimize copying and marshaling:

1. **Span-based APIs**: Use `ReadOnlySpan<T>` and `Span<T>` for zero-copy array access
2. **Pinned memory**: Native calls pin managed arrays only during the call
3. **UTF-8 handling**: Direct UTF-8 byte processing for string keys
4. **Batch operations**: Process multiple keys in single native calls

## Error Handling

- All native errors are converted to managed `PtrHashException`
- Proper resource cleanup via `IDisposable`
- Memory-safe even in error conditions

## Thread Safety

- PtrHash instances are **read-only** after construction and thread-safe for queries
- Construction is **not** thread-safe
- Multiple threads can safely query the same instance simultaneously

## Memory Management

- Native resources are automatically freed via `IDisposable`
- Use `using` statements or explicit `Dispose()` calls
- Multiple `Dispose()` calls are safe
- Accessing disposed instances throws `ObjectDisposedException`