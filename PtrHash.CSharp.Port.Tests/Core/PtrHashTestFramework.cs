using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.BucketFunctions;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.Storage;

namespace PtrHash.CSharp.Port.Tests;

/// <summary>
/// Test configuration for PtrHash combinations
/// </summary>
public readonly record struct TestConfig(
    string Name,
    PtrHashParams Parameters,
    RemappingStorageType StorageType,
    bool SinglePart
);

/// <summary>
/// Shared test utilities for PtrHash correctness testing
/// </summary>
public static class PtrHashTestHelpers
{
    /// <summary>
    /// All PtrHash configurations to test
    /// </summary>
    public static readonly TestConfig[] AllConfigurations = [
        // Fast configurations - both single and multi part
        new("Fast-MultiPart-VecU32",  PtrHashParams.DefaultFast,    RemappingStorageType.VecU32,      SinglePart: false),
        new("Fast-SinglePart-VecU32", PtrHashParams.DefaultFast,    RemappingStorageType.VecU32,      SinglePart: true),
        new("Fast-MultiPart-VecU64",  PtrHashParams.DefaultFast,    RemappingStorageType.VecU64,      SinglePart: false),
        new("Fast-SinglePart-VecU64", PtrHashParams.DefaultFast,    RemappingStorageType.VecU64,      SinglePart: true),

        // Compact configurations
        new("Compact-MultiPart-CacheLineEF",  PtrHashParams.DefaultCompact, RemappingStorageType.CacheLineEF, SinglePart: false),
        new("Compact-SinglePart-CacheLineEF", PtrHashParams.DefaultCompact, RemappingStorageType.CacheLineEF, SinglePart: true),
    ];


    /// <summary>
    /// Generate test keys for given count
    /// </summary>
    public static ulong[] GenerateKeys(int count)
    {
        var keys = new ulong[count];
        var random = new Random(42); // Fixed seed for reproducibility
        
        // Generate unique keys
        var used = new HashSet<ulong>();
        for (int i = 0; i < count; i++)
        {
            ulong key;
            do
            {
                key = ((ulong)random.Next() << 32) | (uint)random.Next();
            }
            while (!used.Add(key));
            
            keys[i] = key;
        }
        
        return keys;
    }

    /// <summary>
    /// Generate string test keys for given count
    /// </summary>
    public static string[] GenerateStringKeys(int count)
    {
        var keys = new string[count];
        var random = new Random(42);
        
        var used = new HashSet<string>();
        for (int i = 0; i < count; i++)
        {
            string key;
            do
            {
                key = $"key_{random.Next():X8}_{i:X6}";
            }
            while (!used.Add(key));
            
            keys[i] = key;
        }
        
        return keys;
    }

    /// <summary>
    /// Test correctness for given configuration and keys
    /// </summary>
    public static void TestCorrectness<TKey>(TestConfig config, ReadOnlySpan<TKey> keys)
        where TKey : notnull
    {
        var parameters = config.Parameters;

        // Create appropriate PtrHash based on key type
        if (typeof(TKey) == typeof(ulong))
        {
            var ulongKeys = keys.ToArray() as ulong[];
            TestCorrectnessULong(config, parameters, ulongKeys!);
        }
        else if (typeof(TKey) == typeof(string))
        {
            var stringKeys = keys.ToArray() as string[];
            TestCorrectnessString(config, parameters, stringKeys!);
        }
        else
        {
            throw new NotSupportedException($"Key type {typeof(TKey)} not supported in tests");
        }
    }

    private static void TestCorrectnessULong(TestConfig config, PtrHashParams parameters, ulong[] keys)
    {
        if (config.SinglePart)
        {
            switch (config.StorageType)
            {
                case RemappingStorageType.VecU32:
                    using (var ph = new PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage, SinglePart>(keys, parameters))
                        VerifyCorrectness(ph, keys, config.Name);
                    break;
                case RemappingStorageType.VecU64:
                    using (var ph = new PtrHash<ulong, StrongerIntHasher, Linear, UInt64VectorRemappingStorage, SinglePart>(keys, parameters))
                        VerifyCorrectness(ph, keys, config.Name);
                    break;
                case RemappingStorageType.CacheLineEF:
                    using (var ph = new PtrHash<ulong, StrongerIntHasher, Linear, CachelineEfVec, SinglePart>(keys, parameters))
                        VerifyCorrectness(ph, keys, config.Name);
                    break;
                default:
                    throw new NotSupportedException($"Storage type {config.StorageType} not supported");
            }
        }
        else
        {
            switch (config.StorageType)
            {
                case RemappingStorageType.VecU32:
                    using (var ph = new PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage, MultiPart>(keys, parameters))
                        VerifyCorrectness(ph, keys, config.Name);
                    break;
                case RemappingStorageType.VecU64:
                    using (var ph = new PtrHash<ulong, StrongerIntHasher, Linear, UInt64VectorRemappingStorage, MultiPart>(keys, parameters))
                        VerifyCorrectness(ph, keys, config.Name);
                    break;
                case RemappingStorageType.CacheLineEF:
                    using (var ph = new PtrHash<ulong, StrongerIntHasher, Linear, CachelineEfVec, MultiPart>(keys, parameters))
                        VerifyCorrectness(ph, keys, config.Name);
                    break;
                default:
                    throw new NotSupportedException($"Storage type {config.StorageType} not supported");
            }
        }
    }

