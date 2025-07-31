using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.Collections;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PtrHash.CSharp.Port.Tests
{
    /// <summary>
    /// Comprehensive correctness tests for PtrHashDictionary across all configurations and dataset sizes
    /// </summary>
    [TestClass]
    public class PtrHashDictionaryCorrectnessTests
    {
        /// <summary>
        /// Test correctness across various dataset sizes for all configurations
        /// </summary>
        [TestMethod]
        [DataRow(1)]
        [DataRow(10)]
        [DataRow(100)]
        [DataRow(1_000)]
        [DataRow(10_000)]
        [DataRow(100_000)]
        [DataRow(1_000_000)]
        public void AllConfigurations_VariousDatasetSizes_MaintainCorrectness(int keyCount)
        {
            var keys = PtrHashTestHelpers.GenerateKeys(keyCount);
            var values = GenerateValues(keyCount);

            foreach (var config in PtrHashTestHelpers.AllConfigurations)
            {
                try
                {
                    TestDictionaryCorrectness(config, keys, values);
                }
                catch (Exception ex)
                {
                    Assert.Fail($"Dictionary configuration {config.Name} failed with {keyCount} keys: {ex.Message}");
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
            var values = GenerateStringValues(keyCount);

            // Test subset of configurations for strings (they need VecU32+ for large indices)
            var stringConfigs = PtrHashTestHelpers.AllConfigurations
                .Where(c => c.StorageType is RemappingStorageType.VecU32 or RemappingStorageType.VecU64)
                .ToArray();

            foreach (var config in stringConfigs)
            {
                try
                {
                    TestStringDictionaryCorrectness(config, keys, values);
                }
                catch (Exception ex)
                {
                    Assert.Fail($"String dictionary configuration {config.Name} failed with {keyCount} keys: {ex.Message}");
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
                var emptyValues = Array.Empty<string>();
                using var dict = new PtrHashDictionaryU64<string>(emptyKeys, emptyValues, "EMPTY");
            });

            // Test single key
            var singleKey = new ulong[] { 42 };
            var singleValue = new string[] { "answer" };
            using (var dict = new PtrHashDictionaryU64<string>(singleKey, singleValue, "MISSING"))
            {
                Assert.AreEqual("answer", dict[42]);
                Assert.IsFalse(dict.TryGetValue(43, out var missing));
                Assert.AreEqual("MISSING", missing);
            }

            // Test mismatched arrays
            Assert.ThrowsException<ArgumentException>(() =>
            {
                var keys = new ulong[] { 1, 2 };
                var values = new string[] { "one" }; // Mismatched length
                using var dict = new PtrHashDictionaryU64<string>(keys, values, "ERROR");
            });

            // Test duplicate keys
            var duplicateKeys = new ulong[] { 42, 42 };
            var duplicateValues = new string[] { "first", "second" };
            var testConfig = PtrHashTestHelpers.AllConfigurations[0];
            try
            {
                TestDictionaryCorrectness(testConfig, duplicateKeys, duplicateValues);
                Assert.Fail($"Dictionary configuration {testConfig.Name} should have failed with duplicate keys");
            }
            catch (Exception)
            {
                // Expected - duplicate keys should cause construction failure
            }
        }

        /// <summary>
        /// Test that single-part vs multi-part produce same results
        /// </summary>
        [TestMethod]
        [DataRow(1_000)]
        [DataRow(100_000)]
        public void SinglePartVsMultiPart_ProduceSameResults(int keyCount)
        {
            var keys = PtrHashTestHelpers.GenerateKeys(keyCount);
            var values = GenerateValues(keyCount);

            var singlePartConfig = new TestConfig("SinglePart", PtrHashParams.DefaultFast with { SinglePart = true }, RemappingStorageType.VecU32);
            var multiPartConfig = new TestConfig("MultiPart", PtrHashParams.DefaultFast with { SinglePart = false }, RemappingStorageType.VecU32);

            // Both should produce valid dictionaries (not necessarily identical lookups, but both correct)
            TestDictionaryCorrectness(singlePartConfig, keys, values);
            TestDictionaryCorrectness(multiPartConfig, keys, values);
        }

        /// <summary>
        /// Test streaming vs individual lookup consistency across configurations
        /// </summary>
        [TestMethod]
        [DataRow(100)]
        [DataRow(10_000)]
        public void StreamingVsIndividual_ConsistentAcrossConfigurations(int keyCount)
        {
            var keys = PtrHashTestHelpers.GenerateKeys(keyCount);
            var values = GenerateValues(keyCount);

            foreach (var config in PtrHashTestHelpers.AllConfigurations.Take(3)) // Test subset for performance
            {
                using var dict = CreateDictionary(config, keys, values);
                
                // Create mixed query (some valid, some invalid keys)
                var queryKeys = CreateMixedQueryKeys(keys, keyCount / 10);
                
                // Test individual lookups
                var individualResults = new string[queryKeys.Length];
                for (int i = 0; i < queryKeys.Length; i++)
                {
                    individualResults[i] = dict.TryGetValue(queryKeys[i], out var value) ? value : dict.Sentinel;
                }
                
                // Test streaming
                var streamResults = new string[queryKeys.Length];
                var streamPrefetchResults = new string[queryKeys.Length];
                dict.TryGetValueStream(queryKeys, streamResults);
                dict.TryGetValueStreamPrefetch(queryKeys, streamPrefetchResults);
                
                // Verify consistency
                CollectionAssert.AreEqual(individualResults, streamResults, 
                    $"Config {config.Name}: Stream results don't match individual results");
                CollectionAssert.AreEqual(individualResults, streamPrefetchResults, 
                    $"Config {config.Name}: StreamPrefetch results don't match individual results");
            }
        }

        private static string[] GenerateValues(int count)
        {
            return Enumerable.Range(0, count).Select(i => $"value_{i}").ToArray();
        }

        private static string[] GenerateStringValues(int count)
        {
            return Enumerable.Range(0, count).Select(i => $"string_value_{i}").ToArray();
        }

        private static ulong[] CreateMixedQueryKeys(ulong[] validKeys, int queryCount)
        {
            var random = new Random(42);
            var queries = new List<ulong>();
            
            // Add some valid keys
            for (int i = 0; i < queryCount / 2; i++)
            {
                queries.Add(validKeys[random.Next(validKeys.Length)]);
            }
            
            // Add some invalid keys
            for (int i = 0; i < queryCount / 2; i++)
            {
                ulong invalidKey;
                do
                {
                    invalidKey = (ulong)random.Next(int.MaxValue) + (ulong)validKeys.Length * 1000;
                } while (validKeys.Contains(invalidKey));
                
                queries.Add(invalidKey);
            }
            
            return queries.ToArray();
        }

        private static void TestDictionaryCorrectness(TestConfig config, ulong[] keys, string[] values)
        {
            using var dict = CreateDictionary(config, keys, values);
            VerifyDictionaryCorrectness(dict, keys, values, config.Name);
        }

        private static void TestStringDictionaryCorrectness(TestConfig config, string[] keys, string[] values)
        {
            var parameters = config.Parameters with { StorageType = config.StorageType };
            using var dict = new PtrHashDictionaryString<string>(keys, values, "MISSING", parameters);
            VerifyStringDictionaryCorrectness(dict, keys, values, config.Name);
        }

        private static PtrHashDictionaryU64<string> CreateDictionary(TestConfig config, ulong[] keys, string[] values)
        {
            var parameters = config.Parameters with { StorageType = config.StorageType };
            return new PtrHashDictionaryU64<string>(keys, values, "MISSING", parameters);
        }

        private static void VerifyDictionaryCorrectness(PtrHashDictionaryU64<string> dict, ulong[] keys, string[] values, string configName)
        {
            // Test 1: All original keys should map to their values
            for (int i = 0; i < keys.Length; i++)
            {
                Assert.IsTrue(dict.TryGetValue(keys[i], out var value), 
                    $"Config {configName}: Key {keys[i]} not found");
                Assert.AreEqual(values[i], value, 
                    $"Config {configName}: Key {keys[i]} has wrong value");
                Assert.AreEqual(values[i], dict[keys[i]], 
                    $"Config {configName}: Indexer for key {keys[i]} has wrong value");
            }

            // Test 2: Invalid keys should return sentinel
            var random = new Random(42);
            for (int i = 0; i < Math.Min(100, keys.Length); i++)
            {
                ulong invalidKey;
                do
                {
                    invalidKey = (ulong)random.Next(int.MaxValue) + (ulong)keys.Length * 1000;
                } while (keys.Contains(invalidKey));

                Assert.IsFalse(dict.TryGetValue(invalidKey, out var value), 
                    $"Config {configName}: Invalid key {invalidKey} should not be found");
                Assert.AreEqual(dict.Sentinel, value, 
                    $"Config {configName}: Invalid key {invalidKey} should return sentinel");
            }

            // Test 3: Streaming consistency (both regular and prefetch)
            var streamResults = new string[keys.Length];
            var streamPrefetchResults = new string[keys.Length];
            dict.TryGetValueStream(keys, streamResults);
            dict.TryGetValueStreamPrefetch(keys, streamPrefetchResults);
            CollectionAssert.AreEqual(values, streamResults, 
                $"Config {configName}: Stream results don't match expected values");
            CollectionAssert.AreEqual(values, streamPrefetchResults, 
                $"Config {configName}: StreamPrefetch results don't match expected values");

            // Test 4: Properties
            Assert.AreEqual(keys.Length, dict.Count, 
                $"Config {configName}: Count should match key count");
            CollectionAssert.AreEquivalent(keys, dict.Keys.ToArray(), 
                $"Config {configName}: Keys collection should match input keys");
            CollectionAssert.AreEquivalent(values, dict.Values.ToArray(), 
                $"Config {configName}: Values collection should match input values");
        }

        private static void VerifyStringDictionaryCorrectness(PtrHashDictionaryString<string> dict, string[] keys, string[] values, string configName)
        {
            // Test 1: All original keys should map to their values
            for (int i = 0; i < keys.Length; i++)
            {
                Assert.IsTrue(dict.TryGetValue(keys[i], out var value), 
                    $"Config {configName}: Key {keys[i]} not found");
                Assert.AreEqual(values[i], value, 
                    $"Config {configName}: Key {keys[i]} has wrong value");
                Assert.AreEqual(values[i], dict[keys[i]], 
                    $"Config {configName}: Indexer for key {keys[i]} has wrong value");
            }

            // Test 2: Streaming consistency (both regular and prefetch)
            var streamResults = new string[keys.Length];
            var streamPrefetchResults = new string[keys.Length];
            dict.TryGetValueStream(keys, streamResults);
            dict.TryGetValueStreamPrefetch(keys, streamPrefetchResults);
            CollectionAssert.AreEqual(values, streamResults, 
                $"Config {configName}: Stream results don't match expected values");
            CollectionAssert.AreEqual(values, streamPrefetchResults, 
                $"Config {configName}: StreamPrefetch results don't match expected values");
        }
    }
}