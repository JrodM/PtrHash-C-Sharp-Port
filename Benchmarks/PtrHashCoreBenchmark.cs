using System;
using System.Collections.Generic;
using System.Linq;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
using PtrHash.CSharp.Port;
using PtrHash.CSharp.Port.PtrHash;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Interop.Core;
using PtrHash.CSharp.Interop.PtrHash;
using PtrHash.CSharp.Interop.Native;

namespace PtrHash.Benchmarks
{
    [Config(typeof(Config))]
    [MemoryDiagnoser]
    [SimpleJob(RuntimeMoniker.Net80)]
    public class PtrHashCoreBenchmark
    {
        private class Config : ManualConfig
        {
            public Config()
            {
            }
        }

        [Params(5_000_000)]
        public int KeyCount { get; set; }
        
        [Params(1_000, 100_000, 1_000_000)]
        public int LookupCount { get; set; }

        private ulong[] _keys = null!;
        private ulong[] _lookupKeys = null!;
        
        // Multi-part PtrHash
        private PtrHash<ulong, StrongerIntHasher> _multiPartPtrHash = null!;
        
        // Single-part PtrHash
        private PtrHash<ulong, StrongerIntHasher> _singlePartPtrHash = null!;
        
        
        // Native interop (multi-part only)
        private PtrHashU64 _nativePtrHash = null!;
        
        private nuint[] _indicesBuffer1 = null!;
        private nuint[] _indicesBuffer2 = null!;
        private nuint[] _indicesBuffer3 = null!;

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
                _lookupKeys[i] = _keys[random.Next(KeyCount)];

            // Multi-part PtrHash (default)
            _multiPartPtrHash = new PtrHash<ulong, StrongerIntHasher>(_keys, PtrHashParams.DefaultFast);
            
            // Single-part PtrHash
            var singlePartParams = PtrHashParams.DefaultFast with { SinglePart = true };
            _singlePartPtrHash = new PtrHash<ulong, StrongerIntHasher>(_keys, singlePartParams);

            
            // Native interop (multi-part only)
            _nativePtrHash = new PtrHashU64(_keys, PtrHashNative.FFIParams.Fast);

            _indicesBuffer1 = new nuint[actualLookupCount];
            _indicesBuffer2 = new nuint[actualLookupCount];
            _indicesBuffer3 = new nuint[actualLookupCount];
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            _multiPartPtrHash?.Dispose();
            _singlePartPtrHash?.Dispose();
            _nativePtrHash?.Dispose();
        }

        // Native Interop Stream Baseline
        [Benchmark(Baseline = true)]
        public ulong Native_GetIndices_Stream()
        {
            ulong sum = 0;
            _nativePtrHash.GetIndicesStream(
                _lookupKeys.AsSpan(),
                _indicesBuffer3.AsSpan());

            for (int i = 0; i < _indicesBuffer3.Length; i++)
            {
                sum += _indicesBuffer3[i];
            }
            return sum;
        }

        // Point Lookups - GetIndex (with remapping)
        [Benchmark]
        public ulong MultiPart_GetIndex_Point()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                sum += _multiPartPtrHash.GetIndexMultiPart(key);
            }
            return sum;
        }

        [Benchmark]
        public ulong SinglePart_GetIndex_Point()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                sum += _singlePartPtrHash.GetIndexMultiPart(key);
            }
            return sum;
        }

        [Benchmark]
        public ulong MultiPart_GetIndex_Point_Optimal()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                sum += _multiPartPtrHash.GetIndex(key);
            }
            return sum;
        }

        [Benchmark]
        public ulong SinglePart_GetIndex_Point_Optimal()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                sum += _singlePartPtrHash.GetIndex(key);
            }
            return sum;
        }

        // Stream Lookups - GetIndicesStream
        [Benchmark]
        public ulong MultiPart_GetIndicesStream()
        {
            ulong sum = 0;
            _multiPartPtrHash.GetIndicesStreamMultiPart(
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
        public ulong SinglePart_GetIndicesStream()
        {
            ulong sum = 0;
            _singlePartPtrHash.GetIndicesStreamMultiPart(
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
        public ulong MultiPart_GetIndicesStream_Optimal()
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
        public ulong SinglePart_GetIndicesStream_Optimal()
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

        // Single-Part Specific Methods (should only run on single-part)
        [Benchmark]
        public ulong SinglePart_GetIndexSinglePart_Point()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                sum += _singlePartPtrHash.GetIndexSinglePart(key);
            }
            return sum;
        }

        [Benchmark]
        public ulong SinglePart_GetIndicesStreamSinglePart()
        {
            ulong sum = 0;
            _singlePartPtrHash.GetIndicesStreamSinglePart(
                _lookupKeys.AsSpan(),
                _indicesBuffer2,
                minimal: true);

            for (int i = 0; i < _indicesBuffer2.Length; i++)
            {
                sum += _indicesBuffer2[i];
            }
            return sum;
        }

        // Native Interop Point Lookup
        [Benchmark]
        public ulong Native_GetIndex_Point()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                sum += _nativePtrHash.GetIndex(key);
            }
            return sum;
        }

    }
}