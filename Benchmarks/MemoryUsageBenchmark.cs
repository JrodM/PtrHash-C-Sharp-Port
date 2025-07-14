using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
using BenchmarkDotNet.Toolchains.InProcess.Emit;
using PtrHash.Core;
using PtrHash.PtrHash;
using PtrHash.SentinelHashMap;
using PtrHashImpl = PtrHash.PtrHash;

namespace PtrHash.Benchmarks
{
    [Config(typeof(Config))]
    [MemoryDiagnoser]
    [SimpleJob(RuntimeMoniker.Net80)]
    public class MemoryUsageBenchmark
    {
        private class Config : ManualConfig
        {
            public Config()
            {
                AddJob(Job.Default.WithToolchain(InProcessEmitToolchain.Instance));
            }
        }

        [Params(1_000, 100_000, 1_000_000)]
        public int KeyCount { get; set; }

        private ulong[] _keys = null!;
        private ulong[] _values = null!;

        [IterationSetup]
        public void Setup()
        {
            var random = new Random(42);
            
            // Generate unique random keys
            var keySet = new HashSet<ulong>();
            while (keySet.Count < KeyCount)
            {
                keySet.Add((ulong)random.NextInt64(1, long.MaxValue));
            }
            _keys = keySet.ToArray();
            
            // Generate random values
            _values = new ulong[KeyCount];
            for (int i = 0; i < KeyCount; i++)
            {
                _values[i] = (ulong)random.NextInt64(1, long.MaxValue);
            }

            // Force garbage collection before measurement
            GC.Collect();
            GC.WaitForPendingFinalizers();
            GC.Collect();
        }

        [Benchmark(Baseline = true)]
        public long DictionaryMemoryUsage()
        {
            var beforeMemory = GC.GetTotalMemory(false);
            
            var dictionary = new Dictionary<ulong, ulong>(KeyCount);
            for (int i = 0; i < KeyCount; i++)
            {
                dictionary[_keys[i]] = _values[i];
            }
            
            var afterMemory = GC.GetTotalMemory(false);
            
            // Keep dictionary alive for measurement
            GC.KeepAlive(dictionary);
            
            return afterMemory - beforeMemory;
        }

        [Benchmark]
        public long PtrHashMemoryUsage()
        {
            var beforeMemory = GC.GetTotalMemory(false);
            
            using var ptrHash = new PtrHashU64(_keys.AsSpan(), PtrHashConfig.Default);
            var valuesArray = new ulong[KeyCount];
            _values.CopyTo(valuesArray, 0);
            
            var afterMemory = GC.GetTotalMemory(false);
            
            // Keep arrays alive for measurement
            GC.KeepAlive(ptrHash);
            GC.KeepAlive(valuesArray);
            
            return afterMemory - beforeMemory;
        }

    }
}