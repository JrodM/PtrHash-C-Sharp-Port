using System;
using System.Collections.Generic;
using System.Linq;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
using PtrHash.CSharp.Port;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.Collections;
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
       // [Params( 10_000)]
        public int LookupCount { get; set; }

        private ulong[] _keys = null!;
        private ulong[] _lookupKeys = null!;
        
        // Multi-part PtrHash
        private PtrHash<ulong, FxHasher> _multiPartPtrHash = null!;
        
        // Single-part PtrHash
        private PtrHash<ulong, FxHasher> _singlePartPtrHash = null!;
        
        
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
            _multiPartPtrHash = new PtrHash<ulong, FxHasher>(_keys, PtrHashParams.DefaultFast);
            
            // Single-part PtrHash
            var singlePartParams = PtrHashParams.DefaultFast with { SinglePart = true };
            _singlePartPtrHash = new PtrHash<ulong, FxHasher>(_keys, singlePartParams);

            
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
        public ulong Native_Stream()
        {
            ulong sum = 0;
            _nativePtrHash.GetIndicesStream(
                _lookupKeys.AsSpan(),
                _indicesBuffer3.AsSpan());

            return sum;
        }

        // Point Lookups - GetIndex (with remapping)

        [Benchmark]
        public ulong MultiPart_GetIndex_Point_Branching()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                _multiPartPtrHash.GetIndex(key);
            }
            return sum;
        }

        [Benchmark]
        public ulong SinglePart_Point_Lookup_Branching()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
              _singlePartPtrHash.GetIndex(key);
            }
            return sum;
        }

        // Stream Lookups - GetIndicesStream

        [Benchmark]
        public ulong MultiPart_Stream_Branching()
        {
            ulong sum = 0;
            _multiPartPtrHash.GetIndicesStream(
                _lookupKeys.AsSpan(),
                _indicesBuffer1,
                minimal: true);

            return sum;
        }

        [Benchmark]
        public ulong SinglePart_Stream_Branching()
        {
            ulong sum = 0;
            _singlePartPtrHash.GetIndicesStream(
                _lookupKeys.AsSpan(),
                _indicesBuffer2,
                minimal: true);
                
            return sum;
        }

    }
}