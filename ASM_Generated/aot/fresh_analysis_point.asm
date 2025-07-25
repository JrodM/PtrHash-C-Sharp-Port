0000000000098860 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds>:
   98860:	55                   	push   %rbp
   98861:	48 8b ec             	mov    %rsp,%rbp
   98864:	8b c6                	mov    %esi,%eax
   98866:	33 c9                	xor    %ecx,%ecx
   98868:	c6 02 00             	movb   $0x0,(%rdx)
   9886b:	8b 77 08             	mov    0x8(%rdi),%esi
   9886e:	3b f0                	cmp    %eax,%esi
   98870:	7e 74                	jle    988e6 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x86>
   98872:	3b c6                	cmp    %esi,%eax
   98874:	73 77                	jae    988ed <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8d>
   98876:	44 8b c0             	mov    %eax,%r8d
   98879:	46 0f b7 44 47 0c    	movzwl 0xc(%rdi,%r8,2),%r8d
   9887f:	41 83 f8 48          	cmp    $0x48,%r8d
   98883:	77 14                	ja     98899 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x39>
   98885:	41 83 f8 20          	cmp    $0x20,%r8d
   98889:	74 4c                	je     988d7 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x77>
   9888b:	41 83 f8 27          	cmp    $0x27,%r8d
   9888f:	74 2a                	je     988bb <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x5b>
   98891:	41 83 f8 48          	cmp    $0x48,%r8d
   98895:	74 45                	je     988dc <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   98897:	eb 47                	jmp    988e0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98899:	41 83 f8 68          	cmp    $0x68,%r8d
   9889d:	77 0e                	ja     988ad <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x4d>
   9889f:	41 83 f8 5c          	cmp    $0x5c,%r8d
   988a3:	74 20                	je     988c5 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x65>
   988a5:	41 83 f8 68          	cmp    $0x68,%r8d
   988a9:	74 31                	je     988dc <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   988ab:	eb 33                	jmp    988e0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988ad:	41 83 f8 6d          	cmp    $0x6d,%r8d
   988b1:	74 29                	je     988dc <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   988b3:	41 83 f8 74          	cmp    $0x74,%r8d
   988b7:	74 23                	je     988dc <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   988b9:	eb 25                	jmp    988e0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988bb:	85 c9                	test   %ecx,%ecx
   988bd:	0f 94 c1             	sete   %cl
   988c0:	0f b6 c9             	movzbl %cl,%ecx
   988c3:	eb 1b                	jmp    988e0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988c5:	ff c0                	inc    %eax
   988c7:	3b c6                	cmp    %esi,%eax
   988c9:	73 22                	jae    988ed <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8d>
   988cb:	44 8b c0             	mov    %eax,%r8d
   988ce:	66 42 83 7c 47 0c 20 	cmpw   $0x20,0xc(%rdi,%r8,2)
   988d5:	75 09                	jne    988e0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988d7:	c6 02 01             	movb   $0x1,(%rdx)
   988da:	eb 04                	jmp    988e0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988dc:	85 c9                	test   %ecx,%ecx
   988de:	74 0b                	je     988eb <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8b>
   988e0:	ff c0                	inc    %eax
   988e2:	3b f0                	cmp    %eax,%esi
   988e4:	7f 8c                	jg     98872 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x12>
   988e6:	c6 02 00             	movb   $0x0,(%rdx)
   988e9:	5d                   	pop    %rbp
   988ea:	c3                   	ret
   988eb:	5d                   	pop    %rbp
   988ec:	c3                   	ret
   988ed:	e8 6e 22 03 00       	call   cab60 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   988f2:	cc                   	int3
   988f3:	90                   	nop
   988f4:	90                   	nop
   988f5:	90                   	nop
   988f6:	90                   	nop
   988f7:	90                   	nop
   988f8:	90                   	nop
   988f9:	90                   	nop
   988fa:	90                   	nop
   988fb:	90                   	nop
   988fc:	90                   	nop
   988fd:	90                   	nop
   988fe:	90                   	nop
   988ff:	90                   	nop

0000000000098900 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek>:
   98900:	55                   	push   %rbp
   98901:	53                   	push   %rbx
   98902:	50                   	push   %rax
   98903:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   98908:	48 8b df             	mov    %rdi,%rbx
   9890b:	83 bb 98 01 00 00 ff 	cmpl   $0xffffffff,0x198(%rbx)
   98912:	75 2e                	jne    98942 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x42>
   98914:	48 8d 3d 65 3f 1b 00 	lea    0x1b3f65(%rip),%rdi        # 24c880 <__NONGCSTATICSS_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   9891b:	48 83 7f f8 00       	cmpq   $0x0,-0x8(%rdi)
   98920:	75 2d                	jne    9894f <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x4f>
   98922:	33 ff                	xor    %edi,%edi
   98924:	89 7d f0             	mov    %edi,-0x10(%rbp)
   98927:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   9892b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
   9892f:	be 0c 10 00 00       	mov    $0x100c,%esi
   98934:	e8 57 39 03 00       	call   cc290 <S_P_CoreLib_Interop_Globalization__GetLocaleInfoInt>
   98939:	8b 45 f0             	mov    -0x10(%rbp),%eax
   9893c:	89 83 98 01 00 00    	mov    %eax,0x198(%rbx)
   98942:	8b 83 98 01 00 00    	mov    0x198(%rbx),%eax
   98948:	48 83 c4 08          	add    $0x8,%rsp
   9894c:	5b                   	pop    %rbx
   9894d:	5d                   	pop    %rbp
   9894e:	c3                   	ret
   9894f:	e8 66 f7 f6 ff       	call   80ba <__GetNonGCStaticBase_S_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   98954:	eb cc                	jmp    98922 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x22>
   98956:	90                   	nop
   98957:	90                   	nop
   98958:	90                   	nop
