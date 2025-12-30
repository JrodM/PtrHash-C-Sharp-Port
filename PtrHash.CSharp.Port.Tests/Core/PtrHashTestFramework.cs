using System;
using System.Collections.Generic;
using System.IO;
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
    PtrHashGenericTypes.RemappingStorage StorageType
);


public static class PtrHashTestHelpers
{
    public static readonly TestConfig[] AllConfigurations = GenerateAllConfigurations();

    /// <summary>
    /// Generate all test configurations dynamically
    /// </summary>
    private static TestConfig[] GenerateAllConfigurations()
    {
        var configs = new List<TestConfig>();
    
        var paramSets = new[]
        {
            ("Fast", PtrHashParams.DefaultFast),
            ("Compact", PtrHashParams.DefaultCompact)
        };
        
 
        var storageTypes = new[]
        {
            PtrHashGenericTypes.RemappingStorage.VecU32,
            PtrHashGenericTypes.RemappingStorage.VecU64,
            PtrHashGenericTypes.RemappingStorage.CacheLineEF
        };
        

        foreach (var (paramName, baseParams) in paramSets)
        {
            foreach (var storageType in storageTypes)
            {
                foreach (bool singlePart in new[] { false, true })
                {
                    var partName = singlePart ? "SinglePart" : "MultiPart";
                    var name = $"{paramName}-{partName}-{storageType}";
                    var parameters = baseParams with { SinglePart = singlePart };
                    
                    configs.Add(new TestConfig(name, parameters, storageType));
                }
            }
        }
        
        return configs.ToArray();
    }


    /// <summary>
    /// Generate test keys for given count
    /// </summary>
    public static ulong[] GenerateKeys(int count)
    {
        var keys = new ulong[count];
        var random = new Random(42); // Fixed seed for reproducibility
        
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
    /// Factory method to create PtrHash instances based on configuration
    /// </summary>
    public static IPtrHash<TKey> CreatePtrHash<TKey>(TestConfig config, TKey[] keys)
        where TKey : notnull
    {
        if (typeof(TKey) == typeof(ulong))
        {
            return config.StorageType switch
            {
                PtrHashGenericTypes.RemappingStorage.VecU32 => 
                    new PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>(keys as ulong[], config.Parameters) as IPtrHash<TKey>,
                PtrHashGenericTypes.RemappingStorage.VecU64 => 
                    new PtrHash<ulong, StrongerIntHasher, Linear, UInt64VectorRemappingStorage>(keys as ulong[], config.Parameters) as IPtrHash<TKey>,
                PtrHashGenericTypes.RemappingStorage.CacheLineEF => 
                    new PtrHash<ulong, StrongerIntHasher, Linear, CachelineEfVec>(keys as ulong[], config.Parameters) as IPtrHash<TKey>,
                _ => throw new NotSupportedException($"Storage type {config.StorageType} not supported")
            } ?? throw new InvalidOperationException();
        }
        else if (typeof(TKey) == typeof(string))
        {
            return config.StorageType switch
            {
                PtrHashGenericTypes.RemappingStorage.VecU32 => 
                    new PtrHash<string, StringHasher, Linear, UInt32VectorRemappingStorage>(keys as string[], config.Parameters) as IPtrHash<TKey>,
                PtrHashGenericTypes.RemappingStorage.VecU64 => 
                    new PtrHash<string, StringHasher, Linear, UInt64VectorRemappingStorage>(keys as string[], config.Parameters) as IPtrHash<TKey>,
                PtrHashGenericTypes.RemappingStorage.CacheLineEF => 
                    new PtrHash<string, StringHasher, Linear, CachelineEfVec>(keys as string[], config.Parameters) as IPtrHash<TKey>,
                _ => throw new NotSupportedException($"Storage type {config.StorageType} not supported")
            } ?? throw new InvalidOperationException();
        }
        else
        {
            throw new NotSupportedException($"Key type {typeof(TKey)} not supported in tests");
        }
    }

    /// <summary>
    /// Test correctness for given configuration and keys
    /// </summary>
    public static void TestCorrectness<TKey>(TestConfig config, ReadOnlySpan<TKey> keys)
        where TKey : notnull
    {
        var keysArray = keys.ToArray();
        using IPtrHash<TKey> ptrhash = CreatePtrHash(config, keysArray);
        VerifyCorrectness(ptrhash, keysArray, config.Name);
    }

    public static void VerifyCorrectness<TKey>(IPtrHash<TKey> ptrhash, TKey[] keys, string configName)
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

        // Test 4: Test streaming interface matches individual lookups
        VerifyStreamingConsistency(ptrhash, keys, configName);
    }

