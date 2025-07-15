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
    public class PortOnlyBenchmark
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
        
        // C# port versions using FxHasher (default for interop compatibility)
        private PtrHash<ulong, FxHasher> _portPtrHashFx = null!;
        private PtrHashMapU64<ulong> _portPtrHashMapFx = null!;
        private PtrHash<ulong, FxHasher> _portPtrHashFxSinglePart = null!;
        private PtrHashMapU64<ulong> _portPtrHashMapFxSinglePart = null!;
        
        // C# port versions using StrongerIntHasher
        private PtrHash<ulong, StrongerIntHasher> _portPtrHashStrong = null!;
        private PtrHashMap<ulong, ulong, StrongerIntHasher> _portPtrHashMapStrong = null!;
        
        private nuint[] _indicesBuffer = null!;
        private ulong[] _valuesBuffer = null!;
        private ulong[] _valuesBuffer2 = null!;
        private ulong[] _valuesBuffer3 = null!;
        private ulong[] _valuesBuffer4 = null!;

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

            // Dictionary
            _dictionary = new Dictionary<ulong, ulong>(KeyCount);
            for (int i = 0; i < KeyCount; i++)
                _dictionary[_keys[i]] = _values[i];

            // C# port versions using FxHasher (to match interop default)
            _portPtrHashFx = new PtrHash<ulong, FxHasher>(_keys, PtrHashParams.DefaultFast);
            _portPtrHashMapFx = new PtrHashMapU64<ulong>(_keys, _values, ulong.MaxValue, PtrHashParams.DefaultFast);
            
            var singlePartParams = PtrHashParams.DefaultFast with { SinglePart = true };
            _portPtrHashFxSinglePart = new PtrHash<ulong, FxHasher>(_keys, singlePartParams);
            _portPtrHashMapFxSinglePart = new PtrHashMapU64<ulong>(_keys, _values, ulong.MaxValue, singlePartParams);

            // C# port versions using StrongerIntHasher
            _portPtrHashStrong = new PtrHash<ulong, StrongerIntHasher>(_keys, PtrHashParams.DefaultFast);
            _portPtrHashMapStrong = new PtrHashMap<ulong, ulong, StrongerIntHasher>(_keys, _values, ulong.MaxValue, PtrHashParams.DefaultFast);

            _indicesBuffer = new nuint[lookupCount];
            _valuesBuffer = new ulong[lookupCount];
            _valuesBuffer2 = new ulong[lookupCount];
            _valuesBuffer3 = new ulong[lookupCount];
            _valuesBuffer4 = new ulong[lookupCount];
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            _portPtrHashFx?.Dispose();
            _portPtrHashMapFx?.Dispose();
            _portPtrHashFxSinglePart?.Dispose();
            _portPtrHashMapFxSinglePart?.Dispose();
            _portPtrHashStrong?.Dispose();
            _portPtrHashMapStrong?.Dispose();
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

        // C# port benchmarks with FxHasher
        [Benchmark]
        public ulong PortPtrHashFxPointLookup()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                var index = _portPtrHashFx.GetIndex(key);
                sum += _values[index];
            }
            return sum;
        }

        [Benchmark]
        public ulong PortPtrHashFxStreamLookup()
        {
            ulong sum = 0;
            _portPtrHashFx.GetIndicesStream(_lookupKeys.AsSpan(), _indicesBuffer, prefetchDistance: 32, minimal: true);
            for (int i = 0; i < _indicesBuffer.Length; i++)
                sum += _values[_indicesBuffer[i]];
            return sum;
        }

        [Benchmark]
        public ulong PortPtrHashMapFxPointLookup()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                var value = _portPtrHashMapFx.GetValueOrSentinel(key);
                if (value != _portPtrHashMapFx.Sentinel)
                    sum += value;
            }
            return sum;
        }

        [Benchmark]
        public ulong PortPtrHashMapFxStreamLookup()
        {
            ulong sum = 0;
            _portPtrHashMapFx.GetValuesStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer,
                prefetchDistance: 32);

            for (int i = 0; i < _valuesBuffer.Length; i++)
            {
                ulong v = _valuesBuffer[i];
                if (v != _portPtrHashMapFx.Sentinel)
                    sum += v;
            }
            return sum;
        }

        [Benchmark]
        public ulong PortPtrHashMapFxSinglePartStreamLookup()
        {
            ulong sum = 0;
            _portPtrHashMapFxSinglePart.GetValuesStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer2,
                prefetchDistance: 32);

            for (int i = 0; i < _valuesBuffer2.Length; i++)
            {
                ulong v = _valuesBuffer2[i];
                if (v != _portPtrHashMapFxSinglePart.Sentinel)
                    sum += v;
            }
            return sum;
        }

        // C# port benchmarks with StrongerIntHasher
        [Benchmark]
        public ulong PortPtrHashStrongPointLookup()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                var index = _portPtrHashStrong.GetIndex(key);
                sum += _values[index];
            }
            return sum;
        }

        [Benchmark]
        public ulong PortPtrHashStrongStreamLookup()
        {
            ulong sum = 0;
            _portPtrHashStrong.GetIndicesStream(_lookupKeys.AsSpan(), _indicesBuffer, prefetchDistance: 32, minimal: true);
            for (int i = 0; i < _indicesBuffer.Length; i++)
                sum += _values[_indicesBuffer[i]];
            return sum;
        }

        [Benchmark]
        public ulong PortPtrHashMapStrongPointLookup()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                var value = _portPtrHashMapStrong.GetValueOrSentinel(key);
                if (value != _portPtrHashMapStrong.Sentinel)
                    sum += value;
            }
            return sum;
        }

        [Benchmark]
        public ulong PortPtrHashMapStrongStreamLookup()
        {
            ulong sum = 0;
            _portPtrHashMapStrong.GetValuesStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer3,
                prefetchDistance: 32);

            for (int i = 0; i < _valuesBuffer3.Length; i++)
            {
                ulong v = _valuesBuffer3[i];
                if (v != _portPtrHashMapStrong.Sentinel)
                    sum += v;
            }
            return sum;
        }
    }
}