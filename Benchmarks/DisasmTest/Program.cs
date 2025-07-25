using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.BucketFunctions;

class Program
{
    static void Main()
    {
        // Create test data with random unique keys
        var random = new Random(42);
        var keySet = new HashSet<ulong>();
        while (keySet.Count < 5000)
            keySet.Add((ulong)random.NextInt64(1, long.MaxValue));
        var keys = keySet.ToArray();
            
        var ptrhash = new PtrHash<ulong, FxHasher, Linear>(keys, PtrHashParams.DefaultFast);
        
        var lookupKeys = new ulong[1000];
        for (int i = 0; i < lookupKeys.Length; i++)
            lookupKeys[i] = (ulong)(i + 1);
            
        var results = new nuint[lookupKeys.Length];
        
        // Force JIT compilation and call target methods
        RunTest(ptrhash, lookupKeys, results);
        
        Console.WriteLine("Test complete");
        ptrhash.Dispose();
    }
    
    [MethodImpl(MethodImplOptions.NoInlining)]
    static void RunTest(PtrHash<ulong, FxHasher, Linear> ptrhash, ulong[] lookupKeys, nuint[] results)
    {
        // Call the method we want to analyze
        ptrhash.GetIndicesStreamPrefetch(lookupKeys, results, minimal: true);
    }
}
