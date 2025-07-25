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

; Assembly listing for method PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetchMultiPart(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this (Tier1)
; Emitting BLENDED_CODE for X64 with AVX - Unix
; Tier1 code
; optimized code
; rbp based frame
; fully interruptible
; No PGO data
; 0 inlinees with PGO data; 236 single block inlinees; 36 inlinees without PGO data

G_M000_IG01:                ;; offset=0x0000
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 456
       lea      rbp, [rsp+0x1F0]
       vxorps   xmm8, xmm8, xmm8
       vmovdqa  xmmword ptr [rbp-0x60], xmm8
       vmovdqa  xmmword ptr [rbp-0x50], xmm8
       xor      eax, eax
       mov      qword ptr [rbp-0x40], rax
       mov      qword ptr [rbp-0x1E8], 0xBB76881
       mov      rbx, rdi
       mov      r15d, edx
 
G_M000_IG02:                ;; offset=0x003F
       cmp      r15d, r8d
       jne      G_M000_IG38
       test     r9b, r9b
       je       SHORT G_M000_IG04
 
G_M000_IG03:                ;; offset=0x004D
       movzx    rdx, byte  ptr [rbx+0x54]
       jmp      SHORT G_M000_IG05
       align    [0 bytes for IG13]
 
G_M000_IG04:                ;; offset=0x0053
       xor      edx, edx
 
G_M000_IG05:                ;; offset=0x0055
       movzx    r14, dl
       mov      dword ptr [rbp-0x2C], r14d
       mov      r13, qword ptr [rbx+0x38]
       mov      qword ptr [rbp-0x38], r13
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      r12, [rsp]
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      rax, [rsp]
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      r8, [rsp]
       mov      r9, rsi
       mov      bword ptr [rbp-0x1D8], r9
       mov      bword ptr [rbp-0x1E0], rcx
       mov      bword ptr [rbp-0x40], r12
       mov      bword ptr [rbp-0x50], rax
       mov      qword ptr [rbp-0x48], rax
       mov      bword ptr [rbp-0x60], r8
       mov      qword ptr [rbp-0x58], r8
       mov      edx, r15d
       mov      r11d, 32
       cmp      edx, 32
       mov      dword ptr [rbp-0x16C], r15d
       cmovl    r11d, r15d
       mov      dword ptr [rbp-0x64], r11d
       mov      ecx, r11d
       and      ecx, -4
       mov      dword ptr [rbp-0x68], ecx
       xor      esi, esi
       test     ecx, ecx
       jle      G_M000_IG37
 
G_M000_IG06:                ;; offset=0x00E2
       movsxd   rdx, esi
       mov      rdx, qword ptr [r9+8*rdx]
       mov      qword ptr [rbp-0x78], rdx
       lea      edi, [rsi+0x01]
       movsxd   rdi, edi
       mov      qword ptr [rbp-0x1C0], rdi
       mov      rcx, qword ptr [r9+8*rdi]
       mov      qword ptr [rbp-0x80], rcx
       lea      r11d, [rsi+0x02]
       movsxd   r11, r11d
       mov      qword ptr [rbp-0x1C8], r11
       mov      rcx, qword ptr [r9+8*r11]
       mov      qword ptr [rbp-0x88], rcx
       lea      ecx, [rsi+0x03]
       movsxd   rcx, ecx
       mov      qword ptr [rbp-0x1D0], rcx
       mov      rdx, qword ptr [r9+8*rcx]
       mov      qword ptr [rbp-0x90], rdx
       mov      rdx, qword ptr [rbp-0x78]
       xor      rdx, qword ptr [rbx+0x48]
       mov      qword ptr [rbp-0x190], rdx
       mov      rdx, 0x517CC1B727220A95
       mov      qword ptr [rbp-0x1F0], rdx
       lea      r13, [rbp-0x118]
       mov      rdx, qword ptr [rbp-0x190]
       mov      r14, qword ptr [rbp-0x1F0]
       mulx     rdx, r10, r14
       mov      qword ptr [r13], r10
       mov      r10, qword ptr [rbp-0x118]
       xor      rdx, r10
       imul     rdx, r14
       movsxd   r10, esi
       mov      qword ptr [r12+8*r10], rdx
       mov      rdx, qword ptr [rbp-0x80]
       xor      rdx, qword ptr [rbx+0x48]
       lea      r10, [rbp-0x120]
       mulx     rdx, r13, r14
       mov      qword ptr [r10], r13
       mov      r10, qword ptr [rbp-0x120]
       xor      rdx, r10
       imul     rdx, r14
       mov      qword ptr [r12+8*rdi], rdx
       mov      rdx, qword ptr [rbp-0x88]
       xor      rdx, qword ptr [rbx+0x48]
       lea      r10, [rbp-0x128]
       mulx     rdx, r13, r14
       mov      qword ptr [r10], r13
       mov      r10, qword ptr [rbp-0x128]
       xor      rdx, r10
       imul     rdx, r14
       mov      qword ptr [r12+8*r11], rdx
       mov      rdx, qword ptr [rbp-0x90]
       xor      rdx, qword ptr [rbx+0x48]
       lea      r10, [rbp-0x130]
       mulx     rdx, r13, r14
       mov      qword ptr [r10], r13
       mov      r10, qword ptr [rbp-0x130]
       xor      rdx, r10
       imul     rdx, r14
       mov      qword ptr [r12+8*rcx], rdx
       movsxd   rdx, esi
       mov      r10, qword ptr [r12+8*rdx]
       mov      r14, qword ptr [r12+8*rdi]
 
G_M000_IG07:                ;; offset=0x0212
       mov      qword ptr [rbp-0x98], r14
       mov      r13, qword ptr [r12+8*r11]
       mov      qword ptr [rbp-0xA0], r13
       mov      rdx, qword ptr [r12+8*rcx]
       mov      qword ptr [rbp-0xA8], rdx
       mov      r13, qword ptr [rbx+0x68]
       lea      r14, [rbp-0x138]
       mov      rdx, r13
       mulx     r13, r15, r10
       mov      qword ptr [r14], r15
       mov      r10, qword ptr [rbp-0x138]
       mov      qword ptr [rbp-0xB0], r13
       mov      qword ptr [rbp-0xB8], r10
       mov      rdx, qword ptr [rbx+0x68]
       lea      r15, [rbp-0x140]
       mov      r14, qword ptr [rbp-0x98]
       mulx     r14, r10, r14
       mov      qword ptr [r15], r10
       mov      r10, qword ptr [rbp-0x140]
       mov      qword ptr [rbp-0xC0], r14
       mov      qword ptr [rbp-0xC8], r10
       mov      rdx, qword ptr [rbx+0x68]
       lea      r15, [rbp-0x148]
       mov      r10, qword ptr [rbp-0xA0]
       mulx     r10, r14, r10
       mov      qword ptr [r15], r14
       mov      rdx, qword ptr [rbp-0x148]
       mov      r15, r10
       mov      qword ptr [rbp-0xD0], r15
       mov      qword ptr [rbp-0xD8], rdx
       mov      r10, qword ptr [rbx+0x68]
       lea      r14, [rbp-0x150]
       mov      r15, qword ptr [rbp-0xA8]
       mov      rdx, r10
       mulx     r15, r13, r15
       mov      qword ptr [r14], r13
       mov      rdx, qword ptr [rbp-0x150]
       mov      qword ptr [rbp-0xE0], r15
       mov      qword ptr [rbp-0xE8], rdx
       mov      dword ptr [rbp-0x70], esi
       movsxd   r10, esi
       mov      r13, qword ptr [rbp-0xB0]
       mov      qword ptr [r8+8*r10], r13
       mov      r14, qword ptr [rbp-0xC0]
       mov      qword ptr [r8+8*rdi], r14
       mov      r10, qword ptr [rbp-0xD0]
       mov      qword ptr [r8+8*r11], r10
       mov      qword ptr [r8+8*rcx], r15
       mov      r14, qword ptr [rbx+0x70]
       lea      r13, [rbp-0x158]
       mov      r10, qword ptr [rbp-0xB8]
       mov      rdx, r14
       mulx     r14, r15, r10
       mov      qword ptr [r13], r15
       mov      rdx, qword ptr [rbx+0x70]
       lea      r10, [rbp-0x160]
       mov      r15, qword ptr [rbp-0xC8]
       mulx     r15, r13, r15
       mov      qword ptr [r10], r13
       mov      qword ptr [rbp-0xF0], r15
 
G_M000_IG08:                ;; offset=0x0357
       mov      rdx, qword ptr [rbx+0x70]
       lea      r10, [rbp-0x168]
       mov      r13, qword ptr [rbp-0xD8]
       mulx     r13, r15, r13
       mov      qword ptr [r10], r15
       mov      rdx, qword ptr [rbx+0x70]
       mov      r10, qword ptr [rbp-0xE8]
       mov      rdi, rdx
       xor      esi, esi
       mov      rdx, r10
       xor      ecx, ecx
       call     [System.UInt128:op_Multiply(System.UInt128,System.UInt128):System.UInt128]
       mov      rdi, rax
       mov      rsi, rdx
       mov      edx, 64
       call     [System.UInt128:op_UnsignedRightShift(System.UInt128,int):System.UInt128]
       mov      r15, qword ptr [rbp-0xB0]
       imul     r15, qword ptr [rbx+0x28]
       add      r15, r14
       mov      r14d, dword ptr [rbp-0x70]
       movsxd   rdi, r14d
       mov      r8, qword ptr [rbp-0x48]
       mov      qword ptr [r8+8*rdi], r15
       mov      r15, qword ptr [rbp-0xC0]
       imul     r15, qword ptr [rbx+0x28]
       add      r15, qword ptr [rbp-0xF0]
       mov      rdi, qword ptr [rbp-0x1C0]
       mov      qword ptr [r8+8*rdi], r15
       mov      r15, qword ptr [rbp-0xD0]
       imul     r15, qword ptr [rbx+0x28]
       add      r15, r13
       mov      r13, qword ptr [rbp-0x1C8]
       mov      qword ptr [r8+8*r13], r15
       mov      r15, qword ptr [rbp-0xE0]
       imul     r15, qword ptr [rbx+0x28]
       add      rax, r15
       mov      r15, qword ptr [rbp-0x1D0]
       mov      qword ptr [r8+8*r15], rax
       mov      rsi, qword ptr [rbx+0x08]
       movsxd   rdx, r14d
       mov      rcx, rsi
       add      rcx, qword ptr [r8+8*rdx]
       prefetcht0 byte  ptr [rcx]
       mov      rdx, rsi
       add      rdx, qword ptr [r8+8*rdi]
       prefetcht0 byte  ptr [rdx]
       mov      rdi, rsi
       add      rdi, qword ptr [r8+8*r13]
       prefetcht0 byte  ptr [rdi]
       add      rsi, qword ptr [r8+8*r15]
       prefetcht0 byte  ptr [rsi]
       add      r14d, 4
       mov      r15d, dword ptr [rbp-0x68]
       cmp      r14d, r15d
       mov      esi, r14d
       jl       G_M000_IG36
 
G_M000_IG09:                ;; offset=0x044D
       mov      r14d, dword ptr [rbp-0x64]
       cmp      r15d, r14d
       jge      G_M000_IG35
 
G_M000_IG10:                ;; offset=0x045A
       movsxd   rdi, r15d
       mov      r13, bword ptr [rbp-0x1D8]
       mov      rdi, qword ptr [r13+8*rdi]
       xor      rdi, qword ptr [rbx+0x48]
       xor      esi, esi
       mov      rdx, 0x517CC1B727220A95
       xor      ecx, ecx
       call     [System.UInt128:op_Multiply(System.UInt128,System.UInt128):System.UInt128]
       mov      qword ptr [rbp-0x198], rax
       mov      rsi, rdx
       mov      rdi, rax
       mov      edx, 64
       call     [System.UInt128:op_UnsignedRightShift(System.UInt128,int):System.UInt128]
       mov      rdi, qword ptr [rbp-0x198]
       xor      rdi, rax
       mov      rsi, 0x517CC1B727220A95
       imul     rdi, rsi
       movsxd   rsi, r15d
       mov      qword ptr [r12+8*rsi], rdi
       movsxd   rdi, r15d
       mov      rdx, qword ptr [r12+8*rdi]
       mov      rdi, qword ptr [rbx+0x68]
       xor      esi, esi
       xor      ecx, ecx
       call     [System.UInt128:op_Multiply(System.UInt128,System.UInt128):System.UInt128]
       mov      qword ptr [rbp-0x1A0], rax
       mov      rsi, rdx
       mov      rdi, rax
       mov      edx, 64
       call     [System.UInt128:op_UnsignedRightShift(System.UInt128,int):System.UInt128]
       mov      qword ptr [rbp-0x1A8], rax
       movsxd   rdi, r15d
       mov      rcx, qword ptr [rbp-0x58]
       mov      qword ptr [rcx+8*rdi], rax
       mov      rdi, qword ptr [rbx+0x70]
       call     [System.UInt128:op_Implicit(ulong):System.UInt128]
       mov      qword ptr [rbp-0x1B0], rax
       mov      qword ptr [rbp-0x1B8], rdx
       mov      rdi, qword ptr [rbp-0x1A0]
       call     [System.UInt128:op_Implicit(ulong):System.UInt128]
       mov      rcx, rdx
       mov      rdi, qword ptr [rbp-0x1B0]
       mov      rsi, qword ptr [rbp-0x1B8]
       mov      rdx, rax
       call     [System.UInt128:op_Multiply(System.UInt128,System.UInt128):System.UInt128]
       mov      rdi, rax
       mov      rsi, rdx
       mov      edx, 64
       call     [System.UInt128:op_RightShift(System.UInt128,int):System.UInt128]
       mov      rdi, rax
       mov      rsi, rdx
 
G_M000_IG11:                ;; offset=0x054D
       call     [System.UInt128:op_Explicit(System.UInt128):ulong]
       mov      rsi, qword ptr [rbp-0x1A8]
       imul     rsi, qword ptr [rbx+0x28]
       add      rsi, rax
       movsxd   rdi, r15d
       mov      rax, qword ptr [rbp-0x48]
       mov      qword ptr [rax+8*rdi], rsi
       mov      rsi, qword ptr [rbx+0x08]
       movsxd   rdi, r15d
       add      rsi, qword ptr [rax+8*rdi]
       prefetcht0 byte  ptr [rsi]
       inc      r15d
       cmp      r15d, r14d
       jl       G_M000_IG34
 
G_M000_IG12:                ;; offset=0x0587
       cmp      r14d, 32
       jge      G_M000_IG33
 
G_M000_IG13:                ;; offset=0x0591
       movsxd   rsi, r14d
       xor      edi, edi
       mov      qword ptr [r12+8*rsi], rdi
       movsxd   rsi, r14d
 
G_M000_IG14:                ;; offset=0x059D
       mov      qword ptr [rax+8*rsi], rdi
       movsxd   rsi, r14d
 
G_M000_IG15:                ;; offset=0x05A4
       mov      r15, qword ptr [rbp-0x58]
       mov      qword ptr [r15+8*rsi], rdi
       inc      r14d
       cmp      r14d, 32
       jl       G_M000_IG32
 
G_M000_IG16:                ;; offset=0x05B9
       xor      r14d, r14d
       mov      ecx, dword ptr [rbp-0x16C]
       lea      esi, [rcx-0x20]
       xor      edi, edi
       call     [System.Math:Max(int,int):int]
       mov      dword ptr [rbp-0x6C], eax
       test     eax, eax
       jle      G_M000_IG21
 
G_M000_IG17:                ;; offset=0x05D8
       mov      edi, r14d
       sar      edi, 31
       and      edi, 31
       add      edi, r14d
       and      edi, -32
       mov      ecx, r14d
       sub      ecx, edi
       mov      dword ptr [rbp-0xF4], ecx
       movsxd   rdi, ecx
       mov      rdx, qword ptr [r12+8*rdi]
       mov      qword ptr [rbp-0x178], rdx
       movsxd   rdi, ecx
       mov      r8, qword ptr [rbp-0x48]
       mov      r9, qword ptr [r8+8*rdi]
       mov      qword ptr [rbp-0x100], r9
       movsxd   rdi, ecx
       mov      r10, qword ptr [r15+8*rdi]
       mov      qword ptr [rbp-0x108], r10
       lea      edi, [r14+0x20]
       movsxd   rdi, edi
       mov      rdi, qword ptr [r13+8*rdi]
       mov      rsi, qword ptr [rbx+0x48]
       call     [PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher:Hash(ulong,ulong):PtrHash.CSharp.Port.KeyHashers.HashValue]
       movsxd   rdi, dword ptr [rbp-0xF4]
       lea      rdi, [r12+8*rdi]
       mov      qword ptr [rdi], rax
       call     [PtrHash.CSharp.Port.KeyHashers.HashValue:High():ulong:this]
       mov      rsi, rax
       lea      rdi, bword ptr [rbx+0x68]
       call     [PtrHash.CSharp.Port.Computation.FastReduce:ReduceWithRemainder(ulong):System.ValueTuple`2[ulong,ulong]:this]
       mov      qword ptr [rbp-0x188], rax
       mov      rsi, rdx
       movsxd   rdi, dword ptr [rbp-0xF4]
       mov      qword ptr [r15+8*rdi], rax
       mov      rdi, rbx
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:BucketInPart(ulong):ulong:this]
       mov      rsi, qword ptr [rbp-0x188]
       imul     rsi, qword ptr [rbx+0x28]
       add      rsi, rax
       mov      edi, dword ptr [rbp-0xF4]
       movsxd   rax, edi
       mov      rcx, qword ptr [rbp-0x48]
       mov      qword ptr [rcx+8*rax], rsi
       mov      rsi, qword ptr [rbx+0x08]
       movsxd   rdi, edi
       mov      rax, rsi
       add      rax, qword ptr [rcx+8*rdi]
       prefetcht0 byte  ptr [rax]
       mov      rdi, qword ptr [rbp-0x100]
       movzx    rsi, byte  ptr [rsi+rdi]
       mov      rdi, rbx
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:HashPilot(ulong):ulong:this]
       mov      rdx, rax
       mov      rsi, qword ptr [rbp-0x178]
       mov      rdi, rbx
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:SlotInPartHp(PtrHash.CSharp.Port.KeyHashers.HashValue,ulong):ulong:this]
 
G_M000_IG18:                ;; offset=0x06CE
       mov      rdx, qword ptr [rbp-0x108]
       imul     rdx, qword ptr [rbx+0x18]
       add      rdx, rax
       cmp      dword ptr [rbp-0x2C], 0
       je       SHORT G_M000_IG20
 
G_M000_IG19:                ;; offset=0x06E3
       mov      rcx, qword ptr [rbp-0x38]
       cmp      rdx, rcx
       jb       G_M000_IG31
       mov      rdi, qword ptr [rbx+0x58]
       mov      rsi, qword ptr [rbx+0x60]
       sub      edx, ecx
       call     [PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage:Index(PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage,int):ulong]
       mov      rdx, rax
 
G_M000_IG20:                ;; offset=0x0703
       movsxd   rsi, r14d
       mov      rcx, bword ptr [rbp-0x1E0]
       mov      qword ptr [rcx+8*rsi], rdx
       inc      r14d
       mov      esi, dword ptr [rbp-0x6C]
       cmp      r14d, esi
       jl       G_M000_IG17
 
G_M000_IG21:                ;; offset=0x0720
       mov      r13d, dword ptr [rbp-0x16C]
       cmp      r14d, r13d
       jge      G_M000_IG25
 
G_M000_IG22:                ;; offset=0x0730
       mov      esi, r14d
       sar      esi, 31
       and      esi, 31
       add      esi, r14d
       and      esi, -32
       mov      edi, r14d
       sub      edi, esi
       movsxd   rsi, edi
       mov      rdx, qword ptr [r12+8*rsi]
       mov      qword ptr [rbp-0x180], rdx
       movsxd   rsi, edi
       mov      r8, qword ptr [rbp-0x48]
       mov      rsi, qword ptr [r8+8*rsi]
       movsxd   rdi, edi
       mov      r9, qword ptr [r15+8*rdi]
       mov      qword ptr [rbp-0x110], r9
       mov      rdi, qword ptr [rbx+0x08]
       movzx    rsi, byte  ptr [rdi+rsi]
       mov      rdi, rbx
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:HashPilot(ulong):ulong:this]
       moJIT warmup complete.
Running streaming tests to generate assembly...
v      rdx, rax
       mov      rsi, qword ptr [rbp-0x180]
       mov      rdi, rbx
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:SlotInPartHp(PtrHash.CSharp.Port.KeyHashers.HashValue,ulong):ulong:this]
       mov      rdx, qword ptr [rbp-0x110]
       imul     rdx, qword ptr [rbx+0x18]
       add      rdx, rax
       cmp      dword ptr [rbp-0x2C], 0
       je       SHORT G_M000_IG24
 
G_M000_IG23:                ;; offset=0x07A5
       mov      rcx, qword ptr [rbp-0x38]
       cmp      rdx, rcx
       jb       SHORT G_M000_IG30
       mov      rdi, qword ptr [rbx+0x58]
       mov      rsi, qword ptr [rbx+0x60]
       sub      edx, ecx
       call     [PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage:Index(PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage,int):ulong]
       mov      rdx, rax
 
G_M000_IG24:                ;; offset=0x07C1
       movsxd   rdi, r14d
       mov      rcx, bword ptr [rbp-0x1E0]
       mov      qword ptr [rcx+8*rdi], rdx
       inc      r14d
       cmp      r14d, r13d
       jl       G_M000_IG22
 
G_M000_IG25:                ;; offset=0x07DB
       xor      edi, edi
       mov      bword ptr [rbp-0x60], rdi
 
G_M000_IG26:                ;; offset=0x07E1
       mov      bword ptr [rbp-0x50], rdi
 
G_M000_IG27:                ;; offset=0x07E5
       mov      bword ptr [rbp-0x40], rdi
       cmp      qword ptr [rbp-0x1E8], 0xBB76881
       je       SHORT G_M000_IG28
       call     CORINFO_HELP_FAIL_FAST
 
G_M000_IG28:                ;; offset=0x07FB
       nop      
 
G_M000_IG29:                ;; offset=0x07FC
       lea      rsp, [rbp-0x28]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret      
 
G_M000_IG30:                ;; offset=0x080B
       jmp      SHORT G_M000_IG24
 
G_M000_IG31:                ;; offset=0x080D
       jmp      G_M000_IG20
 
G_M000_IG32:                ;; offset=0x0812
       mov      rax, qword ptr [rbp-0x48]
       jmp      G_M000_IG13
 
G_M000_IG33:                ;; offset=0x081B
       mov      r15, qword ptr [rbp-0x58]
       jmp      G_M000_IG16
 
G_M000_IG34:                ;; offset=0x0824
       jmp      G_M000_IG10
 
G_M000_IG35:                ;; offset=0x0829
       mov      rax, qword ptr [rbp-0x48]
       mov      r13, bword ptr [rbp-0x1D8]
       jmp      G_M000_IG12
 
G_M000_IG36:                ;; offset=0x0839
       mov      r8, qword ptr [rbp-0x58]
       mov      r9, bword ptr [rbp-0x1D8]
       jmp      G_M000_IG06
 
G_M000_IG37:                ;; offset=0x0849
       mov      r15d, dword ptr [rbp-0x68]
       jmp      G_M000_IG09
 
G_M000_IG38:                ;; offset=0x0852
       mov      rdi, 0x747CFEF95580
       call     CORINFO_HELP_NEWSFAST
       mov      rbx, rax
       mov      edi, 0x600
       mov      rsi, 0x747CFEFCA7B8
       call     CORINFO_HELP_STRCNS
       mov      rsi, rax
       mov      rdi, rbx
       call     [System.ArgumentException:.ctor(System.String):this]
       mov      rdi, rbx
       call     CORINFO_HELP_THROW
       int3     
 
; Total bytes of code 2189

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
       mov      rdi, 0x747D74404A88
       call     [System.Console:WriteLine(System.String)]
       moTesting GetIndicesStreamPrefetch...
  Processed 10000 keys with prefetching
Testing GetIndicesStream (no prefetch)...
  Processed 10000 keys without prefetching
Testing single lookups for comparison...
  Single lookup sum: 1003209853
Testing specific prefetch patterns...
  Tested prefetch patterns for 64, 512, and 4096 key batches
Assembly generation complete.
Check output for JIT-generated assembly or run with AOT for AOT assembly.
v      rsi, 0x743CE8001CD0
       mov      rsi, gword ptr [rsi]
       mov      esi, dword ptr [rsi+0x08]
       movsxd   rsi, esi
       mov      rdi, 0x747CFF6424B0
       call     CORINFO_HELP_NEWARR_1_VC
       mov      gword ptr [rbp-0x08], rax
       mov      rdi, 0x743CE8001CD8
       mov      rdi, gword ptr [rdi]
       mov      gword ptr [rbp-0x48], rdi
       mov      rdi, 0x743CE8001CD0
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
       mov      rdx, qword ptr [rbp-0x38]
       mov      rdi, gword ptr [rbp-0x48]
       mov      r9d, 1
       cmp      dword ptr [rdi], edi
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetch(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this]
       mov      rdi, 0x743CE8001CD8
       mov      rdi, gword ptr [rdi]
       mov      gword ptr [rbp-0x70], rdi
       mov      rdi, 0x743CE8001CD0
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
       mov      rsi, 0x747D74404AE8
       call     [System.Runtime.CompilerServices.DefaultInterpolatedStringHandler:AppendLiteral(System.String):this]
       mov      rsi, 0x743CE8001CD0
 
G_M000_IG03:                ;; offset=0x0165
       mov      rsi, gword ptr [rsi]
       mov      esi, dword ptr [rsi+0x08]
       lea      rdi, [rbp-0x30]
       call     [System.Runtime.CompilerServices.DefaultInterpolatedStringHandler:AppendFormatted[int](int):this]
       lea      rdi, [rbp-0x30]
       mov      rsi, 0x747D74404B18
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

