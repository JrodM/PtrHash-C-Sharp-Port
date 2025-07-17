#!/bin/bash

echo "DebugTrace: PtrHash V2Raw Profiling Script"
echo "=========================================="
echo

# Check if dotnet-trace is installed
if ! command -v dotnet-trace &> /dev/null; then
    echo "Installing dotnet-trace..."
    dotnet tool install --global dotnet-trace
    echo
fi

echo "Starting the DebugTrace application..."
dotnet run --project DebugTrace.csproj --configuration Release &
APP_PID=$!

echo "Application PID: $APP_PID"
echo "Wait for the application to show 'Press any key to start...'"
echo

# Wait a moment for the app to start
sleep 3

echo "Press Enter when you're ready to start profiling..."
read -r

echo "Starting dotnet trace..."
dotnet trace collect --process-id $APP_PID --duration 00:00:30 --format NetTrace --output ptrhash-v2raw-trace

echo "Profiling complete!"
echo "Trace file: ptrhash-v2raw-trace.nettrace"
echo "You can analyze it with:"
echo "  - dotnet trace ps-analysis ptrhash-v2raw-trace.nettrace"
echo "  - Visual Studio or perfview"
echo "  - https://www.speedscope.app (upload the .nettrace file)"