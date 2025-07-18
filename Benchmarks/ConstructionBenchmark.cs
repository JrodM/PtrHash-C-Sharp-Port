using System;
using System.Collections.Generic;
using System.Linq;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
using BenchmarkDotNet.Toolchains.InProcess.Emit;
using PtrHash.CSharp.Interop.Core;
using PtrHash.CSharp.Interop.PtrHash;
using PtrHash.CSharp.Interop.SentinelHashMap;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHashImpl = PtrHash.CSharp.Interop.PtrHash;

namespace PtrHash.Benchmarks
{
    [Config(typeof(Config))]
    [MemoryDiagnoser]
    [SimpleJob(RuntimeMoniker.Net80)]
    public class ConstructionBenchmark
    {
        private class Config : ManualConfig
        {
            public Config()
            {
            
            }
        }

        [Params( 1_000, 10_000, 100_000, 1_000_000, 10_000_000, 100_000_000)]
        public int KeyCount { get; set; }

        private ulong[] _keys = null!;

        [GlobalSetup]
        public void Setup()
        {
            var random = new Random(42);
            
            // Generate unique random keys
            var keySet = new HashSet<ulong>();
            while (keySet.Count < KeyCount)
            {
                keySet.Add((ulong)random.NextInt64(1, long.MaxValue));
            }
            _keys = keySet.ToArray();
            
            Console.WriteLine($"Generated {KeyCount:N0} unique keys for construction benchmark");
        }

        [Benchmark(Baseline = true)]
        public PtrHashU64 NativeInteropConstruction()
        {
            return new PtrHashU64(_keys.AsSpan(), PtrHashConfig.Default);
        }

        [Benchmark]
        public PtrHash<ulong, FxHasher> PortConstruction()
        {
            return new PtrHash<ulong, FxHasher>(_keys, PtrHashParams.DefaultFast);
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            // BenchmarkDotNet will handle disposal of returned objects
        }
    }
}