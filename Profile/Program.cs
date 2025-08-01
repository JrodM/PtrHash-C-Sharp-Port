using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
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
            // Enable JIT disassembly for FindPilot methods
            Environment.SetEnvironmentVariable("DOTNET_JitDisasm", "*FindPilot*");
            Environment.SetEnvironmentVariable("DOTNET_JitDisasmSummary", "1");
            Environment.SetEnvironmentVariable("DOTNET_JitDumpInlinePhases", "1");
            
            Console.WriteLine("PtrHash Construction Profiler");
            Console.WriteLine("=============================");
            Console.WriteLine();
            Console.WriteLine("JIT Disassembly enabled for FindPilot methods");
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
                TryReadKey();
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
                TryReadKey();
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
            
            try
            {
                var input = Console.ReadLine();
                if (int.TryParse(input, out var choice) && choice >= 1 && choice <= 5)
                {
                    return choice;
                }
            }
            catch
            {
                // Console input not available
            }
            
            Console.WriteLine("Invalid choice or no input, defaulting to option 2 (Single-Part)");
            return 2;
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
            
            // Always emit JIT assembly analysis after profiling
            Console.WriteLine();
            Console.WriteLine("🔍 Analyzing JIT Assembly for FindPilot Methods...");
            EmitJitAssembly(keys);
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
        
        
        private static void TryReadKey()
        {
            try
            {
                if (Console.IsInputRedirected)
                {
                    Console.WriteLine("(Input redirected, continuing automatically)");
                    return;
                }
                Console.ReadKey(true);
            }
            catch
            {
                Console.WriteLine("(Could not read key, continuing automatically)");
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
        
        private static void EmitJitAssembly(ulong[] keys)
        {
            try
            {
                Console.WriteLine("Analyzing JIT compilation from profiling runs...");
                Console.WriteLine();
                
                Console.WriteLine("Current JIT Disassembly Settings:");
                Console.WriteLine($"DOTNET_JitDisasm: {Environment.GetEnvironmentVariable("DOTNET_JitDisasm")}");
                Console.WriteLine($"DOTNET_JitDisasmSummary: {Environment.GetEnvironmentVariable("DOTNET_JitDisasmSummary")}");
                Console.WriteLine($"DOTNET_JitDumpInlinePhases: {Environment.GetEnvironmentVariable("DOTNET_JitDumpInlinePhases")}");
                Console.WriteLine();
                
                // Use reflection to get information about the FindPilot method
                var ptrHashType = typeof(PtrHash<ulong, FxHasher, Linear, UInt32VectorRemappingStorage>);
                var findPilotMethod = ptrHashType.GetMethod("FindPilot", BindingFlags.NonPublic | BindingFlags.Instance);
                var findPilotSliceMethod = ptrHashType.GetMethod("FindPilotSlice", BindingFlags.NonPublic | BindingFlags.Instance);
                
                if (findPilotMethod != null)
                {
                    Console.WriteLine($"FindPilot method found: {findPilotMethod.Name}");
                    Console.WriteLine($"  Method Handle: 0x{findPilotMethod.MethodHandle.Value:X}");
                    
                    // Try to get the function pointer (this will force JIT if not already compiled)
                    try
                    {
                        var functionPtr = findPilotMethod.MethodHandle.GetFunctionPointer();
                        Console.WriteLine($"  Function Pointer: 0x{functionPtr:X}");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"  Could not get function pointer: {ex.Message}");
                    }
                }
                
                if (findPilotSliceMethod != null)
                {
                    Console.WriteLine($"FindPilotSlice method found: {findPilotSliceMethod.Name}");
                    Console.WriteLine($"  Method Handle: 0x{findPilotSliceMethod.MethodHandle.Value:X}");
                    
                    try
                    {
                        var functionPtr = findPilotSliceMethod.MethodHandle.GetFunctionPointer();
                        Console.WriteLine($"  Function Pointer: 0x{functionPtr:X}");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"  Could not get function pointer: {ex.Message}");
                    }
                }
                
                Console.WriteLine();
                Console.WriteLine("JIT disassembly should be visible in the output above.");
                Console.WriteLine("Look for 'FindPilot' methods in the JIT compilation messages.");
                
            }
            catch (Exception ex)
            {
                Console.WriteLine($"JIT analysis failed: {ex.Message}");
            }
        }
    }
}