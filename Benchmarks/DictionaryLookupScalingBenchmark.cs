using System;
using System.Collections.Generic;
using System.Linq;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
using PtrHash.CSharp.Interop.Core;
using PtrHash.CSharp.Interop.SentinelHashMap;
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Port.Core;

namespace PtrHash.Benchmarks
{
    [Config(typeof(Config))]
    [MemoryDiagnoser]
    [SimpleJob(RuntimeMoniker.Net80)]
    public class DictionaryLookupScalingBenchmark
    {
        private class Config : ManualConfig
        {
            public Config()
        {
        }
        }

        [Params(2_000_000)]
        public int KeyCount { get; set; }

        [Params(1_000, 10_000, 50_000, 100_000, 200_000)]
        public int LookupCount { get; set; }

        private ulong[] _keys = null!;
        private ulong[] _values = null!;
        private ulong[] _lookupKeys = null!;
        private Dictionary<ulong, ulong> _dictionary = null!;
        
        // Native interop dictionary
        private SentinelPtrHashU64<ulong> _nativeSentinelPtrHash = null!;
        
        // C# port dictionaries
        private PtrHashDictionaryU64<ulong> _multiPartPtrHashDict = null!;
        private PtrHashDictionaryU64<ulong> _singlePartPtrHashDict = null!;
        
        private ulong[] _valuesBuffer1 = null!;
        private ulong[] _valuesBuffer2 = null!;
        private ulong[] _valuesBuffer3 = null!;

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

            // Create lookup keys (can exceed key count for larger lookup tests)
            _lookupKeys = new ulong[LookupCount];
            for (int i = 0; i < LookupCount; i++)
                _lookupKeys[i] = _keys[random.Next(KeyCount)];

            // Standard Dictionary
            _dictionary = new Dictionary<ulong, ulong>(KeyCount);
            for (int i = 0; i < KeyCount; i++)
                _dictionary[_keys[i]] = _values[i];

            // Native interop dictionary
            _nativeSentinelPtrHash = new SentinelPtrHashU64<ulong>(
                _keys,
                _values,
                ulong.MaxValue,
                PtrHashConfig.Default);
            
            // Multi-part C# port dictionary
            _multiPartPtrHashDict = new PtrHashDictionaryU64<ulong>(_keys, _values, ulong.MaxValue, PtrHashParams.DefaultFast);
            
            // Single-part C# port dictionary
            var singlePartParams = PtrHashParams.DefaultFast with { SinglePart = true };
            _singlePartPtrHashDict = new PtrHashDictionaryU64<ulong>(_keys, _values, ulong.MaxValue, singlePartParams);

            _valuesBuffer1 = new ulong[LookupCount];
            _valuesBuffer2 = new ulong[LookupCount];
            _valuesBuffer3 = new ulong[LookupCount];
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            _nativeSentinelPtrHash?.Dispose();
            _multiPartPtrHashDict?.Dispose();
            _singlePartPtrHashDict?.Dispose();
        }

        // Point Lookups
        [Benchmark(Baseline = true)]
        public ulong Dictionary_PointLookup()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
                if (_dictionary.TryGetValue(key, out var v))
                    sum += v;
            return sum;
        }

        [Benchmark]
        public ulong MultiPartDict_PointLookup()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                var value = _multiPartPtrHashDict.GetValueOrSentinel(key);
                if (value != _multiPartPtrHashDict.Sentinel)
                    sum += value;
            }
            return sum;
        }

        [Benchmark]
        public ulong SinglePartDict_PointLookup()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                var value = _singlePartPtrHashDict.GetValueOrSentinel(key);
                if (value != _singlePartPtrHashDict.Sentinel)
                    sum += value;
            }
            return sum;
        }

        // Stream Lookups
        [Benchmark]
        public ulong NativeSentinel_StreamLookup()
        {
            ulong sum = 0;
            _nativeSentinelPtrHash.TryGetValueStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer1.AsSpan());

            for (int i = 0; i < _valuesBuffer1.Length; i++)
            {
                ulong v = _valuesBuffer1[i];
                if (v != _nativeSentinelPtrHash.Sentinel)
                    sum += v;
            }
            return sum;
        }

        [Benchmark]
        public ulong MultiPartDict_StreamLookup()
        {
            ulong sum = 0;
            _multiPartPtrHashDict.GetValuesStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer2);

            for (int i = 0; i < _valuesBuffer2.Length; i++)
            {
                ulong v = _valuesBuffer2[i];
                if (v != _multiPartPtrHashDict.Sentinel)
                    sum += v;
            }
            return sum;
        }

        [Benchmark]
        public ulong SinglePartDict_StreamLookup()
        {
            ulong sum = 0;
            _singlePartPtrHashDict.GetValuesStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer3);

            for (int i = 0; i < _valuesBuffer3.Length; i++)
            {
                ulong v = _valuesBuffer3[i];
                if (v != _singlePartPtrHashDict.Sentinel)
                    sum += v;
            }
            return sum;
        }

    }
}