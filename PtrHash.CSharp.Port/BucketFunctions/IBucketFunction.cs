namespace PtrHash.CSharp.Port.BucketFunctions
{
    public interface IBucketFunction
    {
        bool IsLinear { get; }
        bool BOutput { get; }
        
        void SetBucketsPerPart(ulong b);
        ulong Call(ulong x);
    }
}