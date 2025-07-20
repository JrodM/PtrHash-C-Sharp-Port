#!/bin/bash

# PtrHash Construction Profiling Script
# This script builds and profiles the ConstructionProfiler application using dotTrace

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/ConstructionProfiler"
OUTPUT_DIR="$SCRIPT_DIR/ProfileResults"

echo "=== PtrHash Construction Profiling Script ==="
echo "Script directory: $SCRIPT_DIR"
echo "Project directory: $PROJECT_DIR"
echo "Output directory: $OUTPUT_DIR"

# Create output directory for profile results
mkdir -p "$OUTPUT_DIR"

# Build the profiler application
echo ""
echo "Building ConstructionProfiler..."
cd "$PROJECT_DIR"
dotnet build -c Release

if [ $? -ne 0 ]; then
    echo "ERROR: Build failed"
    exit 1
fi

echo "Build successful!"

# Check if dotTrace command line tools are available
if ! command -v dottrace &> /dev/null; then
    echo ""
    echo "WARNING: dotTrace command line tools not found"
    echo "Please install JetBrains dotTrace and ensure 'dottrace' is in your PATH"
    echo ""
    echo "Alternatives:"
    echo "1. Run the profiler manually: dotnet run -c Release"
    echo "2. Attach dotTrace from JetBrains Rider/dotTrace GUI"
    echo "3. Install dotTrace command line tools"
    echo ""
    echo "Running without profiling..."
    dotnet run -c Release
    exit 0
fi

# Run with dotTrace profiling
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
PROFILE_OUTPUT="$OUTPUT_DIR/construction_profile_$TIMESTAMP.dtp"

echo ""
echo "Starting dotTrace profiling..."
echo "Profile will be saved to: $PROFILE_OUTPUT"
echo ""

dottrace save-to="$PROFILE_OUTPUT" \
    --profiling-type=Timeline \
    --collect-at=Start \
    --save-to="$PROFILE_OUTPUT" \
    -- dotnet "$PROJECT_DIR/bin/Release/net8.0/ConstructionProfiler.dll"

if [ $? -eq 0 ]; then
    echo ""
    echo "Profiling completed successfully!"
    echo "Profile saved to: $PROFILE_OUTPUT"
    echo ""
    echo "To analyze the profile:"
    echo "1. Open dotTrace"
    echo "2. File -> Open -> Select $PROFILE_OUTPUT"
    echo "3. Focus on TryRemapFreeSlots method performance"
else
    echo "ERROR: Profiling failed"
    exit 1
fi