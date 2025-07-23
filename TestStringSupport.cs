using System;
using PtrHash.CSharp.Interop.PtrHash;
using PtrHash.CSharp.Interop.Native;

class Program
{
    static void Main()
    {
        Console.WriteLine("Testing string support...");
        
        try
        {
            var keys = new string[] { "hello", "world" };
            Console.WriteLine($"Creating PtrHash with {keys.Length} string keys");
            
            using var hash = new PtrHashInterop<string>(keys);
            Console.WriteLine("PtrHash created successfully!");
            
            var info = hash.GetInfo();
            Console.WriteLine($"Key count: {info.KeyCount}, Bits per key: {info.BitsPerKey:F2}");
            
            // Test basic lookup
            var index1 = hash.GetIndex("hello");
            var index2 = hash.GetIndex("world");
            Console.WriteLine($"Index of 'hello': {index1}");
            Console.WriteLine($"Index of 'world': {index2}");
            
            Console.WriteLine("String support test completed successfully!");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
            Console.WriteLine($"Stack trace: {ex.StackTrace}");
        }
    }
}