    /// <summary>
    /// Test all storage types with a given action
    /// </summary>
    public static void TestAllStorageTypes<TKey>(TestConfig config, TKey[] keys, Action<IPtrHash<TKey>, string> verifyAction)
        where TKey : notnull
    {
        using IPtrHash<TKey> ptrhash = CreatePtrHash(config, keys);
        verifyAction(ptrhash, config.Name);
    }

    /// <summary>
    /// Verify streaming consistency for a PtrHash
    /// </summary>
    public static void VerifyStreamingConsistency<TKey>(IPtrHash<TKey> ptrhash, TKey[] keys, string configName)
        where TKey : notnull
    {
        var streamMinimal = new nuint[keys.Length];
        var streamNoRemap = new nuint[keys.Length];
        
        ptrhash.GetIndicesStream(keys, streamMinimal, minimal: true);
        ptrhash.GetIndicesStream(keys, streamNoRemap, minimal: false);
        
        for (int i = 0; i < keys.Length; i++)
        {
            var individualMinimal = ptrhash.GetIndex(keys[i]);
            var individualNoRemap = ptrhash.GetIndexNoRemap(keys[i]);
            
            Assert.AreEqual(individualMinimal, streamMinimal[i], 
                $"Config {configName}: Stream minimal {streamMinimal[i]} != individual minimal {individualMinimal} for key {keys[i]}");
            Assert.AreEqual(individualNoRemap, streamNoRemap[i], 
                $"Config {configName}: Stream NoRemap {streamNoRemap[i]} != individual NoRemap {individualNoRemap} for key {keys[i]}");
        }
    }

    /// <summary>
    /// Test edge cases for PtrHash construction
    /// </summary>
    public static void TestEdgeCases<TKey>(TestConfig config)
        where TKey : notnull
    {
        // Test empty keys
        Assert.ThrowsException<ArgumentException>(() =>
        {
            var emptyKeys = Array.Empty<TKey>();
            using IPtrHash<TKey> ptrhash = CreatePtrHash(config, emptyKeys);
        }, $"Config {config.Name}: Should throw on empty keys");

        if (typeof(TKey) == typeof(ulong))
        {
            var singleKey = new[] { (TKey)(object)42UL };
            TestSingleKey(config, singleKey);
        }
        else if (typeof(TKey) == typeof(string))
        {
            var singleKey = new[] { (TKey)(object)"single_key" };
            TestSingleKey(config, singleKey);
        }
    }

    private static void TestSingleKey<TKey>(TestConfig config, TKey[] singleKey)
        where TKey : notnull
    {
        using IPtrHash<TKey> ptrhash = CreatePtrHash(config, singleKey);
        var index = ptrhash.GetIndex(singleKey[0]);
        Assert.AreEqual((nuint)0, index, $"Config {config.Name}: Single key should map to index 0");
    }