--
00000000000ac960 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>:
   ac960:	55                   	push   %rbp
   ac961:	c5 f8 77             	vzeroupper
   ac964:	48 8b ec             	mov    %rsp,%rbp
   ac967:	48 8b c7             	mov    %rdi,%rax
   ac96a:	48 81 fe 80 00 00 00 	cmp    $0x80,%rsi
   ac971:	72 5a                	jb     ac9cd <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x6d>
   ac973:	62 f1 7c 48 10 00    	vmovups (%rax),%zmm0
   ac979:	62 f2 7e 48 29 c8    	vpmovb2m %zmm0,%k1
   ac97f:	c4 e1 fb 93 c9       	kmovq  %k1,%rcx
   ac984:	0f 1f 00             	nopl   (%rax)
   ac987:	48 85 c9             	test   %rcx,%rcx
   ac98a:	0f 85 d7 00 00 00    	jne    aca67 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   ac990:	48 8d 4c 30 c0       	lea    -0x40(%rax,%rsi,1),%rcx
   ac995:	48 8d 78 40          	lea    0x40(%rax),%rdi
   ac999:	48 83 e7 c0          	and    $0xffffffffffffffc0,%rdi
   ac99d:	62 f1 7d 48 6f 07    	vmovdqa32 (%rdi),%zmm0
   ac9a3:	62 f2 7e 48 29 c8    	vpmovb2m %zmm0,%k1
   ac9a9:	c4 e1 fb 93 d1       	kmovq  %k1,%rdx
   ac9ae:	0f 1f 00             	nopl   (%rax)
   ac9b1:	48 85 d2             	test   %rdx,%rdx
   ac9b4:	75 09                	jne    ac9bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   ac9b6:	48 83 c7 40          	add    $0x40,%rdi
   ac9ba:	48 3b f9             	cmp    %rcx,%rdi
   ac9bd:	76 de                	jbe    ac99d <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x3d>
   ac9bf:	48 2b f7             	sub    %rdi,%rsi
   ac9c2:	48 03 f0             	add    %rax,%rsi
   ac9c5:	e9 9d 00 00 00       	jmp    aca67 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   ac9ca:	0f 1f 00             	nopl   (%rax)
   ac9cd:	48 83 fe 40          	cmp    $0x40,%rsi
   ac9d1:	72 34                	jb     aca07 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xa7>
   ac9d3:	c5 fc 10 00          	vmovups (%rax),%ymm0
   ac9d7:	c5 fd d7 c8          	vpmovmskb %ymm0,%ecx
   ac9db:	85 c9                	test   %ecx,%ecx
   ac9dd:	0f 85 84 00 00 00    	jne    aca67 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   ac9e3:	48 8d 4c 30 e0       	lea    -0x20(%rax,%rsi,1),%rcx
   ac9e8:	48 8d 78 20          	lea    0x20(%rax),%rdi
   ac9ec:	48 83 e7 e0          	and    $0xffffffffffffffe0,%rdi
   ac9f0:	c5 fd 6f 07          	vmovdqa (%rdi),%ymm0
   ac9f4:	c5 fd d7 d0          	vpmovmskb %ymm0,%edx
   ac9f8:	85 d2                	test   %edx,%edx
   ac9fa:	75 c3                	jne    ac9bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   ac9fc:	48 83 c7 20          	add    $0x20,%rdi
   aca00:	48 3b f9             	cmp    %rcx,%rdi
   aca03:	76 eb                	jbe    ac9f0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x90>
   aca05:	eb b8                	jmp    ac9bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   aca07:	48 83 fe 20          	cmp    $0x20,%rsi
   aca0b:	72 5a                	jb     aca67 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   aca0d:	c5 f8 10 05 8b 6c 0d 	vmovups 0xd6c8b(%rip),%xmm0        # 1836a0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>
   aca14:	00 
   aca15:	c4 e2 79 17 00       	vptest (%rax),%xmm0
   aca1a:	75 4b                	jne    aca67 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   aca1c:	48 8d 4c 30 f0       	lea    -0x10(%rax,%rsi,1),%rcx
   aca21:	48 8d 78 10          	lea    0x10(%rax),%rdi
   aca25:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   aca29:	c4 e2 79 17 07       	vptest (%rdi),%xmm0
   aca2e:	75 8f                	jne    ac9bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   aca30:	48 83 c7 10          	add    $0x10,%rdi
   aca34:	48 3b f9             	cmp    %rcx,%rdi
   aca37:	76 f0                	jbe    aca29 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xc9>
   aca39:	eb 84                	jmp    ac9bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   aca3b:	8b 0f                	mov    (%rdi),%ecx
   aca3d:	8b 57 04             	mov    0x4(%rdi),%edx
   aca40:	44 8b c1             	mov    %ecx,%r8d
   aca43:	44 0b c2             	or     %edx,%r8d
   aca46:	41 f7 c0 80 80 80 80 	test   $0x80808080,%r8d
   aca4d:	74 10                	je     aca5f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xff>
   aca4f:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   aca55:	75 5e                	jne    acab5 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   aca57:	8b ca                	mov    %edx,%ecx
   aca59:	48 83 c7 04          	add    $0x4,%rdi
   aca5d:	eb 56                	jmp    acab5 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   aca5f:	48 83 c7 08          	add    $0x8,%rdi
   aca63:	48 83 c6 f8          	add    $0xfffffffffffffff8,%rsi
   aca67:	48 83 fe 08          	cmp    $0x8,%rsi
   aca6b:	73 ce                	jae    aca3b <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xdb>
   aca6d:	40 f6 c6 04          	test   $0x4,%sil
   aca71:	74 0e                	je     aca81 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x121>
   aca73:	8b 0f                	mov    (%rdi),%ecx
   aca75:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   aca7b:	75 38                	jne    acab5 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   aca7d:	48 83 c7 04          	add    $0x4,%rdi
   aca81:	40 f6 c6 02          	test   $0x2,%sil
   aca85:	74 0f                	je     aca96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x136>
   aca87:	0f b7 0f             	movzwl (%rdi),%ecx
   aca8a:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   aca90:	75 23                	jne    acab5 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   aca92:	48 83 c7 02          	add    $0x2,%rdi
   aca96:	40 f6 c6 01          	test   $0x1,%sil
   aca9a:	74 0b                	je     acaa7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x147>
   aca9c:	48 8d 4f 01          	lea    0x1(%rdi),%rcx
   acaa0:	80 3f 00             	cmpb   $0x0,(%rdi)
   acaa3:	48 0f 4d f9          	cmovge %rcx,%rdi
   acaa7:	48 8b cf             	mov    %rdi,%rcx
   acaaa:	48 2b c8             	sub    %rax,%rcx
   acaad:	48 8b c1             	mov    %rcx,%rax
   acab0:	c5 f8 77             	vzeroupper
   acab3:	5d                   	pop    %rbp
   acab4:	c3                   	ret
   acab5:	81 e1 80 80 80 80    	and    $0x80808080,%ecx
   acabb:	f3 0f bc c9          	tzcnt  %ecx,%ecx
