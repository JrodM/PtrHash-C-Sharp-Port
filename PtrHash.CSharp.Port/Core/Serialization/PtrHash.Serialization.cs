using System;
using System.IO;
using System.Runtime.InteropServices;
using PtrHash.CSharp.Port.Core.Serialization;
using PtrHash.CSharp.Port.Storage;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.BucketFunctions;

namespace PtrHash.CSharp.Port.Core
{
    // Partial class containing serialization methods
    public unsafe partial class PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage>
        where THasher : struct, IKeyHasher<TKey>
        where TBucketFunction : struct, IBucketFunction
        where TRemappingStorage : struct, IRemappingStorage<TRemappingStorage>
    {
        /// <summary>
        /// Serialize this PtrHash instance to a stream.
        /// </summary>
        public void Serialize(Stream stream)
        {
            if (stream == null)
                throw new ArgumentNullException(nameof(stream));
            if (!stream.CanWrite)
                throw new ArgumentException("Stream must be writable", nameof(stream));

            // Build header
            var header = new PtrHashFileFormat.FileHeader
            {
                Magic = PtrHashFileFormat.MagicNumber,
                VersionMajor = PtrHashFileFormat.CurrentMajorVersion,
                VersionMinor = PtrHashFileFormat.CurrentMinorVersion,
                Flags = GetSerializationFlags(),
                BucketFunctionType = (uint)PtrHashGenericTypes.ResolveBucketFunction<TBucketFunction>(),
                RemappingStorageType = (uint)PtrHashGenericTypes.ResolveRemappingStorage<TRemappingStorage>(),
                KeyHasherType = (uint)PtrHashGenericTypes.ResolveKeyHasher<THasher>(),
                
                // Core fields
                Seed = _seed,
                BucketsPerPart = _bucketsPerPart,
                SlotsPerPart = _slotsPerPart,
                NumKeys = _numKeys,
                
                // Get actual magic multipliers from the PtrHash instance
                BucketsPerPartMagic = (uint)_remBuckets.d,
                SlotsPerPartMagic = (uint)_remSlots.m,
                PartsCountMagic = _parts > 1 ? (uint)_remParts.d : 0,
                
                // Cold path data
                Parts = _parts,
                BucketsTotal = _bucketsTotal,
                SlotsTotal = _slotsTotal,
                BucketsTotalMagic = _bucketFunction.IsLinear ? (uint)_remBucketsTotal.d : 0
            };
            
            // Calculate remapping info
            if (_minimal)
            {
                // Store the byte size of remapping storage
                header.RemapCount = (ulong)TRemappingStorage.GetSizeInBytes(_remapStorage);
                header.RemapOffset = (ulong)(PtrHashFileFormat.HeaderSize + AlignTo64(_bucketsTotal));
            }
            else
            {
                header.RemapCount = 0;
                header.RemapOffset = 0;
            }
            
            // Write header
            WriteHeader(stream, header);
            
            // Write pilots array
            WritePilots(stream);
            
            // Write remapping storage if minimal
            if (_minimal)
            {
                WriteRemappingStorage(stream);
            }
        }
        
        /// <summary>
        /// Serialize this PtrHash instance to a file.
        /// </summary>
        public void SerializeToFile(string filePath)
        {
            using var fileStream = File.Create(filePath);
            Serialize(fileStream);
        }
        
        /// <summary>
        /// Deserialize a PtrHash from a stream.
        /// </summary>
        public static PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage> Deserialize(Stream stream)
        {
            if (stream == null)
                throw new ArgumentNullException(nameof(stream));
            if (!stream.CanRead)
                throw new ArgumentException("Stream must be readable", nameof(stream));

            // Read and validate header
            var header = ReadHeader(stream);
            
            // Create PtrHash instance - validation happens in constructor
            return new PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage>(stream, header);
        }
        
        /// <summary>
        /// Deserialize a PtrHash from a file.
        /// </summary>
        public static PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage> DeserializeFromFile(string filePath)
        {
            using var fileStream = File.OpenRead(filePath);
            return Deserialize(fileStream);
        }
        
        /// <summary>
        /// Deserialize a PtrHash from memory-mapped data (zero-copy).
        /// The caller is responsible for managing the memory mapping lifetime.
        /// </summary>
        public static PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage> DeserializeFromMemoryMap(
            byte* mappedDataPtr,
            nuint dataSize)
        {
            if (mappedDataPtr == null)
                throw new ArgumentNullException(nameof(mappedDataPtr));
            if (dataSize < PtrHashFileFormat.HeaderSize)
                throw new ArgumentException("Data size too small for header", nameof(dataSize));
                
            // Read and validate header
            var header = *(PtrHashFileFormat.FileHeader*)mappedDataPtr;
            if (!header.Validate())
                throw new InvalidOperationException("Invalid PtrHash file header");
                
            // Create PtrHash using memory-mapped constructor - type validation happens there
            return new PtrHash<TKey, THasher, TBucketFunction, TRemappingStorage>(mappedDataPtr, dataSize, header);
        }
        
        #region Serialization Helper Methods
        
        private static PtrHashFileFormat.FileHeader ReadHeader(Stream stream)
        {
            var headerBytes = new byte[PtrHashFileFormat.HeaderSize];
            var bytesRead = stream.Read(headerBytes, 0, headerBytes.Length);
            if (bytesRead != PtrHashFileFormat.HeaderSize)
                throw new InvalidOperationException("Incomplete header in stream");
                
            fixed (byte* ptr = headerBytes)
            {
                var header = *(PtrHashFileFormat.FileHeader*)ptr;
                if (!header.Validate())
                    throw new InvalidOperationException("Invalid PtrHash file header");
                return header;
            }
        }
        
        private void WriteHeader(Stream stream, in PtrHashFileFormat.FileHeader header)
        {
            var headerBytes = new byte[PtrHashFileFormat.HeaderSize];
            fixed (byte* ptr = headerBytes)
            {
                *(PtrHashFileFormat.FileHeader*)ptr = header;
            }
            stream.Write(headerBytes, 0, headerBytes.Length);
        }
        
        private void WritePilots(Stream stream)
        {
            // Write pilots array
            var pilotsSpan = new ReadOnlySpan<byte>(_pilots, (int)_bucketsTotal);
            stream.Write(pilotsSpan);
            
            // Add padding to align to 64 bytes
            var padding = AlignTo64(_bucketsTotal) - _bucketsTotal;
            if (padding > 0)
            {
                Span<byte> paddingBytes = stackalloc byte[(int)padding];
                paddingBytes.Clear();
                stream.Write(paddingBytes);
            }
        }
        
        private void WriteRemappingStorage(Stream stream)
        {
            TRemappingStorage.Serialize(_remapStorage, stream);
        }
        
        private PtrHashFileFormat.HeaderFlags GetSerializationFlags()
        {
            var flags = PtrHashFileFormat.HeaderFlags.None;
            
            if (_minimal)
                flags |= PtrHashFileFormat.HeaderFlags.IsMinimal;
                
            if (_isSinglePart)
                flags |= PtrHashFileFormat.HeaderFlags.IsSinglePart;
                
            return flags;
        }
        
        #endregion
    }
}