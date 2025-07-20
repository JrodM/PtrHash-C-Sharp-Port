# PtrHash Performance Profiling Tools

This directory contains tools for profiling PtrHash construction performance, specifically designed to analyze the 100K key construction performance bottleneck.

## Contents

- **`ConstructionProfiler/`** - Console application for profiling 100K key construction
- **`profile_construction.sh`** - Bash script for automated dotTrace profiling
- **`profile_gui.py`** - Python GUI for easy profiling workflow
- **`ProfileResults/`** - Directory where profile results are saved (created automatically)

## Quick Start

### Option 1: GUI (Recommended)
```bash
python3 profile_gui.py
```

### Option 2: Command Line
```bash
./profile_construction.sh
```

### Option 3: Manual
```bash
cd ConstructionProfiler
dotnet build -c Release
dotnet run -c Release
```

## Profiling Tools

### dotTrace Integration
The scripts are configured to work with JetBrains dotTrace command line tools. If dotTrace is not installed, the tools will fall back to manual timing.

To install dotTrace command line tools:
1. Install JetBrains dotTrace
2. Add dotTrace to your PATH
3. Verify with: `dottrace --help`

### What to Look For

When analyzing the profiles, focus on:

1. **TryRemapFreeSlots method** - This was the main bottleneck (should now be fixed)
2. **Memory allocation patterns** - Look for excessive GC pressure
3. **BitVec operations** - Verify the new IterZeros() method is efficient
4. **SortBucketsInPart** - Potential next optimization target

## Expected Performance

- **Before optimization**: ~113,000 μs (113 ms) for 100K keys
- **After optimization**: Should be significantly faster
- **Native Rust performance**: ~6,466 μs (6.5 ms) for comparison

## Debugging

The ConstructionProfiler application enables construction debugging output to help identify performance bottlenecks. This includes timing information for major construction phases.