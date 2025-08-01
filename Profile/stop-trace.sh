#!/bin/bash

# PtrHash Construction Profiling - Stop Trace
# Usage: ./stop-trace.sh [trace-pid]

TRACE_PID=${1:-$(cat .trace_pid 2>/dev/null)}
TRACE_FILE=$(cat .trace_file 2>/dev/null)

if [ -z "$TRACE_PID" ]; then
    echo "❌ No trace PID provided and no .trace_pid file found"
    echo "Usage: ./stop-trace.sh <trace-pid>"
    exit 1
fi

echo "Stopping trace collection..."
echo "Trace PID: $TRACE_PID"
echo "Output file: $TRACE_FILE"
echo ""

# Stop the trace process
kill -INT $TRACE_PID 2>/dev/null
if [ $? -eq 0 ]; then
    echo "✅ Trace collection stopped"
    
    # Wait a moment for file to be written
    sleep 2
    
    if [ -f "$TRACE_FILE" ]; then
        FILE_SIZE=$(stat -f%z "$TRACE_FILE" 2>/dev/null || stat -c%s "$TRACE_FILE" 2>/dev/null)
        echo "📁 Trace file: $TRACE_FILE ($(numfmt --to=iec $FILE_SIZE 2>/dev/null || echo "$FILE_SIZE bytes"))"
        echo ""
        echo "🔍 Analysis Options:"
        echo "  1. Visual Studio: File → Open → $TRACE_FILE"
        echo "  2. PerfView: Download from Microsoft, open .nettrace file"
        echo "  3. dotnet-trace analyze: dotnet trace analyze $TRACE_FILE"
        echo "  4. speedscope.app: Upload $TRACE_FILE for web-based analysis"
        echo ""
        echo "🎯 Focus Areas for Performance Analysis:"
        echo "  - Array allocation/pooling operations"
        echo "  - Bucket sorting algorithms" 
        echo "  - Pilot finding loops"
        echo "  - BitVec operations"
        echo "  - Memory allocations vs Native baseline"
    else
        echo "⚠️  Trace file not found: $TRACE_FILE"
    fi
else
    echo "⚠️  Failed to stop trace (PID may have already exited)"
fi

# Cleanup
rm -f .trace_pid .trace_file

echo ""
echo "✨ Profiling session complete!"