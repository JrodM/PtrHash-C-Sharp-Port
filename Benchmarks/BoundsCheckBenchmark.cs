using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Jobs;
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;

namespace PtrHash.Benchmarks
{
    [SimpleJob(RuntimeMoniker.Net80)]
    [MemoryDiagnoser]
    public class BoundsCheckBenchmark
    {
        private TestDictionary _dict;
        private ulong[] _lookupKeys;
        private const int NumKeys = 100_000;
        
        [GlobalSetup]
        public void Setup()
        {
            var random = new Random(42);
            var keys = new ulong[NumKeys];
            var values = new ulong[NumKeys];
            
            for (int i = 0; i < NumKeys; i++)
            {
                keys[i] = (ulong)random.NextInt64();
                values[i] = (ulong)i;
            }
            
            _dict = new TestDictionary(keys, values);
            
            // Create lookup keys (mix of existing and non-existing)
            _lookupKeys = new ulong[NumKeys];
            for (int i = 0; i < NumKeys; i++)
            {
                _lookupKeys[i] = i % 2 == 0 ? keys[i] : (ulong)random.NextInt64();
            }
        }
        
        [GlobalCleanup]
        public void Cleanup()
        {
            _dict?.Dispose();
        }
        
        [Benchmark(Baseline = true)]
        public ulong Original_JitBoundsCheck()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                sum += _dict.GetValueOriginal(key);
            }
            return sum;
        }
        
        [Benchmark]
        public ulong Optimized_ManualBoundsCheck()
        {
            ulong sum = 0;
            foreach (var key in _lookupKeys)
            {
                sum += _dict.GetValueOptimized(key);
            }
            return sum;
        }
    }
    
    public class TestDictionary : IDisposable
    {
        private readonly PtrHash<ulong, StrongerIntHasher> _ptrHash;
        private readonly KeyValuePair<ulong, ulong>[] _keyValuePairs;
        private readonly ulong _sentinel = ulong.MaxValue;
        private readonly IEqualityComparer<ulong> _keyComparer;
        
        public TestDictionary(ulong[] keys, ulong[] values)
        {
            _keyComparer = EqualityComparer<ulong>.Default;
            _ptrHash = new PtrHash<ulong, StrongerIntHasher>(keys, PtrHashParams.DefaultFast);
            var info = _ptrHash.GetInfo();
            int maxIndex = (int)info.MaxIndex;

            _keyValuePairs = new KeyValuePair<ulong, ulong>[maxIndex];

            // Initialize all slots with default values
            for (int i = 0; i < maxIndex; i++)
            {
                _keyValuePairs[i] = new KeyValuePair<ulong, ulong>(0UL, _sentinel);
            }

            // Map keys to their hash indices and store key-value pairs
            for (int i = 0; i < keys.Length; i++)
            {
                int idx = (int)_ptrHash.GetIndex(keys[i]);
                _keyValuePairs[idx] = new KeyValuePair<ulong, ulong>(keys[i], values[i]);
            }
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong GetValueOriginal(ulong key)
        {
            var idx = (int)_ptrHash.GetIndex(key);
            
            if (idx >= 0 && idx < _keyValuePairs.Length)
            {
                ref var kvp = ref _keyValuePairs[idx];
                if (_keyComparer.Equals(kvp.Key, key))
                {
                    return kvp.Value;
                }
            }
            
            return _sentinel;
        }
        
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong GetValueOptimized(ulong key)
        {
            var idx = (int)_ptrHash.GetIndex(key);
            
            // Single bounds check using uint trick
            if ((uint)idx < (uint)_keyValuePairs.Length)
            {
                ref var kvp = ref _keyValuePairs[idx];
                if (_keyComparer.Equals(kvp.Key, key))
                {
                    return kvp.Value;
                }
            }
            
            return _sentinel;
        }
        
        public void Dispose()
        {
            _ptrHash?.Dispose();
        }
    }
}