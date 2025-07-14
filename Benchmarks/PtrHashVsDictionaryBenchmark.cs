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


namespace PtrHash.Benchmarks
{
    [Config(typeof(Config))]
    [MemoryDiagnoser]
    [SimpleJob(RuntimeMoniker.Net80)]
    public class PtrHashVsDictionaryBenchmark
    {
        private class Config : ManualConfig
        {
            public Config()
            {
            }
        }

        [Params(10_000, 100_000, 1_000_000)]
        public int KeyCount { get; set; }

        private ulong[] _keys = null!;
        private ulong[] _values = null!;
        private ulong[] _lookupKeys = null!;
        private Dictionary<ulong, ulong> _dictionary = null!;
        private PtrHashU64 _ptrHash = null!;
        private SentinelPtrHashU64<ulong> _sentinelPtrHash = null!;
        private SentinelPtrHashU64<ulong> _sentinelPtrHashSinglePart = null!;
        private nuint[] _indicesBuffer = null!;
        private ulong[] _valuesBuffer = null!;
        private ulong[] _valuesBuffer2 = null!;
        private bool[] _foundBuffer = null!;

        [GlobalSetup]
        public void Setup()
        {
            var random = new Random(42);
            var keySet = new HashSet<ulong>();
            while (keySet.Count < KeyCount)
                keySet.Add((ulong)random.NextInt64(1, long.MaxValue));
            _keys = keySet.ToArray();

            _values = new ulong[KeyCount];
            for (int i = 0; i < KeyCount; i++)
                _values[i] = (ulong)random.NextInt64(1, long.MaxValue);

            int lookupCount = Math.Min(KeyCount, 10_000);
            _lookupKeys = new ulong[lookupCount];
            for (int i = 0; i < lookupCount; i++)
                _lookupKeys[i] = _keys[random.Next(KeyCount)];

            _dictionary = new Dictionary<ulong, ulong>(KeyCount);
            for (int i = 0; i < KeyCount; i++)
                _dictionary[_keys[i]] = _values[i];

            // Use array-based constructor
            _ptrHash = new PtrHashU64(_keys, PtrHashConfig.Default);
            _sentinelPtrHash = new SentinelPtrHashU64<ulong>(
                _keys,
                _values,
                ulong.MaxValue, // Sentinel value
                PtrHashConfig.Default);
            
            var singlePartConfig = PtrHashConfig.Default with { SinglePart = true };
            _sentinelPtrHashSinglePart = new SentinelPtrHashU64<ulong>(
                _keys,
                _values,
                ulong.MaxValue, // Sentinel value
                singlePartConfig);

            _indicesBuffer = new nuint[lookupCount];
            _valuesBuffer = new ulong[lookupCount];
            _valuesBuffer2 = new ulong[lookupCount];
            _foundBuffer = new bool[lookupCount];
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            _ptrHash.Dispose();
            _sentinelPtrHash.Dispose();
            _sentinelPtrHashSinglePart.Dispose();
        }

        [Benchmark(Baseline = true)]
        public ulong DictionaryLookup()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
                if (_dictionary.TryGetValue(key, out var v))
                    sum += v;
            return sum;
        }

        [Benchmark]
        public ulong PtrHashPointLookup()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                var index = _ptrHash.GetIndex(key);
                sum += _values[index];
            }
            return sum;
        }

        [Benchmark]
        public ulong PtrHashStreamLookup()
        {
            ulong sum = 0;
            _ptrHash.GetIndicesStream(_lookupKeys.AsSpan(), _indicesBuffer, prefetchDistance: 32, minimal: true);
            for (int i = 0; i < _indicesBuffer.Length; i++)
                sum += _values[_indicesBuffer[i]];
            return sum;
        }

        [Benchmark]
        public ulong SentinelPtrHashStreamLookup()
        {
            ulong sum = 0;
            _sentinelPtrHash.TryGetValueStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer,
                prefetchDistance: 32);

            for (int i = 0; i < _valuesBuffer.Length; i++)
            {
                ulong v = _valuesBuffer[i];
                if (v != _sentinelPtrHash.Sentinel)
                    sum += v;
            }
 
            return sum;
        }

        [Benchmark]
        public ulong SentinelPtrHashSinglePartStreamLookup()
        {
            ulong sum = 0;
            _sentinelPtrHashSinglePart.TryGetValueStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer2,
                prefetchDistance: 32);

            for (int i = 0; i < _valuesBuffer2.Length; i++)
            {
                ulong v = _valuesBuffer2[i];
                if (v != _sentinelPtrHashSinglePart.Sentinel)
                    sum += v;
            }
 
            return sum;
        }
    }
}