--
00000000000acae0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>:
   acae0:	55                   	push   %rbp
   acae1:	c5 f8 77             	vzeroupper
   acae4:	48 8b ec             	mov    %rsp,%rbp
   acae7:	48 8b cf             	mov    %rdi,%rcx
   acaea:	48 83 fe 40          	cmp    $0x40,%rsi
   acaee:	72 57                	jb     acb47 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x67>
   acaf0:	62 f1 7c 48 10 05 c6 	vmovups 0xd6bc6(%rip),%zmm0        # 1836c0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   acaf7:	6b 0d 00 
   acafa:	62 f2 fd 48 26 09    	vptestmw (%rcx),%zmm0,%k1
   acb00:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   acb05:	0f 1f 00             	nopl   (%rax)
   acb08:	0f 85 d1 00 00 00    	jne    acbdf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acb0e:	48 8d 44 71 c0       	lea    -0x40(%rcx,%rsi,2),%rax
   acb13:	48 8d 79 40          	lea    0x40(%rcx),%rdi
   acb17:	48 83 e7 c0          	and    $0xffffffffffffffc0,%rdi
   acb1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   acb20:	62 f2 fd 48 26 0f    	vptestmw (%rdi),%zmm0,%k1
   acb26:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   acb2b:	75 09                	jne    acb36 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acb2d:	48 83 c7 40          	add    $0x40,%rdi
   acb31:	48 3b f8             	cmp    %rax,%rdi
   acb34:	76 ea                	jbe    acb20 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x40>
   acb36:	48 8b c7             	mov    %rdi,%rax
   acb39:	48 2b c1             	sub    %rcx,%rax
   acb3c:	48 d1 e8             	shr    $1,%rax
   acb3f:	48 2b f0             	sub    %rax,%rsi
   acb42:	e9 98 00 00 00       	jmp    acbdf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acb47:	48 83 fe 20          	cmp    $0x20,%rsi
   acb4b:	72 32                	jb     acb7f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x9f>
   acb4d:	c5 fc 10 05 6b 6b 0d 	vmovups 0xd6b6b(%rip),%ymm0        # 1836c0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   acb54:	00 
   acb55:	c4 e2 7d 17 01       	vptest (%rcx),%ymm0
   acb5a:	0f 85 7f 00 00 00    	jne    acbdf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acb60:	48 8d 44 71 e0       	lea    -0x20(%rcx,%rsi,2),%rax
   acb65:	48 8d 79 20          	lea    0x20(%rcx),%rdi
   acb69:	48 83 e7 e0          	and    $0xffffffffffffffe0,%rdi
   acb6d:	c4 e2 7d 17 07       	vptest (%rdi),%ymm0
   acb72:	75 c2                	jne    acb36 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acb74:	48 83 c7 20          	add    $0x20,%rdi
   acb78:	48 3b f8             	cmp    %rax,%rdi
   acb7b:	76 f0                	jbe    acb6d <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x8d>
   acb7d:	eb b7                	jmp    acb36 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acb7f:	48 83 fe 10          	cmp    $0x10,%rsi
   acb83:	72 5a                	jb     acbdf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acb85:	c5 f8 10 05 33 6b 0d 	vmovups 0xd6b33(%rip),%xmm0        # 1836c0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   acb8c:	00 
   acb8d:	c4 e2 79 17 01       	vptest (%rcx),%xmm0
   acb92:	75 4b                	jne    acbdf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acb94:	48 8d 44 71 f0       	lea    -0x10(%rcx,%rsi,2),%rax
   acb99:	48 8d 79 10          	lea    0x10(%rcx),%rdi
   acb9d:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   acba1:	c4 e2 79 17 07       	vptest (%rdi),%xmm0
   acba6:	75 8e                	jne    acb36 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acba8:	48 83 c7 10          	add    $0x10,%rdi
   acbac:	48 3b f8             	cmp    %rax,%rdi
   acbaf:	76 f0                	jbe    acba1 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xc1>
   acbb1:	eb 83                	jmp    acb36 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acbb3:	8b 17                	mov    (%rdi),%edx
   acbb5:	8b 47 04             	mov    0x4(%rdi),%eax
   acbb8:	44 8b c2             	mov    %edx,%r8d
   acbbb:	44 0b c0             	or     %eax,%r8d
   acbbe:	41 f7 c0 80 ff 80 ff 	test   $0xff80ff80,%r8d
   acbc5:	74 10                	je     acbd7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xf7>
   acbc7:	f7 c2 80 ff 80 ff    	test   $0xff80ff80,%edx
   acbcd:	75 48                	jne    acc17 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acbcf:	8b d0                	mov    %eax,%edx
   acbd1:	48 83 c7 04          	add    $0x4,%rdi
   acbd5:	eb 40                	jmp    acc17 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acbd7:	48 83 c7 08          	add    $0x8,%rdi
   acbdb:	48 83 c6 fc          	add    $0xfffffffffffffffc,%rsi
   acbdf:	48 83 fe 04          	cmp    $0x4,%rsi
   acbe3:	73 ce                	jae    acbb3 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xd3>
   acbe5:	40 f6 c6 02          	test   $0x2,%sil
   acbe9:	74 0e                	je     acbf9 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x119>
   acbeb:	8b 17                	mov    (%rdi),%edx
   acbed:	f7 c2 80 ff 80 ff    	test   $0xff80ff80,%edx
   acbf3:	75 22                	jne    acc17 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acbf5:	48 83 c7 04          	add    $0x4,%rdi
   acbf9:	40 f6 c6 01          	test   $0x1,%sil
   acbfd:	74 0a                	je     acc09 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acbff:	66 83 3f 7f          	cmpw   $0x7f,(%rdi)
   acc03:	77 04                	ja     acc09 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acc05:	48 83 c7 02          	add    $0x2,%rdi
   acc09:	48 8b c7             	mov    %rdi,%rax
   acc0c:	48 2b c1             	sub    %rcx,%rax
   acc0f:	48 d1 e8             	shr    $1,%rax
   acc12:	c5 f8 77             	vzeroupper
   acc15:	5d                   	pop    %rbp
   acc16:	c3                   	ret
   acc17:	f7 c2 80 ff 00 00    	test   $0xff80,%edx
   acc1d:	74 e6                	je     acc05 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x125>
   acc1f:	eb e8                	jmp    acc09 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acc21:	90                   	nop
   acc22:	90                   	nop
   acc23:	90                   	nop
   acc24:	90                   	nop
   acc25:	90                   	nop
   acc26:	90                   	nop
   acc27:	90                   	nop
   acc28:	90                   	nop
