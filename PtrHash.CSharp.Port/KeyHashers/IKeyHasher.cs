namespace PtrHash.CSharp.Port.KeyHashers
{
    /// <summary>
    /// Interface for key hashing functions used by PtrHash
    /// </summary>
    /// <typeparam name="TKey">The type of keys to hash</typeparam>
    public interface IKeyHasher<TKey>
    {
        /// <summary>
        /// Hash a key with a seed to a 64-bit value
        /// </summary>
        ulong Hash(TKey key, ulong seed);
    }
}