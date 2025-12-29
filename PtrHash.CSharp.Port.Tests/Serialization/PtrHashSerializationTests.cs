using System;
using System.Collections.Generic;
using System.IO;
using System.IO.MemoryMappedFiles;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.Core.Serialization;
using PtrHash.CSharp.Port.Storage;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.BucketFunctions;

namespace PtrHash.CSharp.Port.Tests.Serialization;

[TestClass]
public class PtrHashSerializationTests
{
    [TestMethod]
    [DataRow(2)]
    [DataRow(100)]
    [DataRow(1_000)]
    [DataRow(100_000)]
    public void RoundTrip_AllConfigurations_PreservesCorrectness(int keyCount)
    {
        var keys = PtrHashTestHelpers.GenerateKeys(keyCount);

        foreach (var config in PtrHashTestHelpers.AllConfigurations)
        {
            using var stream = new MemoryStream();
            TestRoundTrip(config, keys, stream);
            
            TestRoundTripMemoryMapped(config, keys);
        }
    }
    
    [TestMethod]
    [DataRow(1_000)]
    [DataRow(10_000)]
    public unsafe void MemoryMappedFile_LoadsCorrectly(int keyCount)
    {
        var keys = PtrHashTestHelpers.GenerateKeys(keyCount);
        var config = PtrHashTestHelpers.AllConfigurations.First(c => c.StorageType == PtrHashGenericTypes.RemappingStorage.VecU32);
        
        var tempFile = Path.GetTempFileName();
        try
        {
            using (var original = new PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>(keys, config.Parameters))
            {
                using var fileStream = File.Create(tempFile);
                original.Serialize(fileStream);
            }
            
            var fileInfo = new FileInfo(tempFile);
            using var mmf = MemoryMappedFile.CreateFromFile(tempFile, FileMode.Open, null, fileInfo.Length, MemoryMappedFileAccess.Read);
            using var accessor = mmf.CreateViewAccessor(0, fileInfo.Length, MemoryMappedFileAccess.Read);
            
            byte* ptr = null;
            accessor.SafeMemoryMappedViewHandle.AcquirePointer(ref ptr);
            try
            {
                using var loaded = PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>.DeserializeFromMemoryMap(ptr, (nuint)fileInfo.Length);
                
                foreach (var key in keys.Take(Math.Min(100, keys.Length)))
                {
                    var index = loaded.GetIndex(key);
                    Assert.IsTrue(index < (nuint)keys.Length, $"Index {index} out of bounds for key {key}");
                }
            }
            finally
            {
                accessor.SafeMemoryMappedViewHandle.ReleasePointer();
            }
        }
        finally
        {
            File.Delete(tempFile);
        }
    }
    
    [TestMethod]
    public void Deserialize_WrongStorageType_ThrowsException()
    {
        var keys = PtrHashTestHelpers.GenerateKeys(100);
        using var stream = new MemoryStream();
        
        using (var original = new PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>(
            keys, PtrHashParams.DefaultFast))
        {
            original.Serialize(stream);
        }
        
        stream.Position = 0;
        Assert.ThrowsException<InvalidOperationException>(() =>
        {
            PtrHash<ulong, StrongerIntHasher, Linear, UInt64VectorRemappingStorage>.Deserialize(stream);
        });
    }
    
    [TestMethod]
    public void Deserialize_WrongHasherType_ThrowsException()
    {
        var keys = PtrHashTestHelpers.GenerateKeys(100);
        using var stream = new MemoryStream();
        
        using (var original = new PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>(
            keys, PtrHashParams.DefaultFast))
        {
            original.Serialize(stream);
        }
        
        stream.Position = 0;
        Assert.ThrowsException<InvalidOperationException>(() =>
        {
            PtrHash<ulong, FxHasher, Linear, UInt32VectorRemappingStorage>.Deserialize(stream);
        });
    }
    
    [TestMethod]
    public void Deserialize_WrongBucketFunction_ThrowsException()
    {
        var keys = PtrHashTestHelpers.GenerateKeys(100);
        using var stream = new MemoryStream();
        
        using (var original = new PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>(
            keys, PtrHashParams.DefaultFast))
        {
            original.Serialize(stream);
        }
        
        stream.Position = 0;
        Assert.ThrowsException<InvalidOperationException>(() =>
        {
            PtrHash<ulong, StrongerIntHasher, CubicEps, UInt32VectorRemappingStorage>.Deserialize(stream);
        });
    }
    
    [TestMethod]
    public void Deserialize_InvalidMagicNumber_ThrowsException()
    {
        using var stream = new MemoryStream();
        
        var invalidHeader = new byte[PtrHashFileFormat.HeaderSize];
        BitConverter.GetBytes(0xDEADBEEFu).CopyTo(invalidHeader, 0); // Wrong magic
        stream.Write(invalidHeader);
        
        stream.Position = 0;
        Assert.ThrowsException<InvalidOperationException>(() =>
        {
            PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>.Deserialize(stream);
        });
    }
    
