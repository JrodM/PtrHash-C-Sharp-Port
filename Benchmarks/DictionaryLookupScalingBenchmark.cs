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

        [Params(1_000, 50_000, 100_000, 1_000_000, 10_000_000)]
        public int LookupCount { get; set; }

        private ulong[] _keys = null!;
        private ulong[] _values = null!;
        private ulong[] _lookupKeys = null!;
        private Dictionary<ulong, ulong> _dictionary = null!;
        
        // Native interop dictionaries
        private PtrHashInteropDictionary<ulong, ulong> _nativeMultiPartInterop = null!;
        private PtrHashInteropDictionary<ulong, ulong> _nativeSinglePartInterop = null!;
        
        // C# port dictionaries
        private PtrHashDictionaryU64<ulong> _multiPartPtrHashDict = null!;
        private PtrHashDictionaryU64<ulong> _singlePartPtrHashDict = null!;
        private PtrHashDictionaryU64<ulong> _singlePartU64PtrHashDict = null!;
        
        private ulong[] _valuesBuffer1 = null!;
        private ulong[] _valuesBuffer2 = null!;
        private ulong[] _valuesBuffer3 = null!;
        private ulong[] _valuesBuffer4 = null!;
        private ulong[] _valuesBuffer5 = null!;

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

            // Native interop dictionaries - multi-part (default fast)
            _nativeMultiPartInterop = new PtrHashInteropDictionary<ulong, ulong>(
                _keys,
                _values,
                ulong.MaxValue,
                PtrHashNative.FFIParams.Fast);
            
            // Native interop dictionaries - single-part
            var singlePartNativeParams = PtrHashNative.FFIParams.FastWithOverrides(singlePart: true);
            _nativeSinglePartInterop = new PtrHashInteropDictionary<ulong, ulong>(
                _keys,
                _values,
                ulong.MaxValue,
                singlePartNativeParams);
            
            // Multi-part C# port dictionary
            _multiPartPtrHashDict = new PtrHashDictionaryU64<ulong>(_keys, _values, ulong.MaxValue, PtrHashParams.DefaultFast);
            
            // Single-part C# port dictionary (U32 storage)
            var singlePartPortParams = PtrHashParams.DefaultFast with { SinglePart = true };
            _singlePartPtrHashDict = new PtrHashDictionaryU64<ulong>(_keys, _values, ulong.MaxValue, singlePartPortParams);
            
            // Single-part C# port dictionary (U64 storage)
            var singlePartU64Params = PtrHashParams.DefaultFast with { SinglePart = true, StorageType = RemappingStorageType.VecU64 };
            _singlePartU64PtrHashDict = new PtrHashDictionaryU64<ulong>(_keys, _values, ulong.MaxValue, singlePartU64Params);

            _valuesBuffer1 = new ulong[LookupCount];
            _valuesBuffer2 = new ulong[LookupCount];
            _valuesBuffer3 = new ulong[LookupCount];
            _valuesBuffer4 = new ulong[LookupCount];
            _valuesBuffer5 = new ulong[LookupCount];
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            _nativeMultiPartInterop?.Dispose();
            _nativeSinglePartInterop?.Dispose();
            _multiPartPtrHashDict?.Dispose();
            _singlePartPtrHashDict?.Dispose();
            _singlePartU64PtrHashDict?.Dispose();
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
                if (_multiPartPtrHashDict.TryGetValue(key, out var value))
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
                if (_singlePartPtrHashDict.TryGetValue(key, out var value))
                    sum += value;
            }
            return sum;
        }

        // Stream Lookups
        [Benchmark]
        public ulong NativeMultiPartInterop_StreamLookup()
        {
            ulong sum = 0;
            _nativeMultiPartInterop.TryGetValueStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer1.AsSpan());

            for (int i = 0; i < _valuesBuffer1.Length; i++)
            {
                ulong v = _valuesBuffer1[i];
                if (v != _nativeMultiPartInterop.Sentinel)
                    sum += v;
            }
            return sum;
        }

        [Benchmark]
        public ulong NativeSinglePartInterop_StreamLookup()
        {
            ulong sum = 0;
            _nativeSinglePartInterop.TryGetValueStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer2.AsSpan());

            for (int i = 0; i < _valuesBuffer2.Length; i++)
            {
                ulong v = _valuesBuffer2[i];
                if (v != _nativeSinglePartInterop.Sentinel)
                    sum += v;
            }
            return sum;
        }

        [Benchmark]
        public ulong MultiPartDict_StreamLookup()
        {
            ulong sum = 0;
            _multiPartPtrHashDict.TryGetValueStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer3);

            for (int i = 0; i < _valuesBuffer3.Length; i++)
            {
                ulong v = _valuesBuffer3[i];
                if (v != _multiPartPtrHashDict.Sentinel)
                    sum += v;
            }
            return sum;
        }

        [Benchmark]
        public ulong SinglePartDict_StreamLookup()
        {
            ulong sum = 0;
            _singlePartPtrHashDict.TryGetValueStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer4);

            for (int i = 0; i < _valuesBuffer4.Length; i++)
            {
                ulong v = _valuesBuffer4[i];
                if (v != _singlePartPtrHashDict.Sentinel)
                    sum += v;
            }
            return sum;
        }

        [Benchmark]
        public ulong SinglePartU64Dict_StreamLookup()
        {
            ulong sum = 0;
            _singlePartU64PtrHashDict.TryGetValueStream(
                _lookupKeys.AsSpan(),
                _valuesBuffer5);

            for (int i = 0; i < _valuesBuffer5.Length; i++)
            {
                ulong v = _valuesBuffer5[i];
                if (v != _singlePartU64PtrHashDict.Sentinel)
                    sum += v;
            }
            return sum;
        }

    }
}