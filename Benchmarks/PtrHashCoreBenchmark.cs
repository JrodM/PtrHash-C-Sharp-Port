using System;
using System.Collections.Generic;
using System.Linq;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
using PtrHash.CSharp.Port;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.BucketFunctions;
using PtrHash.CSharp.Port.Storage;
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Interop.PtrHash;
using PtrHash.CSharp.Interop.Native;
using PtrHash.CSharp.Interop.PtrHash.Dispatchers;

namespace PtrHash.Benchmarks
{
    [Config(typeof(Config))]
    [MemoryDiagnoser]
    [SimpleJob(RuntimeMoniker.Net80, baseline: true)]
    [SimpleJob(RuntimeMoniker.NativeAot80)]
    public class PtrHashCoreBenchmark
    {
        private class Config : ManualConfig
        {
            public Config()
            {
                // Add configuration for better benchmarking
                WithOption(ConfigOptions.JoinSummary, true);
            }
        }

        [Params(5_000_000)]
        public int KeyCount { get; set; }

        [Params(1_000, 100_000, 1_000_000)]
       // [Params( 10_000)]
        public int LookupCount { get; set; }

        private ulong[] _keys = null!;
        private ulong[] _lookupKeys = null!;
        
        // Multi-part PtrHash
        private PtrHash<ulong, FxHasher, Linear, UInt32VectorRemappingStorage> _multiPartPtrHash = null!;
        
        // Single-part PtrHash
        private PtrHash<ulong, FxHasher, Linear, UInt32VectorRemappingStorage> _singlePartPtrHash = null!;
        
        
        // Native interop - multi-part
        private PtrHash.CSharp.Interop.PtrHash.PtrHashInterop<ulong, ULongDispatcher> _nativeMultiPartPtrHash = null!;
        
        // Native interop - single-part
        private PtrHash.CSharp.Interop.PtrHash.PtrHashInterop<ulong, ULongDispatcher> _nativeSinglePartPtrHash = null!;
        
        private nuint[] _indicesBuffer1 = null!;
        private nuint[] _indicesBuffer2 = null!;
        private nuint[] _indicesBuffer3 = null!;
        private nuint[] _indicesBuffer4 = null!;
        private nuint[] _indicesBuffer5 = null!;

        [GlobalSetup]
        public void Setup()
        {
            var random = new Random(42);
            var keySet = new HashSet<ulong>();
            while (keySet.Count < KeyCount)
                keySet.Add((ulong)random.NextInt64(1, long.MaxValue));
            _keys = keySet.ToArray();

            // Ensure lookup count doesn't exceed key count
            var actualLookupCount = Math.Min(LookupCount, KeyCount);
            
            _lookupKeys = new ulong[actualLookupCount];
            for (int i = 0; i < actualLookupCount; i++)
            {
                if (i < actualLookupCount / 2)
                    _lookupKeys[i] = _keys[random.Next(KeyCount)]; // 50% hits
                else
                    _lookupKeys[i] = (ulong)random.NextInt64(long.MaxValue / 2, long.MaxValue); // 50% misses
            }

            // Multi-part PtrHash (default)
            _multiPartPtrHash = new PtrHash<ulong, FxHasher, Linear, UInt32VectorRemappingStorage>(_keys, PtrHashParams.DefaultFast);
            
            // Single-part PtrHash
            var singlePartParams = PtrHashParams.DefaultFast with { SinglePart = true };
            _singlePartPtrHash = new PtrHash<ulong, FxHasher, Linear, UInt32VectorRemappingStorage>(_keys, singlePartParams);

            
            // Native interop - multi-part
            _nativeMultiPartPtrHash = new PtrHash.CSharp.Interop.PtrHash.PtrHashInterop<ulong, ULongDispatcher>(_keys, PtrHashNative.FFIParams.Fast);
            
            // Native interop - single-part
            var singlePartNativeParams = PtrHashNative.FFIParams.Fast with { OverrideSinglePart = true };
            _nativeSinglePartPtrHash = new PtrHash.CSharp.Interop.PtrHash.PtrHashInterop<ulong, ULongDispatcher>(_keys, singlePartNativeParams);

            _indicesBuffer1 = new nuint[actualLookupCount];
            _indicesBuffer2 = new nuint[actualLookupCount];
            _indicesBuffer3 = new nuint[actualLookupCount];
            _indicesBuffer4 = new nuint[actualLookupCount];
            _indicesBuffer5 = new nuint[actualLookupCount];
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            _multiPartPtrHash?.Dispose();
            _singlePartPtrHash?.Dispose();
            _nativeMultiPartPtrHash?.Dispose();
            _nativeSinglePartPtrHash?.Dispose();
        }

