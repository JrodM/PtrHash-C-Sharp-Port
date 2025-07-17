using System;
using System.Collections.Generic;
using System.Linq;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
using BenchmarkDotNet.Toolchains.InProcess.Emit;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.Collections;

namespace PtrHash.Benchmarks
{
    [Config(typeof(Config))]
    [MemoryDiagnoser]
    [SimpleJob(RuntimeMoniker.Net80)]
    public class PortConstructionBenchmark
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
            
            Console.WriteLine($"Generated {KeyCount:N0} unique keys for C# port construction benchmark");
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

        // C# port construction benchmarks using FxHasher (to match native default)
        [Benchmark]
        public PtrHash<ulong, FxHasher> PortPtrHashFxConstruction()
        {
            return new PtrHash<ulong, FxHasher>(_keys, PtrHashParams.DefaultFast);
        }

        [Benchmark]
        public PtrHashDictionaryU64<ulong> PortPtrHashDictionaryFxConstruction()
        {
            return new PtrHashDictionaryU64<ulong>(_keys, _keys, 0UL, PtrHashParams.DefaultFast);
        }

        [Benchmark]
        public PtrHash<ulong, FxHasher> PortPtrHashFxSinglePartConstruction()
        {
            var params_single = PtrHashParams.DefaultFast with { SinglePart = true };
            return new PtrHash<ulong, FxHasher>(_keys, params_single);
        }

        [Benchmark]
        public PtrHashDictionaryU64<ulong> PortPtrHashDictionaryFxSinglePartConstruction()
        {
            var params_single = PtrHashParams.DefaultFast with { SinglePart = true };
            return new PtrHashDictionaryU64<ulong>(_keys, _keys, 0UL, params_single);
        }

        // C# port construction benchmarks using StrongerIntHasher
        [Benchmark]
        public PtrHash<ulong, StrongerIntHasher> PortPtrHashStrongerIntHasherConstruction()
        {
            return new PtrHash<ulong, StrongerIntHasher>(_keys, PtrHashParams.DefaultFast);
        }

        [Benchmark]
        public PtrHashDictionary<ulong, ulong, StrongerIntHasher> PortPtrHashDictionaryStrongerIntHasherConstruction()
        {
            return new PtrHashDictionary<ulong, ulong, StrongerIntHasher>(_keys, _keys, 0UL, PtrHashParams.DefaultFast);
        }

        // Balanced parameters comparison
        [Benchmark]
        public PtrHash<ulong, FxHasher> PortPtrHashFxBalancedConstruction()
        {
            return new PtrHash<ulong, FxHasher>(_keys, PtrHashParams.DefaultBalanced);
        }

        [Benchmark]
        public PtrHash<ulong, StrongerIntHasher> PortPtrHashStrongerBalancedConstruction()
        {
            return new PtrHash<ulong, StrongerIntHasher>(_keys, PtrHashParams.DefaultBalanced);
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            // BenchmarkDotNet will handle disposal of returned objects
        }
    }
}