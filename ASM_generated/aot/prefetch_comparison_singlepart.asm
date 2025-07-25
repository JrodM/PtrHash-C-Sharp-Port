0000000000105920 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart>:
  105920:	55                   	push   %rbp
  105921:	41 57                	push   %r15
  105923:	41 56                	push   %r14
  105925:	41 55                	push   %r13
  105927:	41 54                	push   %r12
  105929:	53                   	push   %rbx
  10592a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
  105931:	48 8d ac 24 c0 00 00 	lea    0xc0(%rsp),%rbp
  105938:	00 
  105939:	33 c0                	xor    %eax,%eax
  10593b:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
  105942:	45 0f 57 c0          	xorps  %xmm8,%xmm8
  105946:	44 0f 29 45 80       	movaps %xmm8,-0x80(%rbp)
  10594b:	44 0f 29 45 90       	movaps %xmm8,-0x70(%rbp)
  105950:	44 0f 29 45 a0       	movaps %xmm8,-0x60(%rbp)
  105955:	44 0f 29 45 b0       	movaps %xmm8,-0x50(%rbp)
  10595a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  10595e:	48 8b 05 83 6d 0b 00 	mov    0xb6d83(%rip),%rax        # 1bc6e8 <__security_cookie>
  105965:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  10596c:	48 8b df             	mov    %rdi,%rbx
  10596f:	4c 8b f6             	mov    %rsi,%r14
  105972:	44 8b fa             	mov    %edx,%r15d
  105975:	4c 8b e9             	mov    %rcx,%r13
  105978:	45 3b f8             	cmp    %r8d,%r15d
  10597b:	0f 85 96 03 00 00    	jne    105d17 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x3f7>
  105981:	45 84 c9             	test   %r9b,%r9b
  105984:	74 12                	je     105998 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x78>
  105986:	80 7b 5c 00          	cmpb   $0x0,0x5c(%rbx)
  10598a:	74 0c                	je     105998 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x78>
  10598c:	33 d2                	xor    %edx,%edx
  10598e:	48 83 7b 08 00       	cmpq   $0x0,0x8(%rbx)
  105993:	0f 95 c2             	setne  %dl
  105996:	eb 02                	jmp    10599a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x7a>
  105998:	33 d2                	xor    %edx,%edx
  10599a:	44 0f b6 e2          	movzbl %dl,%r12d
  10599e:	48 8b 43 40          	mov    0x40(%rbx),%rax
  1059a2:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  1059a6:	85 24 24             	test   %esp,(%rsp)
  1059a9:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1059b0:	48 8d 3c 24          	lea    (%rsp),%rdi
  1059b4:	48 89 bd 58 ff ff ff 	mov    %rdi,-0xa8(%rbp)
  1059bb:	33 f6                	xor    %esi,%esi
  1059bd:	ba 00 01 00 00       	mov    $0x100,%edx
  1059c2:	e8 59 18 f0 ff       	call   7220 <memset@plt>
  1059c7:	48 8b bd 58 ff ff ff 	mov    -0xa8(%rbp),%rdi
  1059ce:	48 8b c7             	mov    %rdi,%rax
  1059d1:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
  1059d8:	85 24 24             	test   %esp,(%rsp)
  1059db:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1059e2:	48 8d 3c 24          	lea    (%rsp),%rdi
  1059e6:	48 89 bd 50 ff ff ff 	mov    %rdi,-0xb0(%rbp)
  1059ed:	33 f6                	xor    %esi,%esi
  1059ef:	ba 00 01 00 00       	mov    $0x100,%edx
  1059f4:	e8 27 18 f0 ff       	call   7220 <memset@plt>
  1059f9:	48 8b bd 50 ff ff ff 	mov    -0xb0(%rbp),%rdi
  105a00:	48 8b c7             	mov    %rdi,%rax
  105a03:	48 8b 8d 48 ff ff ff 	mov    -0xb8(%rbp),%rcx
  105a0a:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
  105a0e:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  105a12:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  105a16:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  105a1a:	41 8b d7             	mov    %r15d,%edx
  105a1d:	41 b8 20 00 00 00    	mov    $0x20,%r8d
  105a23:	83 fa 20             	cmp    $0x20,%edx
  105a26:	45 0f 4c c7          	cmovl  %r15d,%r8d
  105a2a:	44 89 45 ac          	mov    %r8d,-0x54(%rbp)
  105a2e:	45 33 c9             	xor    %r9d,%r9d
  105a31:	45 85 c0             	test   %r8d,%r8d
  105a34:	0f 8e d1 02 00 00    	jle    105d0b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x3eb>
  105a3a:	49 63 d1             	movslq %r9d,%rdx
  105a3d:	49 8b 14 d6          	mov    (%r14,%rdx,8),%rdx
  105a41:	48 8b 7b 50          	mov    0x50(%rbx),%rdi
  105a45:	48 c1 c7 05          	rol    $0x5,%rdi
  105a49:	48 33 d7             	xor    %rdi,%rdx
  105a4c:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  105a53:	c1 7c 51 
  105a56:	48 0f af d7          	imul   %rdi,%rdx
  105a5a:	49 63 f9             	movslq %r9d,%rdi
  105a5d:	48 89 14 f9          	mov    %rdx,(%rcx,%rdi,8)
  105a61:	44 89 4d a0          	mov    %r9d,-0x60(%rbp)
  105a65:	49 63 d1             	movslq %r9d,%rdx
  105a68:	48 8b 34 d1          	mov    (%rcx,%rdx,8),%rsi
  105a6c:	48 8b 7b 68          	mov    0x68(%rbx),%rdi
  105a70:	48 8d 55 90          	lea    -0x70(%rbp),%rdx
  105a74:	e8 77 e7 f7 ff       	call   841f0 <S_P_CoreLib_System_Math___BigMul_g__SoftwareFallback_48_0>
  105a79:	8b 55 a0             	mov    -0x60(%rbp),%edx
  105a7c:	48 63 fa             	movslq %edx,%rdi
  105a7f:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
  105a83:	48 89 04 f9          	mov    %rax,(%rcx,%rdi,8)
  105a87:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
  105a8b:	48 63 f2             	movslq %edx,%rsi
  105a8e:	48 03 3c f1          	add    (%rcx,%rsi,8),%rdi
  105a92:	0f 18 0f             	prefetcht0 (%rdi)
  105a95:	ff c2                	inc    %edx
  105a97:	8b 7d ac             	mov    -0x54(%rbp),%edi
  105a9a:	3b d7                	cmp    %edi,%edx
  105a9c:	44 8b ca             	mov    %edx,%r9d
  105a9f:	0f 8c 5d 02 00 00    	jl     105d02 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x3e2>
  105aa5:	83 ff 20             	cmp    $0x20,%edi
  105aa8:	0f 8d 4b 02 00 00    	jge    105cf9 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x3d9>
  105aae:	48 63 d7             	movslq %edi,%rdx
  105ab1:	33 f6                	xor    %esi,%esi
  105ab3:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  105ab7:	48 89 34 d0          	mov    %rsi,(%rax,%rdx,8)
  105abb:	48 63 d7             	movslq %edi,%rdx
  105abe:	48 89 34 d1          	mov    %rsi,(%rcx,%rdx,8)
  105ac2:	ff c7                	inc    %edi
  105ac4:	83 ff 20             	cmp    $0x20,%edi
  105ac7:	0f 8c 27 02 00 00    	jl     105cf4 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x3d4>
  105acd:	45 33 c0             	xor    %r8d,%r8d
  105ad0:	41 8d 57 e0          	lea    -0x20(%r15),%edx
  105ad4:	45 33 c9             	xor    %r9d,%r9d
  105ad7:	85 d2                	test   %edx,%edx
  105ad9:	44 0f 4f ca          	cmovg  %edx,%r9d
  105add:	44 89 4d a4          	mov    %r9d,-0x5c(%rbp)
  105ae1:	45 85 c9             	test   %r9d,%r9d
  105ae4:	0f 8e 02 02 00 00    	jle    105cec <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x3cc>
  105aea:	41 8b d0             	mov    %r8d,%edx
  105aed:	c1 fa 1f             	sar    $0x1f,%edx
  105af0:	83 e2 1f             	and    $0x1f,%edx
  105af3:	41 03 d0             	add    %r8d,%edx
  105af6:	83 e2 e0             	and    $0xffffffe0,%edx
  105af9:	41 8b f8             	mov    %r8d,%edi
  105afc:	2b fa                	sub    %edx,%edi
  105afe:	4c 63 d7             	movslq %edi,%r10
  105b01:	4c 89 95 60 ff ff ff 	mov    %r10,-0xa0(%rbp)
  105b08:	4e 8b 1c d0          	mov    (%rax,%r10,8),%r11
  105b0c:	4c 89 9d 70 ff ff ff 	mov    %r11,-0x90(%rbp)
  105b13:	4e 8b 1c d1          	mov    (%rcx,%r10,8),%r11
  105b17:	4c 89 5d 98          	mov    %r11,-0x68(%rbp)
  105b1b:	44 89 45 a8          	mov    %r8d,-0x58(%rbp)
  105b1f:	41 8d 50 20          	lea    0x20(%r8),%edx
  105b23:	48 63 d2             	movslq %edx,%rdx
  105b26:	49 8b 14 d6          	mov    (%r14,%rdx,8),%rdx
  105b2a:	48 8b 73 50          	mov    0x50(%rbx),%rsi
  105b2e:	48 c1 c6 05          	rol    $0x5,%rsi
  105b32:	48 33 d6             	xor    %rsi,%rdx
  105b35:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  105b3c:	c1 7c 51 
  105b3f:	48 0f af d6          	imul   %rsi,%rdx
  105b43:	4a 89 14 d0          	mov    %rdx,(%rax,%r10,8)
  105b47:	4a 8b 34 d0          	mov    (%rax,%r10,8),%rsi
  105b4b:	48 8b 53 68          	mov    0x68(%rbx),%rdx
  105b4f:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
  105b56:	48 8d 55 88          	lea    -0x78(%rbp),%rdx
  105b5a:	48 8b bd 68 ff ff ff 	mov    -0x98(%rbp),%rdi
  105b61:	e8 8a e6 f7 ff       	call   841f0 <S_P_CoreLib_System_Math___BigMul_g__SoftwareFallback_48_0>
  105b66:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
  105b6a:	48 8b 95 60 ff ff ff 	mov    -0xa0(%rbp),%rdx
  105b71:	48 89 04 d1          	mov    %rax,(%rcx,%rdx,8)
  105b75:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
  105b79:	48 8b f7             	mov    %rdi,%rsi
  105b7c:	48 03 34 d1          	add    (%rcx,%rdx,8),%rsi
  105b80:	0f 18 0e             	prefetcht0 (%rsi)
  105b83:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
  105b87:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  105b8b:	8b fa                	mov    %edx,%edi
  105b8d:	48 33 7b 50          	xor    0x50(%rbx),%rdi
  105b91:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  105b98:	c1 7c 51 
  105b9b:	48 0f af fa          	imul   %rdx,%rdi
  105b9f:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  105ba3:	48 8b b5 70 ff ff ff 	mov    -0x90(%rbp),%rsi
  105baa:	48 33 fe             	xor    %rsi,%rdi
  105bad:	48 0f af 7a 08       	imul   0x8(%rdx),%rdi
  105bb2:	48 8b 32             	mov    (%rdx),%rsi
  105bb5:	48 8d 55 80          	lea    -0x80(%rbp),%rdx
  105bb9:	e8 32 e6 f7 ff       	call   841f0 <S_P_CoreLib_System_Math___BigMul_g__SoftwareFallback_48_0>
  105bbe:	48 8b f0             	mov    %rax,%rsi
  105bc1:	45 85 e4             	test   %r12d,%r12d
  105bc4:	74 20                	je     105be6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x2c6>
  105bc6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  105bca:	48 3b f0             	cmp    %rax,%rsi
  105bcd:	0f 82 14 01 00 00    	jb     105ce7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x3c7>
  105bd3:	2b f0                	sub    %eax,%esi
  105bd5:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  105bd9:	4c 8d 15 40 a3 14 00 	lea    0x14a340(%rip),%r10        # 24ff20 <__InterfaceDispatchCellSection_Start>
  105be0:	41 ff 12             	call   *(%r10)
  105be3:	48 8b f0             	mov    %rax,%rsi
  105be6:	8b 55 a8             	mov    -0x58(%rbp),%edx
  105be9:	48 63 fa             	movslq %edx,%rdi
  105bec:	49 89 74 fd 00       	mov    %rsi,0x0(%r13,%rdi,8)
  105bf1:	ff c2                	inc    %edx
  105bf3:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  105bf6:	3b d7                	cmp    %edi,%edx
  105bf8:	0f 8c d9 00 00 00    	jl     105cd7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x3b7>
  105bfe:	41 3b d7             	cmp    %r15d,%edx
  105c01:	0f 8d 9c 00 00 00    	jge    105ca3 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x383>
  105c07:	8b fa                	mov    %edx,%edi
  105c09:	c1 ff 1f             	sar    $0x1f,%edi
  105c0c:	83 e7 1f             	and    $0x1f,%edi
  105c0f:	03 fa                	add    %edx,%edi
  105c11:	83 e7 e0             	and    $0xffffffe0,%edi
  105c14:	89 55 a8             	mov    %edx,-0x58(%rbp)
  105c17:	8b f2                	mov    %edx,%esi
  105c19:	2b f7                	sub    %edi,%esi
  105c1b:	48 63 fe             	movslq %esi,%rdi
  105c1e:	4c 8b 75 c8          	mov    -0x38(%rbp),%r14
  105c22:	49 8b 3c fe          	mov    (%r14,%rdi,8),%rdi
  105c26:	48 8b 43 10          	mov    0x10(%rbx),%rax
  105c2a:	48 63 f6             	movslq %esi,%rsi
  105c2d:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
  105c31:	48 8b 34 f1          	mov    (%rcx,%rsi,8),%rsi
  105c35:	40 0f b6 34 30       	rex movzbl (%rax,%rsi,1),%esi
  105c3a:	48 33 73 50          	xor    0x50(%rbx),%rsi
  105c3e:	48 b8 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rax
  105c45:	c1 7c 51 
  105c48:	48 0f af f0          	imul   %rax,%rsi
  105c4c:	48 8d 43 78          	lea    0x78(%rbx),%rax
  105c50:	48 33 fe             	xor    %rsi,%rdi
  105c53:	48 0f af 78 08       	imul   0x8(%rax),%rdi
  105c58:	48 8b 30             	mov    (%rax),%rsi
  105c5b:	48 8d 95 78 ff ff ff 	lea    -0x88(%rbp),%rdx
  105c62:	e8 89 e5 f7 ff       	call   841f0 <S_P_CoreLib_System_Math___BigMul_g__SoftwareFallback_48_0>
  105c67:	48 8b f0             	mov    %rax,%rsi
  105c6a:	45 85 e4             	test   %r12d,%r12d
  105c6d:	74 1c                	je     105c8b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x36b>
  105c6f:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  105c73:	48 3b f0             	cmp    %rax,%rsi
  105c76:	72 5d                	jb     105cd5 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x3b5>
  105c78:	2b f0                	sub    %eax,%esi
  105c7a:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  105c7e:	4c 8d 15 9b a2 14 00 	lea    0x14a29b(%rip),%r10        # 24ff20 <__InterfaceDispatchCellSection_Start>
  105c85:	41 ff 12             	call   *(%r10)
  105c88:	48 8b f0             	mov    %rax,%rsi
  105c8b:	8b 7d a8             	mov    -0x58(%rbp),%edi
  105c8e:	48 63 c7             	movslq %edi,%rax
  105c91:	49 89 74 c5 00       	mov    %rsi,0x0(%r13,%rax,8)
  105c96:	ff c7                	inc    %edi
  105c98:	41 3b ff             	cmp    %r15d,%edi
  105c9b:	8b d7                	mov    %edi,%edx
  105c9d:	0f 8c 64 ff ff ff    	jl     105c07 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x2e7>
  105ca3:	33 ff                	xor    %edi,%edi
  105ca5:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
  105ca9:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
  105cad:	48 8d 3d 34 6a 0b 00 	lea    0xb6a34(%rip),%rdi        # 1bc6e8 <__security_cookie>
  105cb4:	48 8b 3f             	mov    (%rdi),%rdi
  105cb7:	48 39 bd 40 ff ff ff 	cmp    %rdi,-0xc0(%rbp)
  105cbe:	74 05                	je     105cc5 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x3a5>
  105cc0:	e8 8b 42 f0 ff       	call   9f50 <RhpFallbackFailFast>
  105cc5:	90                   	nop
  105cc6:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  105cca:	5b                   	pop    %rbx
  105ccb:	41 5c                	pop    %r12
  105ccd:	41 5d                	pop    %r13
  105ccf:	41 5e                	pop    %r14
  105cd1:	41 5f                	pop    %r15
  105cd3:	5d                   	pop    %rbp
  105cd4:	c3                   	ret
  105cd5:	eb b4                	jmp    105c8b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x36b>
  105cd7:	44 8b c2             	mov    %edx,%r8d
  105cda:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  105cde:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
  105ce2:	e9 03 fe ff ff       	jmp    105aea <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x1ca>
  105ce7:	e9 fa fe ff ff       	jmp    105be6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x2c6>
  105cec:	41 8b d0             	mov    %r8d,%edx
  105cef:	e9 0a ff ff ff       	jmp    105bfe <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x2de>
  105cf4:	e9 b5 fd ff ff       	jmp    105aae <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x18e>
  105cf9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  105cfd:	e9 cb fd ff ff       	jmp    105acd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x1ad>
  105d02:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  105d06:	e9 2f fd ff ff       	jmp    105a3a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x11a>
  105d0b:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
  105d0f:	8b 7d ac             	mov    -0x54(%rbp),%edi
  105d12:	e9 8e fd ff ff       	jmp    105aa5 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x185>
  105d17:	48 8d 3d 3a cd 14 00 	lea    0x14cd3a(%rip),%rdi        # 252a58 <_ZTV36S_P_CoreLib_System_ArgumentException>
  105d1e:	e8 41 f8 f5 ff       	call   65564 <RhpNewFast>
  105d23:	48 8b d8             	mov    %rax,%rbx
  105d26:	48 8b fb             	mov    %rbx,%rdi
  105d29:	48 8d 35 58 95 13 00 	lea    0x139558(%rip),%rsi        # 23f288 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  105d30:	e8 bb 56 f8 ff       	call   8b3f0 <S_P_CoreLib_System_ArgumentException___ctor_0>
  105d35:	48 8b fb             	mov    %rbx,%rdi
  105d38:	e8 91 fa f5 ff       	call   657ce <RhpThrowEx>
  105d3d:	cc                   	int3
  105d3e:	90                   	nop
  105d3f:	90                   	nop

