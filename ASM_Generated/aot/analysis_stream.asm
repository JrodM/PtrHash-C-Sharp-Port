   77389:	e8 f2 08 00 00       	call   77c80 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream>
   7738e:	e8 8d 0e 00 00       	call   78220 <ASM_Analysis_AsmGeneration_Program__TestSingleLookups>
   77393:	e8 e8 11 00 00       	call   78580 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern>
   77398:	48 8d 3d d1 3a 1c 00 	lea    0x1c3ad1(%rip),%rdi        # 23ae70 <__Str_Assembly_generation_complete__E694E220ABB5E659C8FE3A93D59496D8C08AFB825EDBB706847AAF14012E93FD>
   7739f:	e8 ac 53 00 00       	call   7c750 <System_Console_System_Console__WriteLine_12>
   773a4:	48 8d 3d e5 43 1c 00 	lea    0x1c43e5(%rip),%rdi        # 23b790 <__Str_Check_output_for_JIT_generated_E88BF50A10FDFF15CB02EFCA372E5395BD12F2100779560FE4DB5574C46B7085>
   773ab:	e8 a0 53 00 00       	call   7c750 <System_Console_System_Console__WriteLine_12>
   773b0:	90                   	nop
   773b1:	48 83 c4 60          	add    $0x60,%rsp
   773b5:	5b                   	pop    %rbx
   773b6:	41 5d                	pop    %r13
   773b8:	41 5e                	pop    %r14
   773ba:	41 5f                	pop    %r15
   773bc:	5d                   	pop    %rbp
   773bd:	c3                   	ret
   773be:	e8 7d b4 01 00       	call   92840 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
   773c3:	cc                   	int3
   773c4:	90                   	nop
   773c5:	90                   	nop
   773c6:	90                   	nop
   773c7:	90                   	nop
   773c8:	90                   	nop
   773c9:	90                   	nop
   773ca:	90                   	nop
   773cb:	90                   	nop
   773cc:	90                   	nop
   773cd:	90                   	nop
   773ce:	90                   	nop
   773cf:	90                   	nop
   773d0:	90                   	nop
   773d1:	90                   	nop
   773d2:	90                   	nop
   773d3:	90                   	nop
   773d4:	90                   	nop
   773d5:	90                   	nop
   773d6:	90                   	nop
   773d7:	90                   	nop
   773d8:	90                   	nop
   773d9:	90                   	nop
   773da:	90                   	nop
   773db:	90                   	nop
   773dc:	90                   	nop
   773dd:	90                   	nop
   773de:	90                   	nop
   773df:	90                   	nop

   7799e:	e8 bd c3 08 00       	call   103d60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream>
   779a3:	33 db                	xor    %ebx,%ebx
   779a5:	4d 85 ff             	test   %r15,%r15
   779a8:	74 42                	je     779ec <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   779aa:	41 83 7f 08 64       	cmpl   $0x64,0x8(%r15)
   779af:	7c 3b                	jl     779ec <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   779b1:	48 8b 3d 18 a1 1a 00 	mov    0x1aa118(%rip),%rdi        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   779b8:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   779bc:	8b f3                	mov    %ebx,%esi
   779be:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   779c3:	39 3f                	cmp    %edi,(%rdi)
   779c5:	e8 a6 be 08 00       	call   103870 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   779ca:	48 8b 3d ff a0 1a 00 	mov    0x1aa0ff(%rip),%rdi        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   779d1:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   779d5:	8b f3                	mov    %ebx,%esi
   779d7:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   779dc:	39 3f                	cmp    %edi,(%rdi)
   779de:	e8 5d c0 08 00       	call   103a40 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   779e3:	ff c3                	inc    %ebx
   779e5:	83 fb 64             	cmp    $0x64,%ebx
   779e8:	7c c7                	jl     779b1 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x5d1>
   779ea:	eb 43                	jmp    77a2f <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x64f>
   779ec:	48 8b 3d dd a0 1a 00 	mov    0x1aa0dd(%rip),%rdi        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   779f3:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   779f7:	41 3b 5f 08          	cmp    0x8(%r15),%ebx
   779fb:	0f 83 a4 00 00 00    	jae    77aa5 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x6c5>
   77a01:	8b f3                	mov    %ebx,%esi
   77a03:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77a08:	39 3f                	cmp    %edi,(%rdi)
   77a0a:	e8 61 be 08 00       	call   103870 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   77a0f:	48 8b 3d ba a0 1a 00 	mov    0x1aa0ba(%rip),%rdi        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77a16:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77a1a:	8b f3                	mov    %ebx,%esi
   77a1c:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77a21:	39 3f                	cmp    %edi,(%rdi)
   77a23:	e8 18 c0 08 00       	call   103a40 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   77a28:	ff c3                	inc    %ebx
   77a2a:	83 fb 64             	cmp    $0x64,%ebx
   77a2d:	7c bd                	jl     779ec <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   77a2f:	48 8d 3d 82 79 1c 00 	lea    0x1c7982(%rip),%rdi        # 23f3b8 <__Str_JIT_warmup_complete__0DAE2BD7E8651565932C6EA373EC942BC13BA8E721DA0F4E914F424C749DD85D>
   77a36:	e8 15 4d 00 00       	call   7c750 <System_Console_System_Console__WriteLine_12>
   77a3b:	90                   	nop
   77a3c:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
   77a43:	5b                   	pop    %rbx
   77a44:	41 5c                	pop    %r12
   77a46:	41 5d                	pop    %r13
   77a48:	41 5e                	pop    %r14
   77a4a:	41 5f                	pop    %r15
   77a4c:	5d                   	pop    %rbp
   77a4d:	c3                   	ret
   77a4e:	bf 10 00 00 00       	mov    $0x10,%edi
   77a53:	e8 38 85 00 00       	call   7ff90 <System_Linq_System_Linq_ThrowHelper__ThrowArgumentNullException>
   77a58:	cc                   	int3
   77a59:	48 8d 3d 78 a3 1d 00 	lea    0x1da378(%rip),%rdi        # 251dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77a60:	e8 af da fe ff       	call   65514 <RhpNewFast>
   77a65:	48 8b d8             	mov    %rax,%rbx
   77a68:	48 8b fb             	mov    %rbx,%rdi
   77a6b:	48 8d 35 4e 7a 1c 00 	lea    0x1c7a4e(%rip),%rsi        # 23f4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77a72:	e8 f9 31 01 00       	call   8ac70 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77a77:	48 8b fb             	mov    %rbx,%rdi
   77a7a:	e8 ff dc fe ff       	call   6577e <RhpThrowEx>
   77a7f:	48 8d 3d 52 a3 1d 00 	lea    0x1da352(%rip),%rdi        # 251dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77a86:	e8 89 da fe ff       	call   65514 <RhpNewFast>
   77a8b:	48 8b d8             	mov    %rax,%rbx
   77a8e:	48 8b fb             	mov    %rbx,%rdi
   77a91:	48 8d 35 28 7a 1c 00 	lea    0x1c7a28(%rip),%rsi        # 23f4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77a98:	e8 d3 31 01 00       	call   8ac70 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77a9d:	48 8b fb             	mov    %rbx,%rdi
   77aa0:	e8 d9 dc fe ff       	call   6577e <RhpThrowEx>
   77aa5:	e8 16 31 05 00       	call   cabc0 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   77aaa:	cc                   	int3
   77aab:	90                   	nop
   77aac:	90                   	nop
   77aad:	90                   	nop
   77aae:	90                   	nop
   77aaf:	90                   	nop

