using System;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.BucketFunctions;
using PtrHash.CSharp.Port.Storage;

namespace PtrHash.CSharp.Port.Core.Serialization
{
    /// <summary>
    /// Validates that generic type parameters match the types stored in a serialized PtrHash file.
    /// </summary>
    internal static class PtrHashTypeValidator
    {
        /// <summary>
        /// Validate that the generic types match what's stored in the file header.
        /// </summary>
        public static void ValidateTypes<TKey, THasher, TBucketFunction, TRemappingStorage>(in PtrHashFileFormat.FileHeader header)
            where THasher : struct, IKeyHasher<TKey>
            where TBucketFunction : struct, IBucketFunction
            where TRemappingStorage : struct, IRemappingStorage<TRemappingStorage>
        {
            // Validate hasher type
            var expectedHasherType = (uint)PtrHashGenericTypes.ResolveKeyHasher<THasher>();
            
            if (header.KeyHasherType != expectedHasherType)
                throw new InvalidOperationException($"Key hasher type mismatch. Expected {typeof(THasher).Name}, found type ID {header.KeyHasherType}");
            
            // Validate bucket function type
            var expectedBucketType = (uint)PtrHashGenericTypes.ResolveBucketFunction<TBucketFunction>();
            
            if (header.BucketFunctionType != expectedBucketType)
                throw new InvalidOperationException($"Bucket function type mismatch. Expected {typeof(TBucketFunction).Name}, found type ID {header.BucketFunctionType}");
            
            // Validate remapping storage type
            var expectedStorageType = (uint)PtrHashGenericTypes.ResolveRemappingStorage<TRemappingStorage>();
            
            if (header.RemappingStorageType != expectedStorageType)
                throw new InvalidOperationException($"Remapping storage type mismatch. Expected {typeof(TRemappingStorage).Name}, found type ID {header.RemappingStorageType}");
        }
    }
}