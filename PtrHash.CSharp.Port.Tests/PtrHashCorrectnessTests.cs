using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.Storage;

namespace PtrHash.CSharp.Port.Tests;

/// <summary>
/// Comprehensive correctness tests for all PtrHash configurations
/// </summary>
[TestClass]
public class PtrHashCorrectnessTests
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
    /// Reproduce self-collision error with specific configuration and seed
    /// </summary>
    //[TestMethod]
    public void ReproduceSelfCollisionError_100Keys_CacheLineEF()
    {
        // Test the problematic configuration
        var config = PtrHashTestHelpers.AllConfigurations
            .First(c => c.Name == "Compact-SinglePart-CacheLineEF");

        // Try different seeds until we find one that triggers the error
        Exception? selfCollisionError = null;
        ulong[]? problematicKeys = null;
        
        for (int seed = 1; seed <= 1000; seed++)
        {
            var random = new Random(seed);
            var keys = new ulong[100];
            
            // Generate keys with this seed
            var used = new HashSet<ulong>();
            for (int i = 0; i < 100; i++)
            {
                ulong key;
                do
                {
                    key = ((ulong)random.Next() << 32) | (uint)random.Next();
                }
                while (!used.Add(key));
                
                keys[i] = key;
            }

            try
            {
                PtrHashTestHelpers.TestCorrectness<ulong>(config, keys.AsSpan());
                // No error with this seed, try next
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Self-collision detected") || 
                    ex.InnerException?.Message.Contains("Self-collision detected") == true)
                {
                    Console.WriteLine($"Found self-collision error with seed {seed}!");
                    Console.WriteLine("Keys that trigger self-collision:");
                    for (int i = 0; i < keys.Length; i++)
                    {
                        Console.WriteLine($"keys[{i}] = 0x{keys[i]:X16}UL;");
                    }
                    
                    selfCollisionError = ex;
                    problematicKeys = keys;
                    break;
                }
                else
                {
                    Console.WriteLine($"Seed {seed}: Got different error: {ex.Message}");
                }
            }
        }

        if (selfCollisionError != null)
        {
            Console.WriteLine($"Successfully reproduced self-collision error: {selfCollisionError.Message}");
            Assert.IsTrue(true, "Self-collision error reproduced successfully");
        }
        else
        {
            Assert.Fail("Could not reproduce self-collision error with any seed from 1-1000");
        }
    }

    /// <summary>
    /// Test with hardcoded keys that reproduce self-collision consistently
    /// </summary>
    [TestMethod]
    public void HardcodedSelfCollisionKeys_ReproduceIssue()
    {
        // Keys from seed 14 that trigger self-collision error
        var keys = new ulong[]
        {
            0x0525327C766C7EBAUL, 0x46E4B4C245EF327CUL, 0x436F47CD658FE74FUL, 0x16E399DD3B9E01F9UL,
            0x5AD3A25137D60D1CUL, 0x4D95C9CD32DB4800UL, 0x20E4854960651C4AUL, 0x6410A02763074698UL,
            0x5FAAB597567176E5UL, 0x0730773D5E238EDEUL, 0x56AB10412431A958UL, 0x2DD2097876342EEEUL,
            0x0938041843F2C56DUL, 0x7C40D1F02E5A5507UL, 0x34F74FFF2D962240UL, 0x2D84B9B2120D081BUL,
            0x76A4E6CB2B75CD1DUL, 0x43FE4D7E2F523152UL, 0x504ADC707603B38FUL, 0x5ECE3A4A740EB053UL,
            0x205E1FDD4D813A7AUL, 0x108372FC6DCAAB7CUL, 0x24EA58460FD63605UL, 0x0CD549A056989401UL,
            0x41DC58F0092D0134UL, 0x04AECC4C03A6F9C1UL, 0x65B011882B89DD90UL, 0x7FC2AE8E60F38923UL,
            0x489A754250B085D3UL, 0x3CB72E647F7C825FUL, 0x694F155E688944D5UL, 0x06A6B1FA2D3D8011UL,
            0x0A51536A3B88C1B2UL, 0x3C366134756EB82BUL, 0x1C66CECC34BE6ED5UL, 0x12BC6A2869A70207UL,
            0x77A33C9A1321C6E9UL, 0x3DC56F010929D5C7UL, 0x13AE365C40075DFBUL, 0x5149D6A87961CE12UL,
            0x371D7BCD25A83DEFUL, 0x6C7DFC162BCA4ECBUL, 0x28E755F429DDBFF1UL, 0x2C5CF6924B1B093BUL,
            0x2BB31E8E630AC45AUL, 0x66B7BC0F7F9A569CUL, 0x394C852B5F51B7EAUL, 0x0ABF9AF537D4DB07UL,
            0x46DA88806345F2EAUL, 0x6379581269619693UL, 0x539FD4D017669174UL, 0x3A31C5350D1DEA1BUL,
            0x7670970B1B07CA44UL, 0x0C03BD26528E4A9FUL, 0x6DC46E8E7698D8C7UL, 0x4D4552C708931747UL,
            0x7F66AF2A43556051UL, 0x485F069243A6D76FUL, 0x7C0B48BE5ADC632EUL, 0x04562A1D60739378UL,
            0x0F2BCB20711B57F8UL, 0x49BB999D395C0A71UL, 0x4E06B2C51322138BUL, 0x305A7CDC185184B0UL,
            0x08622BF405F093FAUL, 0x424F4D4630684371UL, 0x5C8E05E867E84014UL, 0x25C1F9421FB6EA59UL,
            0x6B7678B95F6011FBUL, 0x3559B7BF0DDF8BB0UL, 0x1DDA02CB59CEABF2UL, 0x5D569AAC351A45C6UL,
            0x15C571935E24A4C8UL, 0x0033A77275F724D9UL, 0x16F2B1584718C385UL, 0x3BC992486BFE2551UL,
            0x5EEFC8CD0305C49AUL, 0x5A35CB7362847CD7UL, 0x4DAAF7D600D5BAC4UL, 0x3F173755634E8380UL,
            0x6AAD4D6773B23875UL, 0x4A2C1EAB67D3DA94UL, 0x34498B811CDD0F56UL, 0x2C05115E177E6F16UL,
            0x1D93670F28A81C39UL, 0x58305EB51CAB36C3UL, 0x2582AB6F76769E6CUL, 0x429990AD355D1F2DUL,
            0x13C4BD4C14A153D7UL, 0x239698DE6FE20DFCUL, 0x12EE6C193A635802UL, 0x015ED3584149686EUL,
            0x4A2701B1565127F4UL, 0x51787AA35988414EUL, 0x0DB274A1433D7C6AUL, 0x520BF2826AA0BDF5UL,
            0x2048DAA6520B343EUL, 0x23323E482A27CA55UL, 0x0FA28D477582C017UL, 0x00D0BA4578E8623CUL
        };

        var csharpConfig = PtrHashTestHelpers.AllConfigurations
            .First(c => c.Name == "Compact-SinglePart-CacheLineEF");

        Console.WriteLine($"Testing with {keys.Length} hardcoded keys from seed 14");
        Console.WriteLine("=== Testing C# implementation ===");
        
        // Test C# version
        bool csharpErrorReproduced = false;
        Exception? lastCsharpError = null;
        
        for (int attempt = 1; attempt <= 5; attempt++)
        {
            try
            {
                PtrHashTestHelpers.TestCorrectness<ulong>(csharpConfig, keys.AsSpan());
                Console.WriteLine($"C# Attempt {attempt}: No error");
            }
            catch (Exception ex)
            {
                lastCsharpError = ex;
                if (ex.Message.Contains("Self-collision detected") || 
                    ex.InnerException?.Message.Contains("Self-collision detected") == true)
                {
                    Console.WriteLine($"C# Attempt {attempt}: Self-collision error reproduced!");
                    csharpErrorReproduced = true;
                    break;
                }
                else
                {
                    Console.WriteLine($"C# Attempt {attempt}: Different error: {ex.Message}");
                }
            }
        }

        if (csharpErrorReproduced)
        {
            Console.WriteLine("C# implementation still has the self-collision bug");
            Assert.Fail("C# implementation bug not fixed");
        }
        else
        {
            Console.WriteLine("C# implementation no longer shows self-collision errors!");
            Assert.IsTrue(true, "Self-collision bug appears to be fixed");
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

    /// <summary>
    /// Test that single-part vs multi-part produce same results
    /// </summary>
    [TestMethod]
    [DataRow(1_000)]
    [DataRow(100_000)]
    public void SinglePartVsMultiPart_ProduceSameResults(int keyCount)
    {
        var keys = PtrHashTestHelpers.GenerateKeys(keyCount);

        var singlePartConfig = new TestConfig("SinglePart", PtrHashParams.DefaultFast with { SinglePart = true }, RemappingStorageType.VecU32);
        var multiPartConfig = new TestConfig("MultiPart", PtrHashParams.DefaultFast with { SinglePart = false }, RemappingStorageType.VecU32);

        // Both should produce valid MPHFs (not necessarily identical indices, but both correct)
        PtrHashTestHelpers.TestCorrectness<ulong>(singlePartConfig, keys.AsSpan());
        PtrHashTestHelpers.TestCorrectness<ulong>(multiPartConfig, keys.AsSpan());
    }

}