0000000000077c80 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream>:
   77c80:	55                   	push   %rbp
   77c81:	41 57                	push   %r15
   77c83:	41 56                	push   %r14
   77c85:	41 55                	push   %r13
   77c87:	41 54                	push   %r12
   77c89:	53                   	push   %rbx
   77c8a:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
   77c91:	c5 f8 77             	vzeroupper
   77c94:	48 8d ac 24 00 01 00 	lea    0x100(%rsp),%rbp
   77c9b:	00 
   77c9c:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
   77ca1:	c5 79 7f 85 20 ff ff 	vmovdqa %xmm8,-0xe0(%rbp)
   77ca8:	ff 
   77ca9:	c5 79 7f 85 30 ff ff 	vmovdqa %xmm8,-0xd0(%rbp)
   77cb0:	ff 
   77cb1:	48 b8 70 ff ff ff ff 	movabs $0xffffffffffffff70,%rax
   77cb8:	ff ff ff 
   77cbb:	c5 79 7f 44 05 d0    	vmovdqa %xmm8,-0x30(%rbp,%rax,1)
   77cc1:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
   77cc7:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
   77ccd:	48 83 c0 30          	add    $0x30,%rax
   77cd1:	75 e8                	jne    77cbb <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3b>
   77cd3:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
   77cd7:	48 8d 3d 12 b9 1c 00 	lea    0x1cb912(%rip),%rdi        # 2435f0 <__Str_Testing_GetIndicesStream__no_p_3BADE5A8245CDE1F293826A4BEA915BC6A54827377AA32C6394D40F198A479BE>
   77cde:	e8 6d 4a 00 00       	call   7c750 <System_Console_System_Console__WriteLine_12>
   77ce3:	48 8b 35 e6 9d 1a 00 	mov    0x1a9de6(%rip),%rsi        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77cea:	48 8b 5e 10          	mov    0x10(%rsi),%rbx
   77cee:	8b 73 08             	mov    0x8(%rbx),%esi
   77cf1:	48 8d 3d 58 13 21 00 	lea    0x211358(%rip),%rdi        # 289050 <_ZTV16__Array<UIntPtr>>
   77cf8:	e8 2d d9 fe ff       	call   6562a <RhpNewArray>
   77cfd:	4c 8b f8             	mov    %rax,%r15
   77d00:	48 8b 15 c9 9d 1a 00 	mov    0x1a9dc9(%rip),%rdx        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77d07:	4c 8b 72 18          	mov    0x18(%rdx),%r14
   77d0b:	48 85 db             	test   %rbx,%rbx
   77d0e:	75 06                	jne    77d16 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x96>
   77d10:	33 d2                	xor    %edx,%edx
   77d12:	33 ff                	xor    %edi,%edi
   77d14:	eb 07                	jmp    77d1d <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x9d>
   77d16:	48 8d 53 10          	lea    0x10(%rbx),%rdx
   77d1a:	8b 7b 08             	mov    0x8(%rbx),%edi
   77d1d:	49 8d 77 10          	lea    0x10(%r15),%rsi
   77d21:	41 8b 47 08          	mov    0x8(%r15),%eax
   77d25:	41 80 7e 55 00       	cmpb   $0x0,0x55(%r14)
   77d2a:	0f 84 bb 01 00 00    	je     77eeb <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x26b>
   77d30:	3b f8                	cmp    %eax,%edi
   77d32:	0f 85 9a 04 00 00    	jne    781d2 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x552>
   77d38:	41 0f b6 4e 54       	movzbl 0x54(%r14),%ecx
   77d3d:	4d 8b 46 38          	mov    0x38(%r14),%r8
   77d41:	45 33 c9             	xor    %r9d,%r9d
   77d44:	85 ff                	test   %edi,%edi
   77d46:	4c 0f 45 ca          	cmovne %rdx,%r9
   77d4a:	4c 89 4d a8          	mov    %r9,-0x58(%rbp)
   77d4e:	33 d2                	xor    %edx,%edx
   77d50:	85 c0                	test   %eax,%eax
   77d52:	48 0f 45 d6          	cmovne %rsi,%rdx
   77d56:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   77d5a:	48 8b f2             	mov    %rdx,%rsi
   77d5d:	85 c9                	test   %ecx,%ecx
   77d5f:	0f 84 c4 00 00 00    	je     77e29 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x1a9>
   77d65:	33 c0                	xor    %eax,%eax
   77d67:	85 ff                	test   %edi,%edi
   77d69:	0f 8e 6d 01 00 00    	jle    77edc <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x25c>
   77d6f:	49 8d 9e 80 00 00 00 	lea    0x80(%r14),%rbx
   77d76:	48 63 d0             	movslq %eax,%rdx
   77d79:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   77d7d:	49 33 56 48          	xor    0x48(%r14),%rdx
   77d81:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77d88:	c1 7c 51 
   77d8b:	4c 8d 55 98          	lea    -0x68(%rbp),%r10
   77d8f:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   77d94:	4d 89 1a             	mov    %r11,(%r10)
   77d97:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   77d9b:	48 33 d1             	xor    %rcx,%rdx
   77d9e:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77da5:	c1 7c 51 
   77da8:	48 0f af d1          	imul   %rcx,%rdx
   77dac:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
   77db3:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   77db7:	4c 8d 55 90          	lea    -0x70(%rbp),%r10
   77dbb:	4c 8b 9d 18 ff ff ff 	mov    -0xe8(%rbp),%r11
   77dc2:	48 8b d1             	mov    %rcx,%rdx
   77dc5:	c4 c2 93 f6 d3       	mulx   %r11,%r13,%rdx
   77dca:	4d 89 2a             	mov    %r13,(%r10)
   77dcd:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   77dd1:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   77dd5:	49 33 56 48          	xor    0x48(%r14),%rdx
   77dd9:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77de0:	c1 7c 51 
   77de3:	48 0f af d1          	imul   %rcx,%rdx
   77de7:	48 8b cb             	mov    %rbx,%rcx
   77dea:	49 33 d3             	xor    %r11,%rdx
   77ded:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   77df2:	48 8b 09             	mov    (%rcx),%rcx
   77df5:	4c 8d 55 88          	lea    -0x78(%rbp),%r10
   77df9:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   77dfe:	4d 89 1a             	mov    %r11,(%r10)
   77e01:	49 3b d0             	cmp    %r8,%rdx
   77e04:	72 0d                	jb     77e13 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x193>
   77e06:	41 2b d0             	sub    %r8d,%edx
   77e09:	49 8b 4e 58          	mov    0x58(%r14),%rcx
   77e0d:	48 63 d2             	movslq %edx,%rdx
   77e10:	8b 14 91             	mov    (%rcx,%rdx,4),%edx
   77e13:	48 63 c8             	movslq %eax,%rcx
   77e16:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   77e1a:	ff c0                	inc    %eax
   77e1c:	3b c7                	cmp    %edi,%eax
   77e1e:	0f 8c 52 ff ff ff    	jl     77d76 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0xf6>
   77e24:	e9 b3 00 00 00       	jmp    77edc <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x25c>
   77e29:	33 c0                	xor    %eax,%eax
   77e2b:	85 ff                	test   %edi,%edi
   77e2d:	0f 8e a9 00 00 00    	jle    77edc <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x25c>
   77e33:	49 8d 9e 80 00 00 00 	lea    0x80(%r14),%rbx
   77e3a:	48 63 d0             	movslq %eax,%rdx
   77e3d:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   77e41:	49 33 56 48          	xor    0x48(%r14),%rdx
   77e45:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77e4c:	c1 7c 51 
   77e4f:	4c 8d 45 80          	lea    -0x80(%rbp),%r8
   77e53:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   77e58:	4d 89 10             	mov    %r10,(%r8)
   77e5b:	48 8b 4d 80          	mov    -0x80(%rbp),%rcx
   77e5f:	48 33 d1             	xor    %rcx,%rdx
   77e62:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77e69:	c1 7c 51 
   77e6c:	48 0f af d1          	imul   %rcx,%rdx
   77e70:	48 89 95 10 ff ff ff 	mov    %rdx,-0xf0(%rbp)
   77e77:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   77e7b:	4c 8d 85 78 ff ff ff 	lea    -0x88(%rbp),%r8
   77e82:	4c 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%r10
   77e89:	48 8b d1             	mov    %rcx,%rdx
   77e8c:	c4 c2 a3 f6 d2       	mulx   %r10,%r11,%rdx
   77e91:	4d 89 18             	mov    %r11,(%r8)
   77e94:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   77e98:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   77e9c:	49 33 56 48          	xor    0x48(%r14),%rdx
   77ea0:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77ea7:	c1 7c 51 
   77eaa:	48 0f af d1          	imul   %rcx,%rdx
   77eae:	48 8b cb             	mov    %rbx,%rcx
   77eb1:	49 33 d2             	xor    %r10,%rdx
   77eb4:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   77eb9:	48 8b 09             	mov    (%rcx),%rcx
   77ebc:	4c 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%r8
   77ec3:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   77ec8:	4d 89 10             	mov    %r10,(%r8)
   77ecb:	48 63 c8             	movslq %eax,%rcx
   77ece:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   77ed2:	ff c0                	inc    %eax
   77ed4:	3b c7                	cmp    %edi,%eax
   77ed6:	0f 8c 5e ff ff ff    	jl     77e3a <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x1ba>
   77edc:	33 d2                	xor    %edx,%edx
   77ede:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   77ee2:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
   77ee6:	e9 a3 01 00 00       	jmp    7808e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x40e>
   77eeb:	44 8b ef             	mov    %edi,%r13d
   77eee:	48 8b fe             	mov    %rsi,%rdi
   77ef1:	8b f0                	mov    %eax,%esi
   77ef3:	44 3b ee             	cmp    %esi,%r13d
   77ef6:	0f 85 fc 02 00 00    	jne    781f8 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x578>
   77efc:	41 0f b6 46 54       	movzbl 0x54(%r14),%eax
   77f01:	4d 8b 66 38          	mov    0x38(%r14),%r12
   77f05:	33 c9                	xor    %ecx,%ecx
   77f07:	45 85 ed             	test   %r13d,%r13d
   77f0a:	48 0f 45 ca          	cmovne %rdx,%rcx
   77f0e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
   77f15:	48 8b d9             	mov    %rcx,%rbx
   77f18:	33 d2                	xor    %edx,%edx
   77f1a:	85 f6                	test   %esi,%esi
   77f1c:	48 0f 45 d7          	cmovne %rdi,%rdx
   77f20:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
   77f27:	48 8b ca             	mov    %rdx,%rcx
   77f2a:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
   77f31:	85 c0                	test   %eax,%eax
   77f33:	0f 84 18 01 00 00    	je     78051 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3d1>
   77f39:	33 c0                	xor    %eax,%eax
   77f3b:	45 85 ed             	test   %r13d,%r13d
   77f3e:	0f 8e 3a 01 00 00    	jle    7807e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3fe>
   77f44:	89 85 54 ff ff ff    	mov    %eax,-0xac(%rbp)
   77f4a:	48 63 d0             	movslq %eax,%rdx
   77f4d:	48 8b 14 d3          	mov    (%rbx,%rdx,8),%rdx
   77f51:	49 33 56 48          	xor    0x48(%r14),%rdx
   77f55:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
   77f5c:	c1 7c 51 
   77f5f:	48 8d b5 40 ff ff ff 	lea    -0xc0(%rbp),%rsi
   77f66:	c4 62 bb f6 cf       	mulx   %rdi,%r8,%r9
   77f6b:	4c 89 06             	mov    %r8,(%rsi)
   77f6e:	4c 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%r8
   77f75:	4d 33 c1             	xor    %r9,%r8
   77f78:	4c 0f af c7          	imul   %rdi,%r8
   77f7c:	49 8b f8             	mov    %r8,%rdi
   77f7f:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
   77f86:	49 8d 56 78          	lea    0x78(%r14),%rdx
   77f8a:	48 8b 12             	mov    (%rdx),%rdx
   77f8d:	48 8d b5 38 ff ff ff 	lea    -0xc8(%rbp),%rsi
   77f94:	c4 e2 bb f6 d7       	mulx   %rdi,%r8,%rdx
   77f99:	4c 89 06             	mov    %r8,(%rsi)
   77f9c:	49 8b 76 08          	mov    0x8(%r14),%rsi
   77fa0:	0f b6 14 16          	movzbl (%rsi,%rdx,1),%edx
   77fa4:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
   77fab:	49 8d 7e 68          	lea    0x68(%r14),%rdi
   77faf:	48 8b b5 08 ff ff ff 	mov    -0xf8(%rbp),%rsi
   77fb6:	e8 55 2f 00 00       	call   7af10 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Computation_FastReduce__Reduce>
   77fbb:	49 0f af 46 18       	imul   0x18(%r14),%rax
   77fc0:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
   77fc7:	48 8b bd 48 ff ff ff 	mov    -0xb8(%rbp),%rdi
   77fce:	49 33 7e 48          	xor    0x48(%r14),%rdi
   77fd2:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
   77fd9:	c1 7c 51 
   77fdc:	48 0f af fe          	imul   %rsi,%rdi
   77fe0:	49 8d b6 80 00 00 00 	lea    0x80(%r14),%rsi
   77fe7:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
   77fee:	48 33 fa             	xor    %rdx,%rdi
   77ff1:	48 0f af 7e 08       	imul   0x8(%rsi),%rdi
   77ff6:	48 8b 16             	mov    (%rsi),%rdx
   77ff9:	33 f6                	xor    %esi,%esi
   77ffb:	33 c9                	xor    %ecx,%ecx
   77ffd:	e8 3e be 01 00       	call   93e40 <S_P_CoreLib_System_UInt128__op_Multiply>
   78002:	48 8b f8             	mov    %rax,%rdi
   78005:	48 8b f2             	mov    %rdx,%rsi
   78008:	ba 40 00 00 00       	mov    $0x40,%edx
   7800d:	e8 6e be 01 00       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
   78012:	48 8b b5 30 ff ff ff 	mov    -0xd0(%rbp),%rsi
   78019:	48 03 f0             	add    %rax,%rsi
   7801c:	49 3b f4             	cmp    %r12,%rsi
   7801f:	72 0d                	jb     7802e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3ae>
   78021:	41 2b f4             	sub    %r12d,%esi
   78024:	49 8b 7e 58          	mov    0x58(%r14),%rdi
   78028:	48 63 f6             	movslq %esi,%rsi
   7802b:	8b 34 b7             	mov    (%rdi,%rsi,4),%esi
   7802e:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
   78034:	48 63 c7             	movslq %edi,%rax
   78037:	48 8b 8d 58 ff ff ff 	mov    -0xa8(%rbp),%rcx
   7803e:	48 89 34 c1          	mov    %rsi,(%rcx,%rax,8)
   78042:	ff c7                	inc    %edi
   78044:	41 3b fd             	cmp    %r13d,%edi
   78047:	8b c7                	mov    %edi,%eax
   78049:	0f 8c f5 fe ff ff    	jl     77f44 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x2c4>
   7804f:	eb 2d                	jmp    7807e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3fe>
   78051:	45 33 e4             	xor    %r12d,%r12d
   78054:	45 85 ed             	test   %r13d,%r13d
   78057:	7e 25                	jle    7807e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3fe>
   78059:	49 63 f4             	movslq %r12d,%rsi
   7805c:	48 8b 34 f3          	mov    (%rbx,%rsi,8),%rsi
   78060:	49 8b fe             	mov    %r14,%rdi
   78063:	e8 28 b6 08 00       	call   103690 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>
   78068:	49 63 fc             	movslq %r12d,%rdi
   7806b:	48 8b b5 58 ff ff ff 	mov    -0xa8(%rbp),%rsi
   78072:	48 89 04 fe          	mov    %rax,(%rsi,%rdi,8)
   78076:	41 ff c4             	inc    %r12d
   78079:	45 3b e5             	cmp    %r13d,%r12d
   7807c:	7c db                	jl     78059 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3d9>
   7807e:	33 ff                	xor    %edi,%edi
   78080:	48 89 bd 60 ff ff ff 	mov    %rdi,-0xa0(%rbp)
   78087:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
   7808e:	48 8b 3d 3b 9a 1a 00 	mov    0x1a9a3b(%rip),%rdi        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   78095:	48 8b 5f 18          	mov    0x18(%rdi),%rbx
   78099:	48 8b 3d 30 9a 1a 00 	mov    0x1a9a30(%rip),%rdi        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   780a0:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
   780a4:	48 85 ff             	test   %rdi,%rdi
   780a7:	75 08                	jne    780b1 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x431>
   780a9:	45 33 f6             	xor    %r14d,%r14d
   780ac:	45 33 ed             	xor    %r13d,%r13d
   780af:	eb 08                	jmp    780b9 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x439>
   780b1:	4c 8d 77 10          	lea    0x10(%rdi),%r14
   780b5:	44 8b 6f 08          	mov    0x8(%rdi),%r13d
   780b9:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
   780bd:	c5 fa 7f 85 20 ff ff 	vmovdqu %xmm0,-0xe0(%rbp)
   780c4:	ff 
   780c5:	48 8d bd 20 ff ff ff 	lea    -0xe0(%rbp),%rdi
   780cc:	49 8b f7             	mov    %r15,%rsi
   780cf:	e8 fc 03 09 00       	call   1084d0 <S_P_CoreLib_System_Span_1<UIntPtr>___ctor>
   780d4:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
   780db:	44 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%r8d
   780e2:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
   780e6:	74 13                	je     780fb <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x47b>
   780e8:	49 8b f6             	mov    %r14,%rsi
   780eb:	41 8b d5             	mov    %r13d,%edx
   780ee:	48 8b fb             	mov    %rbx,%rdi
   780f1:	45 33 c9             	xor    %r9d,%r9d
   780f4:	e8 27 c0 08 00       	call   104120 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart>
   780f9:	eb 11                	jmp    7810c <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x48c>
   780fb:	49 8b f6             	mov    %r14,%rsi
   780fe:	41 8b d5             	mov    %r13d,%edx
   78101:	48 8b fb             	mov    %rbx,%rdi
   78104:	45 33 c9             	xor    %r9d,%r9d
   78107:	e8 34 c2 08 00       	call   104340 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart>
   7810c:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   78110:	be 25 00 00 00       	mov    $0x25,%esi
   78115:	ba 01 00 00 00       	mov    $0x1,%edx
   7811a:	e8 e1 8d 04 00       	call   c0f00 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler___ctor>
   7811f:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   78123:	8b 75 c0             	mov    -0x40(%rbp),%esi
   78126:	e8 05 1d 08 00       	call   f9e30 <S_P_CoreLib_System_Span_1<Char>__Slice>
   7812b:	48 8b f0             	mov    %rax,%rsi
   7812e:	48 8d 3d 2b f5 1b 00 	lea    0x1bf52b(%rip),%rdi        # 237660 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   78135:	39 3f                	cmp    %edi,(%rdi)
   78137:	e8 a4 c7 00 00       	call   848e0 <String__TryCopyTo>
   7813c:	85 c0                	test   %eax,%eax
   7813e:	74 0b                	je     7814b <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x4cb>
   78140:	8b 7d c0             	mov    -0x40(%rbp),%edi
   78143:	83 c7 0c             	add    $0xc,%edi
   78146:	89 7d c0             	mov    %edi,-0x40(%rbp)
   78149:	eb 10                	jmp    7815b <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x4db>
   7814b:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   7814f:	48 8d 35 0a f5 1b 00 	lea    0x1bf50a(%rip),%rsi        # 237660 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   78156:	e8 85 8f 04 00       	call   c10e0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   7815b:	48 8b 35 6e 99 1a 00 	mov    0x1a996e(%rip),%rsi        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   78162:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   78166:	8b 76 08             	mov    0x8(%rsi),%esi
   78169:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   7816d:	e8 6e 7a 0b 00       	call   12fbe0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__AppendFormatted<Int32>>
   78172:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   78176:	8b 75 c0             	mov    -0x40(%rbp),%esi
   78179:	e8 b2 1c 08 00       	call   f9e30 <S_P_CoreLib_System_Span_1<Char>__Slice>
   7817e:	48 8b f0             	mov    %rax,%rsi
   78181:	48 8d 3d a0 f9 1b 00 	lea    0x1bf9a0(%rip),%rdi        # 237b28 <__Str__keys_without_prefetching_D8A361755FCD551AE19C922C947806AAE44FC92E986D052C498A0E8B5AAA0C53>
   78188:	39 3f                	cmp    %edi,(%rdi)
   7818a:	e8 51 c7 00 00       	call   848e0 <String__TryCopyTo>
   7818f:	85 c0                	test   %eax,%eax
   78191:	74 0b                	je     7819e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x51e>
   78193:	8b 7d c0             	mov    -0x40(%rbp),%edi
   78196:	83 c7 19             	add    $0x19,%edi
   78199:	89 7d c0             	mov    %edi,-0x40(%rbp)
   7819c:	eb 10                	jmp    781ae <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x52e>
   7819e:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   781a2:	48 8d 35 7f f9 1b 00 	lea    0x1bf97f(%rip),%rsi        # 237b28 <__Str__keys_without_prefetching_D8A361755FCD551AE19C922C947806AAE44FC92E986D052C498A0E8B5AAA0C53>
   781a9:	e8 32 8f 04 00       	call   c10e0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   781ae:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   781b2:	e8 e9 8d 04 00       	call   c0fa0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__ToStringAndClear>
   781b7:	48 8b f8             	mov    %rax,%rdi
   781ba:	e8 91 45 00 00       	call   7c750 <System_Console_System_Console__WriteLine_12>
   781bf:	90                   	nop
   781c0:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
   781c7:	5b                   	pop    %rbx
   781c8:	41 5c                	pop    %r12
   781ca:	41 5d                	pop    %r13
   781cc:	41 5e                	pop    %r14
   781ce:	41 5f                	pop    %r15
   781d0:	5d                   	pop    %rbp
   781d1:	c3                   	ret
   781d2:	48 8d 3d ff 9b 1d 00 	lea    0x1d9bff(%rip),%rdi        # 251dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
   781d9:	e8 36 d3 fe ff       	call   65514 <RhpNewFast>
   781de:	48 8b d8             	mov    %rax,%rbx
   781e1:	48 8b fb             	mov    %rbx,%rdi
   781e4:	48 8d 35 d5 72 1c 00 	lea    0x1c72d5(%rip),%rsi        # 23f4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   781eb:	e8 80 2a 01 00       	call   8ac70 <S_P_CoreLib_System_ArgumentException___ctor_0>
   781f0:	48 8b fb             	mov    %rbx,%rdi
   781f3:	e8 86 d5 fe ff       	call   6577e <RhpThrowEx>
   781f8:	48 8d 3d d9 9b 1d 00 	lea    0x1d9bd9(%rip),%rdi        # 251dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
   781ff:	e8 10 d3 fe ff       	call   65514 <RhpNewFast>
   78204:	48 8b d8             	mov    %rax,%rbx
   78207:	48 8b fb             	mov    %rbx,%rdi
   7820a:	48 8d 35 af 72 1c 00 	lea    0x1c72af(%rip),%rsi        # 23f4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   78211:	e8 5a 2a 01 00       	call   8ac70 <S_P_CoreLib_System_ArgumentException___ctor_0>
   78216:	48 8b fb             	mov    %rbx,%rdi
   78219:	e8 60 d5 fe ff       	call   6577e <RhpThrowEx>
   7821e:	cc                   	int3
   7821f:	90                   	nop