--
00000000000b2a80 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>:
   b2a80:	55                   	push   %rbp
   b2a81:	41 57                	push   %r15
   b2a83:	53                   	push   %rbx
   b2a84:	c5 f8 77             	vzeroupper
   b2a87:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   b2a8c:	48 8b df             	mov    %rdi,%rbx
   b2a8f:	48 85 f6             	test   %rsi,%rsi
   b2a92:	75 07                	jne    b2a9b <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x1b>
   b2a94:	33 c0                	xor    %eax,%eax
   b2a96:	5b                   	pop    %rbx
   b2a97:	41 5f                	pop    %r15
   b2a99:	5d                   	pop    %rbp
   b2a9a:	c3                   	ret
   b2a9b:	4c 8b fb             	mov    %rbx,%r15
   b2a9e:	48 83 fe 08          	cmp    $0x8,%rsi
   b2aa2:	0f 82 0b 01 00 00    	jb     b2bb3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x133>
   b2aa8:	c5 f8 10 05 d0 0c 0d 	vmovups 0xd0cd0(%rip),%xmm0        # 183780 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2aaf:	00 
   b2ab0:	c4 c1 78 10 0f       	vmovups (%r15),%xmm1
   b2ab5:	c5 f1 dd 0d d3 0c 0d 	vpaddusw 0xd0cd3(%rip),%xmm1,%xmm1        # 183790 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10>
   b2abc:	00 
   b2abd:	c5 f9 d7 f9          	vpmovmskb %xmm1,%edi
   b2ac1:	f7 c7 aa aa 00 00    	test   $0xaaaa,%edi
   b2ac7:	0f 85 c2 00 00 00    	jne    b2b8f <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10f>
   b2acd:	48 03 f6             	add    %rsi,%rsi
   b2ad0:	48 83 fe 20          	cmp    $0x20,%rsi
   b2ad4:	72 5c                	jb     b2b32 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xb2>
   b2ad6:	49 8d 5f 10          	lea    0x10(%r15),%rbx
   b2ada:	48 83 e3 f0          	and    $0xfffffffffffffff0,%rbx
   b2ade:	49 03 f7             	add    %r15,%rsi
   b2ae1:	48 2b f3             	sub    %rbx,%rsi
   b2ae4:	48 83 fe 20          	cmp    $0x20,%rsi
   b2ae8:	72 33                	jb     b2b1d <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x9d>
   b2aea:	48 8d 04 33          	lea    (%rbx,%rsi,1),%rax
   b2aee:	48 83 e8 20          	sub    $0x20,%rax
   b2af2:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   b2af9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   b2b00:	c5 f9 6f 0b          	vmovdqa (%rbx),%xmm1
   b2b04:	c5 f9 6f 53 10       	vmovdqa 0x10(%rbx),%xmm2
   b2b09:	c5 f1 eb da          	vpor   %xmm2,%xmm1,%xmm3
   b2b0d:	c4 e2 79 17 d8       	vptest %xmm0,%xmm3
   b2b12:	75 5c                	jne    b2b70 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xf0>
   b2b14:	48 83 c3 20          	add    $0x20,%rbx
   b2b18:	48 3b d8             	cmp    %rax,%rbx
   b2b1b:	76 e3                	jbe    b2b00 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x80>
   b2b1d:	40 f6 c6 10          	test   $0x10,%sil
   b2b21:	74 13                	je     b2b36 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xb6>
   b2b23:	c5 f9 6f 0b          	vmovdqa (%rbx),%xmm1
   b2b27:	c4 e2 79 17 0d 50 0c 	vptest 0xd0c50(%rip),%xmm1        # 183780 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2b2e:	0d 00 
   b2b30:	75 51                	jne    b2b83 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2b32:	48 83 c3 10          	add    $0x10,%rbx
   b2b36:	40 0f b6 c6          	movzbl %sil,%eax
   b2b3a:	a8 0f                	test   $0xf,%al
   b2b3c:	74 24                	je     b2b62 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2b3e:	48 8b c6             	mov    %rsi,%rax
   b2b41:	48 83 e0 0f          	and    $0xf,%rax
   b2b45:	48 03 c3             	add    %rbx,%rax
   b2b48:	48 8b d8             	mov    %rax,%rbx
   b2b4b:	48 83 eb 10          	sub    $0x10,%rbx
   b2b4f:	c5 f8 10 0b          	vmovups (%rbx),%xmm1
   b2b53:	c4 e2 79 17 0d 24 0c 	vptest 0xd0c24(%rip),%xmm1        # 183780 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2b5a:	0d 00 
   b2b5c:	75 25                	jne    b2b83 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2b5e:	48 83 c3 10          	add    $0x10,%rbx
   b2b62:	48 8b c3             	mov    %rbx,%rax
   b2b65:	49 2b c7             	sub    %r15,%rax
   b2b68:	48 d1 e8             	shr    $1,%rax
   b2b6b:	5b                   	pop    %rbx
   b2b6c:	41 5f                	pop    %r15
   b2b6e:	5d                   	pop    %rbp
   b2b6f:	c3                   	ret
   b2b70:	c4 e2 79 17 0d 07 0c 	vptest 0xd0c07(%rip),%xmm1        # 183780 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2b77:	0d 00 
   b2b79:	75 08                	jne    b2b83 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2b7b:	48 83 c3 10          	add    $0x10,%rbx
   b2b7f:	c5 f8 28 ca          	vmovaps %xmm2,%xmm1
   b2b83:	c5 f1 dd 05 05 0c 0d 	vpaddusw 0xd0c05(%rip),%xmm1,%xmm0        # 183790 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10>
   b2b8a:	00 
   b2b8b:	c5 f9 d7 f8          	vpmovmskb %xmm0,%edi
   b2b8f:	81 e7 aa aa 00 00    	and    $0xaaaa,%edi
   b2b95:	33 f6                	xor    %esi,%esi
   b2b97:	f3 0f bc f7          	tzcnt  %edi,%esi
   b2b9b:	8b fe                	mov    %esi,%edi
   b2b9d:	48 8d 5c 3b ff       	lea    -0x1(%rbx,%rdi,1),%rbx
   b2ba2:	eb be                	jmp    b2b62 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2ba4:	e8 37 03 00 00       	call   b2ee0 <S_P_CoreLib_System_Text_Latin1Utility__FirstCharInUInt32IsLatin1>
   b2ba9:	85 c0                	test   %eax,%eax
   b2bab:	74 b5                	je     b2b62 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2bad:	48 83 c3 02          	add    $0x2,%rbx
   b2bb1:	eb af                	jmp    b2b62 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2bb3:	40 f6 c6 04          	test   $0x4,%sil
   b2bb7:	74 2a                	je     b2be3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x163>
   b2bb9:	49 8b 3f             	mov    (%r15),%rdi
   b2bbc:	48 b8 00 ff 00 ff 00 	movabs $0xff00ff00ff00ff00,%rax
   b2bc3:	ff 00 ff 
   b2bc6:	48 23 f8             	and    %rax,%rdi
   b2bc9:	74 14                	je     b2bdf <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x15f>
   b2bcb:	33 db                	xor    %ebx,%ebx
   b2bcd:	f3 48 0f bc df       	tzcnt  %rdi,%rbx