        // === MULTI-PART COMPARISONS ===
        
        // Multi-Part: Native vs Port Point Lookups
        [Benchmark(Baseline = true)]
        public ulong MultiPart_Native_Point()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                sum += _nativeMultiPartPtrHash.GetIndex(key);
            }
            return sum;
        }

        [Benchmark]
        public ulong MultiPart_Port_Point()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                sum += _multiPartPtrHash.GetIndexNoRemap(key);
            }
            return sum;
        }

        // Multi-Part: Native vs Port Stream Lookups
        [Benchmark]
        public ulong MultiPart_Native_Stream()
        {
            ulong sum = 0;
            _nativeMultiPartPtrHash.GetIndicesStream(
                _lookupKeys.AsSpan(),
                _indicesBuffer3.AsSpan(),
                prefetchDistance: 32,
                minimal: true);

            for (int i = 0; i < _indicesBuffer3.Length; i++)
            {
                sum += _indicesBuffer3[i];
            }
            return sum;
        }

        [Benchmark]
        public ulong MultiPart_Port_Stream()
        {
            ulong sum = 0;
            _multiPartPtrHash.GetIndicesStream(
                _lookupKeys.AsSpan(),
                _indicesBuffer1,
                minimal: true);

            for (int i = 0; i < _indicesBuffer1.Length; i++)
            {
                sum += _indicesBuffer1[i];
            }
            return sum;
        }

        [Benchmark]
        public ulong MultiPart_Port_StreamPrefetch()
        {
            ulong sum = 0;
            _multiPartPtrHash.GetIndicesStreamPrefetch(
                _lookupKeys.AsSpan(),
                _indicesBuffer1,
                minimal: true);

            for (int i = 0; i < _indicesBuffer1.Length; i++)
            {
                sum += _indicesBuffer1[i];
            }
            return sum;
        }

        // === SINGLE-PART COMPARISONS ===
        
        // Single-Part: Native vs Port Point Lookups
        [Benchmark]
        public ulong SinglePart_Native_Point()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                sum += _nativeSinglePartPtrHash.GetIndex(key);
            }
            return sum;
        }

        [Benchmark]
        public ulong SinglePart_Port_Point()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                sum += _singlePartPtrHash.GetIndexNoRemap(key);
            }
            return sum;
        }

        // Single-Part: Native vs Port Stream Lookups
        [Benchmark]
        public ulong SinglePart_Native_Stream()
        {
            ulong sum = 0;
            _nativeSinglePartPtrHash.GetIndicesStream(
                _lookupKeys.AsSpan(),
                _indicesBuffer4.AsSpan(),
                prefetchDistance: 32,
                minimal: true);

            for (int i = 0; i < _indicesBuffer4.Length; i++)
            {
                sum += _indicesBuffer4[i];
            }
            return sum;
        }

        [Benchmark]
        public ulong SinglePart_Port_Stream()
        {
            ulong sum = 0;
            _singlePartPtrHash.GetIndicesStream(
                _lookupKeys.AsSpan(),
                _indicesBuffer2,
                minimal: true);

            for (int i = 0; i < _indicesBuffer2.Length; i++)
            {
                sum += _indicesBuffer2[i];
            }
            return sum;
        }

        [Benchmark]
        public ulong SinglePart_Port_StreamPrefetch()
        {
            ulong sum = 0;
            _singlePartPtrHash.GetIndicesStreamPrefetch(
                _lookupKeys.AsSpan(),
                _indicesBuffer2,
                minimal: true);

            for (int i = 0; i < _indicesBuffer2.Length; i++)
            {
                sum += _indicesBuffer2[i];
            }
            return sum;
        }

    }
}