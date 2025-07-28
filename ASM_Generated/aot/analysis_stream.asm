   774fc:	e8 ff 08 00 00       	call   77e00 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream>
   77501:	e8 9a 0e 00 00       	call   783a0 <ASM_Analysis_AsmGeneration_Program__TestSingleLookups>
   77506:	e8 f5 11 00 00       	call   78700 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern>
   7750b:	e8 c0 13 00 00       	call   788d0 <ASM_Analysis_AsmGeneration_Program__TestDictionaryMethods>
   77510:	48 8d 3d 89 e5 1c 00 	lea    0x1ce589(%rip),%rdi        # 245aa0 <__Str_Assembly_generation_complete__E694E220ABB5E659C8FE3A93D59496D8C08AFB825EDBB706847AAF14012E93FD>
   77517:	e8 14 55 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   7751c:	48 8d 3d 9d ee 1c 00 	lea    0x1cee9d(%rip),%rdi        # 2463c0 <__Str_Check_output_for_JIT_generated_E88BF50A10FDFF15CB02EFCA372E5395BD12F2100779560FE4DB5574C46B7085>
   77523:	e8 08 55 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   77528:	90                   	nop
   77529:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   77530:	5b                   	pop    %rbx
   77531:	41 5c                	pop    %r12
   77533:	41 5d                	pop    %r13
   77535:	41 5e                	pop    %r14
   77537:	41 5f                	pop    %r15
   77539:	5d                   	pop    %rbp
   7753a:	c3                   	ret
   7753b:	e8 e0 b5 01 00       	call   92b20 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
   77540:	cc                   	int3
   77541:	90                   	nop
   77542:	90                   	nop
   77543:	90                   	nop
   77544:	90                   	nop
   77545:	90                   	nop
   77546:	90                   	nop
   77547:	90                   	nop
   77548:	90                   	nop
   77549:	90                   	nop
   7754a:	90                   	nop
   7754b:	90                   	nop
   7754c:	90                   	nop
   7754d:	90                   	nop
   7754e:	90                   	nop
   7754f:	90                   	nop
   77550:	90                   	nop
   77551:	90                   	nop
   77552:	90                   	nop
   77553:	90                   	nop
   77554:	90                   	nop
   77555:	90                   	nop
   77556:	90                   	nop
   77557:	90                   	nop
   77558:	90                   	nop
   77559:	90                   	nop
   7755a:	90                   	nop
   7755b:	90                   	nop
   7755c:	90                   	nop
   7755d:	90                   	nop
   7755e:	90                   	nop
   7755f:	90                   	nop

   77b1e:	e8 7d cc 08 00       	call   1047a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream>
   77b23:	33 db                	xor    %ebx,%ebx
   77b25:	4d 85 ff             	test   %r15,%r15
   77b28:	74 42                	je     77b6c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   77b2a:	41 83 7f 08 64       	cmpl   $0x64,0x8(%r15)
   77b2f:	7c 3b                	jl     77b6c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   77b31:	48 8b 3d f0 3f 1b 00 	mov    0x1b3ff0(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77b38:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77b3c:	8b f3                	mov    %ebx,%esi
   77b3e:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77b43:	39 3f                	cmp    %edi,(%rdi)
   77b45:	e8 66 c7 08 00       	call   1042b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   77b4a:	48 8b 3d d7 3f 1b 00 	mov    0x1b3fd7(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77b51:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77b55:	8b f3                	mov    %ebx,%esi
   77b57:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77b5c:	39 3f                	cmp    %edi,(%rdi)
   77b5e:	e8 1d c9 08 00       	call   104480 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   77b63:	ff c3                	inc    %ebx
   77b65:	83 fb 64             	cmp    $0x64,%ebx
   77b68:	7c c7                	jl     77b31 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x5d1>
   77b6a:	eb 43                	jmp    77baf <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x64f>
   77b6c:	48 8b 3d b5 3f 1b 00 	mov    0x1b3fb5(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77b73:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77b77:	41 3b 5f 08          	cmp    0x8(%r15),%ebx
   77b7b:	0f 83 a4 00 00 00    	jae    77c25 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x6c5>
   77b81:	8b f3                	mov    %ebx,%esi
   77b83:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77b88:	39 3f                	cmp    %edi,(%rdi)
   77b8a:	e8 21 c7 08 00       	call   1042b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   77b8f:	48 8b 3d 92 3f 1b 00 	mov    0x1b3f92(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77b96:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77b9a:	8b f3                	mov    %ebx,%esi
   77b9c:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77ba1:	39 3f                	cmp    %edi,(%rdi)
   77ba3:	e8 d8 c8 08 00       	call   104480 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   77ba8:	ff c3                	inc    %ebx
   77baa:	83 fb 64             	cmp    $0x64,%ebx
   77bad:	7c bd                	jl     77b6c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   77baf:	48 8d 3d 32 24 1d 00 	lea    0x1d2432(%rip),%rdi        # 249fe8 <__Str_JIT_warmup_complete__0DAE2BD7E8651565932C6EA373EC942BC13BA8E721DA0F4E914F424C749DD85D>
   77bb6:	e8 75 4e 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   77bbb:	90                   	nop
   77bbc:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
   77bc3:	5b                   	pop    %rbx
   77bc4:	41 5c                	pop    %r12
   77bc6:	41 5d                	pop    %r13
   77bc8:	41 5e                	pop    %r14
   77bca:	41 5f                	pop    %r15
   77bcc:	5d                   	pop    %rbp
   77bcd:	c3                   	ret
   77bce:	bf 10 00 00 00       	mov    $0x10,%edi
   77bd3:	e8 98 86 00 00       	call   80270 <System_Linq_System_Linq_ThrowHelper__ThrowArgumentNullException>
   77bd8:	cc                   	int3
   77bd9:	48 8d 3d 28 56 1e 00 	lea    0x1e5628(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77be0:	e8 bf d9 fe ff       	call   655a4 <RhpNewFast>
   77be5:	48 8b d8             	mov    %rax,%rbx
   77be8:	48 8b fb             	mov    %rbx,%rdi
   77beb:	48 8d 35 6e 25 1d 00 	lea    0x1d256e(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77bf2:	e8 59 33 01 00       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77bf7:	48 8b fb             	mov    %rbx,%rdi
   77bfa:	e8 0f dc fe ff       	call   6580e <RhpThrowEx>
   77bff:	48 8d 3d 02 56 1e 00 	lea    0x1e5602(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77c06:	e8 99 d9 fe ff       	call   655a4 <RhpNewFast>
   77c0b:	48 8b d8             	mov    %rax,%rbx
   77c0e:	48 8b fb             	mov    %rbx,%rdi
   77c11:	48 8d 35 48 25 1d 00 	lea    0x1d2548(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77c18:	e8 33 33 01 00       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77c1d:	48 8b fb             	mov    %rbx,%rdi
   77c20:	e8 e9 db fe ff       	call   6580e <RhpThrowEx>
   77c25:	e8 96 32 05 00       	call   caec0 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   77c2a:	cc                   	int3
   77c2b:	90                   	nop
   77c2c:	90                   	nop
   77c2d:	90                   	nop
   77c2e:	90                   	nop
   77c2f:	90                   	nop

0000000000077e00 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream>:
   77e00:	55                   	push   %rbp
   77e01:	41 57                	push   %r15
   77e03:	41 56                	push   %r14
   77e05:	41 55                	push   %r13
   77e07:	41 54                	push   %r12
   77e09:	53                   	push   %rbx
   77e0a:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
   77e11:	c5 f8 77             	vzeroupper
   77e14:	48 8d ac 24 00 01 00 	lea    0x100(%rsp),%rbp
   77e1b:	00 
   77e1c:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
   77e21:	c5 79 7f 85 20 ff ff 	vmovdqa %xmm8,-0xe0(%rbp)
   77e28:	ff 
   77e29:	c5 79 7f 85 30 ff ff 	vmovdqa %xmm8,-0xd0(%rbp)
   77e30:	ff 
   77e31:	48 b8 70 ff ff ff ff 	movabs $0xffffffffffffff70,%rax
   77e38:	ff ff ff 
   77e3b:	c5 79 7f 44 05 d0    	vmovdqa %xmm8,-0x30(%rbp,%rax,1)
   77e41:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
   77e47:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
   77e4d:	48 83 c0 30          	add    $0x30,%rax
   77e51:	75 e8                	jne    77e3b <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3b>
   77e53:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
   77e57:	48 8d 3d 92 64 1d 00 	lea    0x1d6492(%rip),%rdi        # 24e2f0 <__Str_Testing_GetIndicesStream__no_p_3BADE5A8245CDE1F293826A4BEA915BC6A54827377AA32C6394D40F198A479BE>
   77e5e:	e8 cd 4b 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   77e63:	48 8b 35 be 3c 1b 00 	mov    0x1b3cbe(%rip),%rsi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77e6a:	48 8b 5e 10          	mov    0x10(%rsi),%rbx
   77e6e:	8b 73 08             	mov    0x8(%rbx),%esi
   77e71:	48 8d 3d a8 d4 21 00 	lea    0x21d4a8(%rip),%rdi        # 295320 <_ZTV16__Array<UIntPtr>>
   77e78:	e8 3d d8 fe ff       	call   656ba <RhpNewArray>
   77e7d:	4c 8b f8             	mov    %rax,%r15
   77e80:	48 8b 15 a1 3c 1b 00 	mov    0x1b3ca1(%rip),%rdx        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77e87:	4c 8b 72 18          	mov    0x18(%rdx),%r14
   77e8b:	48 85 db             	test   %rbx,%rbx
   77e8e:	75 06                	jne    77e96 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x96>
   77e90:	33 d2                	xor    %edx,%edx
   77e92:	33 ff                	xor    %edi,%edi
   77e94:	eb 07                	jmp    77e9d <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x9d>
   77e96:	48 8d 53 10          	lea    0x10(%rbx),%rdx
   77e9a:	8b 7b 08             	mov    0x8(%rbx),%edi
   77e9d:	49 8d 77 10          	lea    0x10(%r15),%rsi
   77ea1:	41 8b 47 08          	mov    0x8(%r15),%eax
   77ea5:	41 80 7e 55 00       	cmpb   $0x0,0x55(%r14)
   77eaa:	0f 84 bb 01 00 00    	je     7806b <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x26b>
   77eb0:	3b f8                	cmp    %eax,%edi
   77eb2:	0f 85 9a 04 00 00    	jne    78352 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x552>
   77eb8:	41 0f b6 4e 54       	movzbl 0x54(%r14),%ecx
   77ebd:	4d 8b 46 38          	mov    0x38(%r14),%r8
   77ec1:	45 33 c9             	xor    %r9d,%r9d
   77ec4:	85 ff                	test   %edi,%edi
   77ec6:	4c 0f 45 ca          	cmovne %rdx,%r9
   77eca:	4c 89 4d a8          	mov    %r9,-0x58(%rbp)
   77ece:	33 d2                	xor    %edx,%edx
   77ed0:	85 c0                	test   %eax,%eax
   77ed2:	48 0f 45 d6          	cmovne %rsi,%rdx
   77ed6:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   77eda:	48 8b f2             	mov    %rdx,%rsi
   77edd:	85 c9                	test   %ecx,%ecx
   77edf:	0f 84 c4 00 00 00    	je     77fa9 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x1a9>
   77ee5:	33 c0                	xor    %eax,%eax
   77ee7:	85 ff                	test   %edi,%edi
   77ee9:	0f 8e 6d 01 00 00    	jle    7805c <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x25c>
   77eef:	49 8d 9e 80 00 00 00 	lea    0x80(%r14),%rbx
   77ef6:	48 63 d0             	movslq %eax,%rdx
   77ef9:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   77efd:	49 33 56 48          	xor    0x48(%r14),%rdx
   77f01:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77f08:	c1 7c 51 
   77f0b:	4c 8d 55 98          	lea    -0x68(%rbp),%r10
   77f0f:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   77f14:	4d 89 1a             	mov    %r11,(%r10)
   77f17:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   77f1b:	48 33 d1             	xor    %rcx,%rdx
   77f1e:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77f25:	c1 7c 51 
   77f28:	48 0f af d1          	imul   %rcx,%rdx
   77f2c:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
   77f33:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   77f37:	4c 8d 55 90          	lea    -0x70(%rbp),%r10
   77f3b:	4c 8b 9d 18 ff ff ff 	mov    -0xe8(%rbp),%r11
   77f42:	48 8b d1             	mov    %rcx,%rdx
   77f45:	c4 c2 93 f6 d3       	mulx   %r11,%r13,%rdx
   77f4a:	4d 89 2a             	mov    %r13,(%r10)
   77f4d:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   77f51:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   77f55:	49 33 56 48          	xor    0x48(%r14),%rdx
   77f59:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77f60:	c1 7c 51 
   77f63:	48 0f af d1          	imul   %rcx,%rdx
   77f67:	48 8b cb             	mov    %rbx,%rcx
   77f6a:	49 33 d3             	xor    %r11,%rdx
   77f6d:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   77f72:	48 8b 09             	mov    (%rcx),%rcx
   77f75:	4c 8d 55 88          	lea    -0x78(%rbp),%r10
   77f79:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   77f7e:	4d 89 1a             	mov    %r11,(%r10)
   77f81:	49 3b d0             	cmp    %r8,%rdx
   77f84:	72 0d                	jb     77f93 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x193>
   77f86:	41 2b d0             	sub    %r8d,%edx
   77f89:	49 8b 4e 58          	mov    0x58(%r14),%rcx
   77f8d:	48 63 d2             	movslq %edx,%rdx
   77f90:	8b 14 91             	mov    (%rcx,%rdx,4),%edx
   77f93:	48 63 c8             	movslq %eax,%rcx
   77f96:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   77f9a:	ff c0                	inc    %eax
   77f9c:	3b c7                	cmp    %edi,%eax
   77f9e:	0f 8c 52 ff ff ff    	jl     77ef6 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0xf6>
   77fa4:	e9 b3 00 00 00       	jmp    7805c <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x25c>
   77fa9:	33 c0                	xor    %eax,%eax
   77fab:	85 ff                	test   %edi,%edi
   77fad:	0f 8e a9 00 00 00    	jle    7805c <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x25c>
   77fb3:	49 8d 9e 80 00 00 00 	lea    0x80(%r14),%rbx
   77fba:	48 63 d0             	movslq %eax,%rdx
   77fbd:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   77fc1:	49 33 56 48          	xor    0x48(%r14),%rdx
   77fc5:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77fcc:	c1 7c 51 
   77fcf:	4c 8d 45 80          	lea    -0x80(%rbp),%r8
   77fd3:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   77fd8:	4d 89 10             	mov    %r10,(%r8)
   77fdb:	48 8b 4d 80          	mov    -0x80(%rbp),%rcx
   77fdf:	48 33 d1             	xor    %rcx,%rdx
   77fe2:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77fe9:	c1 7c 51 
   77fec:	48 0f af d1          	imul   %rcx,%rdx
   77ff0:	48 89 95 10 ff ff ff 	mov    %rdx,-0xf0(%rbp)
   77ff7:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   77ffb:	4c 8d 85 78 ff ff ff 	lea    -0x88(%rbp),%r8
   78002:	4c 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%r10
   78009:	48 8b d1             	mov    %rcx,%rdx
   7800c:	c4 c2 a3 f6 d2       	mulx   %r10,%r11,%rdx
   78011:	4d 89 18             	mov    %r11,(%r8)
   78014:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   78018:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   7801c:	49 33 56 48          	xor    0x48(%r14),%rdx
   78020:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   78027:	c1 7c 51 
   7802a:	48 0f af d1          	imul   %rcx,%rdx
   7802e:	48 8b cb             	mov    %rbx,%rcx
   78031:	49 33 d2             	xor    %r10,%rdx
   78034:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   78039:	48 8b 09             	mov    (%rcx),%rcx
   7803c:	4c 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%r8
   78043:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   78048:	4d 89 10             	mov    %r10,(%r8)
   7804b:	48 63 c8             	movslq %eax,%rcx
   7804e:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   78052:	ff c0                	inc    %eax
   78054:	3b c7                	cmp    %edi,%eax
   78056:	0f 8c 5e ff ff ff    	jl     77fba <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x1ba>
   7805c:	33 d2                	xor    %edx,%edx
   7805e:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   78062:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
   78066:	e9 a3 01 00 00       	jmp    7820e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x40e>
   7806b:	44 8b ef             	mov    %edi,%r13d
   7806e:	48 8b fe             	mov    %rsi,%rdi
   78071:	8b f0                	mov    %eax,%esi
   78073:	44 3b ee             	cmp    %esi,%r13d
   78076:	0f 85 fc 02 00 00    	jne    78378 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x578>
   7807c:	41 0f b6 46 54       	movzbl 0x54(%r14),%eax
   78081:	4d 8b 66 38          	mov    0x38(%r14),%r12
   78085:	33 c9                	xor    %ecx,%ecx
   78087:	45 85 ed             	test   %r13d,%r13d
   7808a:	48 0f 45 ca          	cmovne %rdx,%rcx
   7808e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
   78095:	48 8b d9             	mov    %rcx,%rbx
   78098:	33 d2                	xor    %edx,%edx
   7809a:	85 f6                	test   %esi,%esi
   7809c:	48 0f 45 d7          	cmovne %rdi,%rdx
   780a0:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
   780a7:	48 8b ca             	mov    %rdx,%rcx
   780aa:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
   780b1:	85 c0                	test   %eax,%eax
   780b3:	0f 84 18 01 00 00    	je     781d1 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3d1>
   780b9:	33 c0                	xor    %eax,%eax
   780bb:	45 85 ed             	test   %r13d,%r13d
   780be:	0f 8e 3a 01 00 00    	jle    781fe <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3fe>
   780c4:	89 85 54 ff ff ff    	mov    %eax,-0xac(%rbp)
   780ca:	48 63 d0             	movslq %eax,%rdx
   780cd:	48 8b 14 d3          	mov    (%rbx,%rdx,8),%rdx
   780d1:	49 33 56 48          	xor    0x48(%r14),%rdx
   780d5:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
   780dc:	c1 7c 51 
   780df:	48 8d b5 40 ff ff ff 	lea    -0xc0(%rbp),%rsi
   780e6:	c4 62 bb f6 cf       	mulx   %rdi,%r8,%r9
   780eb:	4c 89 06             	mov    %r8,(%rsi)
   780ee:	4c 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%r8
   780f5:	4d 33 c1             	xor    %r9,%r8
   780f8:	4c 0f af c7          	imul   %rdi,%r8
   780fc:	49 8b f8             	mov    %r8,%rdi
   780ff:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
   78106:	49 8d 56 78          	lea    0x78(%r14),%rdx
   7810a:	48 8b 12             	mov    (%rdx),%rdx
   7810d:	48 8d b5 38 ff ff ff 	lea    -0xc8(%rbp),%rsi
   78114:	c4 e2 bb f6 d7       	mulx   %rdi,%r8,%rdx
   78119:	4c 89 06             	mov    %r8,(%rsi)
   7811c:	49 8b 76 08          	mov    0x8(%r14),%rsi
   78120:	0f b6 14 16          	movzbl (%rsi,%rdx,1),%edx
   78124:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
   7812b:	49 8d 7e 68          	lea    0x68(%r14),%rdi
   7812f:	48 8b b5 08 ff ff ff 	mov    -0xf8(%rbp),%rsi
   78136:	e8 f5 30 00 00       	call   7b230 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Computation_FastReduce__Reduce>
   7813b:	49 0f af 46 18       	imul   0x18(%r14),%rax
   78140:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
   78147:	48 8b bd 48 ff ff ff 	mov    -0xb8(%rbp),%rdi
   7814e:	49 33 7e 48          	xor    0x48(%r14),%rdi
   78152:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
   78159:	c1 7c 51 
   7815c:	48 0f af fe          	imul   %rsi,%rdi
   78160:	49 8d b6 80 00 00 00 	lea    0x80(%r14),%rsi
   78167:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
   7816e:	48 33 fa             	xor    %rdx,%rdi
   78171:	48 0f af 7e 08       	imul   0x8(%rsi),%rdi
   78176:	48 8b 16             	mov    (%rsi),%rdx
   78179:	33 f6                	xor    %esi,%esi
   7817b:	33 c9                	xor    %ecx,%ecx
   7817d:	e8 ae bf 01 00       	call   94130 <S_P_CoreLib_System_UInt128__op_Multiply>
   78182:	48 8b f8             	mov    %rax,%rdi
   78185:	48 8b f2             	mov    %rdx,%rsi
   78188:	ba 40 00 00 00       	mov    $0x40,%edx
   7818d:	e8 ee bf 01 00       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
   78192:	48 8b b5 30 ff ff ff 	mov    -0xd0(%rbp),%rsi
   78199:	48 03 f0             	add    %rax,%rsi
   7819c:	49 3b f4             	cmp    %r12,%rsi
   7819f:	72 0d                	jb     781ae <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3ae>
   781a1:	41 2b f4             	sub    %r12d,%esi
   781a4:	49 8b 7e 58          	mov    0x58(%r14),%rdi
   781a8:	48 63 f6             	movslq %esi,%rsi
   781ab:	8b 34 b7             	mov    (%rdi,%rsi,4),%esi
   781ae:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
   781b4:	48 63 c7             	movslq %edi,%rax
   781b7:	48 8b 8d 58 ff ff ff 	mov    -0xa8(%rbp),%rcx
   781be:	48 89 34 c1          	mov    %rsi,(%rcx,%rax,8)
   781c2:	ff c7                	inc    %edi
   781c4:	41 3b fd             	cmp    %r13d,%edi
   781c7:	8b c7                	mov    %edi,%eax
   781c9:	0f 8c f5 fe ff ff    	jl     780c4 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x2c4>
   781cf:	eb 2d                	jmp    781fe <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3fe>
   781d1:	45 33 e4             	xor    %r12d,%r12d
   781d4:	45 85 ed             	test   %r13d,%r13d
   781d7:	7e 25                	jle    781fe <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3fe>
   781d9:	49 63 f4             	movslq %r12d,%rsi
   781dc:	48 8b 34 f3          	mov    (%rbx,%rsi,8),%rsi
   781e0:	49 8b fe             	mov    %r14,%rdi
   781e3:	e8 f8 bd 08 00       	call   103fe0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>
   781e8:	49 63 fc             	movslq %r12d,%rdi
   781eb:	48 8b b5 58 ff ff ff 	mov    -0xa8(%rbp),%rsi
   781f2:	48 89 04 fe          	mov    %rax,(%rsi,%rdi,8)
   781f6:	41 ff c4             	inc    %r12d
   781f9:	45 3b e5             	cmp    %r13d,%r12d
   781fc:	7c db                	jl     781d9 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3d9>
   781fe:	33 ff                	xor    %edi,%edi
   78200:	48 89 bd 60 ff ff ff 	mov    %rdi,-0xa0(%rbp)
   78207:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
   7820e:	48 8b 3d 13 39 1b 00 	mov    0x1b3913(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   78215:	48 8b 5f 18          	mov    0x18(%rdi),%rbx
   78219:	48 8b 3d 08 39 1b 00 	mov    0x1b3908(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   78220:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
   78224:	48 85 ff             	test   %rdi,%rdi
   78227:	75 08                	jne    78231 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x431>
   78229:	45 33 f6             	xor    %r14d,%r14d
   7822c:	45 33 ed             	xor    %r13d,%r13d
   7822f:	eb 08                	jmp    78239 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x439>
   78231:	4c 8d 77 10          	lea    0x10(%rdi),%r14
   78235:	44 8b 6f 08          	mov    0x8(%rdi),%r13d
   78239:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
   7823d:	c5 fa 7f 85 20 ff ff 	vmovdqu %xmm0,-0xe0(%rbp)
   78244:	ff 
   78245:	48 8d bd 20 ff ff ff 	lea    -0xe0(%rbp),%rdi
   7824c:	49 8b f7             	mov    %r15,%rsi
   7824f:	e8 1c 30 09 00       	call   10b270 <S_P_CoreLib_System_Span_1<UIntPtr>___ctor>
   78254:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
   7825b:	44 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%r8d
   78262:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
   78266:	74 13                	je     7827b <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x47b>
   78268:	49 8b f6             	mov    %r14,%rsi
   7826b:	41 8b d5             	mov    %r13d,%edx
   7826e:	48 8b fb             	mov    %rbx,%rdi
   78271:	45 33 c9             	xor    %r9d,%r9d
   78274:	e8 e7 c8 08 00       	call   104b60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart>
   78279:	eb 11                	jmp    7828c <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x48c>
   7827b:	49 8b f6             	mov    %r14,%rsi
   7827e:	41 8b d5             	mov    %r13d,%edx
   78281:	48 8b fb             	mov    %rbx,%rdi
   78284:	45 33 c9             	xor    %r9d,%r9d
   78287:	e8 f4 ca 08 00       	call   104d80 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart>
   7828c:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   78290:	be 25 00 00 00       	mov    $0x25,%esi
   78295:	ba 01 00 00 00       	mov    $0x1,%edx
   7829a:	e8 61 8f 04 00       	call   c1200 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler___ctor>
   7829f:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   782a3:	8b 75 c0             	mov    -0x40(%rbp),%esi
   782a6:	e8 85 1e 08 00       	call   fa130 <S_P_CoreLib_System_Span_1<Char>__Slice>
   782ab:	48 8b f0             	mov    %rax,%rsi
   782ae:	48 8d 3d 63 9f 1c 00 	lea    0x1c9f63(%rip),%rdi        # 242218 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   782b5:	39 3f                	cmp    %edi,(%rdi)
   782b7:	e8 04 c9 00 00       	call   84bc0 <String__TryCopyTo>
   782bc:	85 c0                	test   %eax,%eax
   782be:	74 0b                	je     782cb <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x4cb>
   782c0:	8b 7d c0             	mov    -0x40(%rbp),%edi
   782c3:	83 c7 0c             	add    $0xc,%edi
   782c6:	89 7d c0             	mov    %edi,-0x40(%rbp)
   782c9:	eb 10                	jmp    782db <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x4db>
   782cb:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   782cf:	48 8d 35 42 9f 1c 00 	lea    0x1c9f42(%rip),%rsi        # 242218 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   782d6:	e8 05 91 04 00       	call   c13e0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   782db:	48 8b 35 46 38 1b 00 	mov    0x1b3846(%rip),%rsi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   782e2:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   782e6:	8b 76 08             	mov    0x8(%rsi),%esi
   782e9:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   782ed:	e8 6e b9 0b 00       	call   133c60 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__AppendFormatted<Int32>>
   782f2:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   782f6:	8b 75 c0             	mov    -0x40(%rbp),%esi
   782f9:	e8 32 1e 08 00       	call   fa130 <S_P_CoreLib_System_Span_1<Char>__Slice>
   782fe:	48 8b f0             	mov    %rax,%rsi
   78301:	48 8d 3d 50 a4 1c 00 	lea    0x1ca450(%rip),%rdi        # 242758 <__Str__keys_without_prefetching_D8A361755FCD551AE19C922C947806AAE44FC92E986D052C498A0E8B5AAA0C53>
   78308:	39 3f                	cmp    %edi,(%rdi)
   7830a:	e8 b1 c8 00 00       	call   84bc0 <String__TryCopyTo>
   7830f:	85 c0                	test   %eax,%eax
   78311:	74 0b                	je     7831e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x51e>
   78313:	8b 7d c0             	mov    -0x40(%rbp),%edi
   78316:	83 c7 19             	add    $0x19,%edi
   78319:	89 7d c0             	mov    %edi,-0x40(%rbp)
   7831c:	eb 10                	jmp    7832e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x52e>
   7831e:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   78322:	48 8d 35 2f a4 1c 00 	lea    0x1ca42f(%rip),%rsi        # 242758 <__Str__keys_without_prefetching_D8A361755FCD551AE19C922C947806AAE44FC92E986D052C498A0E8B5AAA0C53>
   78329:	e8 b2 90 04 00       	call   c13e0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   7832e:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   78332:	e8 69 8f 04 00       	call   c12a0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__ToStringAndClear>
   78337:	48 8b f8             	mov    %rax,%rdi
   7833a:	e8 f1 46 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   7833f:	90                   	nop
   78340:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
   78347:	5b                   	pop    %rbx
   78348:	41 5c                	pop    %r12
   7834a:	41 5d                	pop    %r13
   7834c:	41 5e                	pop    %r14
   7834e:	41 5f                	pop    %r15
   78350:	5d                   	pop    %rbp
   78351:	c3                   	ret
   78352:	48 8d 3d af 4e 1e 00 	lea    0x1e4eaf(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
   78359:	e8 46 d2 fe ff       	call   655a4 <RhpNewFast>
   7835e:	48 8b d8             	mov    %rax,%rbx
   78361:	48 8b fb             	mov    %rbx,%rdi
   78364:	48 8d 35 f5 1d 1d 00 	lea    0x1d1df5(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   7836b:	e8 e0 2b 01 00       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
   78370:	48 8b fb             	mov    %rbx,%rdi
   78373:	e8 96 d4 fe ff       	call   6580e <RhpThrowEx>
   78378:	48 8d 3d 89 4e 1e 00 	lea    0x1e4e89(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
   7837f:	e8 20 d2 fe ff       	call   655a4 <RhpNewFast>
   78384:	48 8b d8             	mov    %rax,%rbx
   78387:	48 8b fb             	mov    %rbx,%rdi
   7838a:	48 8d 35 cf 1d 1d 00 	lea    0x1d1dcf(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   78391:	e8 ba 2b 01 00       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
   78396:	48 8b fb             	mov    %rbx,%rdi
   78399:	e8 70 d4 fe ff       	call   6580e <RhpThrowEx>
   7839e:	cc                   	int3
   7839f:	90                   	nop

00000000001047a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream>:
  1047a0:	55                   	push   %rbp
  1047a1:	41 57                	push   %r15
  1047a3:	41 56                	push   %r14
  1047a5:	41 55                	push   %r13
  1047a7:	41 54                	push   %r12
  1047a9:	53                   	push   %rbx
  1047aa:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
  1047b1:	c5 f8 77             	vzeroupper
  1047b4:	48 8d ac 24 b0 00 00 	lea    0xb0(%rsp),%rbp
  1047bb:	00 
  1047bc:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  1047c1:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  1047c8:	ff ff ff 
  1047cb:	c5 79 7f 44 05 d0    	vmovdqa %xmm8,-0x30(%rbp,%rax,1)
  1047d1:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
  1047d7:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
  1047dd:	48 83 c0 30          	add    $0x30,%rax
  1047e1:	75 e8                	jne    1047cb <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2b>
  1047e3:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  1047e7:	48 8b df             	mov    %rdi,%rbx
  1047ea:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  1047ee:	0f 84 2c 02 00 00    	je     104a20 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x280>
  1047f4:	44 8b fa             	mov    %edx,%r15d
  1047f7:	45 3b f8             	cmp    %r8d,%r15d
  1047fa:	0f 85 12 03 00 00    	jne    104b12 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x372>
  104800:	45 84 c9             	test   %r9b,%r9b
  104803:	74 06                	je     10480b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x6b>
  104805:	0f b6 53 54          	movzbl 0x54(%rbx),%edx
  104809:	eb 02                	jmp    10480d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x6d>
  10480b:	33 d2                	xor    %edx,%edx
  10480d:	4c 8b 73 38          	mov    0x38(%rbx),%r14
  104811:	33 ff                	xor    %edi,%edi
  104813:	45 85 ff             	test   %r15d,%r15d
  104816:	48 0f 45 fe          	cmovne %rsi,%rdi
  10481a:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  10481e:	4c 8b ef             	mov    %rdi,%r13
  104821:	33 ff                	xor    %edi,%edi
  104823:	45 85 c0             	test   %r8d,%r8d
  104826:	48 0f 45 f9          	cmovne %rcx,%rdi
  10482a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  10482e:	4c 8b e7             	mov    %rdi,%r12
  104831:	85 d2                	test   %edx,%edx
  104833:	0f 84 dd 00 00 00    	je     104916 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x176>
  104839:	33 c0                	xor    %eax,%eax
  10483b:	45 85 ff             	test   %r15d,%r15d
  10483e:	0f 8e c0 01 00 00    	jle    104a04 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x264>
  104844:	89 45 c4             	mov    %eax,-0x3c(%rbp)
  104847:	48 63 d0             	movslq %eax,%rdx
  10484a:	49 8b 54 d5 00       	mov    0x0(%r13,%rdx,8),%rdx
  10484f:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104853:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  10485a:	c1 7c 51 
  10485d:	48 8d 75 b8          	lea    -0x48(%rbp),%rsi
  104861:	c4 e2 f3 f6 d7       	mulx   %rdi,%rcx,%rdx
  104866:	48 89 0e             	mov    %rcx,(%rsi)
  104869:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  10486d:	48 33 d7             	xor    %rdi,%rdx
  104870:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  104877:	c1 7c 51 
  10487a:	48 0f af d7          	imul   %rdi,%rdx
  10487e:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  104885:	48 8b 7b 70          	mov    0x70(%rbx),%rdi
  104889:	48 8d 75 b0          	lea    -0x50(%rbp),%rsi
  10488d:	48 8b 8d 60 ff ff ff 	mov    -0xa0(%rbp),%rcx
  104894:	48 8b d7             	mov    %rdi,%rdx
  104897:	c4 e2 bb f6 d1       	mulx   %rcx,%r8,%rdx
  10489c:	4c 89 06             	mov    %r8,(%rsi)
  10489f:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  1048a3:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  1048a7:	48 33 53 48          	xor    0x48(%rbx),%rdx
  1048ab:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  1048b2:	c1 7c 51 
  1048b5:	48 0f af d7          	imul   %rdi,%rdx
  1048b9:	48 8d bb 80 00 00 00 	lea    0x80(%rbx),%rdi
  1048c0:	48 33 d1             	xor    %rcx,%rdx
  1048c3:	48 0f af 57 08       	imul   0x8(%rdi),%rdx
  1048c8:	48 8b 3f             	mov    (%rdi),%rdi
  1048cb:	48 8d 75 a8          	lea    -0x58(%rbp),%rsi
  1048cf:	c4 e2 f3 f6 ff       	mulx   %rdi,%rcx,%rdi
  1048d4:	48 89 0e             	mov    %rcx,(%rsi)
  1048d7:	48 8b f7             	mov    %rdi,%rsi
  1048da:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  1048de:	ba 40 00 00 00       	mov    $0x40,%edx
  1048e3:	e8 98 f8 f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1048e8:	49 3b c6             	cmp    %r14,%rax
  1048eb:	72 0d                	jb     1048fa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x15a>
  1048ed:	41 2b c6             	sub    %r14d,%eax
  1048f0:	48 8b 53 58          	mov    0x58(%rbx),%rdx
  1048f4:	48 63 f8             	movslq %eax,%rdi
  1048f7:	8b 04 ba             	mov    (%rdx,%rdi,4),%eax
  1048fa:	8b 55 c4             	mov    -0x3c(%rbp),%edx
  1048fd:	48 63 fa             	movslq %edx,%rdi
  104900:	49 89 04 fc          	mov    %rax,(%r12,%rdi,8)
  104904:	ff c2                	inc    %edx
  104906:	41 3b d7             	cmp    %r15d,%edx
  104909:	8b c2                	mov    %edx,%eax
  10490b:	0f 8c 33 ff ff ff    	jl     104844 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0xa4>
  104911:	e9 ee 00 00 00       	jmp    104a04 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x264>
  104916:	45 33 f6             	xor    %r14d,%r14d
  104919:	45 85 ff             	test   %r15d,%r15d
  10491c:	0f 8e e2 00 00 00    	jle    104a04 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x264>
  104922:	49 63 d6             	movslq %r14d,%rdx
  104925:	49 8b 7c d5 00       	mov    0x0(%r13,%rdx,8),%rdi
  10492a:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  10492e:	48 8d 55 a0          	lea    -0x60(%rbp),%rdx
  104932:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  104939:	c1 7c 51 
  10493c:	e8 9f f4 f7 ff       	call   83de0 <S_P_CoreLib_System_Math__BigMul_0>
  104941:	48 8b f0             	mov    %rax,%rsi
  104944:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
  104948:	c5 f8 11 45 90       	vmovups %xmm0,-0x70(%rbp)
  10494d:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
  104951:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  104955:	e8 a6 f7 f8 ff       	call   94100 <S_P_CoreLib_System_UInt128___ctor>
  10495a:	48 8b 45 90          	mov    -0x70(%rbp),%rax
  10495e:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
  104965:	48 8b 75 98          	mov    -0x68(%rbp),%rsi
  104969:	48 8b f8             	mov    %rax,%rdi
  10496c:	ba 40 00 00 00       	mov    $0x40,%edx
  104971:	e8 0a f8 f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104976:	48 8b 8d 58 ff ff ff 	mov    -0xa8(%rbp),%rcx
  10497d:	48 33 c1             	xor    %rcx,%rax
  104980:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
  104987:	c1 7c 51 
  10498a:	48 0f af c1          	imul   %rcx,%rax
  10498e:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)
  104995:	48 8b fb             	mov    %rbx,%rdi
  104998:	48 8b b5 50 ff ff ff 	mov    -0xb0(%rbp),%rsi
  10499f:	e8 bc fc ff ff       	call   104660 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__BucketInPart>
  1049a4:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  1049a8:	40 0f b6 3c 07       	rex movzbl (%rdi,%rax,1),%edi
  1049ad:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  1049b1:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  1049b8:	c1 7c 51 
  1049bb:	48 0f af fe          	imul   %rsi,%rdi
  1049bf:	48 8d b3 80 00 00 00 	lea    0x80(%rbx),%rsi
  1049c6:	48 8b 95 50 ff ff ff 	mov    -0xb0(%rbp),%rdx
  1049cd:	48 33 fa             	xor    %rdx,%rdi
  1049d0:	48 0f af 7e 08       	imul   0x8(%rsi),%rdi
  1049d5:	48 8b 16             	mov    (%rsi),%rdx
  1049d8:	33 f6                	xor    %esi,%esi
  1049da:	33 c9                	xor    %ecx,%ecx
  1049dc:	e8 4f f7 f8 ff       	call   94130 <S_P_CoreLib_System_UInt128__op_Multiply>
  1049e1:	48 8b f8             	mov    %rax,%rdi
  1049e4:	48 8b f2             	mov    %rdx,%rsi
  1049e7:	ba 40 00 00 00       	mov    $0x40,%edx
  1049ec:	e8 8f f7 f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1049f1:	49 63 fe             	movslq %r14d,%rdi
  1049f4:	49 89 04 fc          	mov    %rax,(%r12,%rdi,8)
  1049f8:	41 ff c6             	inc    %r14d
  1049fb:	45 3b f7             	cmp    %r15d,%r14d
  1049fe:	0f 8c 1e ff ff ff    	jl     104922 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x182>
  104a04:	33 ff                	xor    %edi,%edi
  104a06:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  104a0a:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  104a0e:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  104a15:	5b                   	pop    %rbx
  104a16:	41 5c                	pop    %r12
  104a18:	41 5d                	pop    %r13
  104a1a:	41 5e                	pop    %r14
  104a1c:	41 5f                	pop    %r15
  104a1e:	5d                   	pop    %rbp
  104a1f:	c3                   	ret
  104a20:	48 8b fe             	mov    %rsi,%rdi
  104a23:	44 8b fa             	mov    %edx,%r15d
  104a26:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
  104a2a:	44 89 45 88          	mov    %r8d,-0x78(%rbp)
  104a2e:	44 3b 7d 88          	cmp    -0x78(%rbp),%r15d
  104a32:	0f 85 00 01 00 00    	jne    104b38 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x398>
  104a38:	45 84 c9             	test   %r9b,%r9b
  104a3b:	74 07                	je     104a44 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2a4>
  104a3d:	44 0f b6 73 54       	movzbl 0x54(%rbx),%r14d
  104a42:	eb 03                	jmp    104a47 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2a7>
  104a44:	45 33 f6             	xor    %r14d,%r14d
  104a47:	4c 8b 6b 38          	mov    0x38(%rbx),%r13
  104a4b:	33 c0                	xor    %eax,%eax
  104a4d:	45 85 ff             	test   %r15d,%r15d
  104a50:	48 0f 45 c7          	cmovne %rdi,%rax
  104a54:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
  104a5b:	4c 8b e0             	mov    %rax,%r12
  104a5e:	48 8d 7d 80          	lea    -0x80(%rbp),%rdi
  104a62:	e8 29 68 00 00       	call   10b290 <S_P_CoreLib_System_Span_1<UIntPtr>__GetPinnableReference>
  104a67:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
  104a6e:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
  104a75:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
  104a7c:	45 85 f6             	test   %r14d,%r14d
  104a7f:	74 41                	je     104ac2 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x322>
  104a81:	45 33 f6             	xor    %r14d,%r14d
  104a84:	45 85 ff             	test   %r15d,%r15d
  104a87:	7e 67                	jle    104af0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x350>
  104a89:	49 63 f6             	movslq %r14d,%rsi
  104a8c:	49 8b 34 f4          	mov    (%r12,%rsi,8),%rsi
  104a90:	48 8b fb             	mov    %rbx,%rdi
  104a93:	e8 48 f5 ff ff       	call   103fe0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>
  104a98:	49 3b c5             	cmp    %r13,%rax
  104a9b:	72 0d                	jb     104aaa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x30a>
  104a9d:	41 2b c5             	sub    %r13d,%eax
  104aa0:	48 8b 73 58          	mov    0x58(%rbx),%rsi
  104aa4:	48 63 f8             	movslq %eax,%rdi
  104aa7:	8b 04 be             	mov    (%rsi,%rdi,4),%eax
  104aaa:	49 63 f6             	movslq %r14d,%rsi
  104aad:	48 8b 8d 68 ff ff ff 	mov    -0x98(%rbp),%rcx
  104ab4:	48 89 04 f1          	mov    %rax,(%rcx,%rsi,8)
  104ab8:	41 ff c6             	inc    %r14d
  104abb:	45 3b f7             	cmp    %r15d,%r14d
  104abe:	7c c9                	jl     104a89 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2e9>
  104ac0:	eb 2e                	jmp    104af0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x350>
  104ac2:	45 33 f6             	xor    %r14d,%r14d
  104ac5:	45 85 ff             	test   %r15d,%r15d
  104ac8:	7e 26                	jle    104af0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x350>
  104aca:	49 63 f6             	movslq %r14d,%rsi
  104acd:	49 8b 34 f4          	mov    (%r12,%rsi,8),%rsi
  104ad1:	48 8b fb             	mov    %rbx,%rdi
  104ad4:	e8 07 f5 ff ff       	call   103fe0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>
  104ad9:	49 63 fe             	movslq %r14d,%rdi
  104adc:	4c 8b ad 68 ff ff ff 	mov    -0x98(%rbp),%r13
  104ae3:	49 89 44 fd 00       	mov    %rax,0x0(%r13,%rdi,8)
  104ae8:	41 ff c6             	inc    %r14d
  104aeb:	45 3b f7             	cmp    %r15d,%r14d
  104aee:	7c da                	jl     104aca <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x32a>
  104af0:	33 ff                	xor    %edi,%edi
  104af2:	48 89 bd 70 ff ff ff 	mov    %rdi,-0x90(%rbp)
  104af9:	48 89 bd 78 ff ff ff 	mov    %rdi,-0x88(%rbp)
  104b00:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  104b07:	5b                   	pop    %rbx
  104b08:	41 5c                	pop    %r12
  104b0a:	41 5d                	pop    %r13
  104b0c:	41 5e                	pop    %r14
  104b0e:	41 5f                	pop    %r15
  104b10:	5d                   	pop    %rbp
  104b11:	c3                   	ret
  104b12:	48 8d 3d ef 86 15 00 	lea    0x1586ef(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  104b19:	e8 86 0a f6 ff       	call   655a4 <RhpNewFast>
  104b1e:	48 8b d8             	mov    %rax,%rbx
  104b21:	48 8b fb             	mov    %rbx,%rdi
  104b24:	48 8d 35 35 56 14 00 	lea    0x145635(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104b2b:	e8 20 64 f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104b30:	48 8b fb             	mov    %rbx,%rdi
  104b33:	e8 d6 0c f6 ff       	call   6580e <RhpThrowEx>
  104b38:	48 8d 3d c9 86 15 00 	lea    0x1586c9(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  104b3f:	e8 60 0a f6 ff       	call   655a4 <RhpNewFast>
  104b44:	48 8b d8             	mov    %rax,%rbx
  104b47:	48 8b fb             	mov    %rbx,%rdi
  104b4a:	48 8d 35 0f 56 14 00 	lea    0x14560f(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104b51:	e8 fa 63 f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104b56:	48 8b fb             	mov    %rbx,%rdi
  104b59:	e8 b0 0c f6 ff       	call   6580e <RhpThrowEx>
  104b5e:	cc                   	int3
  104b5f:	90                   	nop

0000000000104b60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart>:
  104b60:	55                   	push   %rbp
  104b61:	41 57                	push   %r15
  104b63:	53                   	push   %rbx
  104b64:	48 83 ec 60          	sub    $0x60,%rsp
  104b68:	48 8d 6c 24 70       	lea    0x70(%rsp),%rbp
  104b6d:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104b72:	c5 79 7f 45 b0       	vmovdqa %xmm8,-0x50(%rbp)
  104b77:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  104b7c:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  104b81:	c5 79 7f 45 e0       	vmovdqa %xmm8,-0x20(%rbp)
  104b86:	41 3b d0             	cmp    %r8d,%edx
  104b89:	0f 85 b9 01 00 00    	jne    104d48 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1e8>
  104b8f:	45 84 c9             	test   %r9b,%r9b
  104b92:	74 06                	je     104b9a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x3a>
  104b94:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  104b98:	eb 02                	jmp    104b9c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x3c>
  104b9a:	33 c0                	xor    %eax,%eax
  104b9c:	4c 8b 4f 38          	mov    0x38(%rdi),%r9
  104ba0:	45 33 d2             	xor    %r10d,%r10d
  104ba3:	85 d2                	test   %edx,%edx
  104ba5:	4c 0f 45 d6          	cmovne %rsi,%r10
  104ba9:	4c 89 55 e8          	mov    %r10,-0x18(%rbp)
  104bad:	49 8b f2             	mov    %r10,%rsi
  104bb0:	45 33 d2             	xor    %r10d,%r10d
  104bb3:	45 85 c0             	test   %r8d,%r8d
  104bb6:	4c 0f 45 d1          	cmovne %rcx,%r10
  104bba:	4c 89 55 e0          	mov    %r10,-0x20(%rbp)
  104bbe:	49 8b ca             	mov    %r10,%rcx
  104bc1:	85 c0                	test   %eax,%eax
  104bc3:	0f 84 c2 00 00 00    	je     104c8b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x12b>
  104bc9:	33 c0                	xor    %eax,%eax
  104bcb:	89 55 ac             	mov    %edx,-0x54(%rbp)
  104bce:	85 d2                	test   %edx,%edx
  104bd0:	0f 8e 5f 01 00 00    	jle    104d35 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1d5>
  104bd6:	4c 8d 87 80 00 00 00 	lea    0x80(%rdi),%r8
  104bdd:	4c 63 d0             	movslq %eax,%r10
  104be0:	4e 8b 14 d6          	mov    (%rsi,%r10,8),%r10
  104be4:	4c 33 57 48          	xor    0x48(%rdi),%r10
  104be8:	49 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r11
  104bef:	c1 7c 51 
  104bf2:	48 8d 5d d8          	lea    -0x28(%rbp),%rbx
  104bf6:	49 8b d2             	mov    %r10,%rdx
  104bf9:	c4 c2 83 f6 d3       	mulx   %r11,%r15,%rdx
  104bfe:	4c 89 3b             	mov    %r15,(%rbx)
  104c01:	4c 8b 55 d8          	mov    -0x28(%rbp),%r10
  104c05:	49 33 d2             	xor    %r10,%rdx
  104c08:	49 0f af d3          	imul   %r11,%rdx
  104c0c:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  104c10:	4c 8b 57 70          	mov    0x70(%rdi),%r10
  104c14:	4c 8d 5d d0          	lea    -0x30(%rbp),%r11
  104c18:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  104c1c:	49 8b d2             	mov    %r10,%rdx
  104c1f:	c4 e2 83 f6 d3       	mulx   %rbx,%r15,%rdx
  104c24:	4d 89 3b             	mov    %r15,(%r11)
  104c27:	4c 8b 57 08          	mov    0x8(%rdi),%r10
  104c2b:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  104c30:	48 33 57 48          	xor    0x48(%rdi),%rdx
  104c34:	49 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r10
  104c3b:	c1 7c 51 
  104c3e:	49 0f af d2          	imul   %r10,%rdx
  104c42:	4d 8b d0             	mov    %r8,%r10
  104c45:	48 33 d3             	xor    %rbx,%rdx
  104c48:	49 0f af 52 08       	imul   0x8(%r10),%rdx
  104c4d:	4d 8b 12             	mov    (%r10),%r10
  104c50:	4c 8d 5d c8          	lea    -0x38(%rbp),%r11
  104c54:	c4 c2 e3 f6 d2       	mulx   %r10,%rbx,%rdx
  104c59:	49 89 1b             	mov    %rbx,(%r11)
  104c5c:	49 3b d1             	cmp    %r9,%rdx
  104c5f:	72 0e                	jb     104c6f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x10f>
  104c61:	41 2b d1             	sub    %r9d,%edx
  104c64:	4c 8b 57 58          	mov    0x58(%rdi),%r10
  104c68:	48 63 d2             	movslq %edx,%rdx
  104c6b:	41 8b 14 92          	mov    (%r10,%rdx,4),%edx
  104c6f:	4c 63 d0             	movslq %eax,%r10
  104c72:	4a 89 14 d1          	mov    %rdx,(%rcx,%r10,8)
  104c76:	ff c0                	inc    %eax
  104c78:	8b 55 ac             	mov    -0x54(%rbp),%edx
  104c7b:	3b c2                	cmp    %edx,%eax
  104c7d:	89 55 ac             	mov    %edx,-0x54(%rbp)
  104c80:	0f 8c 57 ff ff ff    	jl     104bdd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x7d>
  104c86:	e9 aa 00 00 00       	jmp    104d35 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1d5>
  104c8b:	33 c0                	xor    %eax,%eax
  104c8d:	89 55 ac             	mov    %edx,-0x54(%rbp)
  104c90:	85 d2                	test   %edx,%edx
  104c92:	0f 8e 9d 00 00 00    	jle    104d35 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1d5>
  104c98:	4c 8d 87 80 00 00 00 	lea    0x80(%rdi),%r8
  104c9f:	4c 63 c8             	movslq %eax,%r9
  104ca2:	4e 8b 0c ce          	mov    (%rsi,%r9,8),%r9
  104ca6:	4c 33 4f 48          	xor    0x48(%rdi),%r9
  104caa:	49 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r10
  104cb1:	c1 7c 51 
  104cb4:	4c 8d 5d c0          	lea    -0x40(%rbp),%r11
  104cb8:	49 8b d1             	mov    %r9,%rdx
  104cbb:	c4 c2 e3 f6 d2       	mulx   %r10,%rbx,%rdx
  104cc0:	49 89 1b             	mov    %rbx,(%r11)
  104cc3:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
  104cc7:	49 33 d1             	xor    %r9,%rdx
  104cca:	49 0f af d2          	imul   %r10,%rdx
  104cce:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  104cd2:	4c 8b 4f 70          	mov    0x70(%rdi),%r9
  104cd6:	4c 8d 55 b8          	lea    -0x48(%rbp),%r10
  104cda:	4c 8b 5d 98          	mov    -0x68(%rbp),%r11
  104cde:	49 8b d1             	mov    %r9,%rdx
  104ce1:	c4 c2 e3 f6 d3       	mulx   %r11,%rbx,%rdx
  104ce6:	49 89 1a             	mov    %rbx,(%r10)
  104ce9:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
  104ced:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  104cf2:	48 33 57 48          	xor    0x48(%rdi),%rdx
  104cf6:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
  104cfd:	c1 7c 51 
  104d00:	49 0f af d1          	imul   %r9,%rdx
  104d04:	4d 8b c8             	mov    %r8,%r9
  104d07:	49 33 d3             	xor    %r11,%rdx
  104d0a:	49 0f af 51 08       	imul   0x8(%r9),%rdx
  104d0f:	4d 8b 09             	mov    (%r9),%r9
  104d12:	4c 8d 55 b0          	lea    -0x50(%rbp),%r10
  104d16:	c4 c2 a3 f6 d1       	mulx   %r9,%r11,%rdx
  104d1b:	4d 89 1a             	mov    %r11,(%r10)
  104d1e:	4c 63 c8             	movslq %eax,%r9
  104d21:	4a 89 14 c9          	mov    %rdx,(%rcx,%r9,8)
  104d25:	ff c0                	inc    %eax
  104d27:	8b 55 ac             	mov    -0x54(%rbp),%edx
  104d2a:	3b c2                	cmp    %edx,%eax
  104d2c:	89 55 ac             	mov    %edx,-0x54(%rbp)
  104d2f:	0f 8c 6a ff ff ff    	jl     104c9f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x13f>
  104d35:	33 ff                	xor    %edi,%edi
  104d37:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  104d3b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  104d3f:	48 83 c4 60          	add    $0x60,%rsp
  104d43:	5b                   	pop    %rbx
  104d44:	41 5f                	pop    %r15
  104d46:	5d                   	pop    %rbp
  104d47:	c3                   	ret
  104d48:	48 8d 3d b9 84 15 00 	lea    0x1584b9(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  104d4f:	e8 50 08 f6 ff       	call   655a4 <RhpNewFast>
  104d54:	48 8b d8             	mov    %rax,%rbx
  104d57:	48 8b fb             	mov    %rbx,%rdi
  104d5a:	48 8d 35 ff 53 14 00 	lea    0x1453ff(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104d61:	e8 ea 61 f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104d66:	48 8b fb             	mov    %rbx,%rdi
  104d69:	e8 a0 0a f6 ff       	call   6580e <RhpThrowEx>
  104d6e:	cc                   	int3
  104d6f:	90                   	nop
  104d70:	90                   	nop
  104d71:	90                   	nop
  104d72:	90                   	nop
  104d73:	90                   	nop
  104d74:	90                   	nop
  104d75:	90                   	nop
  104d76:	90                   	nop
  104d77:	90                   	nop
  104d78:	90                   	nop
  104d79:	90                   	nop
  104d7a:	90                   	nop
  104d7b:	90                   	nop
  104d7c:	90                   	nop
  104d7d:	90                   	nop
  104d7e:	90                   	nop
  104d7f:	90                   	nop

0000000000104d80 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart>:
  104d80:	55                   	push   %rbp
  104d81:	41 57                	push   %r15
  104d83:	41 56                	push   %r14
  104d85:	41 55                	push   %r13
  104d87:	53                   	push   %rbx
  104d88:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
  104d8f:	48 8d ac 24 a0 00 00 	lea    0xa0(%rsp),%rbp
  104d96:	00 
  104d97:	33 c0                	xor    %eax,%eax
  104d99:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
  104da0:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104da5:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  104dac:	ff ff ff 
  104daf:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
  104db5:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
  104dbb:	c5 79 7f 04 28       	vmovdqa %xmm8,(%rax,%rbp,1)
  104dc0:	48 83 c0 30          	add    $0x30,%rax
  104dc4:	75 e9                	jne    104daf <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x2f>
  104dc6:	41 3b d0             	cmp    %r8d,%edx
  104dc9:	0f 85 48 02 00 00    	jne    105017 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x297>
  104dcf:	45 84 c9             	test   %r9b,%r9b
  104dd2:	74 06                	je     104dda <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x5a>
  104dd4:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  104dd8:	eb 02                	jmp    104ddc <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x5c>
  104dda:	33 c0                	xor    %eax,%eax
  104ddc:	4c 8b 4f 38          	mov    0x38(%rdi),%r9
  104de0:	45 33 d2             	xor    %r10d,%r10d
  104de3:	85 d2                	test   %edx,%edx
  104de5:	4c 0f 45 d6          	cmovne %rsi,%r10
  104de9:	4c 89 55 d8          	mov    %r10,-0x28(%rbp)
  104ded:	49 8b f2             	mov    %r10,%rsi
  104df0:	45 33 d2             	xor    %r10d,%r10d
  104df3:	45 85 c0             	test   %r8d,%r8d
  104df6:	4c 0f 45 d1          	cmovne %rcx,%r10
  104dfa:	4c 89 55 d0          	mov    %r10,-0x30(%rbp)
  104dfe:	49 8b ca             	mov    %r10,%rcx
  104e01:	85 c0                	test   %eax,%eax
  104e03:	0f 84 09 01 00 00    	je     104f12 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x192>
  104e09:	33 c0                	xor    %eax,%eax
  104e0b:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  104e11:	85 d2                	test   %edx,%edx
  104e13:	0f 8e e4 01 00 00    	jle    104ffd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x27d>
  104e19:	4c 8d 47 78          	lea    0x78(%rdi),%r8
  104e1d:	4c 8d 57 68          	lea    0x68(%rdi),%r10
  104e21:	4c 8d 9f 80 00 00 00 	lea    0x80(%rdi),%r11
  104e28:	48 63 d8             	movslq %eax,%rbx
  104e2b:	48 8b 1c de          	mov    (%rsi,%rbx,8),%rbx
  104e2f:	48 33 5f 48          	xor    0x48(%rdi),%rbx
  104e33:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  104e3a:	c1 7c 51 
  104e3d:	4c 8d 75 c0          	lea    -0x40(%rbp),%r14
  104e41:	48 8b d3             	mov    %rbx,%rdx
  104e44:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  104e49:	4d 89 2e             	mov    %r13,(%r14)
  104e4c:	48 8b 5d c0          	mov    -0x40(%rbp),%rbx
  104e50:	48 33 d3             	xor    %rbx,%rdx
  104e53:	49 0f af d7          	imul   %r15,%rdx
  104e57:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
  104e5e:	49 8b d8             	mov    %r8,%rbx
  104e61:	48 8b 1b             	mov    (%rbx),%rbx
  104e64:	4c 8d 7d b8          	lea    -0x48(%rbp),%r15
  104e68:	4c 8b b5 68 ff ff ff 	mov    -0x98(%rbp),%r14
  104e6f:	48 8b d3             	mov    %rbx,%rdx
  104e72:	c4 c2 93 f6 d6       	mulx   %r14,%r13,%rdx
  104e77:	4d 89 2f             	mov    %r13,(%r15)
  104e7a:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
  104e7e:	0f b6 14 13          	movzbl (%rbx,%rdx,1),%edx
  104e82:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  104e86:	49 8b da             	mov    %r10,%rbx
  104e89:	48 8b 1b             	mov    (%rbx),%rbx
  104e8c:	4c 8d 7d a8          	lea    -0x58(%rbp),%r15
  104e90:	48 8b d3             	mov    %rbx,%rdx
  104e93:	c4 c2 93 f6 d6       	mulx   %r14,%r13,%rdx
  104e98:	4d 89 2f             	mov    %r13,(%r15)
  104e9b:	48 0f af 57 18       	imul   0x18(%rdi),%rdx
  104ea0:	48 89 55 b0          	mov    %rdx,-0x50(%rbp)
  104ea4:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
  104ea8:	48 33 5f 48          	xor    0x48(%rdi),%rbx
  104eac:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  104eb3:	c1 7c 51 
  104eb6:	49 0f af df          	imul   %r15,%rbx
  104eba:	4d 8b fb             	mov    %r11,%r15
  104ebd:	49 33 de             	xor    %r14,%rbx
  104ec0:	49 0f af 5f 08       	imul   0x8(%r15),%rbx
  104ec5:	4d 8b 3f             	mov    (%r15),%r15
  104ec8:	4c 8d 75 a0          	lea    -0x60(%rbp),%r14
  104ecc:	48 8b d3             	mov    %rbx,%rdx
  104ecf:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  104ed4:	4d 89 2e             	mov    %r13,(%r14)
  104ed7:	48 8b 5d b0          	mov    -0x50(%rbp),%rbx
  104edb:	48 03 d3             	add    %rbx,%rdx
  104ede:	49 3b d1             	cmp    %r9,%rdx
  104ee1:	72 0d                	jb     104ef0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x170>
  104ee3:	41 2b d1             	sub    %r9d,%edx
  104ee6:	48 8b 5f 58          	mov    0x58(%rdi),%rbx
  104eea:	48 63 d2             	movslq %edx,%rdx
  104eed:	8b 14 93             	mov    (%rbx,%rdx,4),%edx
  104ef0:	48 63 d8             	movslq %eax,%rbx
  104ef3:	48 89 14 d9          	mov    %rdx,(%rcx,%rbx,8)
  104ef7:	ff c0                	inc    %eax
  104ef9:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  104eff:	3b c2                	cmp    %edx,%eax
  104f01:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  104f07:	0f 8c 1b ff ff ff    	jl     104e28 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0xa8>
  104f0d:	e9 eb 00 00 00       	jmp    104ffd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x27d>
  104f12:	33 c0                	xor    %eax,%eax
  104f14:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  104f1a:	85 d2                	test   %edx,%edx
  104f1c:	0f 8e db 00 00 00    	jle    104ffd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x27d>
  104f22:	4c 8d 47 78          	lea    0x78(%rdi),%r8
  104f26:	4c 8d 57 68          	lea    0x68(%rdi),%r10
  104f2a:	4c 8d 9f 80 00 00 00 	lea    0x80(%rdi),%r11
  104f31:	4c 63 c8             	movslq %eax,%r9
  104f34:	4e 8b 0c ce          	mov    (%rsi,%r9,8),%r9
  104f38:	4c 33 4f 48          	xor    0x48(%rdi),%r9
  104f3c:	48 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rbx
  104f43:	c1 7c 51 
  104f46:	4c 8d 7d 90          	lea    -0x70(%rbp),%r15
  104f4a:	49 8b d1             	mov    %r9,%rdx
  104f4d:	c4 e2 8b f6 d3       	mulx   %rbx,%r14,%rdx
  104f52:	4d 89 37             	mov    %r14,(%r15)
  104f55:	4c 8b 4d 90          	mov    -0x70(%rbp),%r9
  104f59:	49 33 d1             	xor    %r9,%rdx
  104f5c:	48 0f af d3          	imul   %rbx,%rdx
  104f60:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  104f67:	4d 8b c8             	mov    %r8,%r9
  104f6a:	4d 8b 09             	mov    (%r9),%r9
  104f6d:	48 8d 5d 88          	lea    -0x78(%rbp),%rbx
  104f71:	4c 8b bd 60 ff ff ff 	mov    -0xa0(%rbp),%r15
  104f78:	49 8b d1             	mov    %r9,%rdx
  104f7b:	c4 c2 8b f6 d7       	mulx   %r15,%r14,%rdx
  104f80:	4c 89 33             	mov    %r14,(%rbx)
  104f83:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
  104f87:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  104f8c:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  104f90:	4d 8b ca             	mov    %r10,%r9
  104f93:	4d 8b 09             	mov    (%r9),%r9
  104f96:	48 8d 5d 80          	lea    -0x80(%rbp),%rbx
  104f9a:	49 8b d1             	mov    %r9,%rdx
  104f9d:	c4 42 8b f6 cf       	mulx   %r15,%r14,%r9
  104fa2:	4c 89 33             	mov    %r14,(%rbx)
  104fa5:	4c 0f af 4f 18       	imul   0x18(%rdi),%r9
  104faa:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
  104fae:	48 33 57 48          	xor    0x48(%rdi),%rdx
  104fb2:	48 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rbx
  104fb9:	c1 7c 51 
  104fbc:	48 0f af d3          	imul   %rbx,%rdx
  104fc0:	49 8b db             	mov    %r11,%rbx
  104fc3:	49 33 d7             	xor    %r15,%rdx
  104fc6:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  104fcb:	48 8b 1b             	mov    (%rbx),%rbx
  104fce:	4c 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%r15
  104fd5:	c4 e2 8b f6 d3       	mulx   %rbx,%r14,%rdx
  104fda:	4d 89 37             	mov    %r14,(%r15)
  104fdd:	49 03 d1             	add    %r9,%rdx
  104fe0:	4c 63 c8             	movslq %eax,%r9
  104fe3:	4a 89 14 c9          	mov    %rdx,(%rcx,%r9,8)
  104fe7:	ff c0                	inc    %eax
  104fe9:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  104fef:	3b c2                	cmp    %edx,%eax
  104ff1:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  104ff7:	0f 8c 34 ff ff ff    	jl     104f31 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x1b1>
  104ffd:	33 ff                	xor    %edi,%edi
  104fff:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  105003:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  105007:	48 81 c4 80 00 00 00 	add    $0x80,%rsp
  10500e:	5b                   	pop    %rbx
  10500f:	41 5d                	pop    %r13
  105011:	41 5e                	pop    %r14
  105013:	41 5f                	pop    %r15
  105015:	5d                   	pop    %rbp
  105016:	c3                   	ret
  105017:	48 8d 3d ea 81 15 00 	lea    0x1581ea(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  10501e:	e8 81 05 f6 ff       	call   655a4 <RhpNewFast>
  105023:	48 8b d8             	mov    %rax,%rbx
  105026:	48 8b fb             	mov    %rbx,%rdi
  105029:	48 8d 35 30 51 14 00 	lea    0x145130(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  105030:	e8 1b 5f f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  105035:	48 8b fb             	mov    %rbx,%rdi
  105038:	e8 d1 07 f6 ff       	call   6580e <RhpThrowEx>
  10503d:	cc                   	int3
  10503e:	90                   	nop
  10503f:	90                   	nop

