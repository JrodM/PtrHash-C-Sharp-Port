// Dumps JIT asm for both the prefetch and non-prefetch streaming paths.
// Compare output against rust_asm.txt (the Rust index_stream standalone variants).
//
// Run from repo root:
//   $env:DOTNET_JitDisasm = "GetIndicesStreamPrefetchCore|GetIndicesStreamCore"
//   dotnet run -c Release --project .\Benchmarks\ -p:Disasm=true 2>&1 | Tee-Object asm.txt

using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.Storage;
using PtrHash.CSharp.Port.BucketFunctions;

static class DisasmDriver
{
    static void Main(string[] args)
    {
        const int N = 10_000;
        var rng = new Random(42);
        var keySet = new HashSet<ulong>(N);
        while (keySet.Count < N)
            keySet.Add((ulong)rng.NextInt64());
        var keys = keySet.ToArray();
        var results = new nuint[N];

        var p = PtrHashParams.DefaultFast with { SinglePart = true };
        using var ph = new PtrHash<ulong, FxHasher, Linear, UInt32VectorRemappingStorage>(keys, p);

        // Warm up both paths to Tier1 before JitDisasm captures the final asm.
        // 30 calls triggers the Tier1 recompile; 50 gives headroom.
        for (int w = 0; w < 50; w++)
        {
            ph.GetIndicesStream(keys, results, minimal: false);
            ph.GetIndicesStreamPrefetch<PrefetchDistance32>(keys, results, minimal: false);
        }

        // Final calls — JitDisasm will have already dumped the Tier1 asm by this point.
        ph.GetIndicesStream(keys, results, minimal: false);
        var ok1 = Verify(keys.Length, results);

        ph.GetIndicesStreamPrefetch<PrefetchDistance32>(keys, results, minimal: false);
        var ok2 = Verify(keys.Length, results);

        Console.WriteLine($"Non-prefetch: {(ok1 ? "OK" : "WRONG")}");
        Console.WriteLine($"Prefetch:     {(ok2 ? "OK" : "WRONG")}");
        Console.WriteLine("Check asm.txt — search for GetIndicesStreamCore and GetIndicesStreamPrefetchCore");
    }

    static bool Verify(int n, nuint[] results)
    {
        // no-remap: results are a bijection into [0, maxIndex), check uniqueness only
        var seen = new HashSet<nuint>(n);
        foreach (var r in results.AsSpan(0, n))
            if (!seen.Add(r)) return false;
        return true;
    }
}
