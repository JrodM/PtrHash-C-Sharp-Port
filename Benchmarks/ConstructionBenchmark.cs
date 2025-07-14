using System;
using System.Collections.Generic;
using System.Linq;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
using BenchmarkDotNet.Toolchains.InProcess.Emit;
using PtrHash.Core;
using PtrHash.PtrHash;
using PtrHash.SentinelHashMap;
using PtrHashImpl = PtrHash.PtrHash;

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
                AddJob(Job.Default.WithToolchain(InProcessEmitToolchain.Instance));
            }
        }

        [Params(10_000, 100_000, 1_000_000)]
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
        public Dictionary<ulong, ulong> DictionaryConstruction()
        {
            var dictionary = new Dictionary<ulong, ulong>(KeyCount);
            for (int i = 0; i < _keys.Length; i++)
            {
                dictionary[_keys[i]] = _keys[i];
            }
            return dictionary;
        }

        [Benchmark]
        public PtrHashU64 PtrHashConstruction()
        {
            return new PtrHashU64(_keys.AsSpan(), PtrHashConfig.Default);
        }

        [Benchmark]
        public SentinelPtrHashU64<ulong> SentinelPtrHashConstruction()
        {
            return new SentinelPtrHashU64<ulong>(_keys.AsSpan(), _keys.AsSpan(), 0UL, PtrHashConfig.Default);
        }


        [GlobalCleanup]
        public void Cleanup()
        {
            // BenchmarkDotNet will handle disposal of returned objects
        }
    }
}