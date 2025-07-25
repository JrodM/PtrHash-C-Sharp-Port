ASM Generation Test for GetIndicesStreamPrefetch
================================================
Created PtrHash with 100000 keys
Query set: 10000 keys

Warming up JIT...
; Assembly listing for method PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetch(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this (Tier0)
; Emitting BLENDED_CODE for X64 with AVX - Unix
; Tier0 code
; rbp based frame
; partially interruptible

G_M000_IG01:                ;; offset=0x0000
       push     rbp
       sub      rsp, 48
       lea      rbp, [rsp+0x30]
       mov      gword ptr [rbp-0x08], rdi
       mov      bword ptr [rbp-0x18], rsi
       mov      qword ptr [rbp-0x10], rdx
       mov      bword ptr [rbp-0x28], rcx
       mov      qword ptr [rbp-0x20], r8
       mov      dword ptr [rbp-0x2C], r9d
 
G_M000_IG02:                ;; offset=0x0022
 
G_M000_IG03:                ;; offset=0x0022
       mov      rsi, gword ptr [rbp-0x08]
       movzx    rsi, byte  ptr [rsi+0x55]
       test     esi, esi
       je       SHORT G_M000_IG05
       mov      rsi, bword ptr [rbp-0x18]
       mov      rdx, qword ptr [rbp-0x10]
       mov      rcx, bword ptr [rbp-0x28]
       mov      r8, qword ptr [rbp-0x20]
       mov      r9d, dword ptr [rbp-0x2C]
       movzx    r9, r9b
       mov      rdi, gword ptr [rbp-0x08]
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetchSinglePart(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this]
       nop      
 
G_M000_IG04:                ;; offset=0x0052
       add      rsp, 48
       pop      rbp
       ret      
 
G_M000_IG05:                ;; offset=0x0058
       mov      rsi, bword ptr [rbp-0x18]
       mov      rdx, qword ptr [rbp-0x10]
       mov      rcx, bword ptr [rbp-0x28]
       mov      r8, qword ptr [rbp-0x20]
       mov      r9d, dword ptr [rbp-0x2C]
       movzx    r9, r9b
       mov      rdi, gword ptr [rbp-0x08]
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetchMultiPart(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this]
       nop      
 
G_M000_IG06:                ;; offset=0x007B
       add      rsp, 48
       pop      rbp
       ret      
 
; Total bytes of code 129

; Assembly listing for method PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetchMultiPart(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this (Tier0-FullOpts)
; Emitting BLENDED_CODE for X64 with AVX - Unix
; Tier-0 switched to FullOpts code
; optimized code
; rbp based frame
; fully interruptible
; No PGO data
; 0 inlinees with PGO data; 146 single block inlinees; 27 inlinees without PGO data

G_M000_IG01:                ;; offset=0x0000
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 168
       vzeroupper 
       lea      rbp, [rsp+0xD0]
       vxorps   xmm8, xmm8, xmm8
       vmovdqa  xmmword ptr [rbp-0xA0], xmm8
       mov      rax, -96
       vmovdqa  xmmword ptr [rbp+rax-0x30], xmm8
       vmovdqa  xmmword ptr [rbp+rax-0x20], xmm8
       vmovdqa  xmmword ptr [rbp+rax-0x10], xmm8
       add      rax, 48
       jne      SHORT  -5 instr
       mov      qword ptr [rbp-0xC8], 0xBAECC64
 
G_M000_IG02:                ;; offset=0x0056
       cmp      edx, r8d
       jne      G_M000_IG31
       test     r9b, r9b
       je       SHORT G_M000_IG04
 
G_M000_IG03:                ;; offset=0x0064
       movzx    rax, byte  ptr [rdi+0x54]
       jmp      SHORT G_M000_IG05
       align    [0 bytes for IG06]
 
G_M000_IG04:                ;; offset=0x006A
       xor      eax, eax
 
G_M000_IG05:                ;; offset=0x006C
       movzx    rax, al
       mov      r8, qword ptr [rdi+0x38]
       mov      qword ptr [rbp-0x30], r8
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      r9, [rsp]
       vxorps   ymm0, ymm0, ymm0
       vmovdqu  ymmword ptr [r9], ymm0
       vmovdqu  ymmword ptr [r9+0x20], ymm0
       vmovdqu  ymmword ptr [r9+0x40], ymm0
       vmovdqu  ymmword ptr [r9+0x60], ymm0
       vmovdqu  ymmword ptr [r9+0x80], ymm0
       vmovdqu  ymmword ptr [r9+0xA0], ymm0
       vmovdqu  ymmword ptr [r9+0xC0], ymm0
       vmovdqu  ymmword ptr [r9+0xE0], ymm0
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      r10, [rsp]
       vxorps   ymm0, ymm0, ymm0
       vmovdqu  ymmword ptr [r10], ymm0
       vmovdqu  ymmword ptr [r10+0x20], ymm0
       vmovdqu  ymmword ptr [r10+0x40], ymm0
       vmovdqu  ymmword ptr [r10+0x60], ymm0
       vmovdqu  ymmword ptr [r10+0x80], ymm0
       vmovdqu  ymmword ptr [r10+0xA0], ymm0
       vmovdqu  ymmword ptr [r10+0xC0], ymm0
       vmovdqu  ymmword ptr [r10+0xE0], ymm0
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      r11, [rsp]
       vxorps   ymm0, ymm0, ymm0
       vmovdqu  ymmword ptr [r11], ymm0
       vmovdqu  ymmword ptr [r11+0x20], ymm0
       vmovdqu  ymmword ptr [r11+0x40], ymm0
       vmovdqu  ymmword ptr [r11+0x60], ymm0
       vmovdqu  ymmword ptr [r11+0x80], ymm0
       vmovdqu  ymmword ptr [r11+0xA0], ymm0
       vmovdqu  ymmword ptr [r11+0xC0], ymm0
       vmovdqu  ymmword ptr [r11+0xE0], ymm0
       mov      bword ptr [rbp-0xC0], rcx
       mov      bword ptr [rbp-0x38], r9
       mov      bword ptr [rbp-0x40], r10
       mov      bword ptr [rbp-0x48], r11
       mov      ebx, edx
       mov      r15d, 32
       cmp      ebx, 32
       mov      dword ptr [rbp-0xA4], edx
       cmovl    r15d, edx
       mov      dword ptr [rbp-0x4C], r15d
       xor      ebx, ebx
       test     r15d, r15d
       jle      G_M000_IG30
 
G_M000_IG06:                ;; offset=0x0195
       movsxd   r14, ebx
       mov      r13, qword ptr [rsi+8*r14]
       xor      r13, qword ptr [rdi+0x48]
       mov      r12, 0x517CC1B727220A95
       lea      r15, [rbp-0x68]
       mov      rdx, r13
       mulx     rdx, rcx, r12
       mov      qword ptr [r15], rcx
       mov      rcx, qword ptr [rbp-0x68]
       xor      rdx, rcx
       imul     rdx, r12
       mov      qword ptr [r9+8*r14], rdx
       mov      rcx, qword ptr [r9+8*r14]
       mov      rdx, qword ptr [rdi+0x68]
       lea      r15, [rbp-0x70]
       mulx     rcx, r13, rcx
       mov      qword ptr [r15], r13
       mov      rdx, qword ptr [rbp-0x70]
       mov      qword ptr [rbp-0xB8], rdx
       mov      qword ptr [r11+8*r14], rcx
       mov      r15, qword ptr [rdi+0x70]
       lea      r13, [rbp-0x78]
       mov      r12, qword ptr [rbp-0xB8]
       mov      rdx, r15
       mulx     rdx, r8, r12
       mov      qword ptr [r13], r8
       imul     rcx, qword ptr [rdi+0x28]
       add      rdx, rcx
       mov      qword ptr [r10+8*r14], rdx
       mov      rdx, qword ptr [rdi+0x08]
       add      rdx, qword ptr [r10+8*r14]
       prefetcht0 byte  ptr [rdx]
       inc      ebx
       mov      r15d, dword ptr [rbp-0x4C]
       cmp      ebx, r15d
       jl       G_M000_IG29
 
G_M000_IG07:                ;; offset=0x022C
       cmp      r15d, 32
       jge      SHORT G_M000_IG11
       align    [14 bytes for IG08]
 
G_M000_IG08:                ;; offset=0x0240
       movsxd   rdx, r15d
       xor      ecx, ecx
       mov      qword ptr [r9+8*rdx], rcx
 
G_M000_IG09:                ;; offset=0x0249
       mov      qword ptr [r10+8*rdx], rcx
 
G_M000_IG10:                ;; offset=0x024D
       mov      qword ptr [r11+8*rdx], rcx
       inc      r15d
       cmp      r15d, 32
       jl       SHORT G_M000_IG08
 
G_M000_IG11:                ;; offset=0x025A
       xor      ecx, ecx
       mov      edx, dword ptr [rbp-0xA4]
       lea      r8d, [rdx-0x20]
       xor      ebx, ebx
       test     r8d, r8d
       cmovg    ebx, r8d
       mov      dword ptr [rbp-0x50], ebx
       test     ebx, ebx
       jle      G_M000_IG28
       align    [0 bytes for IG12]
 
G_M000_IG12:                ;; offset=0x027A
       mov      r8d, ecx
       sar      r8d, 31
       and      r8d, 31
       add      r8d, ecx
       and      r8d, -32
       mov      r15d, ecx
       sub      r15d, r8d
       movsxd   r8, r15d
       mov      r15, qword ptr [r9+8*r8]
       mov      qword ptr [rbp-0xB0], r15
       mov      r14, qword ptr [r10+8*r8]
       mov      r13, qword ptr [r11+8*r8]
       mov      qword ptr [rbp-0x58], r13
       lea      r12d, [rcx+0x20]
       movsxd   r12, r12d
       mov      r12, qword ptr [rsi+8*r12]
       xor      r12, qword ptr [rdi+0x48]
       mov      rdx, 0x517CC1B727220A95
       mov      qword ptr [rbp-0xD0], rdx
       lea      rbx, [rbp-0x80]
       mov      r13, qword ptr [rbp-0xD0]
       mov      rdx, r12
       mulx     rdx, r15, r13
       mov      qword ptr [rbx], r15
       mov      rbx, qword ptr [rbp-0x80]
       xor      rdx, rbx
       imul     rdx, r13
       mov      qword ptr [r9+8*r8], rdx
       mov      rbx, qword ptr [r9+8*r8]
       mov      rdx, qword ptr [rdi+0x68]
       lea      r15, [rbp-0x88]
       mulx     rdx, r13, rbx
       mov      qword ptr [r15], r13
       mov      rbx, qword ptr [rbp-0x88]
       mov      qword ptr [rbp-0x60], rdx
       mov      qword ptr [r11+8*r8], rdx
       mov      r15, qword ptr [rdi+0x70]
       lea      r13, [rbp-0x90]
       mov      rdx, r15
       mulx     rdx, r12, rbx
       mov      qword ptr [r13], r12
       mov      rbx, qword ptr [rbp-0x60]
       imul     rbx, qword ptr [rdi+0x28]
       add      rdx, rbx
       mov      qword ptr [r10+8*r8], rdx
       mov      rdx, qword ptr [rdi+0x08]
       mov      rbx, rdx
       add      rbx, qword ptr [r10+8*r8]
       prefetcht0 byte  ptr [rbx]
       movzx    rdx, byte  ptr [rdx+r14]
       xor      rdx, qword ptr [rdi+0x48]
       mov      r8, 0x517CC1B727220A95
       imul     rdx, r8
       lea      r8, bword ptr [rdi+0x80]
       mov      r15, qword ptr [rbp-0xB0]
       xor      rdx, r15
       imul     rdx, qword ptr [r8+0x08]
       mov      r8, qword ptr [r8]
       lea      rbx, [rbp-0x98]
       mulx     rdx, r15, r8
       mov      qword ptr [rbx], r15
       mov      r13, qword ptr [rbp-0x58]
       imul     r13, qword ptr [rdi+0x18]
       add      rdx, r13
 
G_M000_IG13:                ;; offset=0x0397
       test     eax, eax
       je       SHORT G_M000_IG15
 
G_M000_IG14:                ;; offset=0x039B
       mov      r8, qword ptr [rbp-0x30]
       cmp      rdx, r8
       jb       G_M000_IG27
       mov      rbx, qword ptr [rdi+0x58]
       sub      edx, r8d
       movsxd   rdx, edx
       mov      edx, dword ptr [rbx+4*rdx]
 
G_M000_IG15:                ;; offset=0x03B5
       movsxd   rbx, ecx
       mov      r15, bword ptr [rbp-0xC0]
       mov      qword ptr [r15+8*rbx], rdx
       inc      ecx
       mov      ebx, dword ptr [rbp-0x50]
       cmp      ecx, ebx
       jl       G_M000_IG26
 
G_M000_IG16:                ;; offset=0x03D0
       cmp      ecx, dword ptr [rbp-0xA4]
       jge      G_M000_IG20
       align    [0 bytes for IG17]
 
G_M000_IG17:                ;; offset=0x03DC
       mov      esi, ecx
       sar      esi, 31
       and      esi, 31
       add      esi, ecx
       and      esi, -32
       mov      ebx, ecx
       sub      ebx, esi
       movsxd   rsi, ebx
       mov      rbx, qword ptr [r9+8*rsi]
       mov      r14, qword ptr [r10+8*rsi]
       mov      rsi, qword ptr [r11+8*rsi]
       mov      r13, qword ptr [rdi+0x08]
       movzx    r14, byte  ptr [r14+r13]
       xor      r14, qword ptr [rdi+0x48]
       mov      r13, 0x517CC1B727220A95
       imul     r14, r13
       lea      r13, bword ptr [rdi+0x80]
       xor      rbx, r14
       imul     rbx, qword ptr [r13+0x08]
       mov      r14, qword ptr [r13]
       lea      r13, [rbp-0xA0]
       mov      rdx, rbx
       mulx     rdx, r12, r14
       mov      qword ptr [r13], r12
       imul     rsi, qword ptr [rdi+0x18]
       add      rdx, rsi
       teJIT warmup complete.
Running streaming tests to generate assembly...
st     eax, eax
       je       SHORT G_M000_IG19
 
G_M000_IG18:                ;; offset=0x0449
       mov      r8, qword ptr [rbp-0x30]
       cmp      rdx, r8
       jb       SHORT G_M000_IG25
       mov      rsi, qword ptr [rdi+0x58]
       sub      edx, r8d
       movsxd   rdx, edx
       mov      edx, dword ptr [rsi+4*rdx]
 
G_M000_IG19:                ;; offset=0x045F
       movsxd   rsi, ecx
       mov      qword ptr [r15+8*rsi], rdx
       inc      ecx
       mov      edx, dword ptr [rbp-0xA4]
       cmp      ecx, edx
       mov      dword ptr [rbp-0xA4], edx
       jl       G_M000_IG17
 
G_M000_IG20:                ;; offset=0x047C
       xor      edi, edi
       mov      bword ptr [rbp-0x48], rdi
 
G_M000_IG21:                ;; offset=0x0482
       mov      bword ptr [rbp-0x40], rdi
 
G_M000_IG22:                ;; offset=0x0486
       mov      bword ptr [rbp-0x38], rdi
       cmp      qword ptr [rbp-0xC8], 0xBAECC64
       je       SHORT G_M000_IG23
       call     CORINFO_HELP_FAIL_FAST
 
G_M000_IG23:                ;; offset=0x049C
       nop      
 
G_M000_IG24:                ;; offset=0x049D
       lea      rsp, [rbp-0x28]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret      
 
G_M000_IG25:                ;; offset=0x04AC
       jmp      SHORT G_M000_IG19
 
G_M000_IG26:                ;; offset=0x04AE
       jmp      G_M000_IG12
 
G_M000_IG27:                ;; offset=0x04B3
       jmp      G_M000_IG15
 
G_M000_IG28:                ;; offset=0x04B8
       mov      r15, bword ptr [rbp-0xC0]
       jmp      G_M000_IG16
 
G_M000_IG29:                ;; offset=0x04C4
       jmp      G_M000_IG06
 
G_M000_IG30:                ;; offset=0x04C9
       mov      r15d, dword ptr [rbp-0x4C]
       jmp      G_M000_IG07
 
G_M000_IG31:                ;; offset=0x04D2
       mov      rdi, 0x7F9C511C5580
       call     CORINFO_HELP_NEWSFAST
       mov      rbx, rax
       mov      edi, 0x600
       mov      rsi, 0x7F9C511FA7B8
       call     CORINFO_HELP_STRCNS
       mov      rsi, rax
       mov      rdi, rbx
       call     [System.ArgumentException:.ctor(System.String):this]
       mov      rdi, rbx
       call     CORINFO_HELP_THROW
       int3     
 
; Total bytes of code 1293

; Assembly listing for method AsmGeneration.Program:TestGetIndicesStreamPrefetch() (Tier0)
; Emitting BLENDED_CODE for X64 with AVX - Unix
; Tier0 code
; rbp based frame
; partially interruptible

G_M000_IG01:                ;; offset=0x0000
       push     rbp
       sub      rsp, 128
       lea      rbp, [rsp+0x80]
       vxorps   xmm8, xmm8, xmm8
       vmovdqa  xmmword ptr [rbp-0x80], xmm8
       vmovdqa  xmmword ptr [rbp-0x70], xmm8
       mov      rax, -96
       vmovdqa  xmmword ptr [rax+rbp], xmm8
       vmovdqa  xmmword ptr [rbp+rax+0x10], xmm8
       vmovdqa  xmmword ptr [rbp+rax+0x20], xmm8
       add      rax, 48
       jne      SHORT  -5 instr
 
G_M000_IG02:                ;; offset=0x0040
       mov      rdi, 0x7F9C50014AB8
       call     [System.Console:WriteLine(System.String)]
       mov      rsi, 0x7F5C44001CD0
       mov      rsi, gword ptr [rsi]
       mov      esi, dword ptr [rsi+0x08]
       movsxd   rsi, esi
       mov      rdi, 0x7F9C51872688
       call     CORINFO_HELP_NEWARR_1_VC
       mov      gword ptr [rbp-0x08], rax
       mov      rdi, 0x7F5C44001CD8
       mov      rdi, gword ptr [rdi]
       mov      gword ptr [rbp-0x48], rdi
       mov      rdi, 0x7F5C44001CD0
       mov      rdi, gword ptr [rdi]
       call     [System.ReadOnlySpan`1[ulong]:op_Implicit(ulong[]):System.ReadOnlySpan`1[ulong]]
       mov      bword ptr [rbp-0x40], rax
       mov      qword ptr [rbp-0x38], rdx
       mov      rdi, gword ptr [rbp-0x08]
       call     [System.Span`1[ulong]:op_Implicit(ulong[]):System.Span`1[ulong]]
       mov      bword ptr [rbp-0x58], rax
       mov      qword ptr [rbp-0x50], rdx
       mov      rcx, bword ptr [rbp-0x58]
       mov      r8, qword ptr [rbp-0x50]
       mov      rsi, bword ptr [rbp-0x40]
       mov      rdx, qTesting GetIndicesStreamPrefetch...
  Processed 10000 keys with prefetching
Testing GetIndicesStream (no prefetch)...
  Processed 10000 keys without prefetching
Testing single lookups for comparison...
  Single lookup sum: 1002350047
Testing specific prefetch patterns...
  Tested prefetch patterns for 64, 512, and 4096 key batches
Assembly generation complete.
Check output for JIT-generated assembly or run with AOT for AOT assembly.
word ptr [rbp-0x38]
       mov      rdi, gword ptr [rbp-0x48]
       mov      r9d, 1
       cmp      dword ptr [rdi], edi
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetch(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this]
       mov      rdi, 0x7F5C44001CD8
       mov      rdi, gword ptr [rdi]
       mov      gword ptr [rbp-0x70], rdi
       mov      rdi, 0x7F5C44001CD0
       mov      rdi, gword ptr [rdi]
       call     [System.ReadOnlySpan`1[ulong]:op_Implicit(ulong[]):System.ReadOnlySpan`1[ulong]]
       mov      bword ptr [rbp-0x68], rax
       mov      qword ptr [rbp-0x60], rdx
       mov      rdi, gword ptr [rbp-0x08]
       call     [System.Span`1[ulong]:op_Implicit(ulong[]):System.Span`1[ulong]]
       mov      bword ptr [rbp-0x80], rax
       mov      qword ptr [rbp-0x78], rdx
       mov      rcx, bword ptr [rbp-0x80]
       mov      r8, qword ptr [rbp-0x78]
       mov      rsi, bword ptr [rbp-0x68]
       mov      rdx, qword ptr [rbp-0x60]
       mov      rdi, gword ptr [rbp-0x70]
       xor      r9d, r9d
       cmp      dword ptr [rdi], edi
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetch(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this]
       lea      rdi, [rbp-0x30]
       mov      esi, 34
       mov      edx, 1
       call     [System.Runtime.CompilerServices.DefaultInterpolatedStringHandler:.ctor(int,int):this]
       lea      rdi, [rbp-0x30]
       mov      rsi, 0x7F9C50014B18
       call     [System.Runtime.CompilerServices.DefaultInterpolatedStringHandler:AppendLiteral(System.String):this]
       mov      rsi, 0x7F5C44001CD0
 
G_M000_IG03:                ;; offset=0x0165
       mov      rsi, gword ptr [rsi]
       mov      esi, dword ptr [rsi+0x08]
       lea      rdi, [rbp-0x30]
       call     [System.Runtime.CompilerServices.DefaultInterpolatedStringHandler:AppendFormatted[int](int):this]
       lea      rdi, [rbp-0x30]
       mov      rsi, 0x7F9C50014B48
       call     [System.Runtime.CompilerServices.DefaultInterpolatedStringHandler:AppendLiteral(System.String):this]
       lea      rdi, [rbp-0x30]
       call     [System.Runtime.CompilerServices.DefaultInterpolatedStringHandler:ToStringAndClear():System.String:this]
       mov      rdi, rax
       call     [System.Console:WriteLine(System.String)]
       nop      
 
G_M000_IG04:                ;; offset=0x019D
       add      rsp, 128
       pop      rbp
       ret      
 
; Total bytes of code 422