    private static void TestCorrectnessString(TestConfig config, PtrHashParams parameters, string[] keys)
    {
        if (config.SinglePart)
        {
            switch (config.StorageType)
            {
                case RemappingStorageType.VecU32:
                    using (var ph = new PtrHash<string, StringHasher, Linear, UInt32VectorRemappingStorage, SinglePart>(keys, parameters))
                        VerifyCorrectness(ph, keys, config.Name);
                    break;
                case RemappingStorageType.VecU64:
                    using (var ph = new PtrHash<string, StringHasher, Linear, UInt64VectorRemappingStorage, SinglePart>(keys, parameters))
                        VerifyCorrectness(ph, keys, config.Name);
                    break;
                case RemappingStorageType.CacheLineEF:
                    using (var ph = new PtrHash<string, StringHasher, Linear, CachelineEfVec, SinglePart>(keys, parameters))
                        VerifyCorrectness(ph, keys, config.Name);
                    break;
                default:
                    throw new NotSupportedException($"Storage type {config.StorageType} not supported");
            }
        }
        else
        {
            switch (config.StorageType)
            {
                case RemappingStorageType.VecU32:
                    using (var ph = new PtrHash<string, StringHasher, Linear, UInt32VectorRemappingStorage, MultiPart>(keys, parameters))
                        VerifyCorrectness(ph, keys, config.Name);
                    break;
                case RemappingStorageType.VecU64:
                    using (var ph = new PtrHash<string, StringHasher, Linear, UInt64VectorRemappingStorage, MultiPart>(keys, parameters))
                        VerifyCorrectness(ph, keys, config.Name);
                    break;
                case RemappingStorageType.CacheLineEF:
                    using (var ph = new PtrHash<string, StringHasher, Linear, CachelineEfVec, MultiPart>(keys, parameters))
                        VerifyCorrectness(ph, keys, config.Name);
                    break;
                default:
                    throw new NotSupportedException($"Storage type {config.StorageType} not supported");
            }
        }
    }

    private static void VerifyCorrectness<TKey>(IPtrHash<TKey> ptrhash, TKey[] keys, string configName)
        where TKey : notnull
    {
        var indices = new HashSet<nuint>();
        var noRemapIndices = new HashSet<nuint>();
        var keyCount = (nuint)keys.Length;
        var info = ptrhash.GetInfo();

        // Test 1: All keys map to unique indices in [0, n) for GetIndex (minimal)
        for (int i = 0; i < keys.Length; i++)
        {
            var index = ptrhash.GetIndex(keys[i]);
            
            Assert.IsTrue(index < keyCount, 
                $"Config {configName}: Index {index} >= key count {keyCount} for key {keys[i]}");
            
            Assert.IsTrue(indices.Add(index), 
                $"Config {configName}: Duplicate index {index} for key {keys[i]}");
        }

        // Test 2: All keys map to unique indices in [0, MaxIndex) for GetIndexNoRemap  
        for (int i = 0; i < keys.Length; i++)
        {
            var noRemapIndex = ptrhash.GetIndexNoRemap(keys[i]);
            
            Assert.IsTrue(noRemapIndex < info.MaxIndex, 
                $"Config {configName}: NoRemap index {noRemapIndex} >= MaxIndex {info.MaxIndex} for key {keys[i]}");
            
            Assert.IsTrue(noRemapIndices.Add(noRemapIndex), 
                $"Config {configName}: Duplicate NoRemap index {noRemapIndex} for key {keys[i]}");
        }

        // Test 3: Verify we got exactly n unique indices for both methods
        Assert.AreEqual(keys.Length, indices.Count, 
            $"Config {configName}: Expected {keys.Length} unique minimal indices, got {indices.Count}");
        Assert.AreEqual(keys.Length, noRemapIndices.Count, 
            $"Config {configName}: Expected {keys.Length} unique NoRemap indices, got {noRemapIndices.Count}");

        // Test 4: Test streaming interface matches individual lookups for both minimal and non-minimal
        var streamMinimal = new nuint[keys.Length];
        var streamNoRemap = new nuint[keys.Length];
        var streamPrefetchMinimal = new nuint[keys.Length];
        var streamPrefetchNoRemap = new nuint[keys.Length];
        
        ptrhash.GetIndicesStream<UseMinimal>(keys, streamMinimal);
        ptrhash.GetIndicesStream<NoMinimal>(keys, streamNoRemap);
        ptrhash.GetIndicesStreamPrefetch<UseMinimal, PrefetchDistance32>(keys, streamPrefetchMinimal);
        ptrhash.GetIndicesStreamPrefetch<NoMinimal, PrefetchDistance32>(keys, streamPrefetchNoRemap);
        
        for (int i = 0; i < keys.Length; i++)
        {
            var individualMinimal = ptrhash.GetIndex(keys[i]);
            var individualNoRemap = ptrhash.GetIndexNoRemap(keys[i]);
            
            Assert.AreEqual(individualMinimal, streamMinimal[i], 
                $"Config {configName}: Stream minimal {streamMinimal[i]} != individual minimal {individualMinimal} for key {keys[i]}");
            Assert.AreEqual(individualNoRemap, streamNoRemap[i], 
                $"Config {configName}: Stream NoRemap {streamNoRemap[i]} != individual NoRemap {individualNoRemap} for key {keys[i]}");
            Assert.AreEqual(individualMinimal, streamPrefetchMinimal[i], 
                $"Config {configName}: StreamPrefetch minimal {streamPrefetchMinimal[i]} != individual minimal {individualMinimal} for key {keys[i]}");
            Assert.AreEqual(individualNoRemap, streamPrefetchNoRemap[i], 
                $"Config {configName}: StreamPrefetch NoRemap {streamPrefetchNoRemap[i]} != individual NoRemap {individualNoRemap} for key {keys[i]}");
        }
    }

}