   77384:	e8 27 07 00 00       	call   77ab0 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch>
   77389:	e8 f2 08 00 00       	call   77c80 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream>
   7738e:	e8 8d 0e 00 00       	call   78220 <ASM_Analysis_AsmGeneration_Program__TestSingleLookups>
   77393:	e8 e8 11 00 00       	call   78580 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern>
   77398:	48 8d 3d d1 2a 1c 00 	lea    0x1c2ad1(%rip),%rdi        # 239e70 <__Str_Assembly_generation_complete__E694E220ABB5E659C8FE3A93D59496D8C08AFB825EDBB706847AAF14012E93FD>
   7739f:	e8 4c 53 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
   773a4:	48 8d 3d e5 33 1c 00 	lea    0x1c33e5(%rip),%rdi        # 23a790 <__Str_Check_output_for_JIT_generated_E88BF50A10FDFF15CB02EFCA372E5395BD12F2100779560FE4DB5574C46B7085>
   773ab:	e8 40 53 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
   773b0:	90                   	nop
   773b1:	48 83 c4 60          	add    $0x60,%rsp
   773b5:	5b                   	pop    %rbx
   773b6:	41 5d                	pop    %r13
   773b8:	41 5e                	pop    %r14
   773ba:	41 5f                	pop    %r15
   773bc:	5d                   	pop    %rbp
   773bd:	c3                   	ret
   773be:	e8 1d b4 01 00       	call   927e0 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
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

   774ac:	e8 8f d0 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   774b1:	eb 0b                	jmp    774be <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0xde>
   774b3:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   774b9:	e8 22 d4 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   774be:	48 8b 0d 0b 96 1a 00 	mov    0x1a960b(%rip),%rcx        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   774c5:	48 8b 79 18          	mov    0x18(%rcx),%rdi
   774c9:	4d 85 ff             	test   %r15,%r15
   774cc:	75 06                	jne    774d4 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0xf4>
   774ce:	33 f6                	xor    %esi,%esi
   774d0:	33 d2                	xor    %edx,%edx
   774d2:	eb 08                	jmp    774dc <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0xfc>
   774d4:	49 8d 77 10          	lea    0x10(%r15),%rsi
   774d8:	41 8b 57 08          	mov    0x8(%r15),%edx
   774dc:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   774e0:	41 b8 64 00 00 00    	mov    $0x64,%r8d
   774e6:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   774ea:	74 0a                	je     774f6 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x116>
   774ec:	45 33 c9             	xor    %r9d,%r9d
   774ef:	e8 4c d0 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   774f4:	eb 08                	jmp    774fe <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x11e>
   774f6:	45 33 c9             	xor    %r9d,%r9d
   774f9:	e8 e2 d3 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   774fe:	48 8b 15 cb 95 1a 00 	mov    0x1a95cb(%rip),%rdx        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77505:	4c 8b 72 18          	mov    0x18(%rdx),%r14
   77509:	4d 85 ff             	test   %r15,%r15
   7750c:	75 06                	jne    77514 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x134>
   7750e:	33 d2                	xor    %edx,%edx
   77510:	33 ff                	xor    %edi,%edi
   77512:	eb 08                	jmp    7751c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x13c>
   77514:	49 8d 57 10          	lea    0x10(%r15),%rdx
   77518:	41 8b 7f 08          	mov    0x8(%r15),%edi
   7751c:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   77520:	b8 64 00 00 00       	mov    $0x64,%eax
   77525:	41 80 7e 55 00       	cmpb   $0x0,0x55(%r14)
   7752a:	0f 84 b5 01 00 00    	je     776e5 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x305>
   77530:	3b f8                	cmp    %eax,%edi
   77532:	0f 85 21 05 00 00    	jne    77a59 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x679>
   77538:	41 0f b6 4e 54       	movzbl 0x54(%r14),%ecx
   7753d:	4d 8b 46 38          	mov    0x38(%r14),%r8
   77541:	45 33 c9             	xor    %r9d,%r9d
   77544:	85 ff                	test   %edi,%edi
   77546:	4c 0f 45 ca          	cmovne %rdx,%r9
   7754a:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
   7754e:	33 d2                	xor    %edx,%edx
   77550:	85 c0                	test   %eax,%eax
   77552:	48 0f 45 d6          	cmovne %rsi,%rdx
   77556:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   7755a:	48 8b f2             	mov    %rdx,%rsi
   7755d:	85 c9                	test   %ecx,%ecx
   7755f:	0f 84 c4 00 00 00    	je     77629 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x249>
   77565:	33 c0                	xor    %eax,%eax
   77567:	85 ff                	test   %edi,%edi
   77569:	0f 8e 67 01 00 00    	jle    776d6 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x2f6>
   7756f:	4d 8d ae 80 00 00 00 	lea    0x80(%r14),%r13
   77576:	48 63 d0             	movslq %eax,%rdx
   77579:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   7757d:	49 33 56 48          	xor    0x48(%r14),%rdx
   77581:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77588:	c1 7c 51 
   7758b:	4c 8d 55 c0          	lea    -0x40(%rbp),%r10
   7758f:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   77594:	4d 89 1a             	mov    %r11,(%r10)
   77597:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   7759b:	48 33 d1             	xor    %rcx,%rdx
   7759e:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   775a5:	c1 7c 51 
   775a8:	48 0f af d1          	imul   %rcx,%rdx
   775ac:	48 89 95 28 ff ff ff 	mov    %rdx,-0xd8(%rbp)
   775b3:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   775b7:	4c 8d 55 b8          	lea    -0x48(%rbp),%r10
   775bb:	4c 8b 9d 28 ff ff ff 	mov    -0xd8(%rbp),%r11
   775c2:	48 8b d1             	mov    %rcx,%rdx
   775c5:	c4 c2 9b f6 d3       	mulx   %r11,%r12,%rdx
   775ca:	4d 89 22             	mov    %r12,(%r10)
   775cd:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   775d1:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   775d5:	49 33 56 48          	xor    0x48(%r14),%rdx
   775d9:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   775e0:	c1 7c 51 
   775e3:	48 0f af d1          	imul   %rcx,%rdx
   775e7:	49 8b cd             	mov    %r13,%rcx
   775ea:	49 33 d3             	xor    %r11,%rdx
   775ed:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   775f2:	48 8b 09             	mov    (%rcx),%rcx
   775f5:	4c 8d 55 b0          	lea    -0x50(%rbp),%r10
   775f9:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   775fe:	4d 89 1a             	mov    %r11,(%r10)
   77601:	49 3b d0             	cmp    %r8,%rdx
   77604:	72 0d                	jb     77613 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x233>
   77606:	41 2b d0             	sub    %r8d,%edx
   77609:	49 8b 4e 58          	mov    0x58(%r14),%rcx
   7760d:	48 63 d2             	movslq %edx,%rdx
   77610:	8b 14 91             	mov    (%rcx,%rdx,4),%edx
   77613:	48 63 c8             	movslq %eax,%rcx
   77616:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   7761a:	ff c0                	inc    %eax
   7761c:	3b c7                	cmp    %edi,%eax
   7761e:	0f 8c 52 ff ff ff    	jl     77576 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x196>
   77624:	e9 ad 00 00 00       	jmp    776d6 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x2f6>
   77629:	33 c0                	xor    %eax,%eax
   7762b:	85 ff                	test   %edi,%edi
   7762d:	0f 8e a3 00 00 00    	jle    776d6 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x2f6>
   77633:	4d 8d ae 80 00 00 00 	lea    0x80(%r14),%r13
   7763a:	48 63 d0             	movslq %eax,%rdx
   7763d:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   77641:	49 33 56 48          	xor    0x48(%r14),%rdx
   77645:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   7764c:	c1 7c 51 
   7764f:	4c 8d 45 a8          	lea    -0x58(%rbp),%r8
   77653:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   77658:	4d 89 10             	mov    %r10,(%r8)
   7765b:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
   7765f:	48 33 d1             	xor    %rcx,%rdx
   77662:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77669:	c1 7c 51 
   7766c:	48 0f af d1          	imul   %rcx,%rdx
   77670:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
   77677:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   7767b:	4c 8d 45 a0          	lea    -0x60(%rbp),%r8
   7767f:	4c 8b 95 20 ff ff ff 	mov    -0xe0(%rbp),%r10
   77686:	48 8b d1             	mov    %rcx,%rdx
   77689:	c4 c2 a3 f6 d2       	mulx   %r10,%r11,%rdx
   7768e:	4d 89 18             	mov    %r11,(%r8)
   77691:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   77695:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   77699:	49 33 56 48          	xor    0x48(%r14),%rdx
   7769d:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   776a4:	c1 7c 51 
   776a7:	48 0f af d1          	imul   %rcx,%rdx
   776ab:	49 8b cd             	mov    %r13,%rcx
   776ae:	49 33 d2             	xor    %r10,%rdx
   776b1:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   776b6:	48 8b 09             	mov    (%rcx),%rcx
   776b9:	4c 8d 45 98          	lea    -0x68(%rbp),%r8
   776bd:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   776c2:	4d 89 10             	mov    %r10,(%r8)
   776c5:	48 63 c8             	movslq %eax,%rcx
   776c8:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   776cc:	ff c0                	inc    %eax
   776ce:	3b c7                	cmp    %edi,%eax
   776d0:	0f 8c 64 ff ff ff    	jl     7763a <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x25a>
   776d6:	33 d2                	xor    %edx,%edx
   776d8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   776dc:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   776e0:	e9 62 02 00 00       	jmp    77947 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x567>
   776e5:	44 8b e7             	mov    %edi,%r12d
   776e8:	48 8b fe             	mov    %rsi,%rdi
   776eb:	8b f0                	mov    %eax,%esi
   776ed:	44 3b e6             	cmp    %esi,%r12d
   776f0:	0f 85 89 03 00 00    	jne    77a7f <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x69f>
   776f6:	41 0f b6 46 54       	movzbl 0x54(%r14),%eax
   776fb:	49 8b 4e 38          	mov    0x38(%r14),%rcx
   776ff:	45 33 c0             	xor    %r8d,%r8d
   77702:	45 85 e4             	test   %r12d,%r12d
   77705:	4c 0f 45 c2          	cmovne %rdx,%r8
   77709:	4c 89 45 90          	mov    %r8,-0x70(%rbp)
   7770d:	4d 8b e8             	mov    %r8,%r13
   77710:	33 d2                	xor    %edx,%edx
   77712:	85 f6                	test   %esi,%esi
   77714:	48 0f 45 d7          	cmovne %rdi,%rdx
   77718:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
   7771c:	4c 8b c2             	mov    %rdx,%r8
   7771f:	4c 89 45 80          	mov    %r8,-0x80(%rbp)
   77723:	85 c0                	test   %eax,%eax
   77725:	0f 84 22 01 00 00    	je     7784d <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x46d>
   7772b:	33 ff                	xor    %edi,%edi
   7772d:	45 85 e4             	test   %r12d,%r12d
   77730:	0f 8e 07 02 00 00    	jle    7793d <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x55d>
   77736:	49 8d 76 78          	lea    0x78(%r14),%rsi
   7773a:	48 89 b5 00 ff ff ff 	mov    %rsi,-0x100(%rbp)
   77741:	49 8d 96 80 00 00 00 	lea    0x80(%r14),%rdx
   77748:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
   7774f:	48 63 c7             	movslq %edi,%rax
   77752:	49 8b 44 c5 00       	mov    0x0(%r13,%rax,8),%rax
   77757:	49 33 46 48          	xor    0x48(%r14),%rax
   7775b:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
   77762:	c1 7c 51 
   77765:	4c 8d 95 68 ff ff ff 	lea    -0x98(%rbp),%r10
   7776c:	48 8b d0             	mov    %rax,%rdx
   7776f:	c4 c2 a3 f6 d1       	mulx   %r9,%r11,%rdx
   77774:	4d 89 1a             	mov    %r11,(%r10)
   77777:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   7777e:	48 33 d0             	xor    %rax,%rdx
   77781:	49 0f af d1          	imul   %r9,%rdx
   77785:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
   7778c:	48 8b c6             	mov    %rsi,%rax
   7778f:	48 8b 00             	mov    (%rax),%rax
   77792:	4c 8d 8d 60 ff ff ff 	lea    -0xa0(%rbp),%r9
   77799:	4c 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%r10
   777a0:	48 8b d0             	mov    %rax,%rdx
   777a3:	c4 c2 a3 f6 d2       	mulx   %r10,%r11,%rdx
   777a8:	4d 89 19             	mov    %r11,(%r9)
   777ab:	49 8b 46 08          	mov    0x8(%r14),%rax
   777af:	0f b6 14 10          	movzbl (%rax,%rdx,1),%edx
   777b3:	48 89 95 70 ff ff ff 	mov    %rdx,-0x90(%rbp)
   777ba:	49 8d 46 68          	lea    0x68(%r14),%rax
   777be:	48 8b 00             	mov    (%rax),%rax
   777c1:	4c 8d 8d 58 ff ff ff 	lea    -0xa8(%rbp),%r9
   777c8:	48 8b d0             	mov    %rax,%rdx
   777cb:	c4 c2 a3 f6 c2       	mulx   %r10,%r11,%rax
   777d0:	4d 89 19             	mov    %r11,(%r9)
   777d3:	49 0f af 46 18       	imul   0x18(%r14),%rax
   777d8:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
   777df:	49 33 56 48          	xor    0x48(%r14),%rdx
   777e3:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
   777ea:	c1 7c 51 
   777ed:	49 0f af d1          	imul   %r9,%rdx
   777f1:	4c 8b 8d 08 ff ff ff 	mov    -0xf8(%rbp),%r9
   777f8:	4d 8b d9             	mov    %r9,%r11
   777fb:	49 33 d2             	xor    %r10,%rdx
   777fe:	49 0f af 53 08       	imul   0x8(%r11),%rdx
   77803:	4d 8b 13             	mov    (%r11),%r10
   77806:	4c 8d 9d 50 ff ff ff 	lea    -0xb0(%rbp),%r11
   7780d:	c4 c2 cb f6 d2       	mulx   %r10,%rsi,%rdx
   77812:	49 89 33             	mov    %rsi,(%r11)
   77815:	48 03 c2             	add    %rdx,%rax
   77818:	48 3b c1             	cmp    %rcx,%rax
   7781b:	72 0b                	jb     77828 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x448>
   7781d:	2b c1                	sub    %ecx,%eax
   7781f:	49 8b 76 58          	mov    0x58(%r14),%rsi
   77823:	48 98                	cltq
   77825:	8b 04 86             	mov    (%rsi,%rax,4),%eax
   77828:	48 63 f7             	movslq %edi,%rsi
   7782b:	49 89 04 f0          	mov    %rax,(%r8,%rsi,8)
   7782f:	ff c7                	inc    %edi
   77831:	41 3b fc             	cmp    %r12d,%edi
   77834:	4c 89 8d 08 ff ff ff 	mov    %r9,-0xf8(%rbp)
   7783b:	48 8b b5 00 ff ff ff 	mov    -0x100(%rbp),%rsi
   77842:	0f 8c 07 ff ff ff    	jl     7774f <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x36f>
   77848:	e9 f0 00 00 00       	jmp    7793d <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x55d>
   7784d:	33 c0                	xor    %eax,%eax
   7784f:	45 85 e4             	test   %r12d,%r12d
   77852:	0f 8e e5 00 00 00    	jle    7793d <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x55d>
   77858:	89 85 7c ff ff ff    	mov    %eax,-0x84(%rbp)
   7785e:	48 63 f8             	movslq %eax,%rdi
   77861:	49 8b 7c fd 00       	mov    0x0(%r13,%rdi,8),%rdi
   77866:	49 8b 76 48          	mov    0x48(%r14),%rsi
   7786a:	e8 61 29 00 00       	call   7a1d0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__Hash>
   7786f:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
   77876:	49 8b fe             	mov    %r14,%rdi
   77879:	48 8b b5 10 ff ff ff 	mov    -0xf0(%rbp),%rsi
   77880:	e8 fb c2 08 00       	call   103b80 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__Bucket>
   77885:	49 8b 7e 08          	mov    0x8(%r14),%rdi
   77889:	0f b6 04 07          	movzbl (%rdi,%rax,1),%eax
   7788d:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
   77894:	49 8d 76 68          	lea    0x68(%r14),%rsi
   77898:	48 8b 36             	mov    (%rsi),%rsi
   7789b:	48 8b fe             	mov    %rsi,%rdi
   7789e:	33 f6                	xor    %esi,%esi
   778a0:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
   778a7:	33 c9                	xor    %ecx,%ecx
   778a9:	e8 22 c5 01 00       	call   93dd0 <S_P_CoreLib_System_UInt128__op_Multiply>
   778ae:	48 8b f8             	mov    %rax,%rdi
   778b1:	48 8b f2             	mov    %rdx,%rsi
   778b4:	ba 40 00 00 00       	mov    $0x40,%edx
   778b9:	e8 52 c5 01 00       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
   778be:	49 0f af 46 18       	imul   0x18(%r14),%rax
   778c3:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
   778ca:	48 8b bd 48 ff ff ff 	mov    -0xb8(%rbp),%rdi
   778d1:	49 33 7e 48          	xor    0x48(%r14),%rdi
   778d5:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
   778dc:	c1 7c 51 
   778df:	48 0f af fe          	imul   %rsi,%rdi
   778e3:	4d 8d 8e 80 00 00 00 	lea    0x80(%r14),%r9
   778ea:	48 8b b5 10 ff ff ff 	mov    -0xf0(%rbp),%rsi
   778f1:	48 33 fe             	xor    %rsi,%rdi
   778f4:	49 0f af 79 08       	imul   0x8(%r9),%rdi
   778f9:	49 8b 11             	mov    (%r9),%rdx
   778fc:	33 f6                	xor    %esi,%esi
   778fe:	33 c9                	xor    %ecx,%ecx
   77900:	e8 cb c4 01 00       	call   93dd0 <S_P_CoreLib_System_UInt128__op_Multiply>
   77905:	48 8b f8             	mov    %rax,%rdi
   77908:	48 8b f2             	mov    %rdx,%rsi
   7790b:	ba 40 00 00 00       	mov    $0x40,%edx
   77910:	e8 fb c4 01 00       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
   77915:	48 8b bd 40 ff ff ff 	mov    -0xc0(%rbp),%rdi
   7791c:	48 03 f8             	add    %rax,%rdi
   7791f:	8b b5 7c ff ff ff    	mov    -0x84(%rbp),%esi
   77925:	48 63 c6             	movslq %esi,%rax
   77928:	4c 8b 45 80          	mov    -0x80(%rbp),%r8
   7792c:	49 89 3c c0          	mov    %rdi,(%r8,%rax,8)
   77930:	ff c6                	inc    %esi
   77932:	41 3b f4             	cmp    %r12d,%esi
   77935:	8b c6                	mov    %esi,%eax
   77937:	0f 8c 1b ff ff ff    	jl     77858 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x478>
   7793d:	33 ff                	xor    %edi,%edi
   7793f:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
   77943:	48 89 7d 90          	mov    %rdi,-0x70(%rbp)
   77947:	48 8b 3d 82 91 1a 00 	mov    0x1a9182(%rip),%rdi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   7794e:	4c 8b 77 18          	mov    0x18(%rdi),%r14
   77952:	4d 85 ff             	test   %r15,%r15
   77955:	75 08                	jne    7795f <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x57f>
   77957:	45 33 ed             	xor    %r13d,%r13d
   7795a:	45 33 e4             	xor    %r12d,%r12d
   7795d:	eb 08                	jmp    77967 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x587>
   7795f:	4d 8d 6f 10          	lea    0x10(%r15),%r13
   77963:	45 8b 67 08          	mov    0x8(%r15),%r12d
   77967:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
   7796b:	c5 fa 7f 85 30 ff ff 	vmovdqu %xmm0,-0xd0(%rbp)
   77972:	ff 
   77973:	48 8d bd 30 ff ff ff 	lea    -0xd0(%rbp),%rdi
   7797a:	48 8b f3             	mov    %rbx,%rsi
   7797d:	e8 ae 05 09 00       	call   107f30 <S_P_CoreLib_System_Span_1<UIntPtr>___ctor>
   77982:	48 8b 8d 30 ff ff ff 	mov    -0xd0(%rbp),%rcx
   77989:	44 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%r8d
   77990:	49 8b f5             	mov    %r13,%rsi
   77993:	41 8b d4             	mov    %r12d,%edx
   77996:	49 8b fe             	mov    %r14,%rdi
   77999:	45 33 c9             	xor    %r9d,%r9d
   7799c:	39 3f                	cmp    %edi,(%rdi)
   7799e:	e8 fd c2 08 00       	call   103ca0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream>
   779a3:	33 db                	xor    %ebx,%ebx
   779a5:	4d 85 ff             	test   %r15,%r15
   779a8:	74 42                	je     779ec <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   779aa:	41 83 7f 08 64       	cmpl   $0x64,0x8(%r15)
   779af:	7c 3b                	jl     779ec <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   779b1:	48 8b 3d 18 91 1a 00 	mov    0x1a9118(%rip),%rdi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   779b8:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   779bc:	8b f3                	mov    %ebx,%esi
   779be:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   779c3:	39 3f                	cmp    %edi,(%rdi)
   779c5:	e8 46 be 08 00       	call   103810 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   779ca:	48 8b 3d ff 90 1a 00 	mov    0x1a90ff(%rip),%rdi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   779d1:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   779d5:	8b f3                	mov    %ebx,%esi
   779d7:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   779dc:	39 3f                	cmp    %edi,(%rdi)
   779de:	e8 fd bf 08 00       	call   1039e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   779e3:	ff c3                	inc    %ebx
   779e5:	83 fb 64             	cmp    $0x64,%ebx
   779e8:	7c c7                	jl     779b1 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x5d1>
   779ea:	eb 43                	jmp    77a2f <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x64f>
   779ec:	48 8b 3d dd 90 1a 00 	mov    0x1a90dd(%rip),%rdi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   779f3:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   779f7:	41 3b 5f 08          	cmp    0x8(%r15),%ebx
   779fb:	0f 83 a4 00 00 00    	jae    77aa5 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x6c5>
   77a01:	8b f3                	mov    %ebx,%esi
   77a03:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77a08:	39 3f                	cmp    %edi,(%rdi)
   77a0a:	e8 01 be 08 00       	call   103810 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   77a0f:	48 8b 3d ba 90 1a 00 	mov    0x1a90ba(%rip),%rdi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77a16:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77a1a:	8b f3                	mov    %ebx,%esi
   77a1c:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77a21:	39 3f                	cmp    %edi,(%rdi)
   77a23:	e8 b8 bf 08 00       	call   1039e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   77a28:	ff c3                	inc    %ebx
   77a2a:	83 fb 64             	cmp    $0x64,%ebx
   77a2d:	7c bd                	jl     779ec <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   77a2f:	48 8d 3d 82 69 1c 00 	lea    0x1c6982(%rip),%rdi        # 23e3b8 <__Str_JIT_warmup_complete__0DAE2BD7E8651565932C6EA373EC942BC13BA8E721DA0F4E914F424C749DD85D>
   77a36:	e8 b5 4c 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
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
   77a53:	e8 d8 84 00 00       	call   7ff30 <System_Linq_System_Linq_ThrowHelper__ThrowArgumentNullException>
   77a58:	cc                   	int3
   77a59:	48 8d 3d 78 93 1d 00 	lea    0x1d9378(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77a60:	e8 af da fe ff       	call   65514 <RhpNewFast>
   77a65:	48 8b d8             	mov    %rax,%rbx
   77a68:	48 8b fb             	mov    %rbx,%rdi
   77a6b:	48 8d 35 4e 6a 1c 00 	lea    0x1c6a4e(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77a72:	e8 99 31 01 00       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77a77:	48 8b fb             	mov    %rbx,%rdi
   77a7a:	e8 ff dc fe ff       	call   6577e <RhpThrowEx>
   77a7f:	48 8d 3d 52 93 1d 00 	lea    0x1d9352(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77a86:	e8 89 da fe ff       	call   65514 <RhpNewFast>
   77a8b:	48 8b d8             	mov    %rax,%rbx
   77a8e:	48 8b fb             	mov    %rbx,%rdi
   77a91:	48 8d 35 28 6a 1c 00 	lea    0x1c6a28(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77a98:	e8 73 31 01 00       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77a9d:	48 8b fb             	mov    %rbx,%rdi
   77aa0:	e8 d9 dc fe ff       	call   6577e <RhpThrowEx>
   77aa5:	e8 b6 30 05 00       	call   cab60 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   77aaa:	cc                   	int3
   77aab:	90                   	nop
   77aac:	90                   	nop
   77aad:	90                   	nop
   77aae:	90                   	nop
   77aaf:	90                   	nop

0000000000077ab0 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch>:
   77ab0:	55                   	push   %rbp
   77ab1:	41 57                	push   %r15
   77ab3:	41 56                	push   %r14
   77ab5:	53                   	push   %rbx
   77ab6:	48 83 ec 28          	sub    $0x28,%rsp
   77aba:	c5 f8 77             	vzeroupper
   77abd:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
   77ac2:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
   77ac7:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
   77acc:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
   77ad1:	33 c0                	xor    %eax,%eax
   77ad3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   77ad7:	48 8d 3d 7a ab 1c 00 	lea    0x1cab7a(%rip),%rdi        # 242658 <__Str_Testing_GetIndicesStreamPrefet_DFEC981FE3992F56C08A364E99D8E9725ED1C914578F7F525692F9A2069E1387>
   77ade:	e8 0d 4c 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
   77ae3:	48 8b 1d e6 8f 1a 00 	mov    0x1a8fe6(%rip),%rbx        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77aea:	4c 8b 7b 10          	mov    0x10(%rbx),%r15
   77aee:	41 8b 77 08          	mov    0x8(%r15),%esi
   77af2:	48 8d 3d 57 05 21 00 	lea    0x210557(%rip),%rdi        # 288050 <_ZTV16__Array<UIntPtr>>
   77af9:	e8 2c db fe ff       	call   6562a <RhpNewArray>
   77afe:	4c 8b f0             	mov    %rax,%r14
   77b01:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   77b05:	4d 85 ff             	test   %r15,%r15
   77b08:	75 06                	jne    77b10 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x60>
   77b0a:	33 f6                	xor    %esi,%esi
   77b0c:	33 d2                	xor    %edx,%edx
   77b0e:	eb 08                	jmp    77b18 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x68>
   77b10:	49 8d 77 10          	lea    0x10(%r15),%rsi
   77b14:	41 8b 57 08          	mov    0x8(%r15),%edx
   77b18:	49 8d 4e 10          	lea    0x10(%r14),%rcx
   77b1c:	45 8b 46 08          	mov    0x8(%r14),%r8d
   77b20:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   77b24:	74 0d                	je     77b33 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x83>
   77b26:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   77b2c:	e8 0f ca 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77b31:	eb 0b                	jmp    77b3e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x8e>
   77b33:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   77b39:	e8 a2 cd 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   77b3e:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   77b42:	48 8b 4b 10          	mov    0x10(%rbx),%rcx
   77b46:	48 85 c9             	test   %rcx,%rcx
   77b49:	75 06                	jne    77b51 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xa1>
   77b4b:	33 f6                	xor    %esi,%esi
   77b4d:	33 d2                	xor    %edx,%edx
   77b4f:	eb 07                	jmp    77b58 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xa8>
   77b51:	48 8d 71 10          	lea    0x10(%rcx),%rsi
   77b55:	8b 51 08             	mov    0x8(%rcx),%edx
   77b58:	49 8d 4e 10          	lea    0x10(%r14),%rcx
   77b5c:	45 8b 46 08          	mov    0x8(%r14),%r8d
   77b60:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   77b64:	74 0a                	je     77b70 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xc0>
   77b66:	45 33 c9             	xor    %r9d,%r9d
   77b69:	e8 d2 c9 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77b6e:	eb 08                	jmp    77b78 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xc8>
   77b70:	45 33 c9             	xor    %r9d,%r9d
   77b73:	e8 68 cd 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   77b78:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77b7c:	be 22 00 00 00       	mov    $0x22,%esi
   77b81:	ba 01 00 00 00       	mov    $0x1,%edx
   77b86:	e8 15 93 04 00       	call   c0ea0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler___ctor>
   77b8b:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77b8e:	3b 7d e0             	cmp    -0x20(%rbp),%edi
   77b91:	0f 87 cd 00 00 00    	ja     77c64 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x1b4>
   77b97:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
   77b9b:	8b c7                	mov    %edi,%eax
   77b9d:	48 8d 34 46          	lea    (%rsi,%rax,2),%rsi
   77ba1:	8b 45 e0             	mov    -0x20(%rbp),%eax
   77ba4:	2b c7                	sub    %edi,%eax
   77ba6:	83 f8 0c             	cmp    $0xc,%eax
   77ba9:	72 28                	jb     77bd3 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x123>
   77bab:	48 8d 3d ae ea 1b 00 	lea    0x1beaae(%rip),%rdi        # 236660 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   77bb2:	48 83 c7 0c          	add    $0xc,%rdi
   77bb6:	c5 fa 6f 07          	vmovdqu (%rdi),%xmm0
   77bba:	c5 fa 6f 4f 08       	vmovdqu 0x8(%rdi),%xmm1
   77bbf:	c5 fa 7f 06          	vmovdqu %xmm0,(%rsi)
   77bc3:	c5 fa 7f 4e 08       	vmovdqu %xmm1,0x8(%rsi)
   77bc8:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77bcb:	83 c7 0c             	add    $0xc,%edi
   77bce:	89 7d d0             	mov    %edi,-0x30(%rbp)
   77bd1:	eb 10                	jmp    77be3 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x133>
   77bd3:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77bd7:	48 8d 35 82 ea 1b 00 	lea    0x1bea82(%rip),%rsi        # 236660 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   77bde:	e8 9d 94 04 00       	call   c1080 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   77be3:	48 8b 73 10          	mov    0x10(%rbx),%rsi
   77be7:	8b 76 08             	mov    0x8(%rsi),%esi
   77bea:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77bee:	e8 4d 7a 0b 00       	call   12f640 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__AppendFormatted<Int32>>
   77bf3:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77bf6:	3b 7d e0             	cmp    -0x20(%rbp),%edi
   77bf9:	77 69                	ja     77c64 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x1b4>
   77bfb:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
   77bff:	8b c7                	mov    %edi,%eax
   77c01:	48 8d 34 46          	lea    (%rsi,%rax,2),%rsi
   77c05:	8b 45 e0             	mov    -0x20(%rbp),%eax
   77c08:	2b c7                	sub    %edi,%eax
   77c0a:	83 f8 16             	cmp    $0x16,%eax
   77c0d:	72 28                	jb     77c37 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x187>
   77c0f:	48 8d 3d ca ee 1b 00 	lea    0x1beeca(%rip),%rdi        # 236ae0 <__Str__keys_with_prefetching_7D74716B97304C78AC45626F98B1BB0F1083D62C00EA0EBE1B5AB87B36CE273A>
   77c16:	48 83 c7 0c          	add    $0xc,%rdi
   77c1a:	c5 fe 6f 07          	vmovdqu (%rdi),%ymm0
   77c1e:	c5 fa 6f 4f 1c       	vmovdqu 0x1c(%rdi),%xmm1
   77c23:	c5 fe 7f 06          	vmovdqu %ymm0,(%rsi)
   77c27:	c5 fa 7f 4e 1c       	vmovdqu %xmm1,0x1c(%rsi)
   77c2c:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77c2f:	83 c7 16             	add    $0x16,%edi
   77c32:	89 7d d0             	mov    %edi,-0x30(%rbp)
   77c35:	eb 10                	jmp    77c47 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x197>
   77c37:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77c3b:	48 8d 35 9e ee 1b 00 	lea    0x1bee9e(%rip),%rsi        # 236ae0 <__Str__keys_with_prefetching_7D74716B97304C78AC45626F98B1BB0F1083D62C00EA0EBE1B5AB87B36CE273A>
   77c42:	e8 39 94 04 00       	call   c1080 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   77c47:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77c4b:	e8 f0 92 04 00       	call   c0f40 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__ToStringAndClear>
   77c50:	48 8b f8             	mov    %rax,%rdi
   77c53:	e8 98 4a 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
   77c58:	90                   	nop
   77c59:	48 83 c4 28          	add    $0x28,%rsp
   77c5d:	5b                   	pop    %rbx
   77c5e:	41 5e                	pop    %r14
   77c60:	41 5f                	pop    %r15
   77c62:	5d                   	pop    %rbp
   77c63:	c3                   	ret
   77c64:	e8 77 ab 01 00       	call   927e0 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
   77c69:	cc                   	int3
   77c6a:	90                   	nop
   77c6b:	90                   	nop
   77c6c:	90                   	nop
   77c6d:	90                   	nop
   77c6e:	90                   	nop
   77c6f:	90                   	nop
   77c70:	90                   	nop
   77c71:	90                   	nop
   77c72:	90                   	nop
   77c73:	90                   	nop
   77c74:	90                   	nop
   77c75:	90                   	nop
   77c76:	90                   	nop
   77c77:	90                   	nop
   77c78:	90                   	nop
   77c79:	90                   	nop
   77c7a:	90                   	nop
   77c7b:	90                   	nop
   77c7c:	90                   	nop
   77c7d:	90                   	nop
   77c7e:	90                   	nop
   77c7f:	90                   	nop

   7867a:	e8 c1 be 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   7867f:	eb 0e                	jmp    7868f <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x10f>
   78681:	49 8b cc             	mov    %r12,%rcx
   78684:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   7868a:	e8 51 c2 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   7868f:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   78693:	4d 85 f6             	test   %r14,%r14
   78696:	75 06                	jne    7869e <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x11e>
   78698:	33 f6                	xor    %esi,%esi
   7869a:	33 d2                	xor    %edx,%edx
   7869c:	eb 08                	jmp    786a6 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x126>
   7869e:	49 8d 76 10          	lea    0x10(%r14),%rsi
   786a2:	41 8b 56 08          	mov    0x8(%r14),%edx
   786a6:	4c 8b 7d d0          	mov    -0x30(%rbp),%r15
   786aa:	49 83 c7 10          	add    $0x10,%r15
   786ae:	49 8b cf             	mov    %r15,%rcx
   786b1:	41 b8 00 02 00 00    	mov    $0x200,%r8d
   786b7:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   786bb:	74 0d                	je     786ca <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x14a>
   786bd:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   786c3:	e8 78 be 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   786c8:	eb 0b                	jmp    786d5 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x155>
   786ca:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   786d0:	e8 0b c2 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   786d5:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   786d9:	4d 85 ed             	test   %r13,%r13
   786dc:	75 06                	jne    786e4 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x164>
   786de:	33 f6                	xor    %esi,%esi
   786e0:	33 d2                	xor    %edx,%edx
   786e2:	eb 08                	jmp    786ec <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x16c>
   786e4:	49 8d 75 10          	lea    0x10(%r13),%rsi
   786e8:	41 8b 55 08          	mov    0x8(%r13),%edx
   786ec:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
   786f0:	48 83 c3 10          	add    $0x10,%rbx
   786f4:	48 8b cb             	mov    %rbx,%rcx
   786f7:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
   786fd:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   78701:	74 0d                	je     78710 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x190>
   78703:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   78709:	e8 32 be 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   7870e:	eb 0b                	jmp    7871b <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x19b>
   78710:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   78716:	e8 c5 c1 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   7871b:	48 8d 3d ae df 1b 00 	lea    0x1bdfae(%rip),%rdi        # 2366d0 <__Str___Tested_prefetch_patterns_for_DE81E3DAF059C0B18D33D0B771E134E96E0008DA1110A965332E23E19D043BB8>
   78722:	e8 c9 3f 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
   78727:	90                   	nop
   78728:	48 83 c4 18          	add    $0x18,%rsp
   7872c:	5b                   	pop    %rbx
   7872d:	41 5c                	pop    %r12
   7872f:	41 5d                	pop    %r13
   78731:	41 5e                	pop    %r14
   78733:	41 5f                	pop    %r15
   78735:	5d                   	pop    %rbp
   78736:	c3                   	ret
   78737:	bf 10 00 00 00       	mov    $0x10,%edi
   7873c:	e8 ef 77 00 00       	call   7ff30 <System_Linq_System_Linq_ThrowHelper__ThrowArgumentNullException>
   78741:	cc                   	int3
   78742:	90                   	nop
   78743:	90                   	nop
   78744:	90                   	nop
   78745:	90                   	nop
   78746:	90                   	nop
   78747:	90                   	nop
   78748:	90                   	nop
   78749:	90                   	nop
   7874a:	90                   	nop
   7874b:	90                   	nop
   7874c:	90                   	nop
   7874d:	90                   	nop
   7874e:	90                   	nop
   7874f:	90                   	nop

0000000000104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>:
  104540:	55                   	push   %rbp
  104541:	41 57                	push   %r15
  104543:	41 56                	push   %r14
  104545:	41 55                	push   %r13
  104547:	41 54                	push   %r12
  104549:	53                   	push   %rbx
  10454a:	48 83 ec 68          	sub    $0x68,%rsp
  10454e:	c5 f8 77             	vzeroupper
  104551:	48 8d ac 24 90 00 00 	lea    0x90(%rsp),%rbp
  104558:	00 
  104559:	33 c0                	xor    %eax,%eax
  10455b:	48 89 45 88          	mov    %rax,-0x78(%rbp)
  10455f:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104564:	c5 79 7f 45 90       	vmovdqa %xmm8,-0x70(%rbp)
  104569:	c5 79 7f 45 a0       	vmovdqa %xmm8,-0x60(%rbp)
  10456e:	c5 79 7f 45 b0       	vmovdqa %xmm8,-0x50(%rbp)
  104573:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  104578:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  10457c:	48 8b 05 cd 6d 0b 00 	mov    0xb6dcd(%rip),%rax        # 1bb350 <__security_cookie>
  104583:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
  10458a:	41 3b d0             	cmp    %r8d,%edx
  10458d:	0f 85 24 03 00 00    	jne    1048b7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x377>
  104593:	45 84 c9             	test   %r9b,%r9b
  104596:	74 06                	je     10459e <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x5e>
  104598:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  10459c:	eb 02                	jmp    1045a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x60>
  10459e:	33 c0                	xor    %eax,%eax
  1045a0:	0f b6 c0             	movzbl %al,%eax
  1045a3:	4c 8b 47 38          	mov    0x38(%rdi),%r8
  1045a7:	85 24 24             	test   %esp,(%rsp)
  1045aa:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1045b1:	4c 8d 0c 24          	lea    (%rsp),%r9
  1045b5:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  1045b9:	62 d1 7e 48 7f 01    	vmovdqu32 %zmm0,(%r9)
  1045bf:	62 d1 7e 48 7f 41 01 	vmovdqu32 %zmm0,0x40(%r9)
  1045c6:	62 d1 7e 48 7f 41 02 	vmovdqu32 %zmm0,0x80(%r9)
  1045cd:	62 d1 7e 48 7f 41 03 	vmovdqu32 %zmm0,0xc0(%r9)
  1045d4:	85 24 24             	test   %esp,(%rsp)
  1045d7:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1045de:	4c 8d 14 24          	lea    (%rsp),%r10
  1045e2:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  1045e6:	62 d1 7e 48 7f 02    	vmovdqu32 %zmm0,(%r10)
  1045ec:	62 d1 7e 48 7f 42 01 	vmovdqu32 %zmm0,0x40(%r10)
  1045f3:	62 d1 7e 48 7f 42 02 	vmovdqu32 %zmm0,0x80(%r10)
  1045fa:	62 d1 7e 48 7f 42 03 	vmovdqu32 %zmm0,0xc0(%r10)
  104601:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
  104605:	4c 89 55 c8          	mov    %r10,-0x38(%rbp)
  104609:	44 8b da             	mov    %edx,%r11d
  10460c:	bb 20 00 00 00       	mov    $0x20,%ebx
  104611:	41 83 fb 20          	cmp    $0x20,%r11d
  104615:	89 55 84             	mov    %edx,-0x7c(%rbp)
  104618:	0f 4c da             	cmovl  %edx,%ebx
  10461b:	89 5d c4             	mov    %ebx,-0x3c(%rbp)
  10461e:	45 33 db             	xor    %r11d,%r11d
  104621:	85 db                	test   %ebx,%ebx
  104623:	0f 8e 86 02 00 00    	jle    1048af <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x36f>
  104629:	4d 63 fb             	movslq %r11d,%r15
  10462c:	4e 8b 34 fe          	mov    (%rsi,%r15,8),%r14
  104630:	4c 33 77 48          	xor    0x48(%rdi),%r14
  104634:	49 bd 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r13
  10463b:	c1 7c 51 
  10463e:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
  104642:	49 8b d6             	mov    %r14,%rdx
  104645:	c4 c2 e3 f6 d5       	mulx   %r13,%rbx,%rdx
  10464a:	49 89 1c 24          	mov    %rbx,(%r12)
  10464e:	48 8b 5d b0          	mov    -0x50(%rbp),%rbx
  104652:	48 33 d3             	xor    %rbx,%rdx
  104655:	49 0f af d5          	imul   %r13,%rdx
  104659:	4b 89 14 f9          	mov    %rdx,(%r9,%r15,8)
  10465d:	4b 8b 1c f9          	mov    (%r9,%r15,8),%rbx
  104661:	48 8b 57 70          	mov    0x70(%rdi),%rdx
  104665:	4c 8d 75 a8          	lea    -0x58(%rbp),%r14
  104669:	c4 e2 93 f6 d3       	mulx   %rbx,%r13,%rdx
  10466e:	4d 89 2e             	mov    %r13,(%r14)
  104671:	4b 89 14 fa          	mov    %rdx,(%r10,%r15,8)
  104675:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  104679:	4b 03 14 fa          	add    (%r10,%r15,8),%rdx
  10467d:	0f 18 0a             	prefetcht0 (%rdx)
  104680:	41 ff c3             	inc    %r11d
  104683:	8b 5d c4             	mov    -0x3c(%rbp),%ebx
  104686:	44 3b db             	cmp    %ebx,%r11d
  104689:	0f 8c 1b 02 00 00    	jl     1048aa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x36a>
  10468f:	83 fb 20             	cmp    $0x20,%ebx
  104692:	7d 24                	jge    1046b8 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x178>
  104694:	0f 1f 40 00          	nopl   0x0(%rax)
  104698:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  10469f:	00 
  1046a0:	48 63 d3             	movslq %ebx,%rdx
  1046a3:	45 33 db             	xor    %r11d,%r11d
  1046a6:	4d 89 1c d1          	mov    %r11,(%r9,%rdx,8)
  1046aa:	48 63 d3             	movslq %ebx,%rdx
  1046ad:	4d 89 1c d2          	mov    %r11,(%r10,%rdx,8)
  1046b1:	ff c3                	inc    %ebx
  1046b3:	83 fb 20             	cmp    $0x20,%ebx
  1046b6:	7c e8                	jl     1046a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x160>
  1046b8:	45 33 db             	xor    %r11d,%r11d
  1046bb:	8b 55 84             	mov    -0x7c(%rbp),%edx
  1046be:	8d 5a e0             	lea    -0x20(%rdx),%ebx
  1046c1:	45 33 ff             	xor    %r15d,%r15d
  1046c4:	85 db                	test   %ebx,%ebx
  1046c6:	44 0f 4f fb          	cmovg  %ebx,%r15d
  1046ca:	44 89 7d c0          	mov    %r15d,-0x40(%rbp)
  1046ce:	45 85 ff             	test   %r15d,%r15d
  1046d1:	0f 8e 06 01 00 00    	jle    1047dd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x29d>
  1046d7:	48 8d 9f 80 00 00 00 	lea    0x80(%rdi),%rbx
  1046de:	45 8b f3             	mov    %r11d,%r14d
  1046e1:	41 c1 fe 1f          	sar    $0x1f,%r14d
  1046e5:	41 83 e6 1f          	and    $0x1f,%r14d
  1046e9:	45 03 f3             	add    %r11d,%r14d
  1046ec:	41 83 e6 e0          	and    $0xffffffe0,%r14d
  1046f0:	45 8b eb             	mov    %r11d,%r13d
  1046f3:	45 2b ee             	sub    %r14d,%r13d
  1046f6:	4d 63 f5             	movslq %r13d,%r14
  1046f9:	4f 8b 2c f1          	mov    (%r9,%r14,8),%r13
  1046fd:	4c 89 ad 78 ff ff ff 	mov    %r13,-0x88(%rbp)
  104704:	4f 8b 24 f2          	mov    (%r10,%r14,8),%r12
  104708:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
  10470c:	41 8d 53 20          	lea    0x20(%r11),%edx
  104710:	48 63 d2             	movslq %edx,%rdx
  104713:	48 8b 14 d6          	mov    (%rsi,%rdx,8),%rdx
  104717:	48 33 57 48          	xor    0x48(%rdi),%rdx
  10471b:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  104722:	c1 7c 51 
  104725:	4c 8d 6d a0          	lea    -0x60(%rbp),%r13
  104729:	c4 c2 9b f6 d7       	mulx   %r15,%r12,%rdx
  10472e:	4d 89 65 00          	mov    %r12,0x0(%r13)
  104732:	4c 8b 7d a0          	mov    -0x60(%rbp),%r15
  104736:	49 33 d7             	xor    %r15,%rdx
  104739:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  104740:	c1 7c 51 
  104743:	49 0f af d7          	imul   %r15,%rdx
  104747:	4b 89 14 f1          	mov    %rdx,(%r9,%r14,8)
  10474b:	4f 8b 3c f1          	mov    (%r9,%r14,8),%r15
  10474f:	48 8b 57 70          	mov    0x70(%rdi),%rdx
  104753:	4c 8d 6d 98          	lea    -0x68(%rbp),%r13
  104757:	c4 c2 9b f6 d7       	mulx   %r15,%r12,%rdx
  10475c:	4d 89 65 00          	mov    %r12,0x0(%r13)
  104760:	4b 89 14 f2          	mov    %rdx,(%r10,%r14,8)
  104764:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  104768:	4c 8b fa             	mov    %rdx,%r15
  10476b:	4f 03 3c f2          	add    (%r10,%r14,8),%r15
  10476f:	41 0f 18 0f          	prefetcht0 (%r15)
  104773:	4c 8b 65 b8          	mov    -0x48(%rbp),%r12
  104777:	42 0f b6 14 22       	movzbl (%rdx,%r12,1),%edx
  10477c:	48 33 57 48          	xor    0x48(%rdi),%rdx
  104780:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  104787:	c1 7c 51 
  10478a:	49 0f af d7          	imul   %r15,%rdx
  10478e:	4c 8b fb             	mov    %rbx,%r15
  104791:	4c 8b ad 78 ff ff ff 	mov    -0x88(%rbp),%r13
  104798:	49 33 d5             	xor    %r13,%rdx
  10479b:	49 0f af 57 08       	imul   0x8(%r15),%rdx
  1047a0:	4d 8b 3f             	mov    (%r15),%r15
  1047a3:	4c 8d 75 90          	lea    -0x70(%rbp),%r14
  1047a7:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  1047ac:	4d 89 2e             	mov    %r13,(%r14)
  1047af:	85 c0                	test   %eax,%eax
  1047b1:	74 13                	je     1047c6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x286>
  1047b3:	49 3b d0             	cmp    %r8,%rdx
  1047b6:	72 0e                	jb     1047c6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x286>
  1047b8:	4c 8b 7f 58          	mov    0x58(%rdi),%r15
  1047bc:	41 2b d0             	sub    %r8d,%edx
  1047bf:	48 63 d2             	movslq %edx,%rdx
  1047c2:	41 8b 14 97          	mov    (%r15,%rdx,4),%edx
  1047c6:	4d 63 fb             	movslq %r11d,%r15
  1047c9:	4a 89 14 f9          	mov    %rdx,(%rcx,%r15,8)
  1047cd:	41 ff c3             	inc    %r11d
  1047d0:	44 8b 7d c0          	mov    -0x40(%rbp),%r15d
  1047d4:	45 3b df             	cmp    %r15d,%r11d
  1047d7:	0f 8c 01 ff ff ff    	jl     1046de <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x19e>
  1047dd:	44 3b 5d 84          	cmp    -0x7c(%rbp),%r11d
  1047e1:	0f 8d 91 00 00 00    	jge    104878 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x338>
  1047e7:	48 8d 9f 80 00 00 00 	lea    0x80(%rdi),%rbx
  1047ee:	41 8b f3             	mov    %r11d,%esi
  1047f1:	c1 fe 1f             	sar    $0x1f,%esi
  1047f4:	83 e6 1f             	and    $0x1f,%esi
  1047f7:	41 03 f3             	add    %r11d,%esi
  1047fa:	83 e6 e0             	and    $0xffffffe0,%esi
  1047fd:	45 8b fb             	mov    %r11d,%r15d
  104800:	44 2b fe             	sub    %esi,%r15d
  104803:	49 63 f7             	movslq %r15d,%rsi
  104806:	49 8b 34 f1          	mov    (%r9,%rsi,8),%rsi
  10480a:	4c 8b 77 08          	mov    0x8(%rdi),%r14
  10480e:	4d 63 ff             	movslq %r15d,%r15
  104811:	4f 8b 3c fa          	mov    (%r10,%r15,8),%r15
  104815:	47 0f b6 3c 3e       	movzbl (%r14,%r15,1),%r15d
  10481a:	4c 33 7f 48          	xor    0x48(%rdi),%r15
  10481e:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  104825:	c1 7c 51 
  104828:	4d 0f af fe          	imul   %r14,%r15
  10482c:	4c 8b f3             	mov    %rbx,%r14
  10482f:	49 33 f7             	xor    %r15,%rsi
  104832:	49 0f af 76 08       	imul   0x8(%r14),%rsi
  104837:	4d 8b 3e             	mov    (%r14),%r15
  10483a:	4c 8d 75 88          	lea    -0x78(%rbp),%r14
  10483e:	48 8b d6             	mov    %rsi,%rdx
  104841:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  104846:	4d 89 2e             	mov    %r13,(%r14)
  104849:	85 c0                	test   %eax,%eax
  10484b:	74 12                	je     10485f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x31f>
  10484d:	49 3b d0             	cmp    %r8,%rdx
  104850:	72 0d                	jb     10485f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x31f>
  104852:	48 8b 77 58          	mov    0x58(%rdi),%rsi
  104856:	41 2b d0             	sub    %r8d,%edx
  104859:	48 63 d2             	movslq %edx,%rdx
  10485c:	8b 14 96             	mov    (%rsi,%rdx,4),%edx
  10485f:	49 63 f3             	movslq %r11d,%rsi
  104862:	48 89 14 f1          	mov    %rdx,(%rcx,%rsi,8)
  104866:	41 ff c3             	inc    %r11d
  104869:	8b 55 84             	mov    -0x7c(%rbp),%edx
  10486c:	44 3b da             	cmp    %edx,%r11d
  10486f:	89 55 84             	mov    %edx,-0x7c(%rbp)
  104872:	0f 8c 76 ff ff ff    	jl     1047ee <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x2ae>
  104878:	33 ff                	xor    %edi,%edi
  10487a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  10487e:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  104882:	48 8d 3d c7 6a 0b 00 	lea    0xb6ac7(%rip),%rdi        # 1bb350 <__security_cookie>
  104889:	48 8b 3f             	mov    (%rdi),%rdi
  10488c:	48 39 bd 70 ff ff ff 	cmp    %rdi,-0x90(%rbp)
  104893:	74 05                	je     10489a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x35a>
  104895:	e8 66 56 f0 ff       	call   9f00 <RhpFallbackFailFast>
  10489a:	90                   	nop
  10489b:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  10489f:	5b                   	pop    %rbx
  1048a0:	41 5c                	pop    %r12
  1048a2:	41 5d                	pop    %r13
  1048a4:	41 5e                	pop    %r14
  1048a6:	41 5f                	pop    %r15
  1048a8:	5d                   	pop    %rbp
  1048a9:	c3                   	ret
  1048aa:	e9 7a fd ff ff       	jmp    104629 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0xe9>
  1048af:	8b 5d c4             	mov    -0x3c(%rbp),%ebx
  1048b2:	e9 d8 fd ff ff       	jmp    10468f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x14f>
  1048b7:	48 8d 3d 1a c5 14 00 	lea    0x14c51a(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  1048be:	e8 51 0c f6 ff       	call   65514 <RhpNewFast>
  1048c3:	48 8b d8             	mov    %rax,%rbx
  1048c6:	48 8b fb             	mov    %rbx,%rdi
  1048c9:	48 8d 35 f0 9b 13 00 	lea    0x139bf0(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  1048d0:	e8 3b 63 f8 ff       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
  1048d5:	48 8b fb             	mov    %rbx,%rdi
  1048d8:	e8 a1 0e f6 ff       	call   6577e <RhpThrowEx>
  1048dd:	cc                   	int3
  1048de:	90                   	nop
  1048df:	90                   	nop

00000000001048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>:
  1048e0:	55                   	push   %rbp
  1048e1:	41 57                	push   %r15
  1048e3:	41 56                	push   %r14
  1048e5:	41 55                	push   %r13
  1048e7:	41 54                	push   %r12
  1048e9:	53                   	push   %rbx
  1048ea:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
  1048f1:	c5 f8 77             	vzeroupper
  1048f4:	48 8d ac 24 d0 00 00 	lea    0xd0(%rsp),%rbp
  1048fb:	00 
  1048fc:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104901:	c5 79 7f 85 60 ff ff 	vmovdqa %xmm8,-0xa0(%rbp)
  104908:	ff 
  104909:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  104910:	ff ff ff 
  104913:	c5 79 7f 44 05 d0    	vmovdqa %xmm8,-0x30(%rbp,%rax,1)
  104919:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
  10491f:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
  104925:	48 83 c0 30          	add    $0x30,%rax
  104929:	75 e8                	jne    104913 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x33>
  10492b:	48 8b 05 1e 6a 0b 00 	mov    0xb6a1e(%rip),%rax        # 1bb350 <__security_cookie>
  104932:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  104939:	41 3b d0             	cmp    %r8d,%edx
  10493c:	0f 85 16 04 00 00    	jne    104d58 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x478>
  104942:	45 84 c9             	test   %r9b,%r9b
  104945:	74 06                	je     10494d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x6d>
  104947:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  10494b:	eb 02                	jmp    10494f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x6f>
  10494d:	33 c0                	xor    %eax,%eax
  10494f:	0f b6 c0             	movzbl %al,%eax
  104952:	4c 8b 47 38          	mov    0x38(%rdi),%r8
  104956:	4c 89 45 d0          	mov    %r8,-0x30(%rbp)
  10495a:	85 24 24             	test   %esp,(%rsp)
  10495d:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  104964:	4c 8d 0c 24          	lea    (%rsp),%r9
  104968:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  10496c:	62 d1 7e 48 7f 01    	vmovdqu32 %zmm0,(%r9)
  104972:	62 d1 7e 48 7f 41 01 	vmovdqu32 %zmm0,0x40(%r9)
  104979:	62 d1 7e 48 7f 41 02 	vmovdqu32 %zmm0,0x80(%r9)
  104980:	62 d1 7e 48 7f 41 03 	vmovdqu32 %zmm0,0xc0(%r9)
  104987:	85 24 24             	test   %esp,(%rsp)
  10498a:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  104991:	4c 8d 14 24          	lea    (%rsp),%r10
  104995:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  104999:	62 d1 7e 48 7f 02    	vmovdqu32 %zmm0,(%r10)
  10499f:	62 d1 7e 48 7f 42 01 	vmovdqu32 %zmm0,0x40(%r10)
  1049a6:	62 d1 7e 48 7f 42 02 	vmovdqu32 %zmm0,0x80(%r10)
  1049ad:	62 d1 7e 48 7f 42 03 	vmovdqu32 %zmm0,0xc0(%r10)
  1049b4:	85 24 24             	test   %esp,(%rsp)
  1049b7:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1049be:	4c 8d 1c 24          	lea    (%rsp),%r11
  1049c2:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  1049c6:	62 d1 7e 48 7f 03    	vmovdqu32 %zmm0,(%r11)
  1049cc:	62 d1 7e 48 7f 43 01 	vmovdqu32 %zmm0,0x40(%r11)
  1049d3:	62 d1 7e 48 7f 43 02 	vmovdqu32 %zmm0,0x80(%r11)
  1049da:	62 d1 7e 48 7f 43 03 	vmovdqu32 %zmm0,0xc0(%r11)
  1049e1:	48 89 8d 40 ff ff ff 	mov    %rcx,-0xc0(%rbp)
  1049e8:	4c 89 4d c8          	mov    %r9,-0x38(%rbp)
  1049ec:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
  1049f0:	4c 89 5d b8          	mov    %r11,-0x48(%rbp)
  1049f4:	8b da                	mov    %edx,%ebx
  1049f6:	41 bf 20 00 00 00    	mov    $0x20,%r15d
  1049fc:	83 fb 20             	cmp    $0x20,%ebx
  1049ff:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%rbp)
  104a05:	44 0f 4c fa          	cmovl  %edx,%r15d
  104a09:	44 89 7d b4          	mov    %r15d,-0x4c(%rbp)
  104a0d:	33 db                	xor    %ebx,%ebx
  104a0f:	45 85 ff             	test   %r15d,%r15d
  104a12:	0f 8e 37 03 00 00    	jle    104d4f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x46f>
  104a18:	4c 63 f3             	movslq %ebx,%r14
  104a1b:	4e 8b 2c f6          	mov    (%rsi,%r14,8),%r13
  104a1f:	4c 33 6f 48          	xor    0x48(%rdi),%r13
  104a23:	49 bc 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r12
  104a2a:	c1 7c 51 
  104a2d:	4c 8d 7d 98          	lea    -0x68(%rbp),%r15
  104a31:	49 8b d5             	mov    %r13,%rdx
  104a34:	c4 c2 f3 f6 d4       	mulx   %r12,%rcx,%rdx
  104a39:	49 89 0f             	mov    %rcx,(%r15)
  104a3c:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  104a40:	48 33 d1             	xor    %rcx,%rdx
  104a43:	49 0f af d4          	imul   %r12,%rdx
  104a47:	4b 89 14 f1          	mov    %rdx,(%r9,%r14,8)
  104a4b:	4b 8b 0c f1          	mov    (%r9,%r14,8),%rcx
  104a4f:	48 8b 57 68          	mov    0x68(%rdi),%rdx
  104a53:	4c 8d 7d 90          	lea    -0x70(%rbp),%r15
  104a57:	c4 e2 93 f6 c9       	mulx   %rcx,%r13,%rcx
  104a5c:	4d 89 2f             	mov    %r13,(%r15)
  104a5f:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  104a63:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
  104a6a:	4b 89 0c f3          	mov    %rcx,(%r11,%r14,8)
  104a6e:	4c 8b 7f 70          	mov    0x70(%rdi),%r15
  104a72:	4c 8d 6d 88          	lea    -0x78(%rbp),%r13
  104a76:	4c 8b a5 48 ff ff ff 	mov    -0xb8(%rbp),%r12
  104a7d:	49 8b d7             	mov    %r15,%rdx
  104a80:	c4 c2 bb f6 d4       	mulx   %r12,%r8,%rdx
  104a85:	4d 89 45 00          	mov    %r8,0x0(%r13)
  104a89:	48 0f af 4f 28       	imul   0x28(%rdi),%rcx
  104a8e:	48 03 d1             	add    %rcx,%rdx
  104a91:	4b 89 14 f2          	mov    %rdx,(%r10,%r14,8)
  104a95:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  104a99:	4b 03 14 f2          	add    (%r10,%r14,8),%rdx
  104a9d:	0f 18 0a             	prefetcht0 (%rdx)
  104aa0:	ff c3                	inc    %ebx
  104aa2:	44 8b 7d b4          	mov    -0x4c(%rbp),%r15d
  104aa6:	41 3b df             	cmp    %r15d,%ebx
  104aa9:	0f 8c 9b 02 00 00    	jl     104d4a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x46a>
  104aaf:	41 83 ff 20          	cmp    $0x20,%r15d
  104ab3:	7d 25                	jge    104ada <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x1fa>
  104ab5:	66 66 66 0f 1f 84 00 	data16 data16 nopw 0x0(%rax,%rax,1)
  104abc:	00 00 00 00 
  104ac0:	49 63 d7             	movslq %r15d,%rdx
  104ac3:	33 c9                	xor    %ecx,%ecx
  104ac5:	49 89 0c d1          	mov    %rcx,(%r9,%rdx,8)
  104ac9:	49 89 0c d2          	mov    %rcx,(%r10,%rdx,8)
  104acd:	49 89 0c d3          	mov    %rcx,(%r11,%rdx,8)
  104ad1:	41 ff c7             	inc    %r15d
  104ad4:	41 83 ff 20          	cmp    $0x20,%r15d
  104ad8:	7c e6                	jl     104ac0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x1e0>
  104ada:	33 c9                	xor    %ecx,%ecx
  104adc:	8b 95 5c ff ff ff    	mov    -0xa4(%rbp),%edx
  104ae2:	44 8d 42 e0          	lea    -0x20(%rdx),%r8d
  104ae6:	33 db                	xor    %ebx,%ebx
  104ae8:	45 85 c0             	test   %r8d,%r8d
  104aeb:	41 0f 4f d8          	cmovg  %r8d,%ebx
  104aef:	89 5d b0             	mov    %ebx,-0x50(%rbp)
  104af2:	85 db                	test   %ebx,%ebx
  104af4:	0f 8e 44 02 00 00    	jle    104d3e <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x45e>
  104afa:	44 8b c1             	mov    %ecx,%r8d
  104afd:	41 c1 f8 1f          	sar    $0x1f,%r8d
  104b01:	41 83 e0 1f          	and    $0x1f,%r8d
  104b05:	44 03 c1             	add    %ecx,%r8d
  104b08:	41 83 e0 e0          	and    $0xffffffe0,%r8d
  104b0c:	44 8b f9             	mov    %ecx,%r15d
  104b0f:	45 2b f8             	sub    %r8d,%r15d
  104b12:	4d 63 c7             	movslq %r15d,%r8
  104b15:	4f 8b 3c c1          	mov    (%r9,%r8,8),%r15
  104b19:	4c 89 bd 50 ff ff ff 	mov    %r15,-0xb0(%rbp)
  104b20:	4f 8b 34 c2          	mov    (%r10,%r8,8),%r14
  104b24:	4f 8b 2c c3          	mov    (%r11,%r8,8),%r13
  104b28:	4c 89 6d a8          	mov    %r13,-0x58(%rbp)
  104b2c:	44 8d 61 20          	lea    0x20(%rcx),%r12d
  104b30:	4d 63 e4             	movslq %r12d,%r12
  104b33:	4e 8b 24 e6          	mov    (%rsi,%r12,8),%r12
  104b37:	4c 33 67 48          	xor    0x48(%rdi),%r12
  104b3b:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  104b42:	c1 7c 51 
  104b45:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
  104b4c:	48 8d 5d 80          	lea    -0x80(%rbp),%rbx
  104b50:	4c 8b ad 30 ff ff ff 	mov    -0xd0(%rbp),%r13
  104b57:	49 8b d4             	mov    %r12,%rdx
  104b5a:	c4 c2 83 f6 d5       	mulx   %r13,%r15,%rdx
  104b5f:	4c 89 3b             	mov    %r15,(%rbx)
  104b62:	48 8b 5d 80          	mov    -0x80(%rbp),%rbx
  104b66:	48 33 d3             	xor    %rbx,%rdx
  104b69:	49 0f af d5          	imul   %r13,%rdx
  104b6d:	4b 89 14 c1          	mov    %rdx,(%r9,%r8,8)
  104b71:	4b 8b 1c c1          	mov    (%r9,%r8,8),%rbx
  104b75:	48 8b 57 68          	mov    0x68(%rdi),%rdx
  104b79:	4c 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%r15
  104b80:	c4 e2 93 f6 d3       	mulx   %rbx,%r13,%rdx
  104b85:	4d 89 2f             	mov    %r13,(%r15)
  104b88:	48 8b 9d 78 ff ff ff 	mov    -0x88(%rbp),%rbx
  104b8f:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  104b93:	4b 89 14 c3          	mov    %rdx,(%r11,%r8,8)
  104b97:	4c 8b 7f 70          	mov    0x70(%rdi),%r15
  104b9b:	4c 8d ad 70 ff ff ff 	lea    -0x90(%rbp),%r13
  104ba2:	49 8b d7             	mov    %r15,%rdx
  104ba5:	c4 e2 9b f6 d3       	mulx   %rbx,%r12,%rdx
  104baa:	4d 89 65 00          	mov    %r12,0x0(%r13)
  104bae:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  104bb2:	48 0f af 5f 28       	imul   0x28(%rdi),%rbx
  104bb7:	48 03 d3             	add    %rbx,%rdx
  104bba:	4b 89 14 c2          	mov    %rdx,(%r10,%r8,8)
  104bbe:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  104bc2:	48 8b da             	mov    %rdx,%rbx
  104bc5:	4b 03 1c c2          	add    (%r10,%r8,8),%rbx
  104bc9:	0f 18 0b             	prefetcht0 (%rbx)
  104bcc:	42 0f b6 14 32       	movzbl (%rdx,%r14,1),%edx
  104bd1:	48 33 57 48          	xor    0x48(%rdi),%rdx
  104bd5:	49 b8 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r8
  104bdc:	c1 7c 51 
  104bdf:	49 0f af d0          	imul   %r8,%rdx
  104be3:	4c 8d 87 80 00 00 00 	lea    0x80(%rdi),%r8
  104bea:	4c 8b bd 50 ff ff ff 	mov    -0xb0(%rbp),%r15
  104bf1:	49 33 d7             	xor    %r15,%rdx
  104bf4:	49 0f af 50 08       	imul   0x8(%r8),%rdx
  104bf9:	4d 8b 00             	mov    (%r8),%r8
  104bfc:	48 8d 9d 68 ff ff ff 	lea    -0x98(%rbp),%rbx
  104c03:	c4 c2 83 f6 d0       	mulx   %r8,%r15,%rdx
  104c08:	4c 89 3b             	mov    %r15,(%rbx)
  104c0b:	4c 8b 6d a8          	mov    -0x58(%rbp),%r13
  104c0f:	4c 0f af 6f 18       	imul   0x18(%rdi),%r13
  104c14:	49 03 d5             	add    %r13,%rdx
  104c17:	85 c0                	test   %eax,%eax
  104c19:	74 1a                	je     104c35 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x355>
  104c1b:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
  104c1f:	49 3b d0             	cmp    %r8,%rdx
  104c22:	0f 82 11 01 00 00    	jb     104d39 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x459>
  104c28:	48 8b 5f 58          	mov    0x58(%rdi),%rbx
  104c2c:	41 2b d0             	sub    %r8d,%edx
  104c2f:	48 63 d2             	movslq %edx,%rdx
  104c32:	8b 14 93             	mov    (%rbx,%rdx,4),%edx
  104c35:	48 63 d9             	movslq %ecx,%rbx
  104c38:	4c 8b bd 40 ff ff ff 	mov    -0xc0(%rbp),%r15
  104c3f:	49 89 14 df          	mov    %rdx,(%r15,%rbx,8)
  104c43:	ff c1                	inc    %ecx
  104c45:	8b 5d b0             	mov    -0x50(%rbp),%ebx
  104c48:	3b cb                	cmp    %ebx,%ecx
  104c4a:	0f 8c e4 00 00 00    	jl     104d34 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x454>
  104c50:	3b 8d 5c ff ff ff    	cmp    -0xa4(%rbp),%ecx
  104c56:	0f 8d a0 00 00 00    	jge    104cfc <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x41c>
  104c5c:	8b f1                	mov    %ecx,%esi
  104c5e:	c1 fe 1f             	sar    $0x1f,%esi
  104c61:	83 e6 1f             	and    $0x1f,%esi
  104c64:	03 f1                	add    %ecx,%esi
  104c66:	83 e6 e0             	and    $0xffffffe0,%esi
  104c69:	8b d9                	mov    %ecx,%ebx
  104c6b:	2b de                	sub    %esi,%ebx
  104c6d:	48 63 f3             	movslq %ebx,%rsi
  104c70:	49 8b 1c f1          	mov    (%r9,%rsi,8),%rbx
  104c74:	4d 8b 34 f2          	mov    (%r10,%rsi,8),%r14
  104c78:	49 8b 34 f3          	mov    (%r11,%rsi,8),%rsi
  104c7c:	4c 8b 6f 08          	mov    0x8(%rdi),%r13
  104c80:	47 0f b6 34 2e       	movzbl (%r14,%r13,1),%r14d
  104c85:	4c 33 77 48          	xor    0x48(%rdi),%r14
  104c89:	49 bd 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r13
  104c90:	c1 7c 51 
  104c93:	4d 0f af f5          	imul   %r13,%r14
  104c97:	4c 8d af 80 00 00 00 	lea    0x80(%rdi),%r13
  104c9e:	49 33 de             	xor    %r14,%rbx
  104ca1:	49 0f af 5d 08       	imul   0x8(%r13),%rbx
  104ca6:	4d 8b 75 00          	mov    0x0(%r13),%r14
  104caa:	4c 8d ad 60 ff ff ff 	lea    -0xa0(%rbp),%r13
  104cb1:	48 8b d3             	mov    %rbx,%rdx
  104cb4:	c4 c2 9b f6 d6       	mulx   %r14,%r12,%rdx
  104cb9:	4d 89 65 00          	mov    %r12,0x0(%r13)
  104cbd:	48 0f af 77 18       	imul   0x18(%rdi),%rsi
  104cc2:	48 03 d6             	add    %rsi,%rdx
  104cc5:	85 c0                	test   %eax,%eax
  104cc7:	74 16                	je     104cdf <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x3ff>
  104cc9:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
  104ccd:	49 3b d0             	cmp    %r8,%rdx
  104cd0:	72 60                	jb     104d32 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x452>
  104cd2:	48 8b 77 58          	mov    0x58(%rdi),%rsi
  104cd6:	41 2b d0             	sub    %r8d,%edx
  104cd9:	48 63 d2             	movslq %edx,%rdx
  104cdc:	8b 14 96             	mov    (%rsi,%rdx,4),%edx
  104cdf:	48 63 f1             	movslq %ecx,%rsi
  104ce2:	49 89 14 f7          	mov    %rdx,(%r15,%rsi,8)
  104ce6:	ff c1                	inc    %ecx
  104ce8:	8b 95 5c ff ff ff    	mov    -0xa4(%rbp),%edx
  104cee:	3b ca                	cmp    %edx,%ecx
  104cf0:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%rbp)
  104cf6:	0f 8c 60 ff ff ff    	jl     104c5c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x37c>
  104cfc:	33 ff                	xor    %edi,%edi
  104cfe:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  104d02:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
  104d06:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  104d0a:	48 8d 3d 3f 66 0b 00 	lea    0xb663f(%rip),%rdi        # 1bb350 <__security_cookie>
  104d11:	48 8b 3f             	mov    (%rdi),%rdi
  104d14:	48 39 bd 38 ff ff ff 	cmp    %rdi,-0xc8(%rbp)
  104d1b:	74 05                	je     104d22 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x442>
  104d1d:	e8 de 51 f0 ff       	call   9f00 <RhpFallbackFailFast>
  104d22:	90                   	nop
  104d23:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  104d27:	5b                   	pop    %rbx
  104d28:	41 5c                	pop    %r12
  104d2a:	41 5d                	pop    %r13
  104d2c:	41 5e                	pop    %r14
  104d2e:	41 5f                	pop    %r15
  104d30:	5d                   	pop    %rbp
  104d31:	c3                   	ret
  104d32:	eb ab                	jmp    104cdf <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x3ff>
  104d34:	e9 c1 fd ff ff       	jmp    104afa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x21a>
  104d39:	e9 f7 fe ff ff       	jmp    104c35 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x355>
  104d3e:	4c 8b bd 40 ff ff ff 	mov    -0xc0(%rbp),%r15
  104d45:	e9 06 ff ff ff       	jmp    104c50 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x370>
  104d4a:	e9 c9 fc ff ff       	jmp    104a18 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x138>
  104d4f:	44 8b 7d b4          	mov    -0x4c(%rbp),%r15d
  104d53:	e9 57 fd ff ff       	jmp    104aaf <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x1cf>
  104d58:	48 8d 3d 79 c0 14 00 	lea    0x14c079(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  104d5f:	e8 b0 07 f6 ff       	call   65514 <RhpNewFast>
  104d64:	48 8b d8             	mov    %rax,%rbx
  104d67:	48 8b fb             	mov    %rbx,%rdi
  104d6a:	48 8d 35 4f 97 13 00 	lea    0x13974f(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104d71:	e8 9a 5e f8 ff       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104d76:	48 8b fb             	mov    %rbx,%rdi
  104d79:	e8 00 0a f6 ff       	call   6577e <RhpThrowEx>
  104d7e:	cc                   	int3
  104d7f:	90                   	nop

