using System;
using System.Collections.Generic;
using System.Linq;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
using PtrHash.CSharp.Port;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;

namespace PtrHash.Benchmarks
{
    [Config(typeof(Config))]
    [MemoryDiagnoser]
    [SimpleJob(RuntimeMoniker.Net80)]
    public class PtrHashStreamBenchmark
    {
        private class Config : ManualConfig
        {
            public Config()
            {
            }
        }

        [Params(500_000_000)]
        public int KeyCount { get; set; }

        [Params(10_000)]
        public int LookupCount { get; set; }

        private ulong[] _keys = null!;
        private ulong[] _lookupKeys = null!;
        
        private PtrHash<ulong, StrongerIntHasher> _multiPartPtrHash = null!;
        
        private nuint[] _indicesBuffer = null!;

        [GlobalSetup]
        public void Setup()
        {
            var random = new Random(42);
            _keys = new ulong[KeyCount];
            for (int i = 0; i < KeyCount; i++)
                _keys[i] = (ulong)random.NextInt64(1, long.MaxValue);

            var actualLookupCount = Math.Min(LookupCount, KeyCount);
            
            _lookupKeys = new ulong[actualLookupCount];
            for (int i = 0; i < actualLookupCount; i++)
                _lookupKeys[i] = _keys[random.Next(KeyCount)];

            _multiPartPtrHash = new PtrHash<ulong, StrongerIntHasher>(_keys, PtrHashParams.DefaultFast);

            _indicesBuffer = new nuint[actualLookupCount];
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            _multiPartPtrHash?.Dispose();
        }

        [Benchmark]
        public ulong MultiPart_GetIndicesStream()
        {
            ulong sum = 0;
            _multiPartPtrHash.GetIndicesStream(
                _lookupKeys.AsSpan(),
                _indicesBuffer,
                minimal: true);

            for (int i = 0; i < _indicesBuffer.Length; i++)
            {
                sum += _indicesBuffer[i];
            }
            return sum;
        }
    }
}