    [TestMethod]
    public void Deserialize_UnsupportedVersion_ThrowsException()
    {
        using var stream = new MemoryStream();
        
        var header = new byte[PtrHashFileFormat.HeaderSize];
        BitConverter.GetBytes(PtrHashFileFormat.MagicNumber).CopyTo(header, 0);
        BitConverter.GetBytes((ushort)999).CopyTo(header, 4); // Major version 999
        BitConverter.GetBytes((ushort)0).CopyTo(header, 6);   // Minor version 0
        stream.Write(header);
        
        stream.Position = 0;
        Assert.ThrowsException<InvalidOperationException>(() =>
        {
            PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>.Deserialize(stream);
        });
    }
    
    [TestMethod]
    public void StreamPosition_CorrectAfterOperations()
    {
        var keys = PtrHashTestHelpers.GenerateKeys(100);
        using var stream = new MemoryStream();
        
        var preamble = new byte[] { 1, 2, 3, 4 };
        stream.Write(preamble);
        var startPos = stream.Position;
        
        using (var original = new PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>(
            keys, PtrHashParams.DefaultFast))
        {
            original.Serialize(stream);
        }
        
        var endPos = stream.Position;
        
        stream.Position = startPos;
        
        using var loaded = PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>.Deserialize(stream);
        
        Assert.AreEqual(endPos, stream.Position);
    }
    
    [TestMethod]
    public void RoundTrip_SingleKey_Works()
    {
        var keys = new ulong[] { 42 };
        var config = PtrHashTestHelpers.AllConfigurations[0];
        
        using var stream = new MemoryStream();
        TestRoundTrip(config, keys, stream);
    }
    
    [TestMethod]
    public void RoundTrip_FileStream_Works()
    {
        var keys = PtrHashTestHelpers.GenerateKeys(1000);
        var config = PtrHashTestHelpers.AllConfigurations[0];
        
        var tempFile = Path.GetTempFileName();
        try
        {
            using (var fileStream = File.Create(tempFile))
            {
                dynamic original = PtrHashTestHelpers.CreatePtrHash(config, keys);
                using (original)
                {
                    original.Serialize(fileStream);
                }
            }
            
            using (var fileStream = File.OpenRead(tempFile))
            {
                using var loaded = PtrHashTestHelpers.DeserializePtrHash<ulong>(config, fileStream);
                PtrHashTestHelpers.VerifyCorrectness(loaded, keys, config.Name);
            }
        }
        finally
        {
            File.Delete(tempFile);
        }
    }
    
    // Helper method for round-trip testing
    private static void TestRoundTrip<TKey>(TestConfig config, TKey[] keys, Stream stream)
        where TKey : notnull
    {
        dynamic original = PtrHashTestHelpers.CreatePtrHash(config, keys);
        using (original)
        {
            original.Serialize(stream);
        }
        
        stream.Position = 0;
        using var loaded = PtrHashTestHelpers.DeserializePtrHash<TKey>(config, stream);
        
        PtrHashTestHelpers.VerifyCorrectness(loaded, keys, config.Name);
    }
    
    // Helper method for memory-mapped round-trip testing
    private static unsafe void TestRoundTripMemoryMapped<TKey>(TestConfig config, TKey[] keys)
        where TKey : notnull
    {
        var tempFile = Path.GetTempFileName();
        try
        {
            dynamic original = PtrHashTestHelpers.CreatePtrHash(config, keys);
            using (original)
            {
                using var fileStream = File.Create(tempFile);
                original.Serialize(fileStream);
            }
            
            var fileInfo = new FileInfo(tempFile);
            using var mmf = MemoryMappedFile.CreateFromFile(tempFile, FileMode.Open, null, fileInfo.Length, MemoryMappedFileAccess.Read);
            using var accessor = mmf.CreateViewAccessor(0, fileInfo.Length, MemoryMappedFileAccess.Read);
            
            byte* ptr = null;
            accessor.SafeMemoryMappedViewHandle.AcquirePointer(ref ptr);
            try
            {
                using var loaded = PtrHashTestHelpers.DeserializePtrHashFromMemoryMap<TKey>(config, ptr, (nuint)fileInfo.Length);
                PtrHashTestHelpers.VerifyCorrectness(loaded, keys, config.Name + " (MemoryMapped)");
            }
            finally
            {
                accessor.SafeMemoryMappedViewHandle.ReleasePointer();
            }
        }
        finally
        {
            File.Delete(tempFile);
        }
    }
}