--
0000000000103630 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>:
  103630:	55                   	push   %rbp
  103631:	41 57                	push   %r15
  103633:	41 56                	push   %r14
  103635:	41 55                	push   %r13
  103637:	53                   	push   %rbx
  103638:	48 83 ec 20          	sub    $0x20,%rsp
  10363c:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
  103641:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  103646:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  10364b:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  103650:	48 8b df             	mov    %rdi,%rbx
  103653:	48 8b d6             	mov    %rsi,%rdx
  103656:	48 33 53 48          	xor    0x48(%rbx),%rdx
  10365a:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  103661:	c1 7c 51 
  103664:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  103668:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  10366d:	48 89 06             	mov    %rax,(%rsi)
  103670:	48 8b f7             	mov    %rdi,%rsi
  103673:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  103677:	49 8b ff             	mov    %r15,%rdi
  10367a:	ba 40 00 00 00       	mov    $0x40,%edx
  10367f:	e8 8c 07 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103684:	4c 33 f8             	xor    %rax,%r15
  103687:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  10368e:	c1 7c 51 
  103691:	4d 0f af fe          	imul   %r14,%r15
  103695:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  103699:	48 8b 12             	mov    (%rdx),%rdx
  10369c:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  1036a0:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  1036a5:	48 89 37             	mov    %rsi,(%rdi)
  1036a8:	48 8b f2             	mov    %rdx,%rsi
  1036ab:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  1036af:	ba 40 00 00 00       	mov    $0x40,%edx
  1036b4:	e8 57 07 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1036b9:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  1036bd:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  1036c2:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  1036c6:	48 8b 12             	mov    (%rdx),%rdx
  1036c9:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  1036cd:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  1036d2:	48 89 37             	mov    %rsi,(%rdi)
  1036d5:	48 8b f2             	mov    %rdx,%rsi
  1036d8:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  1036dc:	ba 40 00 00 00       	mov    $0x40,%edx
  1036e1:	e8 2a 07 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1036e6:	4c 8b e8             	mov    %rax,%r13
  1036e9:	4c 0f af 6b 18       	imul   0x18(%rbx),%r13
  1036ee:	4c 33 73 48          	xor    0x48(%rbx),%r14
  1036f2:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  1036f9:	c1 7c 51 
  1036fc:	49 0f af d6          	imul   %r14,%rdx
  103700:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  103707:	49 33 d7             	xor    %r15,%rdx
  10370a:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  10370f:	48 8b 3b             	mov    (%rbx),%rdi
  103712:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
  103716:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  10371b:	48 89 06             	mov    %rax,(%rsi)
  10371e:	48 8b f7             	mov    %rdi,%rsi
  103721:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  103725:	ba 40 00 00 00       	mov    $0x40,%edx
  10372a:	e8 e1 06 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  10372f:	49 03 c5             	add    %r13,%rax
  103732:	48 83 c4 20          	add    $0x20,%rsp
  103736:	5b                   	pop    %rbx
  103737:	41 5d                	pop    %r13
  103739:	41 5e                	pop    %r14
  10373b:	41 5f                	pop    %r15
  10373d:	5d                   	pop    %rbp
  10373e:	c3                   	ret
  10373f:	90                   	nop

