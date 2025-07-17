using System;
using System.Diagnostics;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;

class Program
{
    private const int NUM_KEYS = 10_000_000;
    private static PtrHash<ulong, StrongerIntHasher> _portPtrHash = null!;
    private static ulong[] _lookupKeys = null!;
    private static nuint[] _indicesBuffer = null!;
    private static ulong[] _values = null!;

    static void Main(string[] args)
    {
        Console.WriteLine("DebugTrace: PtrHash V2Raw Performance Profiling");
        Console.WriteLine($"Preparing {NUM_KEYS:N0} random keys...");

        SetupData();
        
        Console.WriteLine("Warming up...");
        WarmUp();
        
        Console.WriteLine("Starting main performance test...");
        Console.WriteLine("Run dotnet trace in another terminal with:");
        Console.WriteLine($"dotnet trace collect --process-id {Environment.ProcessId} --duration 00:00:30 --format NetTrace");
        Console.WriteLine();
        Console.WriteLine("Press any key to start the profiling run...");
        Console.ReadKey();
        
        // Main profiling run
        var stopwatch = Stopwatch.StartNew();
        var iterations = 0;
        var totalSum = 0UL;
        
        Console.WriteLine("Running performance test for 20 seconds...");
        
        while (stopwatch.Elapsed.TotalSeconds < 20)
        {
            var sum = PortPtrHashStreamLookupV2Raw();
            totalSum += sum;
            iterations++;
            
            if (iterations % 10 == 0)
            {
                var avgTime = stopwatch.Elapsed.TotalMilliseconds / iterations;
                Console.WriteLine($"Iterations: {iterations}, Avg time: {avgTime:F2}ms, Sum: {sum}");
            }
        }
        
        stopwatch.Stop();
        
        Console.WriteLine();
        Console.WriteLine("=== FINAL RESULTS ===");
        Console.WriteLine($"Total iterations: {iterations}");
        Console.WriteLine($"Total time: {stopwatch.Elapsed.TotalSeconds:F2} seconds");
        Console.WriteLine($"Average time per iteration: {stopwatch.Elapsed.TotalMilliseconds / iterations:F2}ms");
        Console.WriteLine($"Operations per second: {iterations / stopwatch.Elapsed.TotalSeconds:F2}");
        Console.WriteLine($"Keys per second: {(NUM_KEYS * iterations) / stopwatch.Elapsed.TotalSeconds:N0}");
        Console.WriteLine($"Total sum: {totalSum}");
        Console.WriteLine();
        Console.WriteLine("Profiling complete. Check your dotnet trace output.");
    }

    private static void SetupData()
    {
        var random = new Random(42); // Fixed seed for reproducibility
        
        // Generate 10M random keys for the hash table
        var keys = new ulong[NUM_KEYS];
        for (int i = 0; i < NUM_KEYS; i++)
        {
            keys[i] = (ulong)random.NextInt64();
        }
        
        Console.WriteLine("Building PtrHash...");
        var buildStart = Stopwatch.StartNew();
        
        var parameters = new PtrHashParams
        {
            Alpha = 0.99,
            Lambda = 4.0,
            Minimal = true,
            SinglePart = false
        };
        
        _portPtrHash = new PtrHash<ulong, StrongerIntHasher>(keys, parameters);
        buildStart.Stop();
        
        Console.WriteLine($"PtrHash built in {buildStart.ElapsedMilliseconds}ms");
        
        // Generate random lookup keys (subset of the original keys)
        _lookupKeys = new ulong[NUM_KEYS];
        for (int i = 0; i < NUM_KEYS; i++)
        {
            _lookupKeys[i] = keys[random.Next(NUM_KEYS)];
        }
        
        // Pre-allocate buffers
        _indicesBuffer = new nuint[NUM_KEYS];
        
        // Create values array
        _values = new ulong[_portPtrHash.GetInfo().MaxIndex + 1];
        for (int i = 0; i < _values.Length; i++)
        {
            _values[i] = (ulong)(i + 1);
        }
        
        Console.WriteLine($"Setup complete. Hash table size: {_values.Length:N0} slots");
    }

    private static void WarmUp()
    {
        // Warm up JIT and caches
        for (int i = 0; i < 5; i++)
        {
            var sum = PortPtrHashStreamLookupV2Raw();
            Console.WriteLine($"Warmup {i + 1}: sum = {sum}");
        }
    }

    private static ulong PortPtrHashStreamLookupV2Raw()
    {
        ulong sum = 0;
        _portPtrHash.GetIndicesStreamV2Raw(_lookupKeys.AsSpan(), _indicesBuffer, minimal: true);
        for (int i = 0; i < _indicesBuffer.Length; i++)
            sum += _values[_indicesBuffer[i]];
        return sum;
    }
}
