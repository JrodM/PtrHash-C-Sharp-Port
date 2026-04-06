using System;
using System.Linq;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Diagnosers;
using BenchmarkDotNet.Jobs;
using PtrHash.CSharp.Port;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.BucketFunctions;
using PtrHash.CSharp.Port.Storage;

namespace PtrHash.Benchmarks.DisasmTest
{
    [DisassemblyDiagnoser(maxDepth: 5, printSource: false, syntax: DisassemblySyntax.Intel)]
    [SimpleJob(RuntimeMoniker.Net80)]
    public class PrefetchDisasm
    {
        private PtrHash<ulong, FxHasher, Linear, UInt32VectorRemappingStorage, SinglePart> _ptrHash = null!;
        private ulong[]  _keys        = null!;
        private nuint[]  _results     = null!;

        [GlobalSetup]
        public void Setup()
        {
            var rng = new Random(42);
            _keys   = Enumerable.Range(0, 100_000).Select(_ => (ulong)rng.NextInt64(1, long.MaxValue)).Distinct().ToArray();
            _ptrHash  = new PtrHash<ulong, FxHasher, Linear, UInt32VectorRemappingStorage, SinglePart>(_keys, PtrHashParams.DefaultFast);
            _results  = new nuint[_keys.Length];
        }

        [GlobalCleanup]
        public void Cleanup() => _ptrHash?.Dispose();

        [Benchmark]
        public void StreamPrefetch()
            => _ptrHash.GetIndicesStreamPrefetch<UseMinimal, PrefetchDistance32>(_keys.AsSpan(), _results.AsSpan());
    }
}
