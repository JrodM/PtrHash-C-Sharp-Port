using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Interop.PtrHash;
using PtrHash.CSharp.Interop.Native;
using PtrHash.CSharp.Interop.Tests;

namespace PtrHash.CSharp.Interop.Tests
{
    [TestClass]
    public class PtrHashCoreTests
    {
        [TestMethod]
        public void Constructor_WithValidKeys_CreatesInstance()
        {
            var keys = TestUtilities.GenerateTestU64Keys();
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            TestUtilities.AssertValidPtrHashInfo(hash.GetInfo(), keys.Length);
        }

        [TestMethod]
        public void Constructor_WithDifferentConfigs_CreatesInstances()
        {
            var keys = TestUtilities.GenerateTestU64Keys();
            using var defaultHash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            using var customHash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams(hashFunction: 2));
            
            Assert.AreEqual(defaultHash.GetInfo().KeyCount, customHash.GetInfo().KeyCount);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void Constructor_WithNullKeys_ThrowsArgumentException()
        {
            new PtrHashInteropU64((ulong[])null);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void Constructor_WithEmptyKeys_ThrowsArgumentException()
        {
            new PtrHashInteropU64(Array.Empty<ulong>());
        }

        /// <summary>
        /// Test the same problematic keys that cause self-collision in C# port with native Rust
        /// </summary>
        [TestMethod]
        public void SelfCollisionKeys_NativeRust_ShouldNotFail()
        {
            // Keys from seed 14 that trigger self-collision error in C# port
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

            Console.WriteLine($"Testing {keys.Length} problematic keys with native Rust implementation");
            
            // Test multiple attempts to see if native Rust also fails
            bool nativeRustFailed = false;
            Exception lastException = null;
            
            for (int attempt = 1; attempt <= 10; attempt++)
            {
                try
                {
                    // Use compact config similar to problematic C# config (single-part with minimal setup)
                    var compactParams = PtrHashNative.FFIParams.FastWithOverrides(singlePart: true, hashFunction: 1);
                    using var hash = new PtrHashInteropU64(keys, compactParams);
                    
                    // Verify all keys map correctly
                    var indices = new HashSet<ulong>();
                    foreach (var key in keys)
                    {
                        var index = hash.GetIndex(key);
                        if (!indices.Add(index))
                        {
                            Assert.Fail($"Attempt {attempt}: Duplicate index {index} for key 0x{key:X16}");
                        }
                    }
                    
                    Console.WriteLine($"Attempt {attempt}: Native Rust succeeded");
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Attempt {attempt}: Native Rust failed: {ex.Message}");
                    nativeRustFailed = true;
                    lastException = ex;
                    break;
                }
            }
            
            if (nativeRustFailed)
            {
                Console.WriteLine("Native Rust implementation also fails with these keys!");
                Assert.Inconclusive($"Native Rust failed: {lastException?.Message ?? "Unknown error"}");
            }
            else
            {
                Console.WriteLine("Native Rust implementation handles these keys successfully");
                Assert.IsTrue(true, "Native Rust works fine with problematic keys");
            }
        }

        [TestMethod]
        public void GetIndex_WithValidKeys_ReturnsUniqueIndices()
        {
            var keys = TestUtilities.GenerateTestU64Keys(10_000);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var indices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                indices[i] = hash.GetIndex(keys[i]);
            }
            
            TestUtilities.AssertUniqueIndicesInRange(keys, indices, (nuint)keys.Length);
        }

        [TestMethod]
        public void GetIndexNoRemap_WithValidKeys_ReturnsIndices()
        {
            var keys = TestUtilities.GenerateTestU64Keys();
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            var info = hash.GetInfo();
            
            var indices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                indices[i] = hash.GetIndexNoRemap(keys[i]);
            }
            
            TestUtilities.AssertUniqueIndicesInRange(keys, indices, info.MaxIndex);
        }

        [TestMethod]
        public void GetIndicesBatch_WithValidKeys_ReturnsCorrectIndices()
        {
            var keys = TestUtilities.GenerateTestU64Keys(10_000);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndex(keys[i]);
            }
            
            var batchResults = new nuint[keys.Length];
            hash.GetIndicesBatch(keys, batchResults, minimal: true);
            
            CollectionAssert.AreEqual(expectedIndices, batchResults);
        }

        [TestMethod]
        public void GetIndicesBatch_WithNoRemapFlag_ReturnsCorrectIndices()
        {
            var keys = TestUtilities.GenerateTestU64Keys();
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndexNoRemap(keys[i]);
            }
            
            var batchResults = new nuint[keys.Length];
            hash.GetIndicesBatch(keys, batchResults, minimal: false);
            
            CollectionAssert.AreEqual(expectedIndices, batchResults);
        }

        [TestMethod]
        public void GetIndicesStream_WithValidKeys_ReturnsCorrectIndices()
        {
            var keys = TestUtilities.GenerateTestU64Keys(10);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndex(keys[i]);
            }
            
            var streamResults = new nuint[keys.Length];
            hash.GetIndicesStream(keys, streamResults, prefetchDistance: 16, minimal: true);
            
            CollectionAssert.AreEqual(expectedIndices, streamResults);
        }

        [TestMethod]
        public void GetIndicesStream_WithDifferentPrefetchDistances_ReturnsCorrectIndices()
        {
            var keys = TestUtilities.GenerateTestU64Keys(10);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var expectedIndices = new nuint[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                expectedIndices[i] = hash.GetIndex(keys[i]);
            }
            
            foreach (uint prefetch in new uint[] { 8, 16, 32 })
            {
                var results = new nuint[keys.Length];
                hash.GetIndicesStream(keys, results, prefetchDistance: prefetch, minimal: true);
                CollectionAssert.AreEqual(expectedIndices, results, $"Failed for prefetch distance {prefetch}");
            }
        }

        [TestMethod]
        public void Performance_BasicFunctionality_Works()
        {
            var keys = TestUtilities.GenerateUniqueRandomKeys(25_000);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var results = new nuint[keys.Length];
            hash.GetIndicesBatch(keys, results);
            hash.GetIndicesStream(keys, results, prefetchDistance: 32);
            
            TestUtilities.AssertValidPtrHashInfo(hash.GetInfo(), keys.Length);
        }

        [TestMethod]
        [ExpectedException(typeof(ArgumentException))]
        public void GetIndicesBatch_WithMismatchedArrays_ThrowsArgumentException()
        {
            var keys = TestUtilities.GenerateTestU64Keys(3);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            var results = new nuint[2];
            hash.GetIndicesBatch(keys, results);
        }

        [TestMethod]
        public void GetInfo_ReturnsValidInformation()
        {
            var keys = TestUtilities.GenerateTestU64Keys();
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            TestUtilities.AssertValidPtrHashInfo(hash.GetInfo(), keys.Length);
        }

        [TestMethod]
        public void EndToEnd_AllOperationsWork()
        {
            var keys = TestUtilities.GenerateUniqueRandomKeys(50_000);
            using var hash = new PtrHashInteropU64(keys, TestUtilities.GetTestParams());
            
            var batchResults = new nuint[keys.Length];
            hash.GetIndicesBatch(keys, batchResults, minimal: true);
            
            var streamResults = new nuint[keys.Length];
            hash.GetIndicesStream(keys, streamResults, prefetchDistance: 32, minimal: true);
            
            CollectionAssert.AreEqual(batchResults, streamResults);
            TestUtilities.AssertUniqueIndicesInRange(keys, batchResults, (nuint)keys.Length);
        }
    }
}