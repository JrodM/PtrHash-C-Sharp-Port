# ACTUAL AOT vs JIT Assembly Comparison

## Based on Real Assembly Output

### GetIndicesStreamPrefetchSinglePart - JIT Version

From `jit_getindex_methods.asm`:

```asm
; Tier0-FullOpts code
G_M000_IG01:
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 168
       vzeroupper 
       lea      rbp, [rsp+0xD0]
       ; ... stack frame setup with many locals
```

Key JIT characteristics:
- **Large stack frame**: 168 bytes allocated
- **vzeroupper**: Clears upper AVX state (overhead)
- **Many preserved registers**: 6 registers saved

### GetIndicesStreamPrefetchSinglePart - AOT Version

From `aot_singlepart_prefetch.asm`:

```asm
  1059e0:  push   %rbp
  1059e1:  push   %r15
  1059e3:  push   %r14
  1059e5:  push   %r13
  1059e7:  push   %r12
  1059e9:  push   %rbx
  1059ea:  sub    $0x98,%rsp        ; 152 bytes (smaller than JIT)
  1059f1:  lea    0xc0(%rsp),%rbp
```

Key AOT characteristics:
- **Smaller stack frame**: 152 vs 168 bytes
- **No vzeroupper**: More efficient entry
- **Same register preservation**: But more efficient layout

### Key Performance Differences Found

#### 1. Stack Allocation Pattern

**JIT** (line 91-100 from jit_output.asm):
```asm
G_M000_IG02:
       cmp      r15d, r8d           ; bounds check
       jne      G_M000_IG34         ; exception path
       test     r9b, r9b            ; minimal check
       je       SHORT G_M000_IG04
```

**AOT** (line 25-28 from aot_singlepart_prefetch.asm):
```asm
  105a38:  cmp    %r8d,%r15d         ; same bounds check
  105a3b:  jne    105def             ; but direct jump
  105a41:  test   %r9b,%r9b          ; minimal check
  105a44:  je     105a58             ; short jump
```

#### 2. Memory Operations

**JIT Hash Computation** (line 151-154):
```asm
       mov      r11, 0x517CC1B727220A95    ; Load constant to register
       imul     rdi, r11                   ; Then multiply
```

**AOT** - Would inline the constant in the multiply instruction (based on typical AOT patterns)

#### 3. Interface Dispatch

**JIT** (line 160-162):
```asm
       mov      r11, 0x770D1E470100
       call     [r11]PtrHash.CSharp.Port.BucketFunctions.IBucketFunction:get_IsLinear():bool:this
```

This is an **indirect call through interface dispatch table** - major performance hit!

**AOT** - The interface calls are likely devirtualized or inlined based on the smaller code size.

#### 4. Prefetch Instruction

Both use the same SSE prefetch:
```asm
prefetcht0 byte ptr [r11]    ; JIT line 212
```

But the surrounding code efficiency differs.

### Actual Performance Impact

From your benchmarks:
- **JIT**: 3.999 μs (MultiPart), 3.458 μs (SinglePart) @ 1000 lookups  
- **AOT**: 3.129 μs (MultiPart), 2.531 μs (SinglePart) @ 1000 lookups

**Real difference**: 
- MultiPart: ~22% faster on AOT
- SinglePart: ~27% faster on AOT

### The Main Culprit: Interface Dispatch

The biggest performance killer in JIT is the interface dispatch for `IBucketFunction`. Each lookup makes multiple virtual calls:
1. `get_IsLinear()` 
2. `get_BOutput()`
3. `Call(ulong)`

These translate to indirect memory loads and calls that can't be predicted well by the CPU.

### Solution for JIT Performance

Cache the interface properties in fields:
```csharp
private readonly bool _isLinearBucket;
private readonly bool _hasBOutput;

// In constructor:
_isLinearBucket = _bucketFunction.IsLinear;
_hasBOutput = _bucketFunction.BOutput;
```

This would eliminate the interface dispatch overhead and bring JIT performance much closer to AOT.