0000000000103d60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream>:
  103d60:	55                   	push   %rbp
  103d61:	41 57                	push   %r15
  103d63:	41 56                	push   %r14
  103d65:	41 55                	push   %r13
  103d67:	41 54                	push   %r12
  103d69:	53                   	push   %rbx
  103d6a:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
  103d71:	c5 f8 77             	vzeroupper
  103d74:	48 8d ac 24 b0 00 00 	lea    0xb0(%rsp),%rbp
  103d7b:	00 
  103d7c:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  103d81:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  103d88:	ff ff ff 
  103d8b:	c5 79 7f 44 05 d0    	vmovdqa %xmm8,-0x30(%rbp,%rax,1)
  103d91:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
  103d97:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
  103d9d:	48 83 c0 30          	add    $0x30,%rax
  103da1:	75 e8                	jne    103d8b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2b>
  103da3:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  103da7:	48 8b df             	mov    %rdi,%rbx
  103daa:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  103dae:	0f 84 2c 02 00 00    	je     103fe0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x280>
  103db4:	44 8b fa             	mov    %edx,%r15d
  103db7:	45 3b f8             	cmp    %r8d,%r15d
  103dba:	0f 85 12 03 00 00    	jne    1040d2 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x372>
  103dc0:	45 84 c9             	test   %r9b,%r9b
  103dc3:	74 06                	je     103dcb <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x6b>
  103dc5:	0f b6 53 54          	movzbl 0x54(%rbx),%edx
  103dc9:	eb 02                	jmp    103dcd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x6d>
  103dcb:	33 d2                	xor    %edx,%edx
  103dcd:	4c 8b 73 38          	mov    0x38(%rbx),%r14
  103dd1:	33 ff                	xor    %edi,%edi
  103dd3:	45 85 ff             	test   %r15d,%r15d
  103dd6:	48 0f 45 fe          	cmovne %rsi,%rdi
  103dda:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  103dde:	4c 8b ef             	mov    %rdi,%r13
  103de1:	33 ff                	xor    %edi,%edi
  103de3:	45 85 c0             	test   %r8d,%r8d
  103de6:	48 0f 45 f9          	cmovne %rcx,%rdi
  103dea:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  103dee:	4c 8b e7             	mov    %rdi,%r12
  103df1:	85 d2                	test   %edx,%edx
  103df3:	0f 84 dd 00 00 00    	je     103ed6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x176>
  103df9:	33 c0                	xor    %eax,%eax
  103dfb:	45 85 ff             	test   %r15d,%r15d
  103dfe:	0f 8e c0 01 00 00    	jle    103fc4 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x264>
  103e04:	89 45 c4             	mov    %eax,-0x3c(%rbp)
  103e07:	48 63 d0             	movslq %eax,%rdx
  103e0a:	49 8b 54 d5 00       	mov    0x0(%r13,%rdx,8),%rdx
  103e0f:	48 33 53 48          	xor    0x48(%rbx),%rdx
  103e13:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  103e1a:	c1 7c 51 
  103e1d:	48 8d 75 b8          	lea    -0x48(%rbp),%rsi
  103e21:	c4 e2 f3 f6 d7       	mulx   %rdi,%rcx,%rdx
  103e26:	48 89 0e             	mov    %rcx,(%rsi)
  103e29:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  103e2d:	48 33 d7             	xor    %rdi,%rdx
  103e30:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  103e37:	c1 7c 51 
  103e3a:	48 0f af d7          	imul   %rdi,%rdx
  103e3e:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  103e45:	48 8b 7b 70          	mov    0x70(%rbx),%rdi
  103e49:	48 8d 75 b0          	lea    -0x50(%rbp),%rsi
  103e4d:	48 8b 8d 60 ff ff ff 	mov    -0xa0(%rbp),%rcx
  103e54:	48 8b d7             	mov    %rdi,%rdx
  103e57:	c4 e2 bb f6 d1       	mulx   %rcx,%r8,%rdx
  103e5c:	4c 89 06             	mov    %r8,(%rsi)
  103e5f:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  103e63:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  103e67:	48 33 53 48          	xor    0x48(%rbx),%rdx
  103e6b:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  103e72:	c1 7c 51 
  103e75:	48 0f af d7          	imul   %rdi,%rdx
  103e79:	48 8d bb 80 00 00 00 	lea    0x80(%rbx),%rdi
  103e80:	48 33 d1             	xor    %rcx,%rdx
  103e83:	48 0f af 57 08       	imul   0x8(%rdi),%rdx
  103e88:	48 8b 3f             	mov    (%rdi),%rdi
  103e8b:	48 8d 75 a8          	lea    -0x58(%rbp),%rsi
  103e8f:	c4 e2 f3 f6 ff       	mulx   %rdi,%rcx,%rdi
  103e94:	48 89 0e             	mov    %rcx,(%rsi)
  103e97:	48 8b f7             	mov    %rdi,%rsi
  103e9a:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  103e9e:	ba 40 00 00 00       	mov    $0x40,%edx
  103ea3:	e8 d8 ff f8 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103ea8:	49 3b c6             	cmp    %r14,%rax
  103eab:	72 0d                	jb     103eba <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x15a>
  103ead:	41 2b c6             	sub    %r14d,%eax
  103eb0:	48 8b 53 58          	mov    0x58(%rbx),%rdx
  103eb4:	48 63 f8             	movslq %eax,%rdi
  103eb7:	8b 04 ba             	mov    (%rdx,%rdi,4),%eax
  103eba:	8b 55 c4             	mov    -0x3c(%rbp),%edx
  103ebd:	48 63 fa             	movslq %edx,%rdi
  103ec0:	49 89 04 fc          	mov    %rax,(%r12,%rdi,8)
  103ec4:	ff c2                	inc    %edx
  103ec6:	41 3b d7             	cmp    %r15d,%edx
  103ec9:	8b c2                	mov    %edx,%eax
  103ecb:	0f 8c 33 ff ff ff    	jl     103e04 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0xa4>
  103ed1:	e9 ee 00 00 00       	jmp    103fc4 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x264>
  103ed6:	45 33 f6             	xor    %r14d,%r14d
  103ed9:	45 85 ff             	test   %r15d,%r15d
  103edc:	0f 8e e2 00 00 00    	jle    103fc4 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x264>
  103ee2:	49 63 d6             	movslq %r14d,%rdx
  103ee5:	49 8b 7c d5 00       	mov    0x0(%r13,%rdx,8),%rdi
  103eea:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  103eee:	48 8d 55 a0          	lea    -0x60(%rbp),%rdx
  103ef2:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  103ef9:	c1 7c 51 
  103efc:	e8 ff fb f7 ff       	call   83b00 <S_P_CoreLib_System_Math__BigMul_0>
  103f01:	48 8b f0             	mov    %rax,%rsi
  103f04:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
  103f08:	c5 f8 11 45 90       	vmovups %xmm0,-0x70(%rbp)
  103f0d:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
  103f11:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  103f15:	e8 06 ff f8 ff       	call   93e20 <S_P_CoreLib_System_UInt128___ctor>
  103f1a:	48 8b 45 90          	mov    -0x70(%rbp),%rax
  103f1e:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
  103f25:	48 8b 75 98          	mov    -0x68(%rbp),%rsi
  103f29:	48 8b f8             	mov    %rax,%rdi
  103f2c:	ba 40 00 00 00       	mov    $0x40,%edx
  103f31:	e8 4a ff f8 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103f36:	48 8b 8d 58 ff ff ff 	mov    -0xa8(%rbp),%rcx
  103f3d:	48 33 c1             	xor    %rcx,%rax
  103f40:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
  103f47:	c1 7c 51 
  103f4a:	48 0f af c1          	imul   %rcx,%rax
  103f4e:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)
  103f55:	48 8b fb             	mov    %rbx,%rdi
  103f58:	48 8b b5 50 ff ff ff 	mov    -0xb0(%rbp),%rsi
  103f5f:	e8 bc fc ff ff       	call   103c20 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__BucketInPart>
  103f64:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  103f68:	40 0f b6 3c 07       	rex movzbl (%rdi,%rax,1),%edi
  103f6d:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  103f71:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  103f78:	c1 7c 51 
  103f7b:	48 0f af fe          	imul   %rsi,%rdi
  103f7f:	48 8d b3 80 00 00 00 	lea    0x80(%rbx),%rsi
  103f86:	48 8b 95 50 ff ff ff 	mov    -0xb0(%rbp),%rdx
  103f8d:	48 33 fa             	xor    %rdx,%rdi
  103f90:	48 0f af 7e 08       	imul   0x8(%rsi),%rdi
  103f95:	48 8b 16             	mov    (%rsi),%rdx
  103f98:	33 f6                	xor    %esi,%esi
  103f9a:	33 c9                	xor    %ecx,%ecx
  103f9c:	e8 9f fe f8 ff       	call   93e40 <S_P_CoreLib_System_UInt128__op_Multiply>
  103fa1:	48 8b f8             	mov    %rax,%rdi
  103fa4:	48 8b f2             	mov    %rdx,%rsi
  103fa7:	ba 40 00 00 00       	mov    $0x40,%edx
  103fac:	e8 cf fe f8 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103fb1:	49 63 fe             	movslq %r14d,%rdi
  103fb4:	49 89 04 fc          	mov    %rax,(%r12,%rdi,8)
  103fb8:	41 ff c6             	inc    %r14d
  103fbb:	45 3b f7             	cmp    %r15d,%r14d
  103fbe:	0f 8c 1e ff ff ff    	jl     103ee2 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x182>
  103fc4:	33 ff                	xor    %edi,%edi
  103fc6:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  103fca:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  103fce:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  103fd5:	5b                   	pop    %rbx
  103fd6:	41 5c                	pop    %r12
  103fd8:	41 5d                	pop    %r13
  103fda:	41 5e                	pop    %r14
  103fdc:	41 5f                	pop    %r15
  103fde:	5d                   	pop    %rbp
  103fdf:	c3                   	ret
  103fe0:	48 8b fe             	mov    %rsi,%rdi
  103fe3:	44 8b fa             	mov    %edx,%r15d
  103fe6:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
  103fea:	44 89 45 88          	mov    %r8d,-0x78(%rbp)
  103fee:	44 3b 7d 88          	cmp    -0x78(%rbp),%r15d
  103ff2:	0f 85 00 01 00 00    	jne    1040f8 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x398>
  103ff8:	45 84 c9             	test   %r9b,%r9b
  103ffb:	74 07                	je     104004 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2a4>
  103ffd:	44 0f b6 73 54       	movzbl 0x54(%rbx),%r14d
  104002:	eb 03                	jmp    104007 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2a7>
  104004:	45 33 f6             	xor    %r14d,%r14d
  104007:	4c 8b 6b 38          	mov    0x38(%rbx),%r13
  10400b:	33 c0                	xor    %eax,%eax
  10400d:	45 85 ff             	test   %r15d,%r15d
  104010:	48 0f 45 c7          	cmovne %rdi,%rax
  104014:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
  10401b:	4c 8b e0             	mov    %rax,%r12
  10401e:	48 8d 7d 80          	lea    -0x80(%rbp),%rdi
  104022:	e8 c9 44 00 00       	call   1084f0 <S_P_CoreLib_System_Span_1<UIntPtr>__GetPinnableReference>
  104027:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
  10402e:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
  104035:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
  10403c:	45 85 f6             	test   %r14d,%r14d
  10403f:	74 41                	je     104082 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x322>
  104041:	45 33 f6             	xor    %r14d,%r14d
  104044:	45 85 ff             	test   %r15d,%r15d
  104047:	7e 67                	jle    1040b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x350>
  104049:	49 63 f6             	movslq %r14d,%rsi
  10404c:	49 8b 34 f4          	mov    (%r12,%rsi,8),%rsi
  104050:	48 8b fb             	mov    %rbx,%rdi
  104053:	e8 38 f6 ff ff       	call   103690 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>
  104058:	49 3b c5             	cmp    %r13,%rax
  10405b:	72 0d                	jb     10406a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x30a>
  10405d:	41 2b c5             	sub    %r13d,%eax
  104060:	48 8b 73 58          	mov    0x58(%rbx),%rsi
  104064:	48 63 f8             	movslq %eax,%rdi
  104067:	8b 04 be             	mov    (%rsi,%rdi,4),%eax
  10406a:	49 63 f6             	movslq %r14d,%rsi
  10406d:	48 8b 8d 68 ff ff ff 	mov    -0x98(%rbp),%rcx
  104074:	48 89 04 f1          	mov    %rax,(%rcx,%rsi,8)
  104078:	41 ff c6             	inc    %r14d
  10407b:	45 3b f7             	cmp    %r15d,%r14d
  10407e:	7c c9                	jl     104049 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2e9>
  104080:	eb 2e                	jmp    1040b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x350>
  104082:	45 33 f6             	xor    %r14d,%r14d
  104085:	45 85 ff             	test   %r15d,%r15d
  104088:	7e 26                	jle    1040b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x350>
  10408a:	49 63 f6             	movslq %r14d,%rsi
  10408d:	49 8b 34 f4          	mov    (%r12,%rsi,8),%rsi
  104091:	48 8b fb             	mov    %rbx,%rdi
  104094:	e8 f7 f5 ff ff       	call   103690 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>
  104099:	49 63 fe             	movslq %r14d,%rdi
  10409c:	4c 8b ad 68 ff ff ff 	mov    -0x98(%rbp),%r13
  1040a3:	49 89 44 fd 00       	mov    %rax,0x0(%r13,%rdi,8)
  1040a8:	41 ff c6             	inc    %r14d
  1040ab:	45 3b f7             	cmp    %r15d,%r14d
  1040ae:	7c da                	jl     10408a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x32a>
  1040b0:	33 ff                	xor    %edi,%edi
  1040b2:	48 89 bd 70 ff ff ff 	mov    %rdi,-0x90(%rbp)
  1040b9:	48 89 bd 78 ff ff ff 	mov    %rdi,-0x88(%rbp)
  1040c0:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  1040c7:	5b                   	pop    %rbx
  1040c8:	41 5c                	pop    %r12
  1040ca:	41 5d                	pop    %r13
  1040cc:	41 5e                	pop    %r14
  1040ce:	41 5f                	pop    %r15
  1040d0:	5d                   	pop    %rbp
  1040d1:	c3                   	ret
  1040d2:	48 8d 3d ff dc 14 00 	lea    0x14dcff(%rip),%rdi        # 251dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  1040d9:	e8 36 14 f6 ff       	call   65514 <RhpNewFast>
  1040de:	48 8b d8             	mov    %rax,%rbx
  1040e1:	48 8b fb             	mov    %rbx,%rdi
  1040e4:	48 8d 35 d5 b3 13 00 	lea    0x13b3d5(%rip),%rsi        # 23f4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  1040eb:	e8 80 6b f8 ff       	call   8ac70 <S_P_CoreLib_System_ArgumentException___ctor_0>
  1040f0:	48 8b fb             	mov    %rbx,%rdi
  1040f3:	e8 86 16 f6 ff       	call   6577e <RhpThrowEx>
  1040f8:	48 8d 3d d9 dc 14 00 	lea    0x14dcd9(%rip),%rdi        # 251dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  1040ff:	e8 10 14 f6 ff       	call   65514 <RhpNewFast>
  104104:	48 8b d8             	mov    %rax,%rbx
  104107:	48 8b fb             	mov    %rbx,%rdi
  10410a:	48 8d 35 af b3 13 00 	lea    0x13b3af(%rip),%rsi        # 23f4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104111:	e8 5a 6b f8 ff       	call   8ac70 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104116:	48 8b fb             	mov    %rbx,%rdi
  104119:	e8 60 16 f6 ff       	call   6577e <RhpThrowEx>
  10411e:	cc                   	int3
  10411f:	90                   	nop