    /// <summary>
    /// Factory method to deserialize PtrHash instances based on configuration
    /// </summary>
    public static IPtrHash<TKey> DeserializePtrHash<TKey>(TestConfig config, Stream stream)
        where TKey : notnull
    {
        if (typeof(TKey) == typeof(ulong))
        {
            return config.StorageType switch
            {
                PtrHashGenericTypes.RemappingStorage.VecU32 => 
                    PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>.Deserialize(stream) as IPtrHash<TKey>,
                PtrHashGenericTypes.RemappingStorage.VecU64 => 
                    PtrHash<ulong, StrongerIntHasher, Linear, UInt64VectorRemappingStorage>.Deserialize(stream) as IPtrHash<TKey>,
                PtrHashGenericTypes.RemappingStorage.CacheLineEF => 
                    PtrHash<ulong, StrongerIntHasher, Linear, CachelineEfVec>.Deserialize(stream) as IPtrHash<TKey>,
                _ => throw new NotSupportedException($"Storage type {config.StorageType} not supported")
            } ?? throw new InvalidOperationException();
        }
        else if (typeof(TKey) == typeof(string))
        {
            return config.StorageType switch
            {
                PtrHashGenericTypes.RemappingStorage.VecU32 => 
                    PtrHash<string, StringHasher, Linear, UInt32VectorRemappingStorage>.Deserialize(stream) as IPtrHash<TKey>,
                PtrHashGenericTypes.RemappingStorage.VecU64 => 
                    PtrHash<string, StringHasher, Linear, UInt64VectorRemappingStorage>.Deserialize(stream) as IPtrHash<TKey>,
                PtrHashGenericTypes.RemappingStorage.CacheLineEF => 
                    PtrHash<string, StringHasher, Linear, CachelineEfVec>.Deserialize(stream) as IPtrHash<TKey>,
                _ => throw new NotSupportedException($"Storage type {config.StorageType} not supported")
            } ?? throw new InvalidOperationException();
        }
        else
        {
            throw new NotSupportedException($"Key type {typeof(TKey)} not supported in tests");
        }
    }

    /// <summary>
    /// Factory method to deserialize PtrHash from memory-mapped data based on configuration
    /// </summary>
    public static unsafe IPtrHash<TKey> DeserializePtrHashFromMemoryMap<TKey>(TestConfig config, byte* ptr, nuint dataSize)
        where TKey : notnull
    {
        if (typeof(TKey) == typeof(ulong))
        {
            return config.StorageType switch
            {
                PtrHashGenericTypes.RemappingStorage.VecU32 => 
                    PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>.DeserializeFromMemoryMap(ptr, dataSize) as IPtrHash<TKey>,
                PtrHashGenericTypes.RemappingStorage.VecU64 => 
                    PtrHash<ulong, StrongerIntHasher, Linear, UInt64VectorRemappingStorage>.DeserializeFromMemoryMap(ptr, dataSize) as IPtrHash<TKey>,
                PtrHashGenericTypes.RemappingStorage.CacheLineEF => 
                    PtrHash<ulong, StrongerIntHasher, Linear, CachelineEfVec>.DeserializeFromMemoryMap(ptr, dataSize) as IPtrHash<TKey>,
                _ => throw new NotSupportedException($"Storage type {config.StorageType} not supported")
            } ?? throw new InvalidOperationException();
        }
        else if (typeof(TKey) == typeof(string))
        {
            return config.StorageType switch
            {
                PtrHashGenericTypes.RemappingStorage.VecU32 => 
                    PtrHash<string, StringHasher, Linear, UInt32VectorRemappingStorage>.DeserializeFromMemoryMap(ptr, dataSize) as IPtrHash<TKey>,
                PtrHashGenericTypes.RemappingStorage.VecU64 => 
                    PtrHash<string, StringHasher, Linear, UInt64VectorRemappingStorage>.DeserializeFromMemoryMap(ptr, dataSize) as IPtrHash<TKey>,
                PtrHashGenericTypes.RemappingStorage.CacheLineEF => 
                    PtrHash<string, StringHasher, Linear, CachelineEfVec>.DeserializeFromMemoryMap(ptr, dataSize) as IPtrHash<TKey>,
                _ => throw new NotSupportedException($"Storage type {config.StorageType} not supported")
            } ?? throw new InvalidOperationException();
        }
        else
        {
            throw new NotSupportedException($"Key type {typeof(TKey)} not supported in tests");
        }
    }

}