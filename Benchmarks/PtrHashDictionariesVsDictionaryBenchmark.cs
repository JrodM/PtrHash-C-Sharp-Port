using System;
using System.Collections.Generic;
using System.Linq;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
using PtrHash.CSharp.Interop.InteropDictionary;
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Port;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Interop.Native;
using PtrHash.CSharp.Interop.PtrHash.Dispatchers;

namespace PtrHash.Benchmarks
{
    [Config(typeof(Config))]
    [MemoryDiagnoser]
    [SimpleJob(RuntimeMoniker.Net80)]
    public class PtrHashDictionariesVsDictionaryBenchmark
    {
        private class Config : ManualConfig
        {
            public Config()
            {
            }
        }

        [Params(1_000, 10_000, 100_000, 1_000_000, 10_000_000)]
        public int KeyCount { get; set; }

        private ulong[] _keys = null!;
        private ulong[] _values = null!;
        private ulong[] _lookupKeys = null!;
        private Dictionary<ulong, ulong> _dictionary = null!;
        
        // Native interop dictionary
        private PtrHashInteropDictionary<ulong, ulong, ULongDispatcher> _nativeSentinelPtrHash = null!;
        
        // C# port dictionary
        private PtrHashDictionaryU64<ulong> _portPtrHashMap = null!;
        
        // Single part dictionaries for comparison
        private PtrHashDictionaryU64<ulong> _singlePartPtrHashMap = null!;
        
        private ulong[] _valuesBuffer = null!;
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

            int lookupCount = Math.Min(KeyCount, 10_000);
            
            _lookupKeys = new ulong[lookupCount];
            for (int i = 0; i < lookupCount; i++)
                _lookupKeys[i] = _keys[random.Next(KeyCount)];

            // Dictionary
            _dictionary = new Dictionary<ulong, ulong>(KeyCount);
            for (int i = 0; i < KeyCount; i++)
                _dictionary[_keys[i]] = _values[i];

            // Native interop dictionary
            _nativeSentinelPtrHash = new PtrHashInteropDictionary<ulong, ulong, ULongDispatcher>(
                _keys,
                _values,
                ulong.MaxValue,
                PtrHashNative.FFIParams.Fast);
            
            // C# port dictionary (multi-part)
            _portPtrHashMap = new PtrHashDictionaryU64<ulong>(_keys, _values, ulong.MaxValue, PtrHashParams.DefaultFast);
            
            // Single part dictionary
            var singlePartParams = PtrHashParams.DefaultFast with { SinglePart = true };
            _singlePartPtrHashMap = new PtrHashDictionaryU64<ulong>(_keys, _values, ulong.MaxValue, singlePartParams);

            _valuesBuffer = new ulong[lookupCount];
            _valuesBuffer2 = new ulong[lookupCount];
            _valuesBuffer3 = new ulong[lookupCount];
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            _nativeSentinelPtrHash?.Dispose();
            _portPtrHashMap?.Dispose();
            _singlePartPtrHashMap?.Dispose();
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
        public ulong NativeSentinelPtrHashStreamLookup()
        {
            ulong sum = 0;
            _nativeSentinelPtrHash.TryGetValueStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer.AsSpan());

            for (int i = 0; i < _valuesBuffer.Length; i++)
            {
                ulong v = _valuesBuffer[i];
                if (v != _nativeSentinelPtrHash.Sentinel)
                    sum += v;
            }
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
            _portPtrHashMap.TryGetValueStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer2);

            for (int i = 0; i < _valuesBuffer2.Length; i++)
            {
                ulong v = _valuesBuffer2[i];
                if (v != _portPtrHashMap.Sentinel)
                    sum += v;
            }
            return sum;
        }
        
        [Benchmark]
        public ulong SinglePartPtrHashMapPointLookup()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                var value = _singlePartPtrHashMap.GetValueOrSentinel(key);
                if (value != _singlePartPtrHashMap.Sentinel)
                    sum += value;
            }
            return sum;
        }

        [Benchmark]
        public ulong SinglePartPtrHashMapStreamLookup()
        {
            ulong sum = 0;
            _singlePartPtrHashMap.TryGetValueStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer3);

            for (int i = 0; i < _valuesBuffer3.Length; i++)
            {
                ulong v = _valuesBuffer3[i];
                if (v != _singlePartPtrHashMap.Sentinel)
                    sum += v;
            }
            return sum;
        }

    }
}