0000000000104120 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart>:
  104120:	55                   	push   %rbp
  104121:	41 57                	push   %r15
  104123:	53                   	push   %rbx
  104124:	48 83 ec 60          	sub    $0x60,%rsp
  104128:	48 8d 6c 24 70       	lea    0x70(%rsp),%rbp
  10412d:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104132:	c5 79 7f 45 b0       	vmovdqa %xmm8,-0x50(%rbp)
  104137:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  10413c:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  104141:	c5 79 7f 45 e0       	vmovdqa %xmm8,-0x20(%rbp)
  104146:	41 3b d0             	cmp    %r8d,%edx
  104149:	0f 85 b9 01 00 00    	jne    104308 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1e8>
  10414f:	45 84 c9             	test   %r9b,%r9b
  104152:	74 06                	je     10415a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x3a>
  104154:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  104158:	eb 02                	jmp    10415c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x3c>
  10415a:	33 c0                	xor    %eax,%eax
  10415c:	4c 8b 4f 38          	mov    0x38(%rdi),%r9
  104160:	45 33 d2             	xor    %r10d,%r10d
  104163:	85 d2                	test   %edx,%edx
  104165:	4c 0f 45 d6          	cmovne %rsi,%r10
  104169:	4c 89 55 e8          	mov    %r10,-0x18(%rbp)
  10416d:	49 8b f2             	mov    %r10,%rsi
  104170:	45 33 d2             	xor    %r10d,%r10d
  104173:	45 85 c0             	test   %r8d,%r8d
  104176:	4c 0f 45 d1          	cmovne %rcx,%r10
  10417a:	4c 89 55 e0          	mov    %r10,-0x20(%rbp)
  10417e:	49 8b ca             	mov    %r10,%rcx
  104181:	85 c0                	test   %eax,%eax
  104183:	0f 84 c2 00 00 00    	je     10424b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x12b>
  104189:	33 c0                	xor    %eax,%eax
  10418b:	89 55 ac             	mov    %edx,-0x54(%rbp)
  10418e:	85 d2                	test   %edx,%edx
  104190:	0f 8e 5f 01 00 00    	jle    1042f5 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1d5>
  104196:	4c 8d 87 80 00 00 00 	lea    0x80(%rdi),%r8
  10419d:	4c 63 d0             	movslq %eax,%r10
  1041a0:	4e 8b 14 d6          	mov    (%rsi,%r10,8),%r10
  1041a4:	4c 33 57 48          	xor    0x48(%rdi),%r10
  1041a8:	49 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r11
  1041af:	c1 7c 51 
  1041b2:	48 8d 5d d8          	lea    -0x28(%rbp),%rbx
  1041b6:	49 8b d2             	mov    %r10,%rdx
  1041b9:	c4 c2 83 f6 d3       	mulx   %r11,%r15,%rdx
  1041be:	4c 89 3b             	mov    %r15,(%rbx)
  1041c1:	4c 8b 55 d8          	mov    -0x28(%rbp),%r10
  1041c5:	49 33 d2             	xor    %r10,%rdx
  1041c8:	49 0f af d3          	imul   %r11,%rdx
  1041cc:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  1041d0:	4c 8b 57 70          	mov    0x70(%rdi),%r10
  1041d4:	4c 8d 5d d0          	lea    -0x30(%rbp),%r11
  1041d8:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  1041dc:	49 8b d2             	mov    %r10,%rdx
  1041df:	c4 e2 83 f6 d3       	mulx   %rbx,%r15,%rdx
  1041e4:	4d 89 3b             	mov    %r15,(%r11)
  1041e7:	4c 8b 57 08          	mov    0x8(%rdi),%r10
  1041eb:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  1041f0:	48 33 57 48          	xor    0x48(%rdi),%rdx
  1041f4:	49 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r10
  1041fb:	c1 7c 51 
  1041fe:	49 0f af d2          	imul   %r10,%rdx
  104202:	4d 8b d0             	mov    %r8,%r10
  104205:	48 33 d3             	xor    %rbx,%rdx
  104208:	49 0f af 52 08       	imul   0x8(%r10),%rdx
  10420d:	4d 8b 12             	mov    (%r10),%r10
  104210:	4c 8d 5d c8          	lea    -0x38(%rbp),%r11
  104214:	c4 c2 e3 f6 d2       	mulx   %r10,%rbx,%rdx
  104219:	49 89 1b             	mov    %rbx,(%r11)
  10421c:	49 3b d1             	cmp    %r9,%rdx
  10421f:	72 0e                	jb     10422f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x10f>
  104221:	41 2b d1             	sub    %r9d,%edx
  104224:	4c 8b 57 58          	mov    0x58(%rdi),%r10
  104228:	48 63 d2             	movslq %edx,%rdx
  10422b:	41 8b 14 92          	mov    (%r10,%rdx,4),%edx
  10422f:	4c 63 d0             	movslq %eax,%r10
  104232:	4a 89 14 d1          	mov    %rdx,(%rcx,%r10,8)
  104236:	ff c0                	inc    %eax
  104238:	8b 55 ac             	mov    -0x54(%rbp),%edx
  10423b:	3b c2                	cmp    %edx,%eax
  10423d:	89 55 ac             	mov    %edx,-0x54(%rbp)
  104240:	0f 8c 57 ff ff ff    	jl     10419d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x7d>
  104246:	e9 aa 00 00 00       	jmp    1042f5 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1d5>
  10424b:	33 c0                	xor    %eax,%eax
  10424d:	89 55 ac             	mov    %edx,-0x54(%rbp)
  104250:	85 d2                	test   %edx,%edx
  104252:	0f 8e 9d 00 00 00    	jle    1042f5 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1d5>
  104258:	4c 8d 87 80 00 00 00 	lea    0x80(%rdi),%r8
  10425f:	4c 63 c8             	movslq %eax,%r9
  104262:	4e 8b 0c ce          	mov    (%rsi,%r9,8),%r9
  104266:	4c 33 4f 48          	xor    0x48(%rdi),%r9
  10426a:	49 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r10
  104271:	c1 7c 51 
  104274:	4c 8d 5d c0          	lea    -0x40(%rbp),%r11
  104278:	49 8b d1             	mov    %r9,%rdx
  10427b:	c4 c2 e3 f6 d2       	mulx   %r10,%rbx,%rdx
  104280:	49 89 1b             	mov    %rbx,(%r11)
  104283:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
  104287:	49 33 d1             	xor    %r9,%rdx
  10428a:	49 0f af d2          	imul   %r10,%rdx
  10428e:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  104292:	4c 8b 4f 70          	mov    0x70(%rdi),%r9
  104296:	4c 8d 55 b8          	lea    -0x48(%rbp),%r10
  10429a:	4c 8b 5d 98          	mov    -0x68(%rbp),%r11
  10429e:	49 8b d1             	mov    %r9,%rdx
  1042a1:	c4 c2 e3 f6 d3       	mulx   %r11,%rbx,%rdx
  1042a6:	49 89 1a             	mov    %rbx,(%r10)
  1042a9:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
  1042ad:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  1042b2:	48 33 57 48          	xor    0x48(%rdi),%rdx
  1042b6:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
  1042bd:	c1 7c 51 
  1042c0:	49 0f af d1          	imul   %r9,%rdx
  1042c4:	4d 8b c8             	mov    %r8,%r9
  1042c7:	49 33 d3             	xor    %r11,%rdx
  1042ca:	49 0f af 51 08       	imul   0x8(%r9),%rdx
  1042cf:	4d 8b 09             	mov    (%r9),%r9
  1042d2:	4c 8d 55 b0          	lea    -0x50(%rbp),%r10
  1042d6:	c4 c2 a3 f6 d1       	mulx   %r9,%r11,%rdx
  1042db:	4d 89 1a             	mov    %r11,(%r10)
  1042de:	4c 63 c8             	movslq %eax,%r9
  1042e1:	4a 89 14 c9          	mov    %rdx,(%rcx,%r9,8)
  1042e5:	ff c0                	inc    %eax
  1042e7:	8b 55 ac             	mov    -0x54(%rbp),%edx
  1042ea:	3b c2                	cmp    %edx,%eax
  1042ec:	89 55 ac             	mov    %edx,-0x54(%rbp)
  1042ef:	0f 8c 6a ff ff ff    	jl     10425f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x13f>
  1042f5:	33 ff                	xor    %edi,%edi
  1042f7:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  1042fb:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  1042ff:	48 83 c4 60          	add    $0x60,%rsp
  104303:	5b                   	pop    %rbx
  104304:	41 5f                	pop    %r15
  104306:	5d                   	pop    %rbp
  104307:	c3                   	ret
  104308:	48 8d 3d c9 da 14 00 	lea    0x14dac9(%rip),%rdi        # 251dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  10430f:	e8 00 12 f6 ff       	call   65514 <RhpNewFast>
  104314:	48 8b d8             	mov    %rax,%rbx
  104317:	48 8b fb             	mov    %rbx,%rdi
  10431a:	48 8d 35 9f b1 13 00 	lea    0x13b19f(%rip),%rsi        # 23f4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104321:	e8 4a 69 f8 ff       	call   8ac70 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104326:	48 8b fb             	mov    %rbx,%rdi
  104329:	e8 50 14 f6 ff       	call   6577e <RhpThrowEx>
  10432e:	cc                   	int3
  10432f:	90                   	nop
  104330:	90                   	nop
  104331:	90                   	nop
  104332:	90                   	nop
  104333:	90                   	nop
  104334:	90                   	nop
  104335:	90                   	nop
  104336:	90                   	nop
  104337:	90                   	nop
  104338:	90                   	nop
  104339:	90                   	nop
  10433a:	90                   	nop
  10433b:	90                   	nop
  10433c:	90                   	nop
  10433d:	90                   	nop
  10433e:	90                   	nop
  10433f:	90                   	nop

