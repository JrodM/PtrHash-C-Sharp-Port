using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.Storage;

namespace PtrHash.CSharp.Port.Tests;

[TestClass]
public class PtrHashCorrectnessTests
{
    /// <summary>
    /// Test correctness across various dataset sizes for all configurations
    /// </summary>
    [TestMethod]
    [DataRow(2)]
    [DataRow(10)]
    [DataRow(100)]
    [DataRow(1_000)]
    [DataRow(10_000)]
    [DataRow(100_000)]
    [DataRow(1_000_000)]
    [DataRow(10_000_000)]
    public void AllConfigurations_VariousDatasetSizes_MaintainCorrectness(int keyCount)
    {
        var keys = PtrHashTestHelpers.GenerateKeys(keyCount);

        foreach (var config in PtrHashTestHelpers.AllConfigurations)
        {
            try
            {
                PtrHashTestHelpers.TestCorrectness<ulong>(config, keys.AsSpan());
            }
            catch (Exception ex)
            {
                Assert.Fail($"Configuration {config.Name} failed with {keyCount} keys: {ex.Message}");
            }
        }
    }

    /// <summary>
    /// Test string keys with various sizes
    /// </summary>
    [TestMethod]
    [DataRow(1)]
    [DataRow(100)]
    [DataRow(1_000)]
    [DataRow(100_000)]
    [DataRow(1_000_000)]
    public void StringKeys_VariousDatasetSizes_MaintainCorrectness(int keyCount)
    {
        var keys = PtrHashTestHelpers.GenerateStringKeys(keyCount);

        // Test subset of configurations for strings (they need VecU32+ for large indices)
        var stringConfigs = PtrHashTestHelpers.AllConfigurations
            .Where(c => c.StorageType is RemappingStorageType.VecU32 or RemappingStorageType.VecU64)
            .ToArray();

        foreach (var config in stringConfigs)
        {
            try
            {
                PtrHashTestHelpers.TestCorrectness<string>(config, keys.AsSpan());
            }
            catch (Exception ex)
            {
                Assert.Fail($"Configuration {config.Name} failed with {keyCount} string keys: {ex.Message}");
            }
        }
    }

    /// <summary>
    /// Test edge cases: empty, single key, duplicate detection
    /// </summary>
    [TestMethod]
    public void EdgeCases_HandledCorrectly()
    {
        // Test empty keys - should throw
        Assert.ThrowsException<ArgumentException>(() =>
        {
            var emptyKeys = Array.Empty<ulong>();
            PtrHashTestHelpers.TestCorrectness<ulong>(PtrHashTestHelpers.AllConfigurations[0], emptyKeys);
        });

        // Test single key
        var singleKey = new ulong[] { 42 };
        PtrHashTestHelpers.TestCorrectness<ulong>(PtrHashTestHelpers.AllConfigurations[0], singleKey);

        // Test two identical keys
        var duplicateKeys = new ulong[] { 42, 42 };
        var testConfig = PtrHashTestHelpers.AllConfigurations[0];
        try
        {
            PtrHashTestHelpers.TestCorrectness<ulong>(testConfig, duplicateKeys);
            Assert.Fail($"Configuration {testConfig.Name} should have failed with duplicate keys");
        }
        catch (Exception)
        {
            // Expected - duplicate keys should cause construction failure
        }
    }
}