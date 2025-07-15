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
using PtrHash.CSharp.Port.Collections;

namespace PtrHash.Benchmarks
{
    [Config(typeof(Config))]
    [MemoryDiagnoser]
    [SimpleJob(RuntimeMoniker.Net80)]
    public class ConstructionWithPortBenchmark
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

        // Native interop construction benchmarks
        [Benchmark]
        public PtrHashU64 NativePtrHashConstruction()
        {
            return new PtrHashU64(_keys.AsSpan(), PtrHashConfig.Default);
        }

        [Benchmark]
        public SentinelPtrHashU64<ulong> NativeSentinelPtrHashConstruction()
        {
            return new SentinelPtrHashU64<ulong>(_keys.AsSpan(), _keys.AsSpan(), 0UL, PtrHashConfig.Default);
        }

        [Benchmark]
        public SentinelPtrHashU64<ulong> NativeSentinelPtrHashSinglePartConstruction()
        {
            var config = PtrHashConfig.Default with { SinglePart = true };
            return new SentinelPtrHashU64<ulong>(_keys.AsSpan(), _keys.AsSpan(), 0UL, config);
        }

        // C# port construction benchmarks using FxHasher (to match native default)
        [Benchmark]
        public PtrHash.CSharp.Port.Core.PtrHash<ulong, FxHasher> PortPtrHashConstruction()
        {
            return new PtrHash.CSharp.Port.Core.PtrHash<ulong, FxHasher>(_keys, PtrHashParams.DefaultFast);
        }

        [Benchmark]
        public PtrHashMapU64<ulong> PortPtrHashMapConstruction()
        {
            return new PtrHashMapU64<ulong>(_keys, _keys, 0UL, PtrHashParams.DefaultFast);
        }

        [Benchmark]
        public PtrHash.CSharp.Port.Core.PtrHash<ulong, FxHasher> PortPtrHashSinglePartConstruction()
        {
            var params_single = PtrHashParams.DefaultFast with { SinglePart = true };
            return new PtrHash.CSharp.Port.Core.PtrHash<ulong, FxHasher>(_keys, params_single);
        }

        [Benchmark]
        public PtrHashMapU64<ulong> PortPtrHashMapSinglePartConstruction()
        {
            var params_single = PtrHashParams.DefaultFast with { SinglePart = true };
            return new PtrHashMapU64<ulong>(_keys, _keys, 0UL, params_single);
        }

        // Additional hasher comparison for C# port
        [Benchmark]
        public PtrHash.CSharp.Port.Core.PtrHash<ulong, StrongerIntHasher> PortPtrHashStrongerIntHasherConstruction()
        {
            return new PtrHash.CSharp.Port.Core.PtrHash<ulong, StrongerIntHasher>(_keys, PtrHashParams.DefaultFast);
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            // BenchmarkDotNet will handle disposal of returned objects
        }
    }
}