0000000000104340 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart>:
  104340:	55                   	push   %rbp
  104341:	41 57                	push   %r15
  104343:	41 56                	push   %r14
  104345:	41 55                	push   %r13
  104347:	53                   	push   %rbx
  104348:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
  10434f:	48 8d ac 24 a0 00 00 	lea    0xa0(%rsp),%rbp
  104356:	00 
  104357:	33 c0                	xor    %eax,%eax
  104359:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
  104360:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104365:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  10436c:	ff ff ff 
  10436f:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
  104375:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
  10437b:	c5 79 7f 04 28       	vmovdqa %xmm8,(%rax,%rbp,1)
  104380:	48 83 c0 30          	add    $0x30,%rax
  104384:	75 e9                	jne    10436f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x2f>
  104386:	41 3b d0             	cmp    %r8d,%edx
  104389:	0f 85 48 02 00 00    	jne    1045d7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x297>
  10438f:	45 84 c9             	test   %r9b,%r9b
  104392:	74 06                	je     10439a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x5a>
  104394:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  104398:	eb 02                	jmp    10439c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x5c>
  10439a:	33 c0                	xor    %eax,%eax
  10439c:	4c 8b 4f 38          	mov    0x38(%rdi),%r9
  1043a0:	45 33 d2             	xor    %r10d,%r10d
  1043a3:	85 d2                	test   %edx,%edx
  1043a5:	4c 0f 45 d6          	cmovne %rsi,%r10
  1043a9:	4c 89 55 d8          	mov    %r10,-0x28(%rbp)
  1043ad:	49 8b f2             	mov    %r10,%rsi
  1043b0:	45 33 d2             	xor    %r10d,%r10d
  1043b3:	45 85 c0             	test   %r8d,%r8d
  1043b6:	4c 0f 45 d1          	cmovne %rcx,%r10
  1043ba:	4c 89 55 d0          	mov    %r10,-0x30(%rbp)
  1043be:	49 8b ca             	mov    %r10,%rcx
  1043c1:	85 c0                	test   %eax,%eax
  1043c3:	0f 84 09 01 00 00    	je     1044d2 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x192>
  1043c9:	33 c0                	xor    %eax,%eax
  1043cb:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  1043d1:	85 d2                	test   %edx,%edx
  1043d3:	0f 8e e4 01 00 00    	jle    1045bd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x27d>
  1043d9:	4c 8d 47 78          	lea    0x78(%rdi),%r8
  1043dd:	4c 8d 57 68          	lea    0x68(%rdi),%r10
  1043e1:	4c 8d 9f 80 00 00 00 	lea    0x80(%rdi),%r11
  1043e8:	48 63 d8             	movslq %eax,%rbx
  1043eb:	48 8b 1c de          	mov    (%rsi,%rbx,8),%rbx
  1043ef:	48 33 5f 48          	xor    0x48(%rdi),%rbx
  1043f3:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  1043fa:	c1 7c 51 
  1043fd:	4c 8d 75 c0          	lea    -0x40(%rbp),%r14
  104401:	48 8b d3             	mov    %rbx,%rdx
  104404:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  104409:	4d 89 2e             	mov    %r13,(%r14)
  10440c:	48 8b 5d c0          	mov    -0x40(%rbp),%rbx
  104410:	48 33 d3             	xor    %rbx,%rdx
  104413:	49 0f af d7          	imul   %r15,%rdx
  104417:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
  10441e:	49 8b d8             	mov    %r8,%rbx
  104421:	48 8b 1b             	mov    (%rbx),%rbx
  104424:	4c 8d 7d b8          	lea    -0x48(%rbp),%r15
  104428:	4c 8b b5 68 ff ff ff 	mov    -0x98(%rbp),%r14
  10442f:	48 8b d3             	mov    %rbx,%rdx
  104432:	c4 c2 93 f6 d6       	mulx   %r14,%r13,%rdx
  104437:	4d 89 2f             	mov    %r13,(%r15)
  10443a:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
  10443e:	0f b6 14 13          	movzbl (%rbx,%rdx,1),%edx
  104442:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  104446:	49 8b da             	mov    %r10,%rbx
  104449:	48 8b 1b             	mov    (%rbx),%rbx
  10444c:	4c 8d 7d a8          	lea    -0x58(%rbp),%r15
  104450:	48 8b d3             	mov    %rbx,%rdx
  104453:	c4 c2 93 f6 d6       	mulx   %r14,%r13,%rdx
  104458:	4d 89 2f             	mov    %r13,(%r15)
  10445b:	48 0f af 57 18       	imul   0x18(%rdi),%rdx
  104460:	48 89 55 b0          	mov    %rdx,-0x50(%rbp)
  104464:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
  104468:	48 33 5f 48          	xor    0x48(%rdi),%rbx
  10446c:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  104473:	c1 7c 51 
  104476:	49 0f af df          	imul   %r15,%rbx
  10447a:	4d 8b fb             	mov    %r11,%r15
  10447d:	49 33 de             	xor    %r14,%rbx
  104480:	49 0f af 5f 08       	imul   0x8(%r15),%rbx
  104485:	4d 8b 3f             	mov    (%r15),%r15
  104488:	4c 8d 75 a0          	lea    -0x60(%rbp),%r14
  10448c:	48 8b d3             	mov    %rbx,%rdx
  10448f:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  104494:	4d 89 2e             	mov    %r13,(%r14)
  104497:	48 8b 5d b0          	mov    -0x50(%rbp),%rbx
  10449b:	48 03 d3             	add    %rbx,%rdx
  10449e:	49 3b d1             	cmp    %r9,%rdx
  1044a1:	72 0d                	jb     1044b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x170>
  1044a3:	41 2b d1             	sub    %r9d,%edx
  1044a6:	48 8b 5f 58          	mov    0x58(%rdi),%rbx
  1044aa:	48 63 d2             	movslq %edx,%rdx
  1044ad:	8b 14 93             	mov    (%rbx,%rdx,4),%edx
  1044b0:	48 63 d8             	movslq %eax,%rbx
  1044b3:	48 89 14 d9          	mov    %rdx,(%rcx,%rbx,8)
  1044b7:	ff c0                	inc    %eax
  1044b9:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  1044bf:	3b c2                	cmp    %edx,%eax
  1044c1:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  1044c7:	0f 8c 1b ff ff ff    	jl     1043e8 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0xa8>
  1044cd:	e9 eb 00 00 00       	jmp    1045bd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x27d>
  1044d2:	33 c0                	xor    %eax,%eax
  1044d4:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  1044da:	85 d2                	test   %edx,%edx
  1044dc:	0f 8e db 00 00 00    	jle    1045bd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x27d>
  1044e2:	4c 8d 47 78          	lea    0x78(%rdi),%r8
  1044e6:	4c 8d 57 68          	lea    0x68(%rdi),%r10
  1044ea:	4c 8d 9f 80 00 00 00 	lea    0x80(%rdi),%r11
  1044f1:	4c 63 c8             	movslq %eax,%r9
  1044f4:	4e 8b 0c ce          	mov    (%rsi,%r9,8),%r9
  1044f8:	4c 33 4f 48          	xor    0x48(%rdi),%r9
  1044fc:	48 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rbx
  104503:	c1 7c 51 
  104506:	4c 8d 7d 90          	lea    -0x70(%rbp),%r15
  10450a:	49 8b d1             	mov    %r9,%rdx
  10450d:	c4 e2 8b f6 d3       	mulx   %rbx,%r14,%rdx
  104512:	4d 89 37             	mov    %r14,(%r15)
  104515:	4c 8b 4d 90          	mov    -0x70(%rbp),%r9
  104519:	49 33 d1             	xor    %r9,%rdx
  10451c:	48 0f af d3          	imul   %rbx,%rdx
  104520:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  104527:	4d 8b c8             	mov    %r8,%r9
  10452a:	4d 8b 09             	mov    (%r9),%r9
  10452d:	48 8d 5d 88          	lea    -0x78(%rbp),%rbx
  104531:	4c 8b bd 60 ff ff ff 	mov    -0xa0(%rbp),%r15
  104538:	49 8b d1             	mov    %r9,%rdx
  10453b:	c4 c2 8b f6 d7       	mulx   %r15,%r14,%rdx
  104540:	4c 89 33             	mov    %r14,(%rbx)
  104543:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
  104547:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  10454c:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  104550:	4d 8b ca             	mov    %r10,%r9
  104553:	4d 8b 09             	mov    (%r9),%r9
  104556:	48 8d 5d 80          	lea    -0x80(%rbp),%rbx
  10455a:	49 8b d1             	mov    %r9,%rdx
  10455d:	c4 42 8b f6 cf       	mulx   %r15,%r14,%r9
  104562:	4c 89 33             	mov    %r14,(%rbx)
  104565:	4c 0f af 4f 18       	imul   0x18(%rdi),%r9
  10456a:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
  10456e:	48 33 57 48          	xor    0x48(%rdi),%rdx
  104572:	48 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rbx
  104579:	c1 7c 51 
  10457c:	48 0f af d3          	imul   %rbx,%rdx
  104580:	49 8b db             	mov    %r11,%rbx
  104583:	49 33 d7             	xor    %r15,%rdx
  104586:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  10458b:	48 8b 1b             	mov    (%rbx),%rbx
  10458e:	4c 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%r15
  104595:	c4 e2 8b f6 d3       	mulx   %rbx,%r14,%rdx
  10459a:	4d 89 37             	mov    %r14,(%r15)
  10459d:	49 03 d1             	add    %r9,%rdx
  1045a0:	4c 63 c8             	movslq %eax,%r9
  1045a3:	4a 89 14 c9          	mov    %rdx,(%rcx,%r9,8)
  1045a7:	ff c0                	inc    %eax
  1045a9:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  1045af:	3b c2                	cmp    %edx,%eax
  1045b1:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  1045b7:	0f 8c 34 ff ff ff    	jl     1044f1 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x1b1>
  1045bd:	33 ff                	xor    %edi,%edi
  1045bf:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  1045c3:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  1045c7:	48 81 c4 80 00 00 00 	add    $0x80,%rsp
  1045ce:	5b                   	pop    %rbx
  1045cf:	41 5d                	pop    %r13
  1045d1:	41 5e                	pop    %r14
  1045d3:	41 5f                	pop    %r15
  1045d5:	5d                   	pop    %rbp
  1045d6:	c3                   	ret
  1045d7:	48 8d 3d fa d7 14 00 	lea    0x14d7fa(%rip),%rdi        # 251dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  1045de:	e8 31 0f f6 ff       	call   65514 <RhpNewFast>
  1045e3:	48 8b d8             	mov    %rax,%rbx
  1045e6:	48 8b fb             	mov    %rbx,%rdi
  1045e9:	48 8d 35 d0 ae 13 00 	lea    0x13aed0(%rip),%rsi        # 23f4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  1045f0:	e8 7b 66 f8 ff       	call   8ac70 <S_P_CoreLib_System_ArgumentException___ctor_0>
  1045f5:	48 8b fb             	mov    %rbx,%rdi
  1045f8:	e8 81 11 f6 ff       	call   6577e <RhpThrowEx>
  1045fd:	cc                   	int3
  1045fe:	90                   	nop
  1045ff:	90                   	nop

