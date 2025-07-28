using System;
using System.Reflection;
using BenchmarkDotNet.Running;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Loggers;
using BenchmarkDotNet.Columns;
using BenchmarkDotNet.Exporters;

namespace PtrHash.Benchmarks
{
    class Program
    {
        static void Main(string[] args)
        {
            // Note: Environment variables set here don't affect BenchmarkDotNet child processes
            // For AOT benchmarks, run with: DOTNET_EnableAVX512F=0 dotnet run -c Release -- core
            
            Console.WriteLine("PtrHash Performance Benchmarks");
            Console.WriteLine("==============================");
            Console.WriteLine("Runtime: " + System.Runtime.InteropServices.RuntimeInformation.FrameworkDescription);
            Console.WriteLine("GC Mode: " + (System.Runtime.GCSettings.IsServerGC ? "Server" : "Workstation"));
            Console.WriteLine();

            if (args.Length == 0)
            {
                Console.WriteLine("Available benchmarks:");
                Console.WriteLine("  dictionaries           - Dictionary implementation comparison (PtrHash vs Standard Dictionary)");
                Console.WriteLine("  dict-scaling           - Lookup performance scaling benchmark");
                Console.WriteLine("  construct              - Data structure construction time benchmark");
                Console.WriteLine("  core                   - Native vs Port performance comparison");
                Console.WriteLine("  stream                 - Large dataset streaming benchmark");
                Console.WriteLine("  all                    - Run all benchmarks");
                Console.WriteLine();
                Console.WriteLine("Usage: dotnet run [benchmark]");
                Console.WriteLine("Example: dotnet run dictionaries");
                return;
            }

            var config = ManualConfig
                .Create(DefaultConfig.Instance)
                .AddLogger(ConsoleLogger.Default)
                .AddColumnProvider(DefaultColumnProviders.Instance)
                .AddExporter(MarkdownExporter.GitHub)
                .AddExporter(HtmlExporter.Default);

            switch (args[0].ToLowerInvariant())
            {
                case "dictionaries":
                    Console.WriteLine("Running Dictionary Implementation Comparison benchmark...");
                    BenchmarkRunner.Run<DictionaryImplementationComparisonBenchmark>(config);
                    break;

                case "dict-scaling":
                    Console.WriteLine("Running Lookup Performance Scaling benchmark...");
                    BenchmarkRunner.Run<LookupPerformanceScalingBenchmark>(config);
                    break;

                case "construct":
                    Console.WriteLine("Running Data Structure Construction benchmark...");
                    BenchmarkRunner.Run<DataStructureConstructionBenchmark>(config);
                    break;

                case "core":
                    Console.WriteLine("Running Native vs Port Performance benchmark...");
                    BenchmarkRunner.Run<NativeVsPortPerformanceBenchmark>(config);
                    break;

                case "stream":
                    Console.WriteLine("Running Large Dataset Streaming benchmark...");
                    BenchmarkRunner.Run<LargeDatasetStreamingBenchmark>(config);
                    break;

                case "all":
                    Console.WriteLine("Running all benchmarks...");
                    BenchmarkRunner.Run(Assembly.GetExecutingAssembly(), config);
                    break;

                default:
                    Console.WriteLine($"Unknown benchmark: {args[0]}");
                    Console.WriteLine("Available options: dictionaries, dict-scaling, construct, core, stream, all");
                    break;
            }

            Console.WriteLine();
            Console.WriteLine("Benchmark completed. Check BenchmarkDotNet.Artifacts folder for detailed results.");
        }
    }
}