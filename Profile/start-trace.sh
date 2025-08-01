#!/usr/bin/bash

# PtrHash Construction Profiling - Start Trace
# Usage: ./start-trace.sh [profile-name]

PROFILE_NAME=${1:-"ptrhash-construction"}
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
TRACE_FILE="${PROFILE_NAME}-${TIMESTAMP}.nettrace"

echo "Starting dotnet trace collection..."
echo "Profile: $PROFILE_NAME"
echo "Output: $TRACE_FILE"
echo ""

# Find the Profile process
PROFILE_PID=$(pgrep -f "Profile" | head -1)

if [ -z "$PROFILE_PID" ]; then
    echo "❌ Profile process not found!"
    echo "Make sure to run 'dotnet run' in the Profile directory first"
    exit 1
fi

echo "Found Profile process: PID $PROFILE_PID"
echo ""

# Start trace collection with comprehensive providers
echo "🔍 Starting trace collection..."
dotnet trace collect \
    --process-id $PROFILE_PID \
    --output "$TRACE_FILE" \
    --format NetTrace \
    --providers Microsoft-DotNETCore-SampleProfiler,Microsoft-Windows-DotNETRuntime:0x4c14fccbd:5,System.Runtime:0x4c14fccbd:5,Microsoft-DotNETCore-EventPipe \
    &

TRACE_PID=$!
echo "✅ Trace collection started (PID: $TRACE_PID)"
echo "Output file: $TRACE_FILE"
echo ""
echo "To stop tracing, run: ./stop-trace.sh $TRACE_PID"
echo "Or press Ctrl+C in the Profile application"

# Save the trace PID for stop script
echo $TRACE_PID > .trace_pid
echo $TRACE_FILE > .trace_file

echo ""
echo "📊 Trace collection active. Switch to Profile app and start benchmarking!"