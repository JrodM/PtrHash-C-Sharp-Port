using System;
using System.Runtime.CompilerServices;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Jobs;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;

namespace PtrHash.Benchmarks
{
    [SimpleJob(RuntimeMoniker.Net80)]
    [MemoryDiagnoser]
    public class UnsafeOptimizationBenchmark
    {
        private PtrHash<ulong, StrongerIntHasher> _ptrHash;
        private ulong[] _keys;
        private nuint[] _results;

        [Params(1000, 10_000, 100_000, 1_000_000, 10_000_000)]
        public int KeyCount { get; set; }
        
        [GlobalSetup]
        public void Setup()
        {
            var random = new Random(42);
            _keys = new ulong[KeyCount];
            _results = new nuint[KeyCount];
            
            for (int i = 0; i < KeyCount; i++)
            {
                _keys[i] = (ulong)random.NextInt64();
            }
            
            _ptrHash = new PtrHash<ulong, StrongerIntHasher>(_keys, PtrHashParams.DefaultFast);
        }
        
        [GlobalCleanup]
        public void Cleanup()
        {
            _ptrHash?.Dispose();
        }
        
        [Benchmark(Baseline = true)]
        public void SafeGetIndicesStream()
        {
            _ptrHash.GetIndicesStreamV2(_keys, _results, 32, true);
        }
        
        [Benchmark]
        public void UnsafeGetIndicesStream()
        {
            _ptrHash.GetIndicesStream(_keys, _results, true);
        }
        
    }
}