0000000000105d40 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart>:
  105d40:	55                   	push   %rbp
  105d41:	41 57                	push   %r15
  105d43:	41 56                	push   %r14
  105d45:	41 55                	push   %r13
  105d47:	41 54                	push   %r12
  105d49:	53                   	push   %rbx
  105d4a:	48 81 ec e8 00 00 00 	sub    $0xe8,%rsp
  105d51:	48 8d ac 24 10 01 00 	lea    0x110(%rsp),%rbp
  105d58:	00 
  105d59:	33 c0                	xor    %eax,%eax
  105d5b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  105d62:	45 0f 57 c0          	xorps  %xmm8,%xmm8
  105d66:	44 0f 29 85 40 ff ff 	movaps %xmm8,-0xc0(%rbp)
  105d6d:	ff 
  105d6e:	44 0f 29 85 50 ff ff 	movaps %xmm8,-0xb0(%rbp)
  105d75:	ff 
  105d76:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  105d7d:	ff ff ff 
  105d80:	44 0f 29 44 05 c0    	movaps %xmm8,-0x40(%rbp,%rax,1)
  105d86:	44 0f 29 44 05 d0    	movaps %xmm8,-0x30(%rbp,%rax,1)
  105d8c:	44 0f 29 44 05 e0    	movaps %xmm8,-0x20(%rbp,%rax,1)
