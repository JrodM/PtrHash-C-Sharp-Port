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
                Console.WriteLine("  1. interop-vs-port     - PtrHash Interop vs C# Port comparison");
                Console.WriteLine("  2. dictionaries        - PtrHash Dictionaries vs Standard Dictionary");
                Console.WriteLine("  3. construct           - Construction time benchmark");
                Console.WriteLine("  4. bounds-check        - Manual vs JIT bounds checking comparison");
                Console.WriteLine("  5. all                 - Run all benchmarks");
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

                case "interop-vs-port":
                    Console.WriteLine("Running PtrHash Interop vs C# Port benchmark...");
                    BenchmarkRunner.Run<PtrHashInteropVsPortBenchmark>(config);
                    break;

                case "dictionaries":
                    Console.WriteLine("Running PtrHash Dictionaries vs Standard Dictionary benchmark...");
                    BenchmarkRunner.Run<PtrHashDictionariesVsDictionaryBenchmark>(config);
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

                case "bounds-check":
                    Console.WriteLine("Running bounds check optimization benchmark...");
                    BenchmarkRunner.Run<BoundsCheckBenchmark>(config);
                    break;

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
                    Console.WriteLine("Available options: interop-vs-port, dictionaries, construct, bounds-check, all");
                    break;
            }

            Console.WriteLine();
            Console.WriteLine("Benchmark completed. Check BenchmarkDotNet.Artifacts folder for detailed results.");
        }
    }
}