0000000000103740 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapSinglePart>:
  103740:	55                   	push   %rbp
  103741:	41 57                	push   %r15
  103743:	41 56                	push   %r14
  103745:	53                   	push   %rbx
  103746:	48 83 ec 18          	sub    $0x18,%rsp
  10374a:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
  10374f:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  103754:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  103759:	33 c0                	xor    %eax,%eax
  10375b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  10375f:	48 8b df             	mov    %rdi,%rbx
  103762:	48 8b d6             	mov    %rsi,%rdx
  103765:	48 33 53 48          	xor    0x48(%rbx),%rdx
  103769:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  103770:	c1 7c 51 
  103773:	48 8d 75 e0          	lea    -0x20(%rbp),%rsi
  103777:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  10377c:	48 89 06             	mov    %rax,(%rsi)
  10377f:	48 8b f7             	mov    %rdi,%rsi
  103782:	4c 8b 7d e0          	mov    -0x20(%rbp),%r15
  103786:	49 8b ff             	mov    %r15,%rdi
  103789:	ba 40 00 00 00       	mov    $0x40,%edx
  10378e:	e8 7d 06 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103793:	4c 33 f8             	xor    %rax,%r15
  103796:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  10379d:	c1 7c 51 
  1037a0:	4d 0f af fe          	imul   %r14,%r15
  1037a4:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  1037a8:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
  1037ac:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  1037b1:	48 89 37             	mov    %rsi,(%rdi)
  1037b4:	48 8b f2             	mov    %rdx,%rsi
  1037b7:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
  1037bb:	ba 40 00 00 00       	mov    $0x40,%edx
  1037c0:	e8 4b 06 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1037c5:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  1037c9:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
  1037cd:	48 33 53 48          	xor    0x48(%rbx),%rdx
  1037d1:	49 0f af d6          	imul   %r14,%rdx
  1037d5:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  1037dc:	49 33 d7             	xor    %r15,%rdx
  1037df:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  1037e4:	48 8b 3b             	mov    (%rbx),%rdi
  1037e7:	48 8d 75 d0          	lea    -0x30(%rbp),%rsi
  1037eb:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  1037f0:	48 89 06             	mov    %rax,(%rsi)
  1037f3:	48 8b f7             	mov    %rdi,%rsi
  1037f6:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  1037fa:	ba 40 00 00 00       	mov    $0x40,%edx
  1037ff:	e8 0c 06 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103804:	90                   	nop
  103805:	48 83 c4 18          	add    $0x18,%rsp
  103809:	5b                   	pop    %rbx
  10380a:	41 5e                	pop    %r14
  10380c:	41 5f                	pop    %r15
  10380e:	5d                   	pop    %rbp
  10380f:	c3                   	ret

