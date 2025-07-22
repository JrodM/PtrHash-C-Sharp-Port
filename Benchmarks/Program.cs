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
            Console.WriteLine("PtrHash Performance Benchmarks");
            Console.WriteLine("==============================");
            Console.WriteLine();

            if (args.Length == 0)
            {
                Console.WriteLine("Available benchmarks:");
                Console.WriteLine("  1. dictionaries        - PtrHash Dictionaries vs Standard Dictionary");
                Console.WriteLine("  2. dict-scaling        - Dictionary lookup scaling with fixed 2M keys");
                Console.WriteLine("  3. construct           - Construction time benchmark");
                Console.WriteLine("  4. core                - Core PtrHash single-part vs multi-part performance");
                Console.WriteLine("  5. stream              - PtrHash streaming lookups (10^9 keys, 10k lookups)");
                Console.WriteLine("  6. all                 - Run all benchmarks");
                Console.WriteLine();
                Console.WriteLine("Usage: dotnet run [benchmark]");
                Console.WriteLine("Example: dotnet run interop-vs-port");
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
                // case "lookup":
                //     Console.WriteLine("Running PtrHash vs Dictionary lookup benchmark (original)...");
                //     BenchmarkRunner.Run<PtrHashVsDictionaryBenchmark>(config);
                //     break;

                // case "interop-vs-port":
                //     Console.WriteLine("Running PtrHash Interop vs C# Port benchmark...");
                //     BenchmarkRunner.Run<PtrHashInteropVsPortBenchmark>(config);
                //     break;

                case "dictionaries":
                    Console.WriteLine("Running PtrHash Dictionaries vs Standard Dictionary benchmark...");
                    BenchmarkRunner.Run<PtrHashDictionariesVsDictionaryBenchmark>(config);
                    break;

                case "dict-scaling":
                    Console.WriteLine("Running Dictionary lookup scaling benchmark...");
                    BenchmarkRunner.Run<DictionaryLookupScalingBenchmark>(config);
                    break;

                // case "lookup-port":
                //     Console.WriteLine("Running PtrHash vs Dictionary lookup benchmark (C# port only)...");
                //     BenchmarkRunner.Run<PortOnlyBenchmark>(config);
                //     break;

                // case "memory":
                //     Console.WriteLine("Running memory usage benchmark...");
                //     BenchmarkRunner.Run<MemoryUsageBenchmark>(config);
                //     break;

                case "construct":
                     Console.WriteLine("Running construction time benchmark...");
                     BenchmarkRunner.Run<ConstructionBenchmark>(config);
                     break;

                case "core":
                    Console.WriteLine("Running Core PtrHash benchmark...");
                    BenchmarkRunner.Run<PtrHashCoreBenchmark>(config);
                    break;

                case "stream":
                    Console.WriteLine("Running PtrHash streaming lookups benchmark...");
                    BenchmarkRunner.Run<PtrHashStreamBenchmark>(config);
                    break;

                // case "unsafe-optimization":
                //     Console.WriteLine("Running unsafe pointer optimization benchmark...");
                //     BenchmarkRunner.Run<UnsafeOptimizationBenchmark>(config);
                //     break;

                // case "large-scale":
                //     Console.WriteLine("Running large-scale benchmark (1M-100M keys)...");
                //     BenchmarkRunner.Run<LargeScaleBenchmark>(config);
                //     break;

                // case "simple-unsafe":
                //     Console.WriteLine("Running simple unsafe benchmark...");
                //     SimpleUnsafeBenchmark.Run();
                //     break;

                // case "allocation":
                //     Console.WriteLine("Running allocation benchmark...");
                //     BenchmarkRunner.Run<AllocationBenchmark>(config);
                //     break;

                // case "construct-mixed":
                //     Console.WriteLine("Running construction time benchmark (interop + port)...");
                //     BenchmarkRunner.Run<ConstructionWithPortBenchmark>(config);
                //     break;

                // case "construct-port":
                //     Console.WriteLine("Running construction time benchmark (C# port only)...");
                //     BenchmarkRunner.Run<PortConstructionBenchmark>(config);
                //     break;


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