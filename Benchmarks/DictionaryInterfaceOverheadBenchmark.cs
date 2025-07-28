using System;
using System.Collections.Generic;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;

namespace PtrHash.Benchmarks
{
    // Sealed derived dictionary with no overrides - tests if sealing eliminates callvirt
    public sealed class SealedDictionary<TKey, TValue> : Dictionary<TKey, TValue>
        where TKey : notnull
    {
        public SealedDictionary() : base() { }
        public SealedDictionary(int capacity) : base(capacity) { }
        
        // No method overrides - inherits all Dictionary behavior
    }

    [Config(typeof(Config))]
    [MemoryDiagnoser]
    [SimpleJob(RuntimeMoniker.Net80)]
    public class DictionaryInterfaceOverheadBenchmark
    {
        private class Config : ManualConfig
        {
            public Config()
            {
            }
        }

        private const int KEY_COUNT = 2_000_000;
        
        [Params(100, 1_000, 10_000, 100_000)]
        public int LookupCount { get; set; }

        private ulong[] _keys = null!;
        private ulong[] _values = null!;
        private ulong[] _lookupKeys = null!;
        
        // Concrete Dictionary - direct method calls, no dispatch overhead
        private Dictionary<ulong, ulong> _concreteDictionary = null!;
        
        // Sealed derived dictionary - tests if sealing eliminates callvirt
        private SealedDictionary<ulong, ulong> _sealedDictionary = null!;
        
        // IDictionary interface - interface dispatch overhead
        private IDictionary<ulong, ulong> _interfaceDictionary = null!;
        
        // IReadOnlyDictionary interface - interface dispatch overhead (read-only)
        private IReadOnlyDictionary<ulong, ulong> _readOnlyInterfaceDictionary = null!;

        [GlobalSetup]
        public void Setup()
        {
            var random = new Random(42);
            var keySet = new HashSet<ulong>();
            while (keySet.Count < KEY_COUNT)
                keySet.Add((ulong)random.NextInt64(1, long.MaxValue));
            _keys = keySet.ToArray();

            _values = new ulong[KEY_COUNT];
            for (int i = 0; i < KEY_COUNT; i++)
                _values[i] = (ulong)random.NextInt64(1, long.MaxValue);

            _lookupKeys = new ulong[LookupCount];
            // 50% keys in set, 50% keys not in set
            var hitCount = LookupCount / 2;
            
            // First half: keys that ARE in the set (hits)
            for (int i = 0; i < hitCount; i++)
                _lookupKeys[i] = _keys[random.Next(KEY_COUNT)];
            
            // Second half: keys that are NOT in the set (misses)
            var missKeySet = new HashSet<ulong>(_keys);
            for (int i = hitCount; i < LookupCount; i++)
            {
                ulong missKey;
                do
                {
                    missKey = (ulong)random.NextInt64(1, long.MaxValue);
                } while (missKeySet.Contains(missKey));
                _lookupKeys[i] = missKey;
            }
            
            // Shuffle the lookup keys to mix hits and misses
            for (int i = LookupCount - 1; i > 0; i--)
            {
                int j = random.Next(i + 1);
                (_lookupKeys[i], _lookupKeys[j]) = (_lookupKeys[j], _lookupKeys[i]);
            }

            // Create separate dictionary instances for better type isolation
            var concreteDictionary = new Dictionary<ulong, ulong>(KEY_COUNT);
            var sealedDictionary = new SealedDictionary<ulong, ulong>(KEY_COUNT);
            var interfaceDictionary = new Dictionary<ulong, ulong>(KEY_COUNT);
            var readOnlyInterfaceDictionary = new Dictionary<ulong, ulong>(KEY_COUNT);
            
            // Populate all dictionaries with identical data
            for (int i = 0; i < KEY_COUNT; i++)
            {
                concreteDictionary[_keys[i]] = _values[i];
                sealedDictionary[_keys[i]] = _values[i];
                interfaceDictionary[_keys[i]] = _values[i];
                readOnlyInterfaceDictionary[_keys[i]] = _values[i];
            }
                
            // Assign to fields - separate instances, no shared references
            _concreteDictionary = concreteDictionary;
            _sealedDictionary = sealedDictionary;
            _interfaceDictionary = interfaceDictionary;  // Different instance, interface reference
            _readOnlyInterfaceDictionary = readOnlyInterfaceDictionary;  // Different instance, read-only interface reference
        }

        [Benchmark(Baseline = true)]
        public ulong ConcreteDictionary_TryGetValue()
        {
            ulong sum = 0;
            for (int i = 0; i < LookupCount; i++)
            {
                var key = _lookupKeys[i];
                if (_concreteDictionary.TryGetValue(key, out var value))
                    sum += value;
            }
            return sum;
        }

        [Benchmark]
        public ulong SealedDictionary_TryGetValue()
        {
            ulong sum = 0;
            for (int i = 0; i < LookupCount; i++)
            {
                var key = _lookupKeys[i];
                if (_sealedDictionary.TryGetValue(key, out var value))
                    sum += value;
            }
            return sum;
        }

        [Benchmark]
        public ulong IDictionary_TryGetValue()
        {
            ulong sum = 0;
            for (int i = 0; i < LookupCount; i++)
            {
                var key = _lookupKeys[i];
                if (_interfaceDictionary.TryGetValue(key, out var value))
                    sum += value;
            }
            return sum;
        }

        [Benchmark]
        public ulong IReadOnlyDictionary_TryGetValue()
        {
            ulong sum = 0;
            for (int i = 0; i < LookupCount; i++)
            {
                var key = _lookupKeys[i];
                if (_readOnlyInterfaceDictionary.TryGetValue(key, out var value))
                    sum += value;
            }
            return sum;
        }
    }
}