0000000000103810 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>:
  103810:	55                   	push   %rbp
  103811:	41 57                	push   %r15
  103813:	41 56                	push   %r14
  103815:	41 55                	push   %r13
  103817:	53                   	push   %rbx
  103818:	48 83 ec 30          	sub    $0x30,%rsp
  10381c:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  103821:	48 8b df             	mov    %rdi,%rbx
  103824:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  103828:	0f 85 fe 00 00 00    	jne    10392c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex+0x11c>
  10382e:	48 8b d6             	mov    %rsi,%rdx
  103831:	48 33 53 48          	xor    0x48(%rbx),%rdx
  103835:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  10383c:	c1 7c 51 
  10383f:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  103843:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  103848:	48 89 06             	mov    %rax,(%rsi)
  10384b:	48 8b f7             	mov    %rdi,%rsi
  10384e:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  103852:	49 8b ff             	mov    %r15,%rdi
  103855:	ba 40 00 00 00       	mov    $0x40,%edx
  10385a:	e8 b1 05 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  10385f:	4c 33 f8             	xor    %rax,%r15
  103862:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  103869:	c1 7c 51 
  10386c:	4d 0f af fe          	imul   %r14,%r15
  103870:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  103874:	48 8b 12             	mov    (%rdx),%rdx
  103877:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  10387b:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  103880:	48 89 37             	mov    %rsi,(%rdi)
  103883:	48 8b f2             	mov    %rdx,%rsi
  103886:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  10388a:	ba 40 00 00 00       	mov    $0x40,%edx
  10388f:	e8 7c 05 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103894:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  103898:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  10389d:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  1038a1:	48 8b 12             	mov    (%rdx),%rdx
  1038a4:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  1038a8:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
