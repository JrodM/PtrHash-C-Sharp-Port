using System;
using System.IO;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.Core.Serialization;
using PtrHash.CSharp.Port.Storage;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.BucketFunctions;

namespace PtrHash.CSharp.Port.Tests.Serialization;

[TestClass]
public class VersioningTest
{
    [TestMethod]
    public void FileFormat_UsesCorrectVersion()
    {
        // Version should be 3.1 based on our version.json
        Assert.AreEqual(3, PtrHashFileFormat.CurrentMajorVersion, "Major version should be 3");
        Assert.AreEqual(1, PtrHashFileFormat.CurrentMinorVersion, "Minor version should be 1");
    }
    
    [TestMethod]
    public void Serialization_WritesCorrectVersion()
    {
        var keys = new ulong[] { 1, 2, 3, 4, 5 };
        using var stream = new MemoryStream();
        
        // Create and serialize
        using (var ptrhash = new PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>(keys, PtrHashParams.DefaultCompact))
        {
            ptrhash.Serialize(stream);
        }
        
        // Read back the header
        stream.Position = 0;
        var headerBytes = new byte[PtrHashFileFormat.HeaderSize];
        stream.Read(headerBytes, 0, headerBytes.Length);
        
        unsafe
        {
            fixed (byte* ptr = headerBytes)
            {
                var header = *(PtrHashFileFormat.FileHeader*)ptr;
                
                // Verify version was written correctly
                Assert.AreEqual(3, header.VersionMajor, "Serialized major version should be 3");
                Assert.AreEqual(1, header.VersionMinor, "Serialized minor version should be 1");
            }
        }
    }
    
    [TestMethod]
    public void Deserialization_AcceptsCompatibleVersions()
    {
        var keys = new ulong[] { 1, 2, 3, 4, 5 };
        using var stream = new MemoryStream();
        
        // Create and serialize with current version
        using (var original = new PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>(keys, PtrHashParams.DefaultCompact))
        {
            original.Serialize(stream);
        }
        
        // Deserialize should work with same version
        stream.Position = 0;
        using var loaded = PtrHash<ulong, StrongerIntHasher, Linear, UInt32VectorRemappingStorage>.Deserialize(stream);
        
        // Verify it works
        Assert.AreEqual(keys[0], 1UL);
        var index = loaded.GetIndex(1);
        Assert.IsTrue(index < (nuint)keys.Length);
    }
}