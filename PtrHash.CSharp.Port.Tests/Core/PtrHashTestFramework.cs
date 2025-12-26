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
    PtrHashGenericTypes.RemappingStorage StorageType
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
        new("Fast-MultiPart-VecU32", PtrHashParams.DefaultFast with { SinglePart = false }, PtrHashGenericTypes.RemappingStorage.VecU32),
        new("Fast-SinglePart-VecU32", PtrHashParams.DefaultFast with { SinglePart = true }, PtrHashGenericTypes.RemappingStorage.VecU32), 
        new("Fast-MultiPart-VecU64", PtrHashParams.DefaultFast with { SinglePart = false }, PtrHashGenericTypes.RemappingStorage.VecU64),
        new("Fast-SinglePart-VecU64", PtrHashParams.DefaultFast with { SinglePart = true }, PtrHashGenericTypes.RemappingStorage.VecU64),
        
        // Compact configurations
        new("Compact-MultiPart-CacheLineEF", PtrHashParams.DefaultCompact with { SinglePart = false }, PtrHashGenericTypes.RemappingStorage.CacheLineEF),
        new("Compact-SinglePart-CacheLineEF", PtrHashParams.DefaultCompact with { SinglePart = true }, PtrHashGenericTypes.RemappingStorage.CacheLineEF)
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
        switch (config.StorageType)
        {
            case PtrHashGenericTypes.RemappingStorage.VecU32:
                using (var ptrhash = new PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>(keys, parameters))
                {
                    VerifyCorrectness(ptrhash, keys, config.Name);
                }
                break;
                
            case PtrHashGenericTypes.RemappingStorage.VecU64:
                using (var ptrhash = new PtrHash<ulong, StrongerIntHasher, Linear, UInt64VectorRemappingStorage>(keys, parameters))
                {
                    VerifyCorrectness(ptrhash, keys, config.Name);
                }
                break;
                
            case PtrHashGenericTypes.RemappingStorage.CacheLineEF:
                using (var ptrhash = new PtrHash<ulong, StrongerIntHasher, Linear, CachelineEfVec>(keys, parameters))
                {
                    VerifyCorrectness(ptrhash, keys, config.Name);
                }
                break;
                
            default:
                throw new NotSupportedException($"Storage type {config.StorageType} not supported");
        }
    }

    private static void TestCorrectnessString(TestConfig config, PtrHashParams parameters, string[] keys)
    {
        switch (config.StorageType)
        {
            case PtrHashGenericTypes.RemappingStorage.VecU32:
                using (var ptrhash = new PtrHash<string, StringHasher, Linear, UInt32VectorRemappingStorage>(keys, parameters))
                {
                    VerifyCorrectness(ptrhash, keys, config.Name);
                }
                break;
                
            case PtrHashGenericTypes.RemappingStorage.VecU64:
                using (var ptrhash = new PtrHash<string, StringHasher, Linear, UInt64VectorRemappingStorage>(keys, parameters))
                {
                    VerifyCorrectness(ptrhash, keys, config.Name);
                }
                break;
                
            case PtrHashGenericTypes.RemappingStorage.CacheLineEF:
                using (var ptrhash = new PtrHash<string, StringHasher, Linear, CachelineEfVec>(keys, parameters))
                {
                    VerifyCorrectness(ptrhash, keys, config.Name);
                }
                break;
                
            default:
                throw new NotSupportedException($"Storage type {config.StorageType} not supported");
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

}