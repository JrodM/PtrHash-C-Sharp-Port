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
                Console.WriteLine("  1. lookup    - PtrHash vs Dictionary lookup performance");
                Console.WriteLine("  2. memory    - Memory usage comparison");
                Console.WriteLine("  3. construct - Construction time comparison");
                Console.WriteLine("  4. all       - Run all benchmarks");
                Console.WriteLine();
                Console.WriteLine("Usage: dotnet run [benchmark]");
                Console.WriteLine("Example: dotnet run lookup");
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
                case "lookup":
                    Console.WriteLine("Running PtrHash vs Dictionary lookup benchmark...");
                    BenchmarkRunner.Run<PtrHashVsDictionaryBenchmark>(config);
                    break;

                case "memory":
                    Console.WriteLine("Running memory usage benchmark...");
                    BenchmarkRunner.Run<MemoryUsageBenchmark>(config);
                    break;

                case "construct":
                    Console.WriteLine("Running construction time benchmark...");
                    BenchmarkRunner.Run<ConstructionBenchmark>(config);
                    break;

                case "all":
                    Console.WriteLine("Running all benchmarks...");
                    BenchmarkRunner.Run(Assembly.GetExecutingAssembly(), config);
                    break;

                default:
                    Console.WriteLine($"Unknown benchmark: {args[0]}");
                    Console.WriteLine("Available options: lookup, memory, construct, all");
                    break;
            }

            Console.WriteLine();
            Console.WriteLine("Benchmark completed. Check BenchmarkDotNet.Artifacts folder for detailed results.");
        }
    }
}