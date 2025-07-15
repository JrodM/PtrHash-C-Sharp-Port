using System;
using System.Collections.Generic;
using System.Linq;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
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
    public class PtrHashVsDictionaryWithPortBenchmark
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
        
        // Native interop versions
        private PtrHashU64 _nativePtrHash = null!;
        private SentinelPtrHashU64<ulong> _nativeSentinelPtrHash = null!;
        private SentinelPtrHashU64<ulong> _nativeSentinelPtrHashSinglePart = null!;
        
        // C# port versions using FxHasher (default for interop)
        private global::PtrHash.CSharp.Port.Core.PtrHash<ulong, FxHasher> _portPtrHash = null!;
        private PtrHashMapU64<ulong> _portPtrHashMap = null!;
        private global::PtrHash.CSharp.Port.Core.PtrHash<ulong, FxHasher> _portPtrHashSinglePart = null!;
        private PtrHashMapU64<ulong> _portPtrHashMapSinglePart = null!;
        
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

            // Native interop versions (using FxHasher by default)
            _nativePtrHash = new PtrHashU64(_keys, PtrHashConfig.Default);
            _nativeSentinelPtrHash = new SentinelPtrHashU64<ulong>(
                _keys,
                _values,
                ulong.MaxValue,
                PtrHashConfig.Default);
            
            var singlePartConfig = PtrHashConfig.Default with { SinglePart = true };
            _nativeSentinelPtrHashSinglePart = new SentinelPtrHashU64<ulong>(
                _keys,
                _values,
                ulong.MaxValue,
                singlePartConfig);

            // C# port versions using FxHasher (to match interop default)
            _portPtrHash = new global::PtrHash.CSharp.Port.Core.PtrHash<ulong, FxHasher>(_keys, PtrHashParams.DefaultFast);
            _portPtrHashMap = new PtrHashMapU64<ulong>(_keys, _values, ulong.MaxValue, PtrHashParams.DefaultFast);
            
            var singlePartParams = PtrHashParams.DefaultFast with { SinglePart = true };
            _portPtrHashSinglePart = new global::PtrHash.CSharp.Port.Core.PtrHash<ulong, FxHasher>(_keys, singlePartParams);
            _portPtrHashMapSinglePart = new PtrHashMapU64<ulong>(_keys, _values, ulong.MaxValue, singlePartParams);

            _indicesBuffer = new nuint[lookupCount];
            _valuesBuffer = new ulong[lookupCount];
            _valuesBuffer2 = new ulong[lookupCount];
            _valuesBuffer3 = new ulong[lookupCount];
            _valuesBuffer4 = new ulong[lookupCount];
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            _nativePtrHash?.Dispose();
            _nativeSentinelPtrHash?.Dispose();
            _nativeSentinelPtrHashSinglePart?.Dispose();
            _portPtrHash?.Dispose();
            _portPtrHashMap?.Dispose();
            _portPtrHashSinglePart?.Dispose();
            _portPtrHashMapSinglePart?.Dispose();
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

        // Native interop benchmarks
        [Benchmark]
        public ulong NativePtrHashPointLookup()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                var index = _nativePtrHash.GetIndex(key);
                sum += _values[index];
            }
            return sum;
        }

        [Benchmark]
        public ulong NativePtrHashStreamLookup()
        {
            ulong sum = 0;
            _nativePtrHash.GetIndicesStream(_lookupKeys.AsSpan(), _indicesBuffer, prefetchDistance: 32, minimal: true);
            for (int i = 0; i < _indicesBuffer.Length; i++)
                sum += _values[_indicesBuffer[i]];
            return sum;
        }

        [Benchmark]
        public ulong NativeSentinelPtrHashStreamLookup()
        {
            ulong sum = 0;
            _nativeSentinelPtrHash.TryGetValueStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer,
                prefetchDistance: 32);

            for (int i = 0; i < _valuesBuffer.Length; i++)
            {
                ulong v = _valuesBuffer[i];
                if (v != _nativeSentinelPtrHash.Sentinel)
                    sum += v;
            }
            return sum;
        }

        [Benchmark]
        public ulong NativeSentinelPtrHashSinglePartStreamLookup()
        {
            ulong sum = 0;
            _nativeSentinelPtrHashSinglePart.TryGetValueStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer2,
                prefetchDistance: 32);

            for (int i = 0; i < _valuesBuffer2.Length; i++)
            {
                ulong v = _valuesBuffer2[i];
                if (v != _nativeSentinelPtrHashSinglePart.Sentinel)
                    sum += v;
            }
            return sum;
        }

        // C# port benchmarks
        [Benchmark]
        public ulong PortPtrHashPointLookup()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                var index = _portPtrHash.GetIndex(key);
                sum += _values[index];
            }
            return sum;
        }

        [Benchmark]
        public ulong PortPtrHashStreamLookup()
        {
            ulong sum = 0;
            _portPtrHash.GetIndicesStream(_lookupKeys.AsSpan(), _indicesBuffer, prefetchDistance: 32, minimal: true);
            for (int i = 0; i < _indicesBuffer.Length; i++)
                sum += _values[_indicesBuffer[i]];
            return sum;
        }

        [Benchmark]
        public ulong PortPtrHashMapPointLookup()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                var value = _portPtrHashMap.GetValueOrSentinel(key);
                if (value != _portPtrHashMap.Sentinel)
                    sum += value;
            }
            return sum;
        }

        [Benchmark]
        public ulong PortPtrHashMapStreamLookup()
        {
            ulong sum = 0;
            _portPtrHashMap.GetValuesStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer3,
                prefetchDistance: 32);

            for (int i = 0; i < _valuesBuffer3.Length; i++)
            {
                ulong v = _valuesBuffer3[i];
                if (v != _portPtrHashMap.Sentinel)
                    sum += v;
            }
            return sum;
        }

        [Benchmark]
        public ulong PortPtrHashMapSinglePartStreamLookup()
        {
            ulong sum = 0;
            _portPtrHashMapSinglePart.GetValuesStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer4,
                prefetchDistance: 32);

            for (int i = 0; i < _valuesBuffer4.Length; i++)
            {
                ulong v = _valuesBuffer4[i];
                if (v != _portPtrHashMapSinglePart.Sentinel)
                    sum += v;
            }
            return sum;
        }
    }
}