--
00000000001039e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>:
  1039e0:	55                   	push   %rbp
  1039e1:	41 57                	push   %r15
  1039e3:	41 56                	push   %r14
  1039e5:	41 55                	push   %r13
  1039e7:	53                   	push   %rbx
  1039e8:	48 83 ec 30          	sub    $0x30,%rsp
  1039ec:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  1039f1:	48 8b df             	mov    %rdi,%rbx
  1039f4:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  1039f8:	0f 85 ec 00 00 00    	jne    103aea <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap+0x10a>
  1039fe:	48 8b d6             	mov    %rsi,%rdx
  103a01:	48 33 53 48          	xor    0x48(%rbx),%rdx
  103a05:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  103a0c:	c1 7c 51 
  103a0f:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  103a13:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  103a18:	48 89 06             	mov    %rax,(%rsi)
  103a1b:	48 8b f7             	mov    %rdi,%rsi
  103a1e:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  103a22:	49 8b ff             	mov    %r15,%rdi
  103a25:	ba 40 00 00 00       	mov    $0x40,%edx
  103a2a:	e8 e1 03 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103a2f:	4c 33 f8             	xor    %rax,%r15
  103a32:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  103a39:	c1 7c 51 
  103a3c:	4d 0f af fe          	imul   %r14,%r15
  103a40:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  103a44:	48 8b 12             	mov    (%rdx),%rdx
  103a47:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  103a4b:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  103a50:	48 89 37             	mov    %rsi,(%rdi)
  103a53:	48 8b f2             	mov    %rdx,%rsi
  103a56:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  103a5a:	ba 40 00 00 00       	mov    $0x40,%edx
  103a5f:	e8 ac 03 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103a64:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  103a68:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  103a6d:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  103a71:	48 8b 12             	mov    (%rdx),%rdx
  103a74:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  103a78:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  103a7d:	48 89 37             	mov    %rsi,(%rdi)
  103a80:	48 8b f2             	mov    %rdx,%rsi
  103a83:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  103a87:	ba 40 00 00 00       	mov    $0x40,%edx
  103a8c:	e8 7f 03 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103a91:	4c 8b e8             	mov    %rax,%r13
  103a94:	4c 0f af 6b 18       	imul   0x18(%rbx),%r13
  103a99:	4c 33 73 48          	xor    0x48(%rbx),%r14
  103a9d:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  103aa4:	c1 7c 51 
  103aa7:	49 0f af d6          	imul   %r14,%rdx
  103aab:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  103ab2:	49 33 d7             	xor    %r15,%rdx
  103ab5:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  103aba:	48 8b 3b             	mov    (%rbx),%rdi
  103abd:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
  103ac1:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  103ac6:	48 89 06             	mov    %rax,(%rsi)
  103ac9:	48 8b f7             	mov    %rdi,%rsi
  103acc:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  103ad0:	ba 40 00 00 00       	mov    $0x40,%edx
  103ad5:	e8 36 03 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103ada:	49 03 c5             	add    %r13,%rax
  103add:	48 83 c4 30          	add    $0x30,%rsp
  103ae1:	5b                   	pop    %rbx
  103ae2:	41 5d                	pop    %r13
  103ae4:	41 5e                	pop    %r14
  103ae6:	41 5f                	pop    %r15
  103ae8:	5d                   	pop    %rbp
  103ae9:	c3                   	ret
  103aea:	48 8b fe             	mov    %rsi,%rdi
  103aed:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  103af1:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
  103af5:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  103afc:	c1 7c 51 
  103aff:	e8 9c ff f7 ff       	call   83aa0 <S_P_CoreLib_System_Math__BigMul_0>
  103b04:	48 8b f0             	mov    %rax,%rsi
  103b07:	4c 8b 7d b8          	mov    -0x48(%rbp),%r15
  103b0b:	49 8b ff             	mov    %r15,%rdi
  103b0e:	ba 40 00 00 00       	mov    $0x40,%edx
  103b13:	e8 f8 02 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103b18:	4c 33 f8             	xor    %rax,%r15
  103b1b:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  103b22:	c1 7c 51 
  103b25:	4d 0f af fe          	imul   %r14,%r15
  103b29:	48 8b fb             	mov    %rbx,%rdi
  103b2c:	49 8b f7             	mov    %r15,%rsi
  103b2f:	e8 8c 00 00 00       	call   103bc0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__BucketInPart>
  103b34:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  103b38:	40 0f b6 3c 07       	rex movzbl (%rdi,%rax,1),%edi
  103b3d:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  103b41:	49 0f af fe          	imul   %r14,%rdi
  103b45:	48 8d b3 80 00 00 00 	lea    0x80(%rbx),%rsi
  103b4c:	49 33 ff             	xor    %r15,%rdi
  103b4f:	48 0f af 7e 08       	imul   0x8(%rsi),%rdi
  103b54:	48 8b 16             	mov    (%rsi),%rdx
  103b57:	33 f6                	xor    %esi,%esi
  103b59:	33 c9                	xor    %ecx,%ecx
  103b5b:	e8 70 02 f9 ff       	call   93dd0 <S_P_CoreLib_System_UInt128__op_Multiply>
