   774f7:	e8 34 07 00 00       	call   77c30 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch>
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

   7762c:	e8 0f da 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77631:	eb 0b                	jmp    7763e <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0xde>
   77633:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   77639:	e8 a2 dd 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   7763e:	48 8b 0d e3 44 1b 00 	mov    0x1b44e3(%rip),%rcx        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77645:	48 8b 79 18          	mov    0x18(%rcx),%rdi
   77649:	4d 85 ff             	test   %r15,%r15
   7764c:	75 06                	jne    77654 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0xf4>
   7764e:	33 f6                	xor    %esi,%esi
   77650:	33 d2                	xor    %edx,%edx
   77652:	eb 08                	jmp    7765c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0xfc>
   77654:	49 8d 77 10          	lea    0x10(%r15),%rsi
   77658:	41 8b 57 08          	mov    0x8(%r15),%edx
   7765c:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   77660:	41 b8 64 00 00 00    	mov    $0x64,%r8d
   77666:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   7766a:	74 0a                	je     77676 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x116>
   7766c:	45 33 c9             	xor    %r9d,%r9d
   7766f:	e8 cc d9 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77674:	eb 08                	jmp    7767e <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x11e>
   77676:	45 33 c9             	xor    %r9d,%r9d
   77679:	e8 62 dd 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   7767e:	48 8b 15 a3 44 1b 00 	mov    0x1b44a3(%rip),%rdx        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77685:	4c 8b 72 18          	mov    0x18(%rdx),%r14
   77689:	4d 85 ff             	test   %r15,%r15
   7768c:	75 06                	jne    77694 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x134>
   7768e:	33 d2                	xor    %edx,%edx
   77690:	33 ff                	xor    %edi,%edi
   77692:	eb 08                	jmp    7769c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x13c>
   77694:	49 8d 57 10          	lea    0x10(%r15),%rdx
   77698:	41 8b 7f 08          	mov    0x8(%r15),%edi
   7769c:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   776a0:	b8 64 00 00 00       	mov    $0x64,%eax
   776a5:	41 80 7e 55 00       	cmpb   $0x0,0x55(%r14)
   776aa:	0f 84 b5 01 00 00    	je     77865 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x305>
   776b0:	3b f8                	cmp    %eax,%edi
   776b2:	0f 85 21 05 00 00    	jne    77bd9 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x679>
   776b8:	41 0f b6 4e 54       	movzbl 0x54(%r14),%ecx
   776bd:	4d 8b 46 38          	mov    0x38(%r14),%r8
   776c1:	45 33 c9             	xor    %r9d,%r9d
   776c4:	85 ff                	test   %edi,%edi
   776c6:	4c 0f 45 ca          	cmovne %rdx,%r9
   776ca:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
   776ce:	33 d2                	xor    %edx,%edx
   776d0:	85 c0                	test   %eax,%eax
   776d2:	48 0f 45 d6          	cmovne %rsi,%rdx
   776d6:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   776da:	48 8b f2             	mov    %rdx,%rsi
   776dd:	85 c9                	test   %ecx,%ecx
   776df:	0f 84 c4 00 00 00    	je     777a9 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x249>
   776e5:	33 c0                	xor    %eax,%eax
   776e7:	85 ff                	test   %edi,%edi
   776e9:	0f 8e 67 01 00 00    	jle    77856 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x2f6>
   776ef:	4d 8d ae 80 00 00 00 	lea    0x80(%r14),%r13
   776f6:	48 63 d0             	movslq %eax,%rdx
   776f9:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   776fd:	49 33 56 48          	xor    0x48(%r14),%rdx
   77701:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77708:	c1 7c 51 
   7770b:	4c 8d 55 c0          	lea    -0x40(%rbp),%r10
   7770f:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   77714:	4d 89 1a             	mov    %r11,(%r10)
   77717:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   7771b:	48 33 d1             	xor    %rcx,%rdx
   7771e:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77725:	c1 7c 51 
   77728:	48 0f af d1          	imul   %rcx,%rdx
   7772c:	48 89 95 28 ff ff ff 	mov    %rdx,-0xd8(%rbp)
   77733:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   77737:	4c 8d 55 b8          	lea    -0x48(%rbp),%r10
   7773b:	4c 8b 9d 28 ff ff ff 	mov    -0xd8(%rbp),%r11
   77742:	48 8b d1             	mov    %rcx,%rdx
   77745:	c4 c2 9b f6 d3       	mulx   %r11,%r12,%rdx
   7774a:	4d 89 22             	mov    %r12,(%r10)
   7774d:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   77751:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   77755:	49 33 56 48          	xor    0x48(%r14),%rdx
   77759:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77760:	c1 7c 51 
   77763:	48 0f af d1          	imul   %rcx,%rdx
   77767:	49 8b cd             	mov    %r13,%rcx
   7776a:	49 33 d3             	xor    %r11,%rdx
   7776d:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   77772:	48 8b 09             	mov    (%rcx),%rcx
   77775:	4c 8d 55 b0          	lea    -0x50(%rbp),%r10
   77779:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   7777e:	4d 89 1a             	mov    %r11,(%r10)
   77781:	49 3b d0             	cmp    %r8,%rdx
   77784:	72 0d                	jb     77793 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x233>
   77786:	41 2b d0             	sub    %r8d,%edx
   77789:	49 8b 4e 58          	mov    0x58(%r14),%rcx
   7778d:	48 63 d2             	movslq %edx,%rdx
   77790:	8b 14 91             	mov    (%rcx,%rdx,4),%edx
   77793:	48 63 c8             	movslq %eax,%rcx
   77796:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   7779a:	ff c0                	inc    %eax
   7779c:	3b c7                	cmp    %edi,%eax
   7779e:	0f 8c 52 ff ff ff    	jl     776f6 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x196>
   777a4:	e9 ad 00 00 00       	jmp    77856 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x2f6>
   777a9:	33 c0                	xor    %eax,%eax
   777ab:	85 ff                	test   %edi,%edi
   777ad:	0f 8e a3 00 00 00    	jle    77856 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x2f6>
   777b3:	4d 8d ae 80 00 00 00 	lea    0x80(%r14),%r13
   777ba:	48 63 d0             	movslq %eax,%rdx
   777bd:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   777c1:	49 33 56 48          	xor    0x48(%r14),%rdx
   777c5:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   777cc:	c1 7c 51 
   777cf:	4c 8d 45 a8          	lea    -0x58(%rbp),%r8
   777d3:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   777d8:	4d 89 10             	mov    %r10,(%r8)
   777db:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
   777df:	48 33 d1             	xor    %rcx,%rdx
   777e2:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   777e9:	c1 7c 51 
   777ec:	48 0f af d1          	imul   %rcx,%rdx
   777f0:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
   777f7:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   777fb:	4c 8d 45 a0          	lea    -0x60(%rbp),%r8
   777ff:	4c 8b 95 20 ff ff ff 	mov    -0xe0(%rbp),%r10
   77806:	48 8b d1             	mov    %rcx,%rdx
   77809:	c4 c2 a3 f6 d2       	mulx   %r10,%r11,%rdx
   7780e:	4d 89 18             	mov    %r11,(%r8)
   77811:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   77815:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   77819:	49 33 56 48          	xor    0x48(%r14),%rdx
   7781d:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77824:	c1 7c 51 
   77827:	48 0f af d1          	imul   %rcx,%rdx
   7782b:	49 8b cd             	mov    %r13,%rcx
   7782e:	49 33 d2             	xor    %r10,%rdx
   77831:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   77836:	48 8b 09             	mov    (%rcx),%rcx
   77839:	4c 8d 45 98          	lea    -0x68(%rbp),%r8
   7783d:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   77842:	4d 89 10             	mov    %r10,(%r8)
   77845:	48 63 c8             	movslq %eax,%rcx
   77848:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   7784c:	ff c0                	inc    %eax
   7784e:	3b c7                	cmp    %edi,%eax
   77850:	0f 8c 64 ff ff ff    	jl     777ba <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x25a>
   77856:	33 d2                	xor    %edx,%edx
   77858:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   7785c:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   77860:	e9 62 02 00 00       	jmp    77ac7 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x567>
   77865:	44 8b e7             	mov    %edi,%r12d
   77868:	48 8b fe             	mov    %rsi,%rdi
   7786b:	8b f0                	mov    %eax,%esi
   7786d:	44 3b e6             	cmp    %esi,%r12d
   77870:	0f 85 89 03 00 00    	jne    77bff <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x69f>
   77876:	41 0f b6 46 54       	movzbl 0x54(%r14),%eax
   7787b:	49 8b 4e 38          	mov    0x38(%r14),%rcx
   7787f:	45 33 c0             	xor    %r8d,%r8d
   77882:	45 85 e4             	test   %r12d,%r12d
   77885:	4c 0f 45 c2          	cmovne %rdx,%r8
   77889:	4c 89 45 90          	mov    %r8,-0x70(%rbp)
   7788d:	4d 8b e8             	mov    %r8,%r13
   77890:	33 d2                	xor    %edx,%edx
   77892:	85 f6                	test   %esi,%esi
   77894:	48 0f 45 d7          	cmovne %rdi,%rdx
   77898:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
   7789c:	4c 8b c2             	mov    %rdx,%r8
   7789f:	4c 89 45 80          	mov    %r8,-0x80(%rbp)
   778a3:	85 c0                	test   %eax,%eax
   778a5:	0f 84 22 01 00 00    	je     779cd <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x46d>
   778ab:	33 ff                	xor    %edi,%edi
   778ad:	45 85 e4             	test   %r12d,%r12d
   778b0:	0f 8e 07 02 00 00    	jle    77abd <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x55d>
   778b6:	49 8d 76 78          	lea    0x78(%r14),%rsi
   778ba:	48 89 b5 00 ff ff ff 	mov    %rsi,-0x100(%rbp)
   778c1:	49 8d 96 80 00 00 00 	lea    0x80(%r14),%rdx
   778c8:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
   778cf:	48 63 c7             	movslq %edi,%rax
   778d2:	49 8b 44 c5 00       	mov    0x0(%r13,%rax,8),%rax
   778d7:	49 33 46 48          	xor    0x48(%r14),%rax
   778db:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
   778e2:	c1 7c 51 
   778e5:	4c 8d 95 68 ff ff ff 	lea    -0x98(%rbp),%r10
   778ec:	48 8b d0             	mov    %rax,%rdx
   778ef:	c4 c2 a3 f6 d1       	mulx   %r9,%r11,%rdx
   778f4:	4d 89 1a             	mov    %r11,(%r10)
   778f7:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   778fe:	48 33 d0             	xor    %rax,%rdx
   77901:	49 0f af d1          	imul   %r9,%rdx
   77905:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
   7790c:	48 8b c6             	mov    %rsi,%rax
   7790f:	48 8b 00             	mov    (%rax),%rax
   77912:	4c 8d 8d 60 ff ff ff 	lea    -0xa0(%rbp),%r9
   77919:	4c 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%r10
   77920:	48 8b d0             	mov    %rax,%rdx
   77923:	c4 c2 a3 f6 d2       	mulx   %r10,%r11,%rdx
   77928:	4d 89 19             	mov    %r11,(%r9)
   7792b:	49 8b 46 08          	mov    0x8(%r14),%rax
   7792f:	0f b6 14 10          	movzbl (%rax,%rdx,1),%edx
   77933:	48 89 95 70 ff ff ff 	mov    %rdx,-0x90(%rbp)
   7793a:	49 8d 46 68          	lea    0x68(%r14),%rax
   7793e:	48 8b 00             	mov    (%rax),%rax
   77941:	4c 8d 8d 58 ff ff ff 	lea    -0xa8(%rbp),%r9
   77948:	48 8b d0             	mov    %rax,%rdx
   7794b:	c4 c2 a3 f6 c2       	mulx   %r10,%r11,%rax
   77950:	4d 89 19             	mov    %r11,(%r9)
   77953:	49 0f af 46 18       	imul   0x18(%r14),%rax
   77958:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
   7795f:	49 33 56 48          	xor    0x48(%r14),%rdx
   77963:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
   7796a:	c1 7c 51 
   7796d:	49 0f af d1          	imul   %r9,%rdx
   77971:	4c 8b 8d 08 ff ff ff 	mov    -0xf8(%rbp),%r9
   77978:	4d 8b d9             	mov    %r9,%r11
   7797b:	49 33 d2             	xor    %r10,%rdx
   7797e:	49 0f af 53 08       	imul   0x8(%r11),%rdx
   77983:	4d 8b 13             	mov    (%r11),%r10
   77986:	4c 8d 9d 50 ff ff ff 	lea    -0xb0(%rbp),%r11
   7798d:	c4 c2 cb f6 d2       	mulx   %r10,%rsi,%rdx
   77992:	49 89 33             	mov    %rsi,(%r11)
   77995:	48 03 c2             	add    %rdx,%rax
   77998:	48 3b c1             	cmp    %rcx,%rax
   7799b:	72 0b                	jb     779a8 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x448>
   7799d:	2b c1                	sub    %ecx,%eax
   7799f:	49 8b 76 58          	mov    0x58(%r14),%rsi
   779a3:	48 98                	cltq
   779a5:	8b 04 86             	mov    (%rsi,%rax,4),%eax
   779a8:	48 63 f7             	movslq %edi,%rsi
   779ab:	49 89 04 f0          	mov    %rax,(%r8,%rsi,8)
   779af:	ff c7                	inc    %edi
   779b1:	41 3b fc             	cmp    %r12d,%edi
   779b4:	4c 89 8d 08 ff ff ff 	mov    %r9,-0xf8(%rbp)
   779bb:	48 8b b5 00 ff ff ff 	mov    -0x100(%rbp),%rsi
   779c2:	0f 8c 07 ff ff ff    	jl     778cf <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x36f>
   779c8:	e9 f0 00 00 00       	jmp    77abd <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x55d>
   779cd:	33 c0                	xor    %eax,%eax
   779cf:	45 85 e4             	test   %r12d,%r12d
   779d2:	0f 8e e5 00 00 00    	jle    77abd <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x55d>
   779d8:	89 85 7c ff ff ff    	mov    %eax,-0x84(%rbp)
   779de:	48 63 f8             	movslq %eax,%rdi
   779e1:	49 8b 7c fd 00       	mov    0x0(%r13,%rdi,8),%rdi
   779e6:	49 8b 76 48          	mov    0x48(%r14),%rsi
   779ea:	e8 31 2b 00 00       	call   7a520 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__Hash>
   779ef:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
   779f6:	49 8b fe             	mov    %r14,%rdi
   779f9:	48 8b b5 10 ff ff ff 	mov    -0xf0(%rbp),%rsi
   77a00:	e8 1b cc 08 00       	call   104620 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__Bucket>
   77a05:	49 8b 7e 08          	mov    0x8(%r14),%rdi
   77a09:	0f b6 04 07          	movzbl (%rdi,%rax,1),%eax
   77a0d:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
   77a14:	49 8d 76 68          	lea    0x68(%r14),%rsi
   77a18:	48 8b 36             	mov    (%rsi),%rsi
   77a1b:	48 8b fe             	mov    %rsi,%rdi
   77a1e:	33 f6                	xor    %esi,%esi
   77a20:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
   77a27:	33 c9                	xor    %ecx,%ecx
   77a29:	e8 02 c7 01 00       	call   94130 <S_P_CoreLib_System_UInt128__op_Multiply>
   77a2e:	48 8b f8             	mov    %rax,%rdi
   77a31:	48 8b f2             	mov    %rdx,%rsi
   77a34:	ba 40 00 00 00       	mov    $0x40,%edx
   77a39:	e8 42 c7 01 00       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
   77a3e:	49 0f af 46 18       	imul   0x18(%r14),%rax
   77a43:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
   77a4a:	48 8b bd 48 ff ff ff 	mov    -0xb8(%rbp),%rdi
   77a51:	49 33 7e 48          	xor    0x48(%r14),%rdi
   77a55:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
   77a5c:	c1 7c 51 
   77a5f:	48 0f af fe          	imul   %rsi,%rdi
   77a63:	4d 8d 8e 80 00 00 00 	lea    0x80(%r14),%r9
   77a6a:	48 8b b5 10 ff ff ff 	mov    -0xf0(%rbp),%rsi
   77a71:	48 33 fe             	xor    %rsi,%rdi
   77a74:	49 0f af 79 08       	imul   0x8(%r9),%rdi
   77a79:	49 8b 11             	mov    (%r9),%rdx
   77a7c:	33 f6                	xor    %esi,%esi
   77a7e:	33 c9                	xor    %ecx,%ecx
   77a80:	e8 ab c6 01 00       	call   94130 <S_P_CoreLib_System_UInt128__op_Multiply>
   77a85:	48 8b f8             	mov    %rax,%rdi
   77a88:	48 8b f2             	mov    %rdx,%rsi
   77a8b:	ba 40 00 00 00       	mov    $0x40,%edx
   77a90:	e8 eb c6 01 00       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
   77a95:	48 8b bd 40 ff ff ff 	mov    -0xc0(%rbp),%rdi
   77a9c:	48 03 f8             	add    %rax,%rdi
   77a9f:	8b b5 7c ff ff ff    	mov    -0x84(%rbp),%esi
   77aa5:	48 63 c6             	movslq %esi,%rax
   77aa8:	4c 8b 45 80          	mov    -0x80(%rbp),%r8
   77aac:	49 89 3c c0          	mov    %rdi,(%r8,%rax,8)
   77ab0:	ff c6                	inc    %esi
   77ab2:	41 3b f4             	cmp    %r12d,%esi
   77ab5:	8b c6                	mov    %esi,%eax
   77ab7:	0f 8c 1b ff ff ff    	jl     779d8 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x478>
   77abd:	33 ff                	xor    %edi,%edi
   77abf:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
   77ac3:	48 89 7d 90          	mov    %rdi,-0x70(%rbp)
   77ac7:	48 8b 3d 5a 40 1b 00 	mov    0x1b405a(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77ace:	4c 8b 77 18          	mov    0x18(%rdi),%r14
   77ad2:	4d 85 ff             	test   %r15,%r15
   77ad5:	75 08                	jne    77adf <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x57f>
   77ad7:	45 33 ed             	xor    %r13d,%r13d
   77ada:	45 33 e4             	xor    %r12d,%r12d
   77add:	eb 08                	jmp    77ae7 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x587>
   77adf:	4d 8d 6f 10          	lea    0x10(%r15),%r13
   77ae3:	45 8b 67 08          	mov    0x8(%r15),%r12d
   77ae7:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
   77aeb:	c5 fa 7f 85 30 ff ff 	vmovdqu %xmm0,-0xd0(%rbp)
   77af2:	ff 
   77af3:	48 8d bd 30 ff ff ff 	lea    -0xd0(%rbp),%rdi
   77afa:	48 8b f3             	mov    %rbx,%rsi
   77afd:	e8 6e 37 09 00       	call   10b270 <S_P_CoreLib_System_Span_1<UIntPtr>___ctor>
   77b02:	48 8b 8d 30 ff ff ff 	mov    -0xd0(%rbp),%rcx
   77b09:	44 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%r8d
   77b10:	49 8b f5             	mov    %r13,%rsi
   77b13:	41 8b d4             	mov    %r12d,%edx
   77b16:	49 8b fe             	mov    %r14,%rdi
   77b19:	45 33 c9             	xor    %r9d,%r9d
   77b1c:	39 3f                	cmp    %edi,(%rdi)
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

0000000000077c30 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch>:
   77c30:	55                   	push   %rbp
   77c31:	41 57                	push   %r15
   77c33:	41 56                	push   %r14
   77c35:	53                   	push   %rbx
   77c36:	48 83 ec 28          	sub    $0x28,%rsp
   77c3a:	c5 f8 77             	vzeroupper
   77c3d:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
   77c42:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
   77c47:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
   77c4c:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
   77c51:	33 c0                	xor    %eax,%eax
   77c53:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   77c57:	48 8d 3d fa 66 1d 00 	lea    0x1d66fa(%rip),%rdi        # 24e358 <__Str_Testing_GetIndicesStreamPrefet_DFEC981FE3992F56C08A364E99D8E9725ED1C914578F7F525692F9A2069E1387>
   77c5e:	e8 cd 4d 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   77c63:	48 8b 1d be 3e 1b 00 	mov    0x1b3ebe(%rip),%rbx        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77c6a:	4c 8b 7b 10          	mov    0x10(%rbx),%r15
   77c6e:	41 8b 77 08          	mov    0x8(%r15),%esi
   77c72:	48 8d 3d a7 d6 21 00 	lea    0x21d6a7(%rip),%rdi        # 295320 <_ZTV16__Array<UIntPtr>>
   77c79:	e8 3c da fe ff       	call   656ba <RhpNewArray>
   77c7e:	4c 8b f0             	mov    %rax,%r14
   77c81:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   77c85:	4d 85 ff             	test   %r15,%r15
   77c88:	75 06                	jne    77c90 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x60>
   77c8a:	33 f6                	xor    %esi,%esi
   77c8c:	33 d2                	xor    %edx,%edx
   77c8e:	eb 08                	jmp    77c98 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x68>
   77c90:	49 8d 77 10          	lea    0x10(%r15),%rsi
   77c94:	41 8b 57 08          	mov    0x8(%r15),%edx
   77c98:	49 8d 4e 10          	lea    0x10(%r14),%rcx
   77c9c:	45 8b 46 08          	mov    0x8(%r14),%r8d
   77ca0:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   77ca4:	74 0d                	je     77cb3 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x83>
   77ca6:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   77cac:	e8 8f d3 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77cb1:	eb 0b                	jmp    77cbe <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x8e>
   77cb3:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   77cb9:	e8 22 d7 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   77cbe:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   77cc2:	48 8b 4b 10          	mov    0x10(%rbx),%rcx
   77cc6:	48 85 c9             	test   %rcx,%rcx
   77cc9:	75 06                	jne    77cd1 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xa1>
   77ccb:	33 f6                	xor    %esi,%esi
   77ccd:	33 d2                	xor    %edx,%edx
   77ccf:	eb 07                	jmp    77cd8 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xa8>
   77cd1:	48 8d 71 10          	lea    0x10(%rcx),%rsi
   77cd5:	8b 51 08             	mov    0x8(%rcx),%edx
   77cd8:	49 8d 4e 10          	lea    0x10(%r14),%rcx
   77cdc:	45 8b 46 08          	mov    0x8(%r14),%r8d
   77ce0:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   77ce4:	74 0a                	je     77cf0 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xc0>
   77ce6:	45 33 c9             	xor    %r9d,%r9d
   77ce9:	e8 52 d3 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77cee:	eb 08                	jmp    77cf8 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xc8>
   77cf0:	45 33 c9             	xor    %r9d,%r9d
   77cf3:	e8 e8 d6 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   77cf8:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77cfc:	be 22 00 00 00       	mov    $0x22,%esi
   77d01:	ba 01 00 00 00       	mov    $0x1,%edx
   77d06:	e8 f5 94 04 00       	call   c1200 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler___ctor>
   77d0b:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77d0e:	3b 7d e0             	cmp    -0x20(%rbp),%edi
   77d11:	0f 87 cd 00 00 00    	ja     77de4 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x1b4>
   77d17:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
   77d1b:	8b c7                	mov    %edi,%eax
   77d1d:	48 8d 34 46          	lea    (%rsi,%rax,2),%rsi
   77d21:	8b 45 e0             	mov    -0x20(%rbp),%eax
   77d24:	2b c7                	sub    %edi,%eax
   77d26:	83 f8 0c             	cmp    $0xc,%eax
   77d29:	72 28                	jb     77d53 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x123>
   77d2b:	48 8d 3d e6 a4 1c 00 	lea    0x1ca4e6(%rip),%rdi        # 242218 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   77d32:	48 83 c7 0c          	add    $0xc,%rdi
   77d36:	c5 fa 6f 07          	vmovdqu (%rdi),%xmm0
   77d3a:	c5 fa 6f 4f 08       	vmovdqu 0x8(%rdi),%xmm1
   77d3f:	c5 fa 7f 06          	vmovdqu %xmm0,(%rsi)
   77d43:	c5 fa 7f 4e 08       	vmovdqu %xmm1,0x8(%rsi)
   77d48:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77d4b:	83 c7 0c             	add    $0xc,%edi
   77d4e:	89 7d d0             	mov    %edi,-0x30(%rbp)
   77d51:	eb 10                	jmp    77d63 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x133>
   77d53:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77d57:	48 8d 35 ba a4 1c 00 	lea    0x1ca4ba(%rip),%rsi        # 242218 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   77d5e:	e8 7d 96 04 00       	call   c13e0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   77d63:	48 8b 73 10          	mov    0x10(%rbx),%rsi
   77d67:	8b 76 08             	mov    0x8(%rsi),%esi
   77d6a:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77d6e:	e8 ed be 0b 00       	call   133c60 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__AppendFormatted<Int32>>
   77d73:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77d76:	3b 7d e0             	cmp    -0x20(%rbp),%edi
   77d79:	77 69                	ja     77de4 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x1b4>
   77d7b:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
   77d7f:	8b c7                	mov    %edi,%eax
   77d81:	48 8d 34 46          	lea    (%rsi,%rax,2),%rsi
   77d85:	8b 45 e0             	mov    -0x20(%rbp),%eax
   77d88:	2b c7                	sub    %edi,%eax
   77d8a:	83 f8 16             	cmp    $0x16,%eax
   77d8d:	72 28                	jb     77db7 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x187>
   77d8f:	48 8d 3d 7a a9 1c 00 	lea    0x1ca97a(%rip),%rdi        # 242710 <__Str__keys_with_prefetching_7D74716B97304C78AC45626F98B1BB0F1083D62C00EA0EBE1B5AB87B36CE273A>
   77d96:	48 83 c7 0c          	add    $0xc,%rdi
   77d9a:	c5 fe 6f 07          	vmovdqu (%rdi),%ymm0
   77d9e:	c5 fa 6f 4f 1c       	vmovdqu 0x1c(%rdi),%xmm1
   77da3:	c5 fe 7f 06          	vmovdqu %ymm0,(%rsi)
   77da7:	c5 fa 7f 4e 1c       	vmovdqu %xmm1,0x1c(%rsi)
   77dac:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77daf:	83 c7 16             	add    $0x16,%edi
   77db2:	89 7d d0             	mov    %edi,-0x30(%rbp)
   77db5:	eb 10                	jmp    77dc7 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x197>
   77db7:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77dbb:	48 8d 35 4e a9 1c 00 	lea    0x1ca94e(%rip),%rsi        # 242710 <__Str__keys_with_prefetching_7D74716B97304C78AC45626F98B1BB0F1083D62C00EA0EBE1B5AB87B36CE273A>
   77dc2:	e8 19 96 04 00       	call   c13e0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   77dc7:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77dcb:	e8 d0 94 04 00       	call   c12a0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__ToStringAndClear>
   77dd0:	48 8b f8             	mov    %rax,%rdi
   77dd3:	e8 58 4c 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   77dd8:	90                   	nop
   77dd9:	48 83 c4 28          	add    $0x28,%rsp
   77ddd:	5b                   	pop    %rbx
   77dde:	41 5e                	pop    %r14
   77de0:	41 5f                	pop    %r15
   77de2:	5d                   	pop    %rbp
   77de3:	c3                   	ret
   77de4:	e8 37 ad 01 00       	call   92b20 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
   77de9:	cc                   	int3
   77dea:	90                   	nop
   77deb:	90                   	nop
   77dec:	90                   	nop
   77ded:	90                   	nop
   77dee:	90                   	nop
   77def:	90                   	nop
   77df0:	90                   	nop
   77df1:	90                   	nop
   77df2:	90                   	nop
   77df3:	90                   	nop
   77df4:	90                   	nop
   77df5:	90                   	nop
   77df6:	90                   	nop
   77df7:	90                   	nop
   77df8:	90                   	nop
   77df9:	90                   	nop
   77dfa:	90                   	nop
   77dfb:	90                   	nop
   77dfc:	90                   	nop
   77dfd:	90                   	nop
   77dfe:	90                   	nop
   77dff:	90                   	nop

   787fa:	e8 41 c8 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   787ff:	eb 0e                	jmp    7880f <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x10f>
   78801:	49 8b cc             	mov    %r12,%rcx
   78804:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   7880a:	e8 d1 cb 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   7880f:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   78813:	4d 85 f6             	test   %r14,%r14
   78816:	75 06                	jne    7881e <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x11e>
   78818:	33 f6                	xor    %esi,%esi
   7881a:	33 d2                	xor    %edx,%edx
   7881c:	eb 08                	jmp    78826 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x126>
   7881e:	49 8d 76 10          	lea    0x10(%r14),%rsi
   78822:	41 8b 56 08          	mov    0x8(%r14),%edx
   78826:	4c 8b 7d d0          	mov    -0x30(%rbp),%r15
   7882a:	49 83 c7 10          	add    $0x10,%r15
   7882e:	49 8b cf             	mov    %r15,%rcx
   78831:	41 b8 00 02 00 00    	mov    $0x200,%r8d
   78837:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   7883b:	74 0d                	je     7884a <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x14a>
   7883d:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   78843:	e8 f8 c7 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   78848:	eb 0b                	jmp    78855 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x155>
   7884a:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   78850:	e8 8b cb 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   78855:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   78859:	4d 85 ed             	test   %r13,%r13
   7885c:	75 06                	jne    78864 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x164>
   7885e:	33 f6                	xor    %esi,%esi
   78860:	33 d2                	xor    %edx,%edx
   78862:	eb 08                	jmp    7886c <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x16c>
   78864:	49 8d 75 10          	lea    0x10(%r13),%rsi
   78868:	41 8b 55 08          	mov    0x8(%r13),%edx
   7886c:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
   78870:	48 83 c3 10          	add    $0x10,%rbx
   78874:	48 8b cb             	mov    %rbx,%rcx
   78877:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
   7887d:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   78881:	74 0d                	je     78890 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x190>
   78883:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   78889:	e8 b2 c7 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   7888e:	eb 0b                	jmp    7889b <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x19b>
   78890:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   78896:	e8 45 cb 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   7889b:	48 8d 3d 5e 9a 1c 00 	lea    0x1c9a5e(%rip),%rdi        # 242300 <__Str___Tested_prefetch_patterns_for_DE81E3DAF059C0B18D33D0B771E134E96E0008DA1110A965332E23E19D043BB8>
   788a2:	e8 89 41 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   788a7:	90                   	nop
   788a8:	48 83 c4 18          	add    $0x18,%rsp
   788ac:	5b                   	pop    %rbx
   788ad:	41 5c                	pop    %r12
   788af:	41 5d                	pop    %r13
   788b1:	41 5e                	pop    %r14
   788b3:	41 5f                	pop    %r15
   788b5:	5d                   	pop    %rbp
   788b6:	c3                   	ret
   788b7:	bf 10 00 00 00       	mov    $0x10,%edi
   788bc:	e8 af 79 00 00       	call   80270 <System_Linq_System_Linq_ThrowHelper__ThrowArgumentNullException>
   788c1:	cc                   	int3
   788c2:	90                   	nop
   788c3:	90                   	nop
   788c4:	90                   	nop
   788c5:	90                   	nop
   788c6:	90                   	nop
   788c7:	90                   	nop
   788c8:	90                   	nop
   788c9:	90                   	nop
   788ca:	90                   	nop
   788cb:	90                   	nop
   788cc:	90                   	nop
   788cd:	90                   	nop
   788ce:	90                   	nop
   788cf:	90                   	nop

0000000000105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>:
  105040:	55                   	push   %rbp
  105041:	41 57                	push   %r15
  105043:	41 56                	push   %r14
  105045:	41 55                	push   %r13
  105047:	41 54                	push   %r12
  105049:	53                   	push   %rbx
  10504a:	48 83 ec 68          	sub    $0x68,%rsp
  10504e:	c5 f8 77             	vzeroupper
  105051:	48 8d ac 24 90 00 00 	lea    0x90(%rsp),%rbp
  105058:	00 
  105059:	33 c0                	xor    %eax,%eax
  10505b:	48 89 45 88          	mov    %rax,-0x78(%rbp)
  10505f:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  105064:	c5 79 7f 45 90       	vmovdqa %xmm8,-0x70(%rbp)
  105069:	c5 79 7f 45 a0       	vmovdqa %xmm8,-0x60(%rbp)
  10506e:	c5 79 7f 45 b0       	vmovdqa %xmm8,-0x50(%rbp)
  105073:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  105078:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  10507c:	48 8b 05 fd e5 0b 00 	mov    0xbe5fd(%rip),%rax        # 1c3680 <__security_cookie>
  105083:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
  10508a:	41 3b d0             	cmp    %r8d,%edx
  10508d:	0f 85 24 03 00 00    	jne    1053b7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x377>
  105093:	45 84 c9             	test   %r9b,%r9b
  105096:	74 06                	je     10509e <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x5e>
  105098:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  10509c:	eb 02                	jmp    1050a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x60>
  10509e:	33 c0                	xor    %eax,%eax
  1050a0:	0f b6 c0             	movzbl %al,%eax
  1050a3:	4c 8b 47 38          	mov    0x38(%rdi),%r8
  1050a7:	85 24 24             	test   %esp,(%rsp)
  1050aa:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1050b1:	4c 8d 0c 24          	lea    (%rsp),%r9
  1050b5:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  1050b9:	62 d1 7e 48 7f 01    	vmovdqu32 %zmm0,(%r9)
  1050bf:	62 d1 7e 48 7f 41 01 	vmovdqu32 %zmm0,0x40(%r9)
  1050c6:	62 d1 7e 48 7f 41 02 	vmovdqu32 %zmm0,0x80(%r9)
  1050cd:	62 d1 7e 48 7f 41 03 	vmovdqu32 %zmm0,0xc0(%r9)
  1050d4:	85 24 24             	test   %esp,(%rsp)
  1050d7:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1050de:	4c 8d 14 24          	lea    (%rsp),%r10
  1050e2:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  1050e6:	62 d1 7e 48 7f 02    	vmovdqu32 %zmm0,(%r10)
  1050ec:	62 d1 7e 48 7f 42 01 	vmovdqu32 %zmm0,0x40(%r10)
  1050f3:	62 d1 7e 48 7f 42 02 	vmovdqu32 %zmm0,0x80(%r10)
  1050fa:	62 d1 7e 48 7f 42 03 	vmovdqu32 %zmm0,0xc0(%r10)
  105101:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
  105105:	4c 89 55 c8          	mov    %r10,-0x38(%rbp)
  105109:	44 8b da             	mov    %edx,%r11d
  10510c:	bb 20 00 00 00       	mov    $0x20,%ebx
  105111:	41 83 fb 20          	cmp    $0x20,%r11d
  105115:	89 55 84             	mov    %edx,-0x7c(%rbp)
  105118:	0f 4c da             	cmovl  %edx,%ebx
  10511b:	89 5d c4             	mov    %ebx,-0x3c(%rbp)
  10511e:	45 33 db             	xor    %r11d,%r11d
  105121:	85 db                	test   %ebx,%ebx
  105123:	0f 8e 86 02 00 00    	jle    1053af <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x36f>
  105129:	4d 63 fb             	movslq %r11d,%r15
  10512c:	4e 8b 34 fe          	mov    (%rsi,%r15,8),%r14
  105130:	4c 33 77 48          	xor    0x48(%rdi),%r14
  105134:	49 bd 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r13
  10513b:	c1 7c 51 
  10513e:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
  105142:	49 8b d6             	mov    %r14,%rdx
  105145:	c4 c2 e3 f6 d5       	mulx   %r13,%rbx,%rdx
  10514a:	49 89 1c 24          	mov    %rbx,(%r12)
  10514e:	48 8b 5d b0          	mov    -0x50(%rbp),%rbx
  105152:	48 33 d3             	xor    %rbx,%rdx
  105155:	49 0f af d5          	imul   %r13,%rdx
  105159:	4b 89 14 f9          	mov    %rdx,(%r9,%r15,8)
  10515d:	4b 8b 1c f9          	mov    (%r9,%r15,8),%rbx
  105161:	48 8b 57 70          	mov    0x70(%rdi),%rdx
  105165:	4c 8d 75 a8          	lea    -0x58(%rbp),%r14
  105169:	c4 e2 93 f6 d3       	mulx   %rbx,%r13,%rdx
  10516e:	4d 89 2e             	mov    %r13,(%r14)
  105171:	4b 89 14 fa          	mov    %rdx,(%r10,%r15,8)
  105175:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  105179:	4b 03 14 fa          	add    (%r10,%r15,8),%rdx
  10517d:	0f 18 0a             	prefetcht0 (%rdx)
  105180:	41 ff c3             	inc    %r11d
  105183:	8b 5d c4             	mov    -0x3c(%rbp),%ebx
  105186:	44 3b db             	cmp    %ebx,%r11d
  105189:	0f 8c 1b 02 00 00    	jl     1053aa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x36a>
  10518f:	83 fb 20             	cmp    $0x20,%ebx
  105192:	7d 24                	jge    1051b8 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x178>
  105194:	0f 1f 40 00          	nopl   0x0(%rax)
  105198:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  10519f:	00 
  1051a0:	48 63 d3             	movslq %ebx,%rdx
  1051a3:	45 33 db             	xor    %r11d,%r11d
  1051a6:	4d 89 1c d1          	mov    %r11,(%r9,%rdx,8)
  1051aa:	48 63 d3             	movslq %ebx,%rdx
  1051ad:	4d 89 1c d2          	mov    %r11,(%r10,%rdx,8)
  1051b1:	ff c3                	inc    %ebx
  1051b3:	83 fb 20             	cmp    $0x20,%ebx
  1051b6:	7c e8                	jl     1051a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x160>
  1051b8:	45 33 db             	xor    %r11d,%r11d
  1051bb:	8b 55 84             	mov    -0x7c(%rbp),%edx
  1051be:	8d 5a e0             	lea    -0x20(%rdx),%ebx
  1051c1:	45 33 ff             	xor    %r15d,%r15d
  1051c4:	85 db                	test   %ebx,%ebx
  1051c6:	44 0f 4f fb          	cmovg  %ebx,%r15d
  1051ca:	44 89 7d c0          	mov    %r15d,-0x40(%rbp)
  1051ce:	45 85 ff             	test   %r15d,%r15d
  1051d1:	0f 8e 06 01 00 00    	jle    1052dd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x29d>
  1051d7:	48 8d 9f 80 00 00 00 	lea    0x80(%rdi),%rbx
  1051de:	45 8b f3             	mov    %r11d,%r14d
  1051e1:	41 c1 fe 1f          	sar    $0x1f,%r14d
  1051e5:	41 83 e6 1f          	and    $0x1f,%r14d
  1051e9:	45 03 f3             	add    %r11d,%r14d
  1051ec:	41 83 e6 e0          	and    $0xffffffe0,%r14d
  1051f0:	45 8b eb             	mov    %r11d,%r13d
  1051f3:	45 2b ee             	sub    %r14d,%r13d
  1051f6:	4d 63 f5             	movslq %r13d,%r14
  1051f9:	4f 8b 2c f1          	mov    (%r9,%r14,8),%r13
  1051fd:	4c 89 ad 78 ff ff ff 	mov    %r13,-0x88(%rbp)
  105204:	4f 8b 24 f2          	mov    (%r10,%r14,8),%r12
  105208:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
  10520c:	41 8d 53 20          	lea    0x20(%r11),%edx
  105210:	48 63 d2             	movslq %edx,%rdx
  105213:	48 8b 14 d6          	mov    (%rsi,%rdx,8),%rdx
  105217:	48 33 57 48          	xor    0x48(%rdi),%rdx
  10521b:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  105222:	c1 7c 51 
  105225:	4c 8d 6d a0          	lea    -0x60(%rbp),%r13
  105229:	c4 c2 9b f6 d7       	mulx   %r15,%r12,%rdx
  10522e:	4d 89 65 00          	mov    %r12,0x0(%r13)
  105232:	4c 8b 7d a0          	mov    -0x60(%rbp),%r15
  105236:	49 33 d7             	xor    %r15,%rdx
  105239:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  105240:	c1 7c 51 
  105243:	49 0f af d7          	imul   %r15,%rdx
  105247:	4b 89 14 f1          	mov    %rdx,(%r9,%r14,8)
  10524b:	4f 8b 3c f1          	mov    (%r9,%r14,8),%r15
  10524f:	48 8b 57 70          	mov    0x70(%rdi),%rdx
  105253:	4c 8d 6d 98          	lea    -0x68(%rbp),%r13
  105257:	c4 c2 9b f6 d7       	mulx   %r15,%r12,%rdx
  10525c:	4d 89 65 00          	mov    %r12,0x0(%r13)
  105260:	4b 89 14 f2          	mov    %rdx,(%r10,%r14,8)
  105264:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  105268:	4c 8b fa             	mov    %rdx,%r15
  10526b:	4f 03 3c f2          	add    (%r10,%r14,8),%r15
  10526f:	41 0f 18 0f          	prefetcht0 (%r15)
  105273:	4c 8b 65 b8          	mov    -0x48(%rbp),%r12
  105277:	42 0f b6 14 22       	movzbl (%rdx,%r12,1),%edx
  10527c:	48 33 57 48          	xor    0x48(%rdi),%rdx
  105280:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  105287:	c1 7c 51 
  10528a:	49 0f af d7          	imul   %r15,%rdx
  10528e:	4c 8b fb             	mov    %rbx,%r15
  105291:	4c 8b ad 78 ff ff ff 	mov    -0x88(%rbp),%r13
  105298:	49 33 d5             	xor    %r13,%rdx
  10529b:	49 0f af 57 08       	imul   0x8(%r15),%rdx
  1052a0:	4d 8b 3f             	mov    (%r15),%r15
  1052a3:	4c 8d 75 90          	lea    -0x70(%rbp),%r14
  1052a7:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  1052ac:	4d 89 2e             	mov    %r13,(%r14)
  1052af:	85 c0                	test   %eax,%eax
  1052b1:	74 13                	je     1052c6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x286>
  1052b3:	49 3b d0             	cmp    %r8,%rdx
  1052b6:	72 0e                	jb     1052c6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x286>
  1052b8:	4c 8b 7f 58          	mov    0x58(%rdi),%r15
  1052bc:	41 2b d0             	sub    %r8d,%edx
  1052bf:	48 63 d2             	movslq %edx,%rdx
  1052c2:	41 8b 14 97          	mov    (%r15,%rdx,4),%edx
  1052c6:	4d 63 fb             	movslq %r11d,%r15
  1052c9:	4a 89 14 f9          	mov    %rdx,(%rcx,%r15,8)
  1052cd:	41 ff c3             	inc    %r11d
  1052d0:	44 8b 7d c0          	mov    -0x40(%rbp),%r15d
  1052d4:	45 3b df             	cmp    %r15d,%r11d
  1052d7:	0f 8c 01 ff ff ff    	jl     1051de <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x19e>
  1052dd:	44 3b 5d 84          	cmp    -0x7c(%rbp),%r11d
  1052e1:	0f 8d 91 00 00 00    	jge    105378 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x338>
  1052e7:	48 8d 9f 80 00 00 00 	lea    0x80(%rdi),%rbx
  1052ee:	41 8b f3             	mov    %r11d,%esi
  1052f1:	c1 fe 1f             	sar    $0x1f,%esi
  1052f4:	83 e6 1f             	and    $0x1f,%esi
  1052f7:	41 03 f3             	add    %r11d,%esi
  1052fa:	83 e6 e0             	and    $0xffffffe0,%esi
  1052fd:	45 8b fb             	mov    %r11d,%r15d
  105300:	44 2b fe             	sub    %esi,%r15d
  105303:	49 63 f7             	movslq %r15d,%rsi
  105306:	49 8b 34 f1          	mov    (%r9,%rsi,8),%rsi
  10530a:	4c 8b 77 08          	mov    0x8(%rdi),%r14
  10530e:	4d 63 ff             	movslq %r15d,%r15
  105311:	4f 8b 3c fa          	mov    (%r10,%r15,8),%r15
  105315:	47 0f b6 3c 3e       	movzbl (%r14,%r15,1),%r15d
  10531a:	4c 33 7f 48          	xor    0x48(%rdi),%r15
  10531e:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  105325:	c1 7c 51 
  105328:	4d 0f af fe          	imul   %r14,%r15
  10532c:	4c 8b f3             	mov    %rbx,%r14
  10532f:	49 33 f7             	xor    %r15,%rsi
  105332:	49 0f af 76 08       	imul   0x8(%r14),%rsi
  105337:	4d 8b 3e             	mov    (%r14),%r15
  10533a:	4c 8d 75 88          	lea    -0x78(%rbp),%r14
  10533e:	48 8b d6             	mov    %rsi,%rdx
  105341:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  105346:	4d 89 2e             	mov    %r13,(%r14)
  105349:	85 c0                	test   %eax,%eax
  10534b:	74 12                	je     10535f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x31f>
  10534d:	49 3b d0             	cmp    %r8,%rdx
  105350:	72 0d                	jb     10535f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x31f>
  105352:	48 8b 77 58          	mov    0x58(%rdi),%rsi
  105356:	41 2b d0             	sub    %r8d,%edx
  105359:	48 63 d2             	movslq %edx,%rdx
  10535c:	8b 14 96             	mov    (%rsi,%rdx,4),%edx
  10535f:	49 63 f3             	movslq %r11d,%rsi
  105362:	48 89 14 f1          	mov    %rdx,(%rcx,%rsi,8)
  105366:	41 ff c3             	inc    %r11d
  105369:	8b 55 84             	mov    -0x7c(%rbp),%edx
  10536c:	44 3b da             	cmp    %edx,%r11d
  10536f:	89 55 84             	mov    %edx,-0x7c(%rbp)
  105372:	0f 8c 76 ff ff ff    	jl     1052ee <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x2ae>
  105378:	33 ff                	xor    %edi,%edi
  10537a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  10537e:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  105382:	48 8d 3d f7 e2 0b 00 	lea    0xbe2f7(%rip),%rdi        # 1c3680 <__security_cookie>
  105389:	48 8b 3f             	mov    (%rdi),%rdi
  10538c:	48 39 bd 70 ff ff ff 	cmp    %rdi,-0x90(%rbp)
  105393:	74 05                	je     10539a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x35a>
  105395:	e8 f6 4b f0 ff       	call   9f90 <RhpFallbackFailFast>
  10539a:	90                   	nop
  10539b:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  10539f:	5b                   	pop    %rbx
  1053a0:	41 5c                	pop    %r12
  1053a2:	41 5d                	pop    %r13
  1053a4:	41 5e                	pop    %r14
  1053a6:	41 5f                	pop    %r15
  1053a8:	5d                   	pop    %rbp
  1053a9:	c3                   	ret
  1053aa:	e9 7a fd ff ff       	jmp    105129 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0xe9>
  1053af:	8b 5d c4             	mov    -0x3c(%rbp),%ebx
  1053b2:	e9 d8 fd ff ff       	jmp    10518f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x14f>
  1053b7:	48 8d 3d 4a 7e 15 00 	lea    0x157e4a(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  1053be:	e8 e1 01 f6 ff       	call   655a4 <RhpNewFast>
  1053c3:	48 8b d8             	mov    %rax,%rbx
  1053c6:	48 8b fb             	mov    %rbx,%rdi
  1053c9:	48 8d 35 90 4d 14 00 	lea    0x144d90(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  1053d0:	e8 7b 5b f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  1053d5:	48 8b fb             	mov    %rbx,%rdi
  1053d8:	e8 31 04 f6 ff       	call   6580e <RhpThrowEx>
  1053dd:	cc                   	int3
  1053de:	90                   	nop
  1053df:	90                   	nop

00000000001053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>:
  1053e0:	55                   	push   %rbp
  1053e1:	41 57                	push   %r15
  1053e3:	41 56                	push   %r14
  1053e5:	41 55                	push   %r13
  1053e7:	41 54                	push   %r12
  1053e9:	53                   	push   %rbx
  1053ea:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
  1053f1:	c5 f8 77             	vzeroupper
  1053f4:	48 8d ac 24 d0 00 00 	lea    0xd0(%rsp),%rbp
  1053fb:	00 
  1053fc:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  105401:	c5 79 7f 85 60 ff ff 	vmovdqa %xmm8,-0xa0(%rbp)
  105408:	ff 
  105409:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  105410:	ff ff ff 
  105413:	c5 79 7f 44 05 d0    	vmovdqa %xmm8,-0x30(%rbp,%rax,1)
  105419:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
  10541f:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
  105425:	48 83 c0 30          	add    $0x30,%rax
  105429:	75 e8                	jne    105413 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x33>
  10542b:	48 8b 05 4e e2 0b 00 	mov    0xbe24e(%rip),%rax        # 1c3680 <__security_cookie>
  105432:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  105439:	41 3b d0             	cmp    %r8d,%edx
  10543c:	0f 85 16 04 00 00    	jne    105858 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x478>
  105442:	45 84 c9             	test   %r9b,%r9b
  105445:	74 06                	je     10544d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x6d>
  105447:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  10544b:	eb 02                	jmp    10544f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x6f>
  10544d:	33 c0                	xor    %eax,%eax
  10544f:	0f b6 c0             	movzbl %al,%eax
  105452:	4c 8b 47 38          	mov    0x38(%rdi),%r8
  105456:	4c 89 45 d0          	mov    %r8,-0x30(%rbp)
  10545a:	85 24 24             	test   %esp,(%rsp)
  10545d:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  105464:	4c 8d 0c 24          	lea    (%rsp),%r9
  105468:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  10546c:	62 d1 7e 48 7f 01    	vmovdqu32 %zmm0,(%r9)
  105472:	62 d1 7e 48 7f 41 01 	vmovdqu32 %zmm0,0x40(%r9)
  105479:	62 d1 7e 48 7f 41 02 	vmovdqu32 %zmm0,0x80(%r9)
  105480:	62 d1 7e 48 7f 41 03 	vmovdqu32 %zmm0,0xc0(%r9)
  105487:	85 24 24             	test   %esp,(%rsp)
  10548a:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  105491:	4c 8d 14 24          	lea    (%rsp),%r10
  105495:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  105499:	62 d1 7e 48 7f 02    	vmovdqu32 %zmm0,(%r10)
  10549f:	62 d1 7e 48 7f 42 01 	vmovdqu32 %zmm0,0x40(%r10)
  1054a6:	62 d1 7e 48 7f 42 02 	vmovdqu32 %zmm0,0x80(%r10)
  1054ad:	62 d1 7e 48 7f 42 03 	vmovdqu32 %zmm0,0xc0(%r10)
  1054b4:	85 24 24             	test   %esp,(%rsp)
  1054b7:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1054be:	4c 8d 1c 24          	lea    (%rsp),%r11
  1054c2:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  1054c6:	62 d1 7e 48 7f 03    	vmovdqu32 %zmm0,(%r11)
  1054cc:	62 d1 7e 48 7f 43 01 	vmovdqu32 %zmm0,0x40(%r11)
  1054d3:	62 d1 7e 48 7f 43 02 	vmovdqu32 %zmm0,0x80(%r11)
  1054da:	62 d1 7e 48 7f 43 03 	vmovdqu32 %zmm0,0xc0(%r11)
  1054e1:	48 89 8d 40 ff ff ff 	mov    %rcx,-0xc0(%rbp)
  1054e8:	4c 89 4d c8          	mov    %r9,-0x38(%rbp)
  1054ec:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
  1054f0:	4c 89 5d b8          	mov    %r11,-0x48(%rbp)
  1054f4:	8b da                	mov    %edx,%ebx
  1054f6:	41 bf 20 00 00 00    	mov    $0x20,%r15d
  1054fc:	83 fb 20             	cmp    $0x20,%ebx
  1054ff:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%rbp)
  105505:	44 0f 4c fa          	cmovl  %edx,%r15d
  105509:	44 89 7d b4          	mov    %r15d,-0x4c(%rbp)
  10550d:	33 db                	xor    %ebx,%ebx
  10550f:	45 85 ff             	test   %r15d,%r15d
  105512:	0f 8e 37 03 00 00    	jle    10584f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x46f>
  105518:	4c 63 f3             	movslq %ebx,%r14
  10551b:	4e 8b 2c f6          	mov    (%rsi,%r14,8),%r13
  10551f:	4c 33 6f 48          	xor    0x48(%rdi),%r13
  105523:	49 bc 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r12
  10552a:	c1 7c 51 
  10552d:	4c 8d 7d 98          	lea    -0x68(%rbp),%r15
  105531:	49 8b d5             	mov    %r13,%rdx
  105534:	c4 c2 f3 f6 d4       	mulx   %r12,%rcx,%rdx
  105539:	49 89 0f             	mov    %rcx,(%r15)
  10553c:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  105540:	48 33 d1             	xor    %rcx,%rdx
  105543:	49 0f af d4          	imul   %r12,%rdx
  105547:	4b 89 14 f1          	mov    %rdx,(%r9,%r14,8)
  10554b:	4b 8b 0c f1          	mov    (%r9,%r14,8),%rcx
  10554f:	48 8b 57 68          	mov    0x68(%rdi),%rdx
  105553:	4c 8d 7d 90          	lea    -0x70(%rbp),%r15
  105557:	c4 e2 93 f6 c9       	mulx   %rcx,%r13,%rcx
  10555c:	4d 89 2f             	mov    %r13,(%r15)
  10555f:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  105563:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
  10556a:	4b 89 0c f3          	mov    %rcx,(%r11,%r14,8)
  10556e:	4c 8b 7f 70          	mov    0x70(%rdi),%r15
  105572:	4c 8d 6d 88          	lea    -0x78(%rbp),%r13
  105576:	4c 8b a5 48 ff ff ff 	mov    -0xb8(%rbp),%r12
  10557d:	49 8b d7             	mov    %r15,%rdx
  105580:	c4 c2 bb f6 d4       	mulx   %r12,%r8,%rdx
  105585:	4d 89 45 00          	mov    %r8,0x0(%r13)
  105589:	48 0f af 4f 28       	imul   0x28(%rdi),%rcx
  10558e:	48 03 d1             	add    %rcx,%rdx
  105591:	4b 89 14 f2          	mov    %rdx,(%r10,%r14,8)
  105595:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  105599:	4b 03 14 f2          	add    (%r10,%r14,8),%rdx
  10559d:	0f 18 0a             	prefetcht0 (%rdx)
  1055a0:	ff c3                	inc    %ebx
  1055a2:	44 8b 7d b4          	mov    -0x4c(%rbp),%r15d
  1055a6:	41 3b df             	cmp    %r15d,%ebx
  1055a9:	0f 8c 9b 02 00 00    	jl     10584a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x46a>
  1055af:	41 83 ff 20          	cmp    $0x20,%r15d
  1055b3:	7d 25                	jge    1055da <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x1fa>
  1055b5:	66 66 66 0f 1f 84 00 	data16 data16 nopw 0x0(%rax,%rax,1)
  1055bc:	00 00 00 00 
  1055c0:	49 63 d7             	movslq %r15d,%rdx
  1055c3:	33 c9                	xor    %ecx,%ecx
  1055c5:	49 89 0c d1          	mov    %rcx,(%r9,%rdx,8)
  1055c9:	49 89 0c d2          	mov    %rcx,(%r10,%rdx,8)
  1055cd:	49 89 0c d3          	mov    %rcx,(%r11,%rdx,8)
  1055d1:	41 ff c7             	inc    %r15d
  1055d4:	41 83 ff 20          	cmp    $0x20,%r15d
  1055d8:	7c e6                	jl     1055c0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x1e0>
  1055da:	33 c9                	xor    %ecx,%ecx
  1055dc:	8b 95 5c ff ff ff    	mov    -0xa4(%rbp),%edx
  1055e2:	44 8d 42 e0          	lea    -0x20(%rdx),%r8d
  1055e6:	33 db                	xor    %ebx,%ebx
  1055e8:	45 85 c0             	test   %r8d,%r8d
  1055eb:	41 0f 4f d8          	cmovg  %r8d,%ebx
  1055ef:	89 5d b0             	mov    %ebx,-0x50(%rbp)
  1055f2:	85 db                	test   %ebx,%ebx
  1055f4:	0f 8e 44 02 00 00    	jle    10583e <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x45e>
  1055fa:	44 8b c1             	mov    %ecx,%r8d
  1055fd:	41 c1 f8 1f          	sar    $0x1f,%r8d
  105601:	41 83 e0 1f          	and    $0x1f,%r8d
  105605:	44 03 c1             	add    %ecx,%r8d
  105608:	41 83 e0 e0          	and    $0xffffffe0,%r8d
  10560c:	44 8b f9             	mov    %ecx,%r15d
  10560f:	45 2b f8             	sub    %r8d,%r15d
  105612:	4d 63 c7             	movslq %r15d,%r8
  105615:	4f 8b 3c c1          	mov    (%r9,%r8,8),%r15
  105619:	4c 89 bd 50 ff ff ff 	mov    %r15,-0xb0(%rbp)
  105620:	4f 8b 34 c2          	mov    (%r10,%r8,8),%r14
  105624:	4f 8b 2c c3          	mov    (%r11,%r8,8),%r13
  105628:	4c 89 6d a8          	mov    %r13,-0x58(%rbp)
  10562c:	44 8d 61 20          	lea    0x20(%rcx),%r12d
  105630:	4d 63 e4             	movslq %r12d,%r12
  105633:	4e 8b 24 e6          	mov    (%rsi,%r12,8),%r12
  105637:	4c 33 67 48          	xor    0x48(%rdi),%r12
  10563b:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  105642:	c1 7c 51 
  105645:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
  10564c:	48 8d 5d 80          	lea    -0x80(%rbp),%rbx
  105650:	4c 8b ad 30 ff ff ff 	mov    -0xd0(%rbp),%r13
  105657:	49 8b d4             	mov    %r12,%rdx
  10565a:	c4 c2 83 f6 d5       	mulx   %r13,%r15,%rdx
  10565f:	4c 89 3b             	mov    %r15,(%rbx)
  105662:	48 8b 5d 80          	mov    -0x80(%rbp),%rbx
  105666:	48 33 d3             	xor    %rbx,%rdx
  105669:	49 0f af d5          	imul   %r13,%rdx
  10566d:	4b 89 14 c1          	mov    %rdx,(%r9,%r8,8)
  105671:	4b 8b 1c c1          	mov    (%r9,%r8,8),%rbx
  105675:	48 8b 57 68          	mov    0x68(%rdi),%rdx
  105679:	4c 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%r15
  105680:	c4 e2 93 f6 d3       	mulx   %rbx,%r13,%rdx
  105685:	4d 89 2f             	mov    %r13,(%r15)
  105688:	48 8b 9d 78 ff ff ff 	mov    -0x88(%rbp),%rbx
  10568f:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  105693:	4b 89 14 c3          	mov    %rdx,(%r11,%r8,8)
  105697:	4c 8b 7f 70          	mov    0x70(%rdi),%r15
  10569b:	4c 8d ad 70 ff ff ff 	lea    -0x90(%rbp),%r13
  1056a2:	49 8b d7             	mov    %r15,%rdx
  1056a5:	c4 e2 9b f6 d3       	mulx   %rbx,%r12,%rdx
  1056aa:	4d 89 65 00          	mov    %r12,0x0(%r13)
  1056ae:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  1056b2:	48 0f af 5f 28       	imul   0x28(%rdi),%rbx
  1056b7:	48 03 d3             	add    %rbx,%rdx
  1056ba:	4b 89 14 c2          	mov    %rdx,(%r10,%r8,8)
  1056be:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1056c2:	48 8b da             	mov    %rdx,%rbx
  1056c5:	4b 03 1c c2          	add    (%r10,%r8,8),%rbx
  1056c9:	0f 18 0b             	prefetcht0 (%rbx)
  1056cc:	42 0f b6 14 32       	movzbl (%rdx,%r14,1),%edx
  1056d1:	48 33 57 48          	xor    0x48(%rdi),%rdx
  1056d5:	49 b8 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r8
  1056dc:	c1 7c 51 
  1056df:	49 0f af d0          	imul   %r8,%rdx
  1056e3:	4c 8d 87 80 00 00 00 	lea    0x80(%rdi),%r8
  1056ea:	4c 8b bd 50 ff ff ff 	mov    -0xb0(%rbp),%r15
  1056f1:	49 33 d7             	xor    %r15,%rdx
  1056f4:	49 0f af 50 08       	imul   0x8(%r8),%rdx
  1056f9:	4d 8b 00             	mov    (%r8),%r8
  1056fc:	48 8d 9d 68 ff ff ff 	lea    -0x98(%rbp),%rbx
  105703:	c4 c2 83 f6 d0       	mulx   %r8,%r15,%rdx
  105708:	4c 89 3b             	mov    %r15,(%rbx)
  10570b:	4c 8b 6d a8          	mov    -0x58(%rbp),%r13
  10570f:	4c 0f af 6f 18       	imul   0x18(%rdi),%r13
  105714:	49 03 d5             	add    %r13,%rdx
  105717:	85 c0                	test   %eax,%eax
  105719:	74 1a                	je     105735 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x355>
  10571b:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
  10571f:	49 3b d0             	cmp    %r8,%rdx
  105722:	0f 82 11 01 00 00    	jb     105839 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x459>
  105728:	48 8b 5f 58          	mov    0x58(%rdi),%rbx
  10572c:	41 2b d0             	sub    %r8d,%edx
  10572f:	48 63 d2             	movslq %edx,%rdx
  105732:	8b 14 93             	mov    (%rbx,%rdx,4),%edx
  105735:	48 63 d9             	movslq %ecx,%rbx
  105738:	4c 8b bd 40 ff ff ff 	mov    -0xc0(%rbp),%r15
  10573f:	49 89 14 df          	mov    %rdx,(%r15,%rbx,8)
  105743:	ff c1                	inc    %ecx
  105745:	8b 5d b0             	mov    -0x50(%rbp),%ebx
  105748:	3b cb                	cmp    %ebx,%ecx
  10574a:	0f 8c e4 00 00 00    	jl     105834 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x454>
  105750:	3b 8d 5c ff ff ff    	cmp    -0xa4(%rbp),%ecx
  105756:	0f 8d a0 00 00 00    	jge    1057fc <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x41c>
  10575c:	8b f1                	mov    %ecx,%esi
  10575e:	c1 fe 1f             	sar    $0x1f,%esi
  105761:	83 e6 1f             	and    $0x1f,%esi
  105764:	03 f1                	add    %ecx,%esi
  105766:	83 e6 e0             	and    $0xffffffe0,%esi
  105769:	8b d9                	mov    %ecx,%ebx
  10576b:	2b de                	sub    %esi,%ebx
  10576d:	48 63 f3             	movslq %ebx,%rsi
  105770:	49 8b 1c f1          	mov    (%r9,%rsi,8),%rbx
  105774:	4d 8b 34 f2          	mov    (%r10,%rsi,8),%r14
  105778:	49 8b 34 f3          	mov    (%r11,%rsi,8),%rsi
  10577c:	4c 8b 6f 08          	mov    0x8(%rdi),%r13
  105780:	47 0f b6 34 2e       	movzbl (%r14,%r13,1),%r14d
  105785:	4c 33 77 48          	xor    0x48(%rdi),%r14
  105789:	49 bd 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r13
  105790:	c1 7c 51 
  105793:	4d 0f af f5          	imul   %r13,%r14
  105797:	4c 8d af 80 00 00 00 	lea    0x80(%rdi),%r13
  10579e:	49 33 de             	xor    %r14,%rbx
  1057a1:	49 0f af 5d 08       	imul   0x8(%r13),%rbx
  1057a6:	4d 8b 75 00          	mov    0x0(%r13),%r14
  1057aa:	4c 8d ad 60 ff ff ff 	lea    -0xa0(%rbp),%r13
  1057b1:	48 8b d3             	mov    %rbx,%rdx
  1057b4:	c4 c2 9b f6 d6       	mulx   %r14,%r12,%rdx
  1057b9:	4d 89 65 00          	mov    %r12,0x0(%r13)
  1057bd:	48 0f af 77 18       	imul   0x18(%rdi),%rsi
  1057c2:	48 03 d6             	add    %rsi,%rdx
  1057c5:	85 c0                	test   %eax,%eax
  1057c7:	74 16                	je     1057df <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x3ff>
  1057c9:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
  1057cd:	49 3b d0             	cmp    %r8,%rdx
  1057d0:	72 60                	jb     105832 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x452>
  1057d2:	48 8b 77 58          	mov    0x58(%rdi),%rsi
  1057d6:	41 2b d0             	sub    %r8d,%edx
  1057d9:	48 63 d2             	movslq %edx,%rdx
  1057dc:	8b 14 96             	mov    (%rsi,%rdx,4),%edx
  1057df:	48 63 f1             	movslq %ecx,%rsi
  1057e2:	49 89 14 f7          	mov    %rdx,(%r15,%rsi,8)
  1057e6:	ff c1                	inc    %ecx
  1057e8:	8b 95 5c ff ff ff    	mov    -0xa4(%rbp),%edx
  1057ee:	3b ca                	cmp    %edx,%ecx
  1057f0:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%rbp)
  1057f6:	0f 8c 60 ff ff ff    	jl     10575c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x37c>
  1057fc:	33 ff                	xor    %edi,%edi
  1057fe:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  105802:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
  105806:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  10580a:	48 8d 3d 6f de 0b 00 	lea    0xbde6f(%rip),%rdi        # 1c3680 <__security_cookie>
  105811:	48 8b 3f             	mov    (%rdi),%rdi
  105814:	48 39 bd 38 ff ff ff 	cmp    %rdi,-0xc8(%rbp)
  10581b:	74 05                	je     105822 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x442>
  10581d:	e8 6e 47 f0 ff       	call   9f90 <RhpFallbackFailFast>
  105822:	90                   	nop
  105823:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  105827:	5b                   	pop    %rbx
  105828:	41 5c                	pop    %r12
  10582a:	41 5d                	pop    %r13
  10582c:	41 5e                	pop    %r14
  10582e:	41 5f                	pop    %r15
  105830:	5d                   	pop    %rbp
  105831:	c3                   	ret
  105832:	eb ab                	jmp    1057df <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x3ff>
  105834:	e9 c1 fd ff ff       	jmp    1055fa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x21a>
  105839:	e9 f7 fe ff ff       	jmp    105735 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x355>
  10583e:	4c 8b bd 40 ff ff ff 	mov    -0xc0(%rbp),%r15
  105845:	e9 06 ff ff ff       	jmp    105750 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x370>
  10584a:	e9 c9 fc ff ff       	jmp    105518 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x138>
  10584f:	44 8b 7d b4          	mov    -0x4c(%rbp),%r15d
  105853:	e9 57 fd ff ff       	jmp    1055af <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x1cf>
  105858:	48 8d 3d a9 79 15 00 	lea    0x1579a9(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  10585f:	e8 40 fd f5 ff       	call   655a4 <RhpNewFast>
  105864:	48 8b d8             	mov    %rax,%rbx
  105867:	48 8b fb             	mov    %rbx,%rdi
  10586a:	48 8d 35 ef 48 14 00 	lea    0x1448ef(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  105871:	e8 da 56 f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  105876:	48 8b fb             	mov    %rbx,%rdi
  105879:	e8 90 ff f5 ff       	call   6580e <RhpThrowEx>
  10587e:	cc                   	int3
  10587f:	90                   	nop

  109aae:	e8 8d b5 ff ff       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
  109ab3:	eb 14                	jmp    109ac9 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0xa9>
  109ab5:	48 8b c8             	mov    %rax,%rcx
  109ab8:	49 8b f6             	mov    %r14,%rsi
  109abb:	41 8b d7             	mov    %r15d,%edx
  109abe:	41 b9 01 00 00 00    	mov    $0x1,%r9d
  109ac4:	e8 17 b9 ff ff       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
  109ac9:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  109acd:	33 f6                	xor    %esi,%esi
  109acf:	45 85 ff             	test   %r15d,%r15d
  109ad2:	7e 5f                	jle    109b33 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x113>
  109ad4:	8b c6                	mov    %esi,%eax
  109ad6:	8b 0c c7             	mov    (%rdi,%rax,8),%ecx
  109ad9:	48 8b 53 10          	mov    0x10(%rbx),%rdx
  109add:	39 4a 08             	cmp    %ecx,0x8(%rdx)
  109ae0:	76 39                	jbe    109b1b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0xfb>
  109ae2:	3b 4a 08             	cmp    0x8(%rdx),%ecx
  109ae5:	0f 83 fe 01 00 00    	jae    109ce9 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x2c9>
  109aeb:	8b c9                	mov    %ecx,%ecx
  109aed:	48 c1 e1 04          	shl    $0x4,%rcx
  109af1:	48 8d 4c 0a 10       	lea    0x10(%rdx,%rcx,1),%rcx
  109af6:	48 8b 53 18          	mov    0x18(%rbx),%rdx
  109afa:	4d 8b 04 c6          	mov    (%r14,%rax,8),%r8
  109afe:	4c 8b 09             	mov    (%rcx),%r9
  109b01:	38 12                	cmp    %dl,(%rdx)
  109b03:	4d 3b c1             	cmp    %r9,%r8
  109b06:	75 13                	jne    109b1b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0xfb>
  109b08:	41 3b f5             	cmp    %r13d,%esi
  109b0b:	0f 83 d8 01 00 00    	jae    109ce9 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x2c9>
  109b11:	48 8b 49 08          	mov    0x8(%rcx),%rcx
  109b15:	49 89 0c c4          	mov    %rcx,(%r12,%rax,8)
  109b19:	eb 11                	jmp    109b2c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x10c>
  109b1b:	41 3b f5             	cmp    %r13d,%esi
  109b1e:	0f 83 c5 01 00 00    	jae    109ce9 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x2c9>
  109b24:	48 8b 4b 20          	mov    0x20(%rbx),%rcx
  109b28:	49 89 0c c4          	mov    %rcx,(%r12,%rax,8)
  109b2c:	ff c6                	inc    %esi
  109b2e:	41 3b f7             	cmp    %r15d,%esi
  109b31:	7c a1                	jl     109ad4 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0xb4>
  109b33:	48 8d 3d 46 9b 0b 00 	lea    0xb9b46(%rip),%rdi        # 1c3680 <__security_cookie>
  109b3a:	48 8b 3f             	mov    (%rdi),%rdi
  109b3d:	48 39 7d a8          	cmp    %rdi,-0x58(%rbp)
  109b41:	74 05                	je     109b48 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x128>
  109b43:	e8 48 04 f0 ff       	call   9f90 <RhpFallbackFailFast>
  109b48:	90                   	nop
  109b49:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  109b4d:	5b                   	pop    %rbx
  109b4e:	41 5c                	pop    %r12
  109b50:	41 5d                	pop    %r13
  109b52:	41 5e                	pop    %r14
  109b54:	41 5f                	pop    %r15
  109b56:	5d                   	pop    %rbp
  109b57:	c3                   	ret
  109b58:	48 8d 3d 41 ec 14 00 	lea    0x14ec41(%rip),%rdi        # 2587a0 <__NONGCSTATICSS_P_CoreLib_System_Buffers_ArrayPool_1<UIntPtr>>
  109b5f:	48 83 7f f8 00       	cmpq   $0x0,-0x8(%rdi)
  109b64:	0f 85 75 01 00 00    	jne    109cdf <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x2bf>
  109b6a:	48 8b 05 07 26 12 00 	mov    0x122607(%rip),%rax        # 22c178 <__GCSTATICSS_P_CoreLib_System_Buffers_ArrayPool_1<UIntPtr>>
  109b71:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  109b75:	48 8b 78 08          	mov    0x8(%rax),%rdi
  109b79:	41 8b f7             	mov    %r15d,%esi
  109b7c:	39 3f                	cmp    %edi,(%rdi)
  109b7e:	e8 1d 18 00 00       	call   10b3a0 <S_P_CoreLib_System_Buffers_SharedArrayPool_1<UIntPtr>__Rent>
  109b83:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  109b87:	48 85 c0             	test   %rax,%rax
  109b8a:	75 11                	jne    109b9d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x17d>
  109b8c:	45 85 ff             	test   %r15d,%r15d
  109b8f:	0f 85 d0 00 00 00    	jne    109c65 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x245>
  109b95:	45 33 d2             	xor    %r10d,%r10d
  109b98:	45 33 db             	xor    %r11d,%r11d
  109b9b:	eb 15                	jmp    109bb2 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x192>
  109b9d:	44 39 78 08          	cmp    %r15d,0x8(%rax)
  109ba1:	0f 82 be 00 00 00    	jb     109c65 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x245>
  109ba7:	4c 8d 50 10          	lea    0x10(%rax),%r10
  109bab:	45 8b df             	mov    %r15d,%r11d
  109bae:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  109bb2:	4c 89 55 b8          	mov    %r10,-0x48(%rbp)
  109bb6:	44 89 5d d4          	mov    %r11d,-0x2c(%rbp)
  109bba:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  109bbe:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
  109bc2:	74 19                	je     109bdd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x1bd>
  109bc4:	49 8b ca             	mov    %r10,%rcx
  109bc7:	45 8b c3             	mov    %r11d,%r8d
  109bca:	49 8b f6             	mov    %r14,%rsi
  109bcd:	41 8b d7             	mov    %r15d,%edx
  109bd0:	41 b9 01 00 00 00    	mov    $0x1,%r9d
  109bd6:	e8 65 b4 ff ff       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
  109bdb:	eb 17                	jmp    109bf4 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x1d4>
  109bdd:	49 8b ca             	mov    %r10,%rcx
  109be0:	45 8b c3             	mov    %r11d,%r8d
  109be3:	49 8b f6             	mov    %r14,%rsi
  109be6:	41 8b d7             	mov    %r15d,%edx
  109be9:	41 b9 01 00 00 00    	mov    $0x1,%r9d
  109bef:	e8 ec b7 ff ff       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
  109bf4:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  109bf8:	8b 75 d4             	mov    -0x2c(%rbp),%esi
  109bfb:	49 8b d6             	mov    %r14,%rdx
  109bfe:	41 8b c7             	mov    %r15d,%eax
  109c01:	49 8b cc             	mov    %r12,%rcx
  109c04:	45 8b c5             	mov    %r13d,%r8d
  109c07:	45 33 c9             	xor    %r9d,%r9d
  109c0a:	85 c0                	test   %eax,%eax
  109c0c:	7e 6c                	jle    109c7a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x25a>
  109c0e:	44 3b ce             	cmp    %esi,%r9d
  109c11:	73 4d                	jae    109c60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x240>
  109c13:	45 8b d1             	mov    %r9d,%r10d
  109c16:	46 8b 1c d7          	mov    (%rdi,%r10,8),%r11d
  109c1a:	4c 8b 7b 10          	mov    0x10(%rbx),%r15
  109c1e:	45 39 5f 08          	cmp    %r11d,0x8(%r15)
  109c22:	76 47                	jbe    109c6b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x24b>
  109c24:	45 3b 5f 08          	cmp    0x8(%r15),%r11d
  109c28:	73 36                	jae    109c60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x240>
  109c2a:	45 8b db             	mov    %r11d,%r11d
  109c2d:	49 c1 e3 04          	shl    $0x4,%r11
  109c31:	4f 8d 5c 1f 10       	lea    0x10(%r15,%r11,1),%r11
  109c36:	4c 8b 73 18          	mov    0x18(%rbx),%r14
  109c3a:	4e 8b 2c d2          	mov    (%rdx,%r10,8),%r13
  109c3e:	4d 8b 23             	mov    (%r11),%r12
  109c41:	45 38 36             	cmp    %r14b,(%r14)
  109c44:	4d 3b ec             	cmp    %r12,%r13
  109c47:	75 22                	jne    109c6b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x24b>
  109c49:	45 3b c8             	cmp    %r8d,%r9d
  109c4c:	73 12                	jae    109c60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x240>
  109c4e:	4d 8b 5b 08          	mov    0x8(%r11),%r11
  109c52:	4e 89 1c d1          	mov    %r11,(%rcx,%r10,8)
  109c56:	41 ff c1             	inc    %r9d
  109c59:	44 3b c8             	cmp    %eax,%r9d
  109c5c:	7c b0                	jl     109c0e <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x1ee>
  109c5e:	eb 1a                	jmp    109c7a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x25a>
  109c60:	e8 5b 12 fc ff       	call   caec0 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
  109c65:	e8 b6 8e f8 ff       	call   92b20 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
  109c6a:	cc                   	int3
  109c6b:	45 3b c8             	cmp    %r8d,%r9d
  109c6e:	73 f0                	jae    109c60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x240>
  109c70:	4c 8b 5b 20          	mov    0x20(%rbx),%r11
  109c74:	4e 89 1c d1          	mov    %r11,(%rcx,%r10,8)
  109c78:	eb dc                	jmp    109c56 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x236>
  109c7a:	4c 8b 7d b0          	mov    -0x50(%rbp),%r15
  109c7e:	49 8b 7f 08          	mov    0x8(%r15),%rdi
  109c82:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
  109c86:	33 d2                	xor    %edx,%edx
  109c88:	39 3f                	cmp    %edi,(%rdi)
  109c8a:	e8 91 19 00 00       	call   10b620 <S_P_CoreLib_System_Buffers_SharedArrayPool_1<UIntPtr>__Return>
  109c8f:	48 8d 3d ea 99 0b 00 	lea    0xb99ea(%rip),%rdi        # 1c3680 <__security_cookie>
  109c96:	48 8b 3f             	mov    (%rdi),%rdi
  109c99:	48 39 7d a8          	cmp    %rdi,-0x58(%rbp)
  109c9d:	74 05                	je     109ca4 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x284>
  109c9f:	e8 ec 02 f0 ff       	call   9f90 <RhpFallbackFailFast>
  109ca4:	90                   	nop
  109ca5:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  109ca9:	5b                   	pop    %rbx
  109caa:	41 5c                	pop    %r12
  109cac:	41 5d                	pop    %r13
  109cae:	41 5e                	pop    %r14
  109cb0:	41 5f                	pop    %r15
  109cb2:	5d                   	pop    %rbp
  109cb3:	c3                   	ret
  109cb4:	e8 d7 11 fc ff       	call   cae90 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowOverflowException>
  109cb9:	48 8d 3d 48 35 15 00 	lea    0x153548(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  109cc0:	e8 df b8 f5 ff       	call   655a4 <RhpNewFast>
  109cc5:	48 8b d8             	mov    %rax,%rbx
  109cc8:	48 8b fb             	mov    %rbx,%rdi
  109ccb:	48 8d 35 1e 04 14 00 	lea    0x14041e(%rip),%rsi        # 24a0f0 <__Str_Key_and_value_spans_must_have__E5F69F0C03A0FBD9E1FD3A9E1354D228FFEDD0EE3D99CA68EDD54E9F85DA3BA8>
  109cd2:	e8 79 12 f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  109cd7:	48 8b fb             	mov    %rbx,%rdi
  109cda:	e8 2f bb f5 ff       	call   6580e <RhpThrowEx>
  109cdf:	e8 3e ee ef ff       	call   8b22 <__GetGCStaticBase_S_P_CoreLib_System_Buffers_ArrayPool_1<UIntPtr>>
  109ce4:	e9 81 fe ff ff       	jmp    109b6a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x14a>
  109ce9:	e8 d2 11 fc ff       	call   caec0 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
  109cee:	cc                   	int3
  109cef:	55                   	push   %rbp
  109cf0:	41 57                	push   %r15
  109cf2:	41 56                	push   %r14
  109cf4:	41 55                	push   %r13
  109cf6:	41 54                	push   %r12
  109cf8:	53                   	push   %rbx
  109cf9:	50                   	push   %rax
  109cfa:	48 8d 05 9f ea 14 00 	lea    0x14ea9f(%rip),%rax        # 2587a0 <__NONGCSTATICSS_P_CoreLib_System_Buffers_ArrayPool_1<UIntPtr>>
  109d01:	48 83 78 f8 00       	cmpq   $0x0,-0x8(%rax)
  109d06:	74 05                	je     109d0d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x2ed>
  109d08:	e8 15 ee ef ff       	call   8b22 <__GetGCStaticBase_S_P_CoreLib_System_Buffers_ArrayPool_1<UIntPtr>>
  109d0d:	4c 8b 3d 64 24 12 00 	mov    0x122464(%rip),%r15        # 22c178 <__GCSTATICSS_P_CoreLib_System_Buffers_ArrayPool_1<UIntPtr>>
  109d14:	49 8b 7f 08          	mov    0x8(%r15),%rdi
  109d18:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
  109d1c:	33 d2                	xor    %edx,%edx
  109d1e:	39 3f                	cmp    %edi,(%rdi)
  109d20:	e8 fb 18 00 00       	call   10b620 <S_P_CoreLib_System_Buffers_SharedArrayPool_1<UIntPtr>__Return>
  109d25:	90                   	nop
  109d26:	48 83 c4 08          	add    $0x8,%rsp
  109d2a:	5b                   	pop    %rbx
  109d2b:	41 5c                	pop    %r12
  109d2d:	41 5d                	pop    %r13
  109d2f:	41 5e                	pop    %r14
  109d31:	41 5f                	pop    %r15
  109d33:	5d                   	pop    %rbp
  109d34:	c3                   	ret
  109d35:	90                   	nop
  109d36:	90                   	nop
  109d37:	90                   	nop
  109d38:	90                   	nop
  109d39:	90                   	nop
  109d3a:	90                   	nop
  109d3b:	90                   	nop
  109d3c:	90                   	nop
  109d3d:	90                   	nop
  109d3e:	90                   	nop
  109d3f:	90                   	nop

