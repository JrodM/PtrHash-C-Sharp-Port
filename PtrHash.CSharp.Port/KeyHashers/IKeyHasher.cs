using PtrHash.CSharp.Port.KeyHashers;

namespace PtrHash.CSharp.Port.KeyHashers
{
    /// <summary>
    /// Interface for key hashing functions used by PtrHash
    /// Uses static abstract methods for better monomorphism and performance
    /// </summary>
    /// <typeparam name="TKey">The type of keys to hash</typeparam>
    public interface IKeyHasher<TKey>
    {
        static abstract HashValue Hash(TKey key, ulong seed);
    }
}