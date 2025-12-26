using System;
using PtrHash.CSharp.Port.BucketFunctions;
using PtrHash.CSharp.Port.KeyHashers;
using PtrHash.CSharp.Port.Storage;

namespace PtrHash.CSharp.Port.Core
{
    /// <summary>
    /// Enumerations defining the types supported as generic parameters in PtrHash.
    /// These values are used for both runtime configuration and serialization.
    /// </summary>
    public static class PtrHashGenericTypes
    {
        /// <summary>
        /// Bucket function types supported by PtrHash.
        /// These values must remain stable for serialization backward compatibility.
        /// </summary>
        public enum BucketFunction : uint
        {
            Linear = 0,
            CubicEps = 1
        }
        
        /// <summary>
        /// Key hasher types supported by PtrHash.
        /// These values must remain stable for serialization backward compatibility.
        /// </summary>
        public enum KeyHasher : uint
        {
            FxHasher = 0,
            StringHasher = 1,
            StrongerIntHasher = 2,
            Xxh3Hasher = 3
        }
        
        /// <summary>
        /// Remapping storage types supported by PtrHash.
        /// Controls space/speed tradeoff for the remapping table.
        /// These values must remain stable for serialization backward compatibility.
        /// </summary>
        public enum RemappingStorage : uint
        {
            /// <summary>
            /// 8-bit values, most compact for small numbers
            /// </summary>
            VecU8 = 0,
            
            /// <summary>
            /// 16-bit values, good for medium numbers
            /// </summary>
            VecU16 = 1,
            
            /// <summary>
            /// 32-bit values, default
            /// </summary>
            VecU32 = 2,
            
            /// <summary>
            /// 64-bit values, supports largest numbers
            /// </summary>
            VecU64 = 3,
            
            /// <summary>
            /// CacheLineEF - Standard Elias-Fano compressed encoding, maximum compression
            /// </summary>
            CacheLineEF = 4
        }
        
        /// <summary>
        /// Resolves a bucket function type to its enum value based on the type.
        /// </summary>
        public static BucketFunction ResolveBucketFunction<TBucketFunction>()
        {
            return typeof(TBucketFunction) switch
            {
                Type t when t == typeof(Linear) => BucketFunction.Linear,
                Type t when t == typeof(CubicEps) => BucketFunction.CubicEps,
                Type t => throw new NotSupportedException($"Unsupported bucket function type: {t.Name}")
            };
        }
        
        /// <summary>
        /// Resolves a key hasher type to its enum value based on the type.
        /// </summary>
        public static KeyHasher ResolveKeyHasher<THasher>()
        {
            return typeof(THasher) switch
            {
                Type t when t == typeof(FxHasher) => KeyHasher.FxHasher,
                Type t when t == typeof(StringHasher) => KeyHasher.StringHasher,
                Type t when t == typeof(StrongerIntHasher) => KeyHasher.StrongerIntHasher,
                Type t when t == typeof(Xxh3Hasher) => KeyHasher.Xxh3Hasher,
                Type t => throw new NotSupportedException($"Unsupported key hasher type: {t.Name}")
            };
        }
        
        /// <summary>
        /// Resolves a remapping storage type to its enum value based on the type.
        /// </summary>
        public static RemappingStorage ResolveRemappingStorage<TRemappingStorage>()
        {
            return typeof(TRemappingStorage) switch
            {
                Type t when t == typeof(Byte8VectorRemappingStorage) => RemappingStorage.VecU8,
                Type t when t == typeof(UShort16VectorRemappingStorage) => RemappingStorage.VecU16,
                Type t when t == typeof(UInt32VectorRemappingStorage) => RemappingStorage.VecU32,
                Type t when t == typeof(UInt64VectorRemappingStorage) => RemappingStorage.VecU64,
                Type t when t == typeof(CachelineEfVec) => RemappingStorage.CacheLineEF,
                Type t => throw new NotSupportedException($"Unsupported remapping storage type: {t.Name}")
            };
        }
    }
}