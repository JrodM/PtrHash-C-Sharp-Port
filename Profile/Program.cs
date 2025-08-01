using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.BucketFunctions;
using PtrHash.CSharp.Port.Storage;

namespace PtrHash.Profile
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("PtrHash Construction Profiler");
            Console.WriteLine("=============================");
            Console.WriteLine();
            
            // Parse command line arguments
            int keyCount = args.Length > 0 && int.TryParse(args[0], out var count) ? count : 10_000_000;
            bool autoTrace = args.Contains("--auto-trace");
            
            Console.WriteLine($"Key count: {keyCount:N0}");
            Console.WriteLine($"Auto-trace: {autoTrace}");
            Console.WriteLine();
            
            // Generate test keys
            Console.WriteLine("Generating test keys...");
            var keys = GenerateKeys(keyCount);
            Console.WriteLine($"Generated {keys.Length:N0} unique keys");
            Console.WriteLine();
            
            // Choose what to profile
            var choice = ChooseProfileTarget();
            
            if (autoTrace)
            {
                // Start tracing automatically
                StartDotnetTrace();
                Console.WriteLine("Tracing started automatically. Press any key to begin profiling...");
                Console.ReadKey();
                Console.WriteLine();
                RunSelectedBenchmark(keys, choice);
            }
            else
            {
                // Manual tracing workflow
                Console.WriteLine("Manual Tracing Workflow:");
                Console.WriteLine("1. Run: ./start-trace.sh");
                Console.WriteLine("2. Press any key here to start construction");
                Console.WriteLine("3. Run: ./stop-trace.sh when done");
                Console.WriteLine();
                Console.WriteLine("Press any key to start construction benchmarks...");
                Console.ReadKey();
                Console.WriteLine();
                RunSelectedBenchmark(keys, choice);
            }
            
            Console.WriteLine();
            Console.WriteLine("Profiling complete!");
            Console.WriteLine("Check the generated .nettrace files for analysis.");
        }
        
        private static int ChooseProfileTarget()
        {
            Console.WriteLine("Choose what to profile:");
            Console.WriteLine("1. C# Port Multi-Part (the slow one - ~910ms)");
            Console.WriteLine("2. C# Port Single-Part");
            Console.WriteLine("3. Both Multi-Part and Single-Part");
            Console.WriteLine("4. Repeated Multi-Part (100 runs for extended profiling)");
            Console.WriteLine("5. Repeated Single-Part (100 runs for extended profiling)");
            Console.WriteLine();
            Console.Write("Enter choice (1-5): ");
            
            if (int.TryParse(Console.ReadLine(), out var choice) && choice >= 1 && choice <= 5)
            {
                return choice;
            }
            
            Console.WriteLine("Invalid choice, defaulting to option 1 (Multi-Part)");
            return 1;
        }
        
        private static void StartDotnetTrace()
        {
            try
            {
                var processId = Process.GetCurrentProcess().Id;
                var traceFileName = $"ptrhash-construction-{DateTime.Now:yyyyMMdd-HHmmss}.nettrace";
                
                var startInfo = new ProcessStartInfo
                {
                    FileName = "dotnet",
                    Arguments = $"trace collect -p {processId} -o {traceFileName} --format NetTrace",
                    UseShellExecute = false,
                    CreateNoWindow = true
                };
                
                Process.Start(startInfo);
                Console.WriteLine($"Started dotnet trace collection: {traceFileName}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Failed to start trace: {ex.Message}");
            }
        }
        
        private static void RunSelectedBenchmark(ulong[] keys, int choice)
        {
            Console.WriteLine("Running C# Port Construction Profiling:");
            Console.WriteLine("=======================================");
            Console.WriteLine();
            
            switch (choice)
            {
                case 1:
                    Console.WriteLine("🔍 Profiling C# Port Multi-Part Construction (The Bottleneck)...");
                    Console.WriteLine("Expected: ~910ms, ~211KB allocated");
                    Console.WriteLine("Focus: Find where all the time and memory goes!");
                    Console.WriteLine();
                    ProfileCSharpPortConstruction(keys, multiPart: true);
                    break;
                    
                case 2:
                    Console.WriteLine("🔍 Profiling C# Port Single-Part Construction...");
                    ProfileCSharpPortConstruction(keys, multiPart: false);
                    break;
                    
                case 3:
                    Console.WriteLine("🔍 Profiling Both Multi-Part and Single-Part...");
                    Console.WriteLine("Multi-Part first:");
                    ProfileCSharpPortConstruction(keys, multiPart: true);
                    Console.WriteLine();
                    Console.WriteLine("Single-Part second:");
                    ProfileCSharpPortConstruction(keys, multiPart: false);
                    break;
                    
                case 4:
                    Console.WriteLine("🔍 Repeated Multi-Part Profiling (100 runs for extended profiling)...");
                    for (int i = 1; i <= 100; i++)
                    {
                        Console.WriteLine($"Run {i}/100:");
                        ProfileCSharpPortConstruction(keys, multiPart: true);
                        if (i < 100) Console.WriteLine();
                    }
                    break;
                    
                case 5:
                    Console.WriteLine("🔍 Repeated Single-Part Profiling (100 runs for extended profiling)...");
                    for (int i = 1; i <= 100; i++)
                    {
                        Console.WriteLine($"Run {i}/100:");
                        ProfileCSharpPortConstruction(keys, multiPart: false);
                        if (i < 100) Console.WriteLine();
                    }
                    break;
            }
        }
        
        private static void ProfileCSharpPortConstruction(ulong[] keys, bool multiPart)
        {
            var sw = Stopwatch.StartNew();
            
            var parameters = new PtrHashParams
            {
                Alpha = 0.99,
                Lambda = 3.0,
                Minimal = true,
                SinglePart = !multiPart,
                StorageType = RemappingStorageType.VecU32
            };
            
            try
            {
                using var ptrHash = new PtrHash<ulong, FxHasher, Linear, UInt32VectorRemappingStorage>(keys, parameters);
                var info = ptrHash.GetInfo();
                
                sw.Stop();
                Console.WriteLine($"  ✓ C# Port {(multiPart ? "Multi" : "Single")}-Part: {sw.ElapsedMilliseconds:N0}ms");
                Console.WriteLine($"    Keys: {info.KeyCount:N0}, Max Index: {info.MaxIndex:N0}");
                Console.WriteLine($"    Memory: ~{GC.GetTotalMemory(false) / 1024:N0}KB allocated");
            }
            catch (Exception ex)
            {
                sw.Stop();
                Console.WriteLine($"  ✗ C# Port {(multiPart ? "Multi" : "Single")}-Part FAILED: {ex.Message}");
            }
        }
        
        
        private static ulong[] GenerateKeys(int count)
        {
            var random = new Random(42); // Fixed seed for reproducibility
            var keys = new HashSet<ulong>();
            
            while (keys.Count < count)
            {
                var key = ((ulong)random.Next() << 32) | (uint)random.Next();
                keys.Add(key);
            }
            
            return keys.ToArray();
        }
    }
}