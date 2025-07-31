@echo off
echo Building PtrHash Rust library and C# projects...

REM Build Rust library first
echo.
echo [1/4] Building Rust library (release)...
cargo build --release
if %ERRORLEVEL% neq 0 (
    echo ERROR: Rust build failed
    exit /b 1
)

REM Build C# library
echo.
echo [2/4] Building C# interop library...
dotnet build CSharpInterop/PtrHashNative.csproj --configuration Release
if %ERRORLEVEL% neq 0 (
    echo ERROR: C# library build failed
    exit /b 1
)

REM Build tests
echo.
echo [3/4] Building C# tests...
dotnet build CSharInterop.Tests/CSharpInterop.Tests.csproj --configuration Release
if %ERRORLEVEL% neq 0 (
    echo ERROR: C# tests build failed
    exit /b 1
)

REM Build benchmarks
echo.
echo [4/4] Building benchmarks...
dotnet build Benchmarks/PtrHash.Benchmarks.csproj --configuration Release
if %ERRORLEVEL% neq 0 (
    echo ERROR: Benchmarks build failed
    exit /b 1
)

echo.
echo SUCCESS: All projects built successfully!
echo.
echo Next steps:
echo   Run tests:      dotnet test CSharInterop.Tests
echo   Run benchmarks: dotnet run --project Benchmarks -- lookup
echo.