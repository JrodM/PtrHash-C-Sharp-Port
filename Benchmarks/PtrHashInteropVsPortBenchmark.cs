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
    public class PtrHashInteropVsPortBenchmark
    {
        private class Config : ManualConfig
        {
            public Config()
            {
            }
        }

        [Params(1_000, 10_000, 100_000, 1_000_000, 10_000_000, 100_000_000)]
        public int KeyCount { get; set; }

        private ulong[] _keys = null!;
        private ulong[] _values = null!;
        private ulong[] _lookupKeys = null!;
        
        // Native interop versions
        private PtrHashU64 _nativePtrHash = null!;
        
        // C# port versions using FxHasher (default for interop)
        private global::PtrHash.CSharp.Port.Core.PtrHash<ulong, FxHasher> _portPtrHash = null!;
        
        private nuint[] _indicesBuffer = null!;

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

            // Native interop versions (using FxHasher by default)
            _nativePtrHash = new PtrHashU64(_keys, PtrHashConfig.Default);

            // C# port versions using FxHasher (to match interop default)
            _portPtrHash = new global::PtrHash.CSharp.Port.Core.PtrHash<ulong, FxHasher>(_keys, PtrHashParams.DefaultFast);

            _indicesBuffer = new nuint[lookupCount];
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            _nativePtrHash?.Dispose();
            _portPtrHash?.Dispose();
        }

        // Native interop benchmarks
        [Benchmark(Baseline = true)]
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
            _portPtrHash.GetIndicesStream(_lookupKeys.AsSpan(), _indicesBuffer, minimal: true);
            for (int i = 0; i < _indicesBuffer.Length; i++)
                sum += _values[_indicesBuffer[i]];
            return sum;
        }
    }
}