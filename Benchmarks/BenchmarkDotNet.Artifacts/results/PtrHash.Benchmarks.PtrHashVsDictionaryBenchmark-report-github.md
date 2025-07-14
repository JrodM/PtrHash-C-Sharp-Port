```

BenchmarkDotNet v0.13.12, Windows 11 (10.0.26100.4652)
Unknown processor
.NET SDK 9.0.301
  [Host]   : .NET 8.0.0 (8.0.23.53103), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI
  .NET 8.0 : .NET 8.0.0 (8.0.23.53103), X64 RyuJIT AVX-512F+CD+BW+DQ+VL+VBMI

Job=.NET 8.0  Runtime=.NET 8.0  

```
| Method                                | KeyCount | Mean      | Error    | StdDev   | Ratio | RatioSD | Gen0   | Allocated | Alloc Ratio |
|-------------------------------------- |--------- |----------:|---------:|---------:|------:|--------:|-------:|----------:|------------:|
| **DictionaryLookup**                      | **10000**    |  **54.96 μs** | **1.082 μs** | **1.328 μs** |  **1.00** |    **0.00** |      **-** |         **-** |          **NA** |
| PtrHashPointLookup                    | 10000    | 195.18 μs | 1.172 μs | 1.039 μs |  3.56 |    0.11 |      - |         - |          NA |
| PtrHashStreamLookup                   | 10000    |  23.66 μs | 0.236 μs | 0.221 μs |  0.43 |    0.01 |      - |         - |          NA |
| SentinelPtrHashStreamLookup           | 10000    |  33.49 μs | 0.434 μs | 0.385 μs |  0.61 |    0.02 | 9.5215 |   80024 B |          NA |
| SentinelPtrHashSinglePartStreamLookup | 10000    |  33.30 μs | 0.351 μs | 0.311 μs |  0.61 |    0.02 | 9.5215 |   80024 B |          NA |
|                                       |          |           |          |          |       |         |        |           |             |
| **DictionaryLookup**                      | **100000**   |  **77.55 μs** | **1.358 μs** | **1.270 μs** |  **1.00** |    **0.00** |      **-** |         **-** |          **NA** |
| PtrHashPointLookup                    | 100000   | 206.21 μs | 0.720 μs | 0.638 μs |  2.66 |    0.04 |      - |         - |          NA |
| PtrHashStreamLookup                   | 100000   |  23.04 μs | 0.306 μs | 0.272 μs |  0.30 |    0.01 |      - |         - |          NA |
| SentinelPtrHashStreamLookup           | 100000   |  35.98 μs | 0.713 μs | 1.022 μs |  0.47 |    0.02 | 9.5215 |   80024 B |          NA |
| SentinelPtrHashSinglePartStreamLookup | 100000   |  35.85 μs | 0.713 μs | 1.581 μs |  0.47 |    0.02 | 9.5215 |   80024 B |          NA |
|                                       |          |           |          |          |       |         |        |           |             |
| **DictionaryLookup**                      | **1000000**  |  **84.50 μs** | **1.540 μs** | **2.398 μs** |  **1.00** |    **0.00** |      **-** |         **-** |          **NA** |
| PtrHashPointLookup                    | 1000000  | 251.05 μs | 3.395 μs | 3.176 μs |  2.97 |    0.12 |      - |         - |          NA |
| PtrHashStreamLookup                   | 1000000  |  25.90 μs | 0.498 μs | 0.511 μs |  0.31 |    0.01 |      - |         - |          NA |
| SentinelPtrHashStreamLookup           | 1000000  |  39.97 μs | 0.793 μs | 1.430 μs |  0.47 |    0.02 | 9.5215 |   80024 B |          NA |
| SentinelPtrHashSinglePartStreamLookup | 1000000  |  37.35 μs | 0.721 μs | 0.937 μs |  0.44 |    0.02 | 9.5215 |   80024 B |          NA |
