using System;
using System.Collections.Generic;
using System.Linq;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
using BenchmarkDotNet.Toolchains.InProcess.Emit;
using PtrHash.CSharp.Interop.PtrHash;
using PtrHash.CSharp.Interop.InteropDictionary;
using PtrHash.CSharp.Interop.Native;
using PtrHash.CSharp.Interop.PtrHash.Dispatchers;
using PtrHash.CSharp.Port;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.BucketFunctions;
using PtrHashImpl = PtrHash.CSharp.Interop.PtrHash;

namespace PtrHash.Benchmarks
{
    [Config(typeof(Config))]
    [MemoryDiagnoser]
    [SimpleJob(RuntimeMoniker.Net80)]
    public class ConstructionBenchmark
    {
        private class Config : ManualConfig
        {
            public Config()
            {
            
            }
        }

 //[Params(  100_000)]
        [Params( 1_000, 10_000, 100_000, 1_000_000, 10_000_000)]
        public int KeyCount { get; set; }

        private ulong[] _keys = null!;

        [GlobalSetup]
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
            
            Console.WriteLine($"Generated {KeyCount:N0} unique keys for construction benchmark");
        }

        [Benchmark(Baseline = true)]
        public HashSet<ulong> HashSetConstruction()
        {
            return new HashSet<ulong>(_keys);
        }

        [Benchmark]
        public PtrHashImpl.PtrHashInterop<ulong, ULongDispatcher> NativeInteropConstruction()
        {
            return new PtrHashImpl.PtrHashInterop<ulong, ULongDispatcher>(_keys.AsSpan(), PtrHashNative.FFIParams.Fast);
        }

        [Benchmark]
        public PtrHashImpl.PtrHashInterop<ulong, ULongDispatcher> NativeInteropConstruction_StrongerHasher()
        {
            var config = PtrHashNative.FFIParams.Fast with { OverrideHashFunction = 2 }; // StrongerIntHash
            return new PtrHashImpl.PtrHashInterop<ulong, ULongDispatcher>(_keys.AsSpan(), config);
        }

        [Benchmark]
        public PtrHash<ulong, FxHasher, Linear> PortConstructionMultiPart()
        {
            return new PtrHash<ulong, FxHasher, Linear>(_keys, PtrHashParams.DefaultFast);
        }

        [Benchmark]
        public PtrHash<ulong, FxHasher, Linear> PortConstructionSinglePart()
        {
            var singlePartParams = PtrHashParams.DefaultFast with { SinglePart = true };
            return new PtrHash<ulong, FxHasher, Linear>(_keys, singlePartParams);
        }

        [Benchmark]
        public PtrHash<ulong, StrongerIntHasher, Linear> PortConstructionMultiPart_StrongerHasher()
        {
            return new PtrHash<ulong, StrongerIntHasher, Linear>(_keys, PtrHashParams.DefaultFast);
        }

        [Benchmark]
        public PtrHash<ulong, StrongerIntHasher, Linear> PortConstructionSinglePart_StrongerHasher()
        {
            var singlePartParams = PtrHashParams.DefaultFast with { SinglePart = true };
            return new PtrHash<ulong, StrongerIntHasher, Linear>(_keys, singlePartParams);
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            // BenchmarkDotNet will handle disposal of returned objects
        }
    }
}