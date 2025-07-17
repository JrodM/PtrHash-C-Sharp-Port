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
                Console.WriteLine("  1. lookup          - PtrHash vs Dictionary lookup (interop only)");
                Console.WriteLine("  2. lookup-mixed    - PtrHash vs Dictionary (interop + port comparison)");
                Console.WriteLine("  3. lookup-port     - PtrHash vs Dictionary (C# port only)");
                Console.WriteLine("  4. memory          - Memory usage comparison");
                Console.WriteLine("  5. construct       - Construction time (interop only)");
                Console.WriteLine("  6. construct-mixed - Construction time (interop + port comparison)");
                Console.WriteLine("  7. construct-port  - Construction time (C# port only)");
                Console.WriteLine("  8. prefetch        - Prefetch.PrefetchRead() vs normal array access");
                Console.WriteLine("  9. all             - Run all benchmarks");
                Console.WriteLine();
                Console.WriteLine("Usage: dotnet run [benchmark]");
                Console.WriteLine("Example: dotnet run lookup-port");
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

                // case "lookup-mixed":
                //     Console.WriteLine("Running PtrHash vs Dictionary lookup benchmark (interop + port)...");
                //     BenchmarkRunner.Run<PtrHashVsDictionaryWithPortBenchmark>(config);
                //     break;

                // case "lookup-port":
                //     Console.WriteLine("Running PtrHash vs Dictionary lookup benchmark (C# port only)...");
                //     BenchmarkRunner.Run<PortOnlyBenchmark>(config);
                //     break;

                // case "memory":
                //     Console.WriteLine("Running memory usage benchmark...");
                //     BenchmarkRunner.Run<MemoryUsageBenchmark>(config);
                //     break;

                // case "construct":
                //     Console.WriteLine("Running construction time benchmark (interop only)...");
                //     BenchmarkRunner.Run<ConstructionBenchmark>(config);
                //     break;

                // case "construct-mixed":
                //     Console.WriteLine("Running construction time benchmark (interop + port)...");
                //     BenchmarkRunner.Run<ConstructionWithPortBenchmark>(config);
                //     break;

                // case "construct-port":
                //     Console.WriteLine("Running construction time benchmark (C# port only)...");
                //     BenchmarkRunner.Run<PortConstructionBenchmark>(config);
                //     break;

                case "prefetch":
                    Console.WriteLine("Running prefetch performance benchmark...");
                    BenchmarkRunner.Run<PrefetchBenchmark>(config);
                    break;

                case "all":
                    Console.WriteLine("Running all benchmarks...");
                    BenchmarkRunner.Run(Assembly.GetExecutingAssembly(), config);
                    break;

                default:
                    Console.WriteLine($"Unknown benchmark: {args[0]}");
                    Console.WriteLine("Available options: prefetch, all");
                    break;
            }

            Console.WriteLine();
            Console.WriteLine("Benchmark completed. Check BenchmarkDotNet.Artifacts folder for detailed results.");
        }
    }
}