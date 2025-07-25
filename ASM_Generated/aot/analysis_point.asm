00000000000988c0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds>:
   988c0:	55                   	push   %rbp
   988c1:	48 8b ec             	mov    %rsp,%rbp
   988c4:	8b c6                	mov    %esi,%eax
   988c6:	33 c9                	xor    %ecx,%ecx
   988c8:	c6 02 00             	movb   $0x0,(%rdx)
   988cb:	8b 77 08             	mov    0x8(%rdi),%esi
   988ce:	3b f0                	cmp    %eax,%esi
   988d0:	7e 74                	jle    98946 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x86>
   988d2:	3b c6                	cmp    %esi,%eax
   988d4:	73 77                	jae    9894d <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8d>
   988d6:	44 8b c0             	mov    %eax,%r8d
   988d9:	46 0f b7 44 47 0c    	movzwl 0xc(%rdi,%r8,2),%r8d
   988df:	41 83 f8 48          	cmp    $0x48,%r8d
   988e3:	77 14                	ja     988f9 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x39>
   988e5:	41 83 f8 20          	cmp    $0x20,%r8d
   988e9:	74 4c                	je     98937 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x77>
   988eb:	41 83 f8 27          	cmp    $0x27,%r8d
   988ef:	74 2a                	je     9891b <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x5b>
   988f1:	41 83 f8 48          	cmp    $0x48,%r8d
   988f5:	74 45                	je     9893c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   988f7:	eb 47                	jmp    98940 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988f9:	41 83 f8 68          	cmp    $0x68,%r8d
   988fd:	77 0e                	ja     9890d <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x4d>
   988ff:	41 83 f8 5c          	cmp    $0x5c,%r8d
   98903:	74 20                	je     98925 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x65>
   98905:	41 83 f8 68          	cmp    $0x68,%r8d
   98909:	74 31                	je     9893c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   9890b:	eb 33                	jmp    98940 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   9890d:	41 83 f8 6d          	cmp    $0x6d,%r8d
   98911:	74 29                	je     9893c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   98913:	41 83 f8 74          	cmp    $0x74,%r8d
   98917:	74 23                	je     9893c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   98919:	eb 25                	jmp    98940 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   9891b:	85 c9                	test   %ecx,%ecx
   9891d:	0f 94 c1             	sete   %cl
   98920:	0f b6 c9             	movzbl %cl,%ecx
   98923:	eb 1b                	jmp    98940 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98925:	ff c0                	inc    %eax
   98927:	3b c6                	cmp    %esi,%eax
   98929:	73 22                	jae    9894d <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8d>
   9892b:	44 8b c0             	mov    %eax,%r8d
   9892e:	66 42 83 7c 47 0c 20 	cmpw   $0x20,0xc(%rdi,%r8,2)
   98935:	75 09                	jne    98940 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98937:	c6 02 01             	movb   $0x1,(%rdx)
   9893a:	eb 04                	jmp    98940 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   9893c:	85 c9                	test   %ecx,%ecx
   9893e:	74 0b                	je     9894b <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8b>
   98940:	ff c0                	inc    %eax
   98942:	3b f0                	cmp    %eax,%esi
   98944:	7f 8c                	jg     988d2 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x12>
   98946:	c6 02 00             	movb   $0x0,(%rdx)
   98949:	5d                   	pop    %rbp
   9894a:	c3                   	ret
   9894b:	5d                   	pop    %rbp
   9894c:	c3                   	ret
   9894d:	e8 6e 22 03 00       	call   cabc0 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   98952:	cc                   	int3
   98953:	90                   	nop
   98954:	90                   	nop
   98955:	90                   	nop
   98956:	90                   	nop
   98957:	90                   	nop
   98958:	90                   	nop
   98959:	90                   	nop
   9895a:	90                   	nop
   9895b:	90                   	nop
   9895c:	90                   	nop
   9895d:	90                   	nop
   9895e:	90                   	nop
   9895f:	90                   	nop

0000000000098960 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek>:
   98960:	55                   	push   %rbp
   98961:	53                   	push   %rbx
   98962:	50                   	push   %rax
   98963:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   98968:	48 8b df             	mov    %rdi,%rbx
   9896b:	83 bb 98 01 00 00 ff 	cmpl   $0xffffffff,0x198(%rbx)
   98972:	75 2e                	jne    989a2 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x42>
   98974:	48 8d 3d 05 4f 1b 00 	lea    0x1b4f05(%rip),%rdi        # 24d880 <__NONGCSTATICSS_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   9897b:	48 83 7f f8 00       	cmpq   $0x0,-0x8(%rdi)
   98980:	75 2d                	jne    989af <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x4f>
   98982:	33 ff                	xor    %edi,%edi
   98984:	89 7d f0             	mov    %edi,-0x10(%rbp)
   98987:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   9898b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
   9898f:	be 0c 10 00 00       	mov    $0x100c,%esi
   98994:	e8 57 39 03 00       	call   cc2f0 <S_P_CoreLib_Interop_Globalization__GetLocaleInfoInt>
   98999:	8b 45 f0             	mov    -0x10(%rbp),%eax
   9899c:	89 83 98 01 00 00    	mov    %eax,0x198(%rbx)
   989a2:	8b 83 98 01 00 00    	mov    0x198(%rbx),%eax
   989a8:	48 83 c4 08          	add    $0x8,%rsp
   989ac:	5b                   	pop    %rbx
   989ad:	5d                   	pop    %rbp
   989ae:	c3                   	ret
   989af:	e8 06 f7 f6 ff       	call   80ba <__GetNonGCStaticBase_S_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   989b4:	eb cc                	jmp    98982 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x22>
   989b6:	90                   	nop
   989b7:	90                   	nop
   989b8:	90                   	nop
--
00000000000ac9c0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>:
   ac9c0:	55                   	push   %rbp
   ac9c1:	c5 f8 77             	vzeroupper
   ac9c4:	48 8b ec             	mov    %rsp,%rbp
   ac9c7:	48 8b c7             	mov    %rdi,%rax
   ac9ca:	48 81 fe 80 00 00 00 	cmp    $0x80,%rsi
   ac9d1:	72 5a                	jb     aca2d <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x6d>
   ac9d3:	62 f1 7c 48 10 00    	vmovups (%rax),%zmm0
   ac9d9:	62 f2 7e 48 29 c8    	vpmovb2m %zmm0,%k1
   ac9df:	c4 e1 fb 93 c9       	kmovq  %k1,%rcx
   ac9e4:	0f 1f 00             	nopl   (%rax)
   ac9e7:	48 85 c9             	test   %rcx,%rcx
   ac9ea:	0f 85 d7 00 00 00    	jne    acac7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   ac9f0:	48 8d 4c 30 c0       	lea    -0x40(%rax,%rsi,1),%rcx
   ac9f5:	48 8d 78 40          	lea    0x40(%rax),%rdi
   ac9f9:	48 83 e7 c0          	and    $0xffffffffffffffc0,%rdi
   ac9fd:	62 f1 7d 48 6f 07    	vmovdqa32 (%rdi),%zmm0
   aca03:	62 f2 7e 48 29 c8    	vpmovb2m %zmm0,%k1
   aca09:	c4 e1 fb 93 d1       	kmovq  %k1,%rdx
   aca0e:	0f 1f 00             	nopl   (%rax)
   aca11:	48 85 d2             	test   %rdx,%rdx
   aca14:	75 09                	jne    aca1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   aca16:	48 83 c7 40          	add    $0x40,%rdi
   aca1a:	48 3b f9             	cmp    %rcx,%rdi
   aca1d:	76 de                	jbe    ac9fd <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x3d>
   aca1f:	48 2b f7             	sub    %rdi,%rsi
   aca22:	48 03 f0             	add    %rax,%rsi
   aca25:	e9 9d 00 00 00       	jmp    acac7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   aca2a:	0f 1f 00             	nopl   (%rax)
   aca2d:	48 83 fe 40          	cmp    $0x40,%rsi
   aca31:	72 34                	jb     aca67 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xa7>
   aca33:	c5 fc 10 00          	vmovups (%rax),%ymm0
   aca37:	c5 fd d7 c8          	vpmovmskb %ymm0,%ecx
   aca3b:	85 c9                	test   %ecx,%ecx
   aca3d:	0f 85 84 00 00 00    	jne    acac7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   aca43:	48 8d 4c 30 e0       	lea    -0x20(%rax,%rsi,1),%rcx
   aca48:	48 8d 78 20          	lea    0x20(%rax),%rdi
   aca4c:	48 83 e7 e0          	and    $0xffffffffffffffe0,%rdi
   aca50:	c5 fd 6f 07          	vmovdqa (%rdi),%ymm0
   aca54:	c5 fd d7 d0          	vpmovmskb %ymm0,%edx
   aca58:	85 d2                	test   %edx,%edx
   aca5a:	75 c3                	jne    aca1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   aca5c:	48 83 c7 20          	add    $0x20,%rdi
   aca60:	48 3b f9             	cmp    %rcx,%rdi
   aca63:	76 eb                	jbe    aca50 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x90>
   aca65:	eb b8                	jmp    aca1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   aca67:	48 83 fe 20          	cmp    $0x20,%rsi
   aca6b:	72 5a                	jb     acac7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   aca6d:	c5 f8 10 05 eb 7c 0d 	vmovups 0xd7ceb(%rip),%xmm0        # 184760 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>
   aca74:	00 
   aca75:	c4 e2 79 17 00       	vptest (%rax),%xmm0
   aca7a:	75 4b                	jne    acac7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   aca7c:	48 8d 4c 30 f0       	lea    -0x10(%rax,%rsi,1),%rcx
   aca81:	48 8d 78 10          	lea    0x10(%rax),%rdi
   aca85:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   aca89:	c4 e2 79 17 07       	vptest (%rdi),%xmm0
   aca8e:	75 8f                	jne    aca1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   aca90:	48 83 c7 10          	add    $0x10,%rdi
   aca94:	48 3b f9             	cmp    %rcx,%rdi
   aca97:	76 f0                	jbe    aca89 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xc9>
   aca99:	eb 84                	jmp    aca1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   aca9b:	8b 0f                	mov    (%rdi),%ecx
   aca9d:	8b 57 04             	mov    0x4(%rdi),%edx
   acaa0:	44 8b c1             	mov    %ecx,%r8d
   acaa3:	44 0b c2             	or     %edx,%r8d
   acaa6:	41 f7 c0 80 80 80 80 	test   $0x80808080,%r8d
   acaad:	74 10                	je     acabf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xff>
   acaaf:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   acab5:	75 5e                	jne    acb15 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   acab7:	8b ca                	mov    %edx,%ecx
   acab9:	48 83 c7 04          	add    $0x4,%rdi
   acabd:	eb 56                	jmp    acb15 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   acabf:	48 83 c7 08          	add    $0x8,%rdi
   acac3:	48 83 c6 f8          	add    $0xfffffffffffffff8,%rsi
   acac7:	48 83 fe 08          	cmp    $0x8,%rsi
   acacb:	73 ce                	jae    aca9b <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xdb>
   acacd:	40 f6 c6 04          	test   $0x4,%sil
   acad1:	74 0e                	je     acae1 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x121>
   acad3:	8b 0f                	mov    (%rdi),%ecx
   acad5:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   acadb:	75 38                	jne    acb15 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   acadd:	48 83 c7 04          	add    $0x4,%rdi
   acae1:	40 f6 c6 02          	test   $0x2,%sil
   acae5:	74 0f                	je     acaf6 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x136>
   acae7:	0f b7 0f             	movzwl (%rdi),%ecx
   acaea:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   acaf0:	75 23                	jne    acb15 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   acaf2:	48 83 c7 02          	add    $0x2,%rdi
   acaf6:	40 f6 c6 01          	test   $0x1,%sil
   acafa:	74 0b                	je     acb07 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x147>
   acafc:	48 8d 4f 01          	lea    0x1(%rdi),%rcx
   acb00:	80 3f 00             	cmpb   $0x0,(%rdi)
   acb03:	48 0f 4d f9          	cmovge %rcx,%rdi
   acb07:	48 8b cf             	mov    %rdi,%rcx
   acb0a:	48 2b c8             	sub    %rax,%rcx
   acb0d:	48 8b c1             	mov    %rcx,%rax
   acb10:	c5 f8 77             	vzeroupper
   acb13:	5d                   	pop    %rbp
   acb14:	c3                   	ret
   acb15:	81 e1 80 80 80 80    	and    $0x80808080,%ecx
   acb1b:	f3 0f bc c9          	tzcnt  %ecx,%ecx
--
00000000000acb40 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>:
   acb40:	55                   	push   %rbp
   acb41:	c5 f8 77             	vzeroupper
   acb44:	48 8b ec             	mov    %rsp,%rbp
   acb47:	48 8b cf             	mov    %rdi,%rcx
   acb4a:	48 83 fe 40          	cmp    $0x40,%rsi
   acb4e:	72 57                	jb     acba7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x67>
   acb50:	62 f1 7c 48 10 05 26 	vmovups 0xd7c26(%rip),%zmm0        # 184780 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   acb57:	7c 0d 00 
   acb5a:	62 f2 fd 48 26 09    	vptestmw (%rcx),%zmm0,%k1
   acb60:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   acb65:	0f 1f 00             	nopl   (%rax)
   acb68:	0f 85 d1 00 00 00    	jne    acc3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acb6e:	48 8d 44 71 c0       	lea    -0x40(%rcx,%rsi,2),%rax
   acb73:	48 8d 79 40          	lea    0x40(%rcx),%rdi
   acb77:	48 83 e7 c0          	and    $0xffffffffffffffc0,%rdi
   acb7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   acb80:	62 f2 fd 48 26 0f    	vptestmw (%rdi),%zmm0,%k1
   acb86:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   acb8b:	75 09                	jne    acb96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acb8d:	48 83 c7 40          	add    $0x40,%rdi
   acb91:	48 3b f8             	cmp    %rax,%rdi
   acb94:	76 ea                	jbe    acb80 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x40>
   acb96:	48 8b c7             	mov    %rdi,%rax
   acb99:	48 2b c1             	sub    %rcx,%rax
   acb9c:	48 d1 e8             	shr    $1,%rax
   acb9f:	48 2b f0             	sub    %rax,%rsi
   acba2:	e9 98 00 00 00       	jmp    acc3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acba7:	48 83 fe 20          	cmp    $0x20,%rsi
   acbab:	72 32                	jb     acbdf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x9f>
   acbad:	c5 fc 10 05 cb 7b 0d 	vmovups 0xd7bcb(%rip),%ymm0        # 184780 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   acbb4:	00 
   acbb5:	c4 e2 7d 17 01       	vptest (%rcx),%ymm0
   acbba:	0f 85 7f 00 00 00    	jne    acc3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acbc0:	48 8d 44 71 e0       	lea    -0x20(%rcx,%rsi,2),%rax
   acbc5:	48 8d 79 20          	lea    0x20(%rcx),%rdi
   acbc9:	48 83 e7 e0          	and    $0xffffffffffffffe0,%rdi
   acbcd:	c4 e2 7d 17 07       	vptest (%rdi),%ymm0
   acbd2:	75 c2                	jne    acb96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acbd4:	48 83 c7 20          	add    $0x20,%rdi
   acbd8:	48 3b f8             	cmp    %rax,%rdi
   acbdb:	76 f0                	jbe    acbcd <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x8d>
   acbdd:	eb b7                	jmp    acb96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acbdf:	48 83 fe 10          	cmp    $0x10,%rsi
   acbe3:	72 5a                	jb     acc3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acbe5:	c5 f8 10 05 93 7b 0d 	vmovups 0xd7b93(%rip),%xmm0        # 184780 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   acbec:	00 
   acbed:	c4 e2 79 17 01       	vptest (%rcx),%xmm0
   acbf2:	75 4b                	jne    acc3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acbf4:	48 8d 44 71 f0       	lea    -0x10(%rcx,%rsi,2),%rax
   acbf9:	48 8d 79 10          	lea    0x10(%rcx),%rdi
   acbfd:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   acc01:	c4 e2 79 17 07       	vptest (%rdi),%xmm0
   acc06:	75 8e                	jne    acb96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acc08:	48 83 c7 10          	add    $0x10,%rdi
   acc0c:	48 3b f8             	cmp    %rax,%rdi
   acc0f:	76 f0                	jbe    acc01 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xc1>
   acc11:	eb 83                	jmp    acb96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acc13:	8b 17                	mov    (%rdi),%edx
   acc15:	8b 47 04             	mov    0x4(%rdi),%eax
   acc18:	44 8b c2             	mov    %edx,%r8d
   acc1b:	44 0b c0             	or     %eax,%r8d
   acc1e:	41 f7 c0 80 ff 80 ff 	test   $0xff80ff80,%r8d
   acc25:	74 10                	je     acc37 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xf7>
   acc27:	f7 c2 80 ff 80 ff    	test   $0xff80ff80,%edx
   acc2d:	75 48                	jne    acc77 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acc2f:	8b d0                	mov    %eax,%edx
   acc31:	48 83 c7 04          	add    $0x4,%rdi
   acc35:	eb 40                	jmp    acc77 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acc37:	48 83 c7 08          	add    $0x8,%rdi
   acc3b:	48 83 c6 fc          	add    $0xfffffffffffffffc,%rsi
   acc3f:	48 83 fe 04          	cmp    $0x4,%rsi
   acc43:	73 ce                	jae    acc13 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xd3>
   acc45:	40 f6 c6 02          	test   $0x2,%sil
   acc49:	74 0e                	je     acc59 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x119>
   acc4b:	8b 17                	mov    (%rdi),%edx
   acc4d:	f7 c2 80 ff 80 ff    	test   $0xff80ff80,%edx
   acc53:	75 22                	jne    acc77 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acc55:	48 83 c7 04          	add    $0x4,%rdi
   acc59:	40 f6 c6 01          	test   $0x1,%sil
   acc5d:	74 0a                	je     acc69 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acc5f:	66 83 3f 7f          	cmpw   $0x7f,(%rdi)
   acc63:	77 04                	ja     acc69 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acc65:	48 83 c7 02          	add    $0x2,%rdi
   acc69:	48 8b c7             	mov    %rdi,%rax
   acc6c:	48 2b c1             	sub    %rcx,%rax
   acc6f:	48 d1 e8             	shr    $1,%rax
   acc72:	c5 f8 77             	vzeroupper
   acc75:	5d                   	pop    %rbp
   acc76:	c3                   	ret
   acc77:	f7 c2 80 ff 00 00    	test   $0xff80,%edx
   acc7d:	74 e6                	je     acc65 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x125>
   acc7f:	eb e8                	jmp    acc69 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acc81:	90                   	nop
   acc82:	90                   	nop
   acc83:	90                   	nop
   acc84:	90                   	nop
   acc85:	90                   	nop
   acc86:	90                   	nop
   acc87:	90                   	nop
   acc88:	90                   	nop
--
00000000000b2ae0 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>:
   b2ae0:	55                   	push   %rbp
   b2ae1:	41 57                	push   %r15
   b2ae3:	53                   	push   %rbx
   b2ae4:	c5 f8 77             	vzeroupper
   b2ae7:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   b2aec:	48 8b df             	mov    %rdi,%rbx
   b2aef:	48 85 f6             	test   %rsi,%rsi
   b2af2:	75 07                	jne    b2afb <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x1b>
   b2af4:	33 c0                	xor    %eax,%eax
   b2af6:	5b                   	pop    %rbx
   b2af7:	41 5f                	pop    %r15
   b2af9:	5d                   	pop    %rbp
   b2afa:	c3                   	ret
   b2afb:	4c 8b fb             	mov    %rbx,%r15
   b2afe:	48 83 fe 08          	cmp    $0x8,%rsi
   b2b02:	0f 82 0b 01 00 00    	jb     b2c13 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x133>
   b2b08:	c5 f8 10 05 30 1d 0d 	vmovups 0xd1d30(%rip),%xmm0        # 184840 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2b0f:	00 
   b2b10:	c4 c1 78 10 0f       	vmovups (%r15),%xmm1
   b2b15:	c5 f1 dd 0d 33 1d 0d 	vpaddusw 0xd1d33(%rip),%xmm1,%xmm1        # 184850 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10>
   b2b1c:	00 
   b2b1d:	c5 f9 d7 f9          	vpmovmskb %xmm1,%edi
   b2b21:	f7 c7 aa aa 00 00    	test   $0xaaaa,%edi
   b2b27:	0f 85 c2 00 00 00    	jne    b2bef <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10f>
   b2b2d:	48 03 f6             	add    %rsi,%rsi
   b2b30:	48 83 fe 20          	cmp    $0x20,%rsi
   b2b34:	72 5c                	jb     b2b92 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xb2>
   b2b36:	49 8d 5f 10          	lea    0x10(%r15),%rbx
   b2b3a:	48 83 e3 f0          	and    $0xfffffffffffffff0,%rbx
   b2b3e:	49 03 f7             	add    %r15,%rsi
   b2b41:	48 2b f3             	sub    %rbx,%rsi
   b2b44:	48 83 fe 20          	cmp    $0x20,%rsi
   b2b48:	72 33                	jb     b2b7d <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x9d>
   b2b4a:	48 8d 04 33          	lea    (%rbx,%rsi,1),%rax
   b2b4e:	48 83 e8 20          	sub    $0x20,%rax
   b2b52:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   b2b59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   b2b60:	c5 f9 6f 0b          	vmovdqa (%rbx),%xmm1
   b2b64:	c5 f9 6f 53 10       	vmovdqa 0x10(%rbx),%xmm2
   b2b69:	c5 f1 eb da          	vpor   %xmm2,%xmm1,%xmm3
   b2b6d:	c4 e2 79 17 d8       	vptest %xmm0,%xmm3
   b2b72:	75 5c                	jne    b2bd0 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xf0>
   b2b74:	48 83 c3 20          	add    $0x20,%rbx
   b2b78:	48 3b d8             	cmp    %rax,%rbx
   b2b7b:	76 e3                	jbe    b2b60 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x80>
   b2b7d:	40 f6 c6 10          	test   $0x10,%sil
   b2b81:	74 13                	je     b2b96 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xb6>
   b2b83:	c5 f9 6f 0b          	vmovdqa (%rbx),%xmm1
   b2b87:	c4 e2 79 17 0d b0 1c 	vptest 0xd1cb0(%rip),%xmm1        # 184840 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2b8e:	0d 00 
   b2b90:	75 51                	jne    b2be3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2b92:	48 83 c3 10          	add    $0x10,%rbx
   b2b96:	40 0f b6 c6          	movzbl %sil,%eax
   b2b9a:	a8 0f                	test   $0xf,%al
   b2b9c:	74 24                	je     b2bc2 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2b9e:	48 8b c6             	mov    %rsi,%rax
   b2ba1:	48 83 e0 0f          	and    $0xf,%rax
   b2ba5:	48 03 c3             	add    %rbx,%rax
   b2ba8:	48 8b d8             	mov    %rax,%rbx
   b2bab:	48 83 eb 10          	sub    $0x10,%rbx
   b2baf:	c5 f8 10 0b          	vmovups (%rbx),%xmm1
   b2bb3:	c4 e2 79 17 0d 84 1c 	vptest 0xd1c84(%rip),%xmm1        # 184840 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2bba:	0d 00 
   b2bbc:	75 25                	jne    b2be3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2bbe:	48 83 c3 10          	add    $0x10,%rbx
   b2bc2:	48 8b c3             	mov    %rbx,%rax
   b2bc5:	49 2b c7             	sub    %r15,%rax
   b2bc8:	48 d1 e8             	shr    $1,%rax
   b2bcb:	5b                   	pop    %rbx
   b2bcc:	41 5f                	pop    %r15
   b2bce:	5d                   	pop    %rbp
   b2bcf:	c3                   	ret
   b2bd0:	c4 e2 79 17 0d 67 1c 	vptest 0xd1c67(%rip),%xmm1        # 184840 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2bd7:	0d 00 
   b2bd9:	75 08                	jne    b2be3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2bdb:	48 83 c3 10          	add    $0x10,%rbx
   b2bdf:	c5 f8 28 ca          	vmovaps %xmm2,%xmm1
   b2be3:	c5 f1 dd 05 65 1c 0d 	vpaddusw 0xd1c65(%rip),%xmm1,%xmm0        # 184850 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10>
   b2bea:	00 
   b2beb:	c5 f9 d7 f8          	vpmovmskb %xmm0,%edi
   b2bef:	81 e7 aa aa 00 00    	and    $0xaaaa,%edi
   b2bf5:	33 f6                	xor    %esi,%esi
   b2bf7:	f3 0f bc f7          	tzcnt  %edi,%esi
   b2bfb:	8b fe                	mov    %esi,%edi
   b2bfd:	48 8d 5c 3b ff       	lea    -0x1(%rbx,%rdi,1),%rbx
   b2c02:	eb be                	jmp    b2bc2 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2c04:	e8 37 03 00 00       	call   b2f40 <S_P_CoreLib_System_Text_Latin1Utility__FirstCharInUInt32IsLatin1>
   b2c09:	85 c0                	test   %eax,%eax
   b2c0b:	74 b5                	je     b2bc2 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2c0d:	48 83 c3 02          	add    $0x2,%rbx
   b2c11:	eb af                	jmp    b2bc2 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2c13:	40 f6 c6 04          	test   $0x4,%sil
   b2c17:	74 2a                	je     b2c43 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x163>
   b2c19:	49 8b 3f             	mov    (%r15),%rdi
   b2c1c:	48 b8 00 ff 00 ff 00 	movabs $0xff00ff00ff00ff00,%rax
   b2c23:	ff 00 ff 
   b2c26:	48 23 f8             	and    %rax,%rdi
   b2c29:	74 14                	je     b2c3f <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x15f>
   b2c2b:	33 db                	xor    %ebx,%ebx
   b2c2d:	f3 48 0f bc df       	tzcnt  %rdi,%rbx
--
0000000000103690 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>:
  103690:	55                   	push   %rbp
  103691:	41 57                	push   %r15
  103693:	41 56                	push   %r14
  103695:	41 55                	push   %r13
  103697:	53                   	push   %rbx
  103698:	48 83 ec 20          	sub    $0x20,%rsp
  10369c:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
  1036a1:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  1036a6:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  1036ab:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  1036b0:	48 8b df             	mov    %rdi,%rbx
  1036b3:	48 8b d6             	mov    %rsi,%rdx
  1036b6:	48 33 53 48          	xor    0x48(%rbx),%rdx
  1036ba:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  1036c1:	c1 7c 51 
  1036c4:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  1036c8:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  1036cd:	48 89 06             	mov    %rax,(%rsi)
  1036d0:	48 8b f7             	mov    %rdi,%rsi
  1036d3:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  1036d7:	49 8b ff             	mov    %r15,%rdi
  1036da:	ba 40 00 00 00       	mov    $0x40,%edx
  1036df:	e8 9c 07 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1036e4:	4c 33 f8             	xor    %rax,%r15
  1036e7:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  1036ee:	c1 7c 51 
  1036f1:	4d 0f af fe          	imul   %r14,%r15
  1036f5:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  1036f9:	48 8b 12             	mov    (%rdx),%rdx
  1036fc:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  103700:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  103705:	48 89 37             	mov    %rsi,(%rdi)
  103708:	48 8b f2             	mov    %rdx,%rsi
  10370b:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  10370f:	ba 40 00 00 00       	mov    $0x40,%edx
  103714:	e8 67 07 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103719:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  10371d:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  103722:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  103726:	48 8b 12             	mov    (%rdx),%rdx
  103729:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  10372d:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  103732:	48 89 37             	mov    %rsi,(%rdi)
  103735:	48 8b f2             	mov    %rdx,%rsi
  103738:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  10373c:	ba 40 00 00 00       	mov    $0x40,%edx
  103741:	e8 3a 07 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103746:	4c 8b e8             	mov    %rax,%r13
  103749:	4c 0f af 6b 18       	imul   0x18(%rbx),%r13
  10374e:	4c 33 73 48          	xor    0x48(%rbx),%r14
  103752:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  103759:	c1 7c 51 
  10375c:	49 0f af d6          	imul   %r14,%rdx
  103760:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  103767:	49 33 d7             	xor    %r15,%rdx
  10376a:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  10376f:	48 8b 3b             	mov    (%rbx),%rdi
  103772:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
  103776:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  10377b:	48 89 06             	mov    %rax,(%rsi)
  10377e:	48 8b f7             	mov    %rdi,%rsi
  103781:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  103785:	ba 40 00 00 00       	mov    $0x40,%edx
  10378a:	e8 f1 06 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  10378f:	49 03 c5             	add    %r13,%rax
  103792:	48 83 c4 20          	add    $0x20,%rsp
  103796:	5b                   	pop    %rbx
  103797:	41 5d                	pop    %r13
  103799:	41 5e                	pop    %r14
  10379b:	41 5f                	pop    %r15
  10379d:	5d                   	pop    %rbp
  10379e:	c3                   	ret
  10379f:	90                   	nop

00000000001037a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapSinglePart>:
  1037a0:	55                   	push   %rbp
  1037a1:	41 57                	push   %r15
  1037a3:	41 56                	push   %r14
  1037a5:	53                   	push   %rbx
  1037a6:	48 83 ec 18          	sub    $0x18,%rsp
  1037aa:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
  1037af:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  1037b4:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  1037b9:	33 c0                	xor    %eax,%eax
  1037bb:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  1037bf:	48 8b df             	mov    %rdi,%rbx
  1037c2:	48 8b d6             	mov    %rsi,%rdx
  1037c5:	48 33 53 48          	xor    0x48(%rbx),%rdx
  1037c9:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  1037d0:	c1 7c 51 
  1037d3:	48 8d 75 e0          	lea    -0x20(%rbp),%rsi
  1037d7:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  1037dc:	48 89 06             	mov    %rax,(%rsi)
  1037df:	48 8b f7             	mov    %rdi,%rsi
  1037e2:	4c 8b 7d e0          	mov    -0x20(%rbp),%r15
  1037e6:	49 8b ff             	mov    %r15,%rdi
  1037e9:	ba 40 00 00 00       	mov    $0x40,%edx
  1037ee:	e8 8d 06 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1037f3:	4c 33 f8             	xor    %rax,%r15
  1037f6:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  1037fd:	c1 7c 51 
  103800:	4d 0f af fe          	imul   %r14,%r15
  103804:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  103808:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
  10380c:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  103811:	48 89 37             	mov    %rsi,(%rdi)
  103814:	48 8b f2             	mov    %rdx,%rsi
  103817:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
  10381b:	ba 40 00 00 00       	mov    $0x40,%edx
  103820:	e8 5b 06 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103825:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  103829:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
  10382d:	48 33 53 48          	xor    0x48(%rbx),%rdx
  103831:	49 0f af d6          	imul   %r14,%rdx
  103835:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  10383c:	49 33 d7             	xor    %r15,%rdx
  10383f:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  103844:	48 8b 3b             	mov    (%rbx),%rdi
  103847:	48 8d 75 d0          	lea    -0x30(%rbp),%rsi
  10384b:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  103850:	48 89 06             	mov    %rax,(%rsi)
  103853:	48 8b f7             	mov    %rdi,%rsi
  103856:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  10385a:	ba 40 00 00 00       	mov    $0x40,%edx
  10385f:	e8 1c 06 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103864:	90                   	nop
  103865:	48 83 c4 18          	add    $0x18,%rsp
  103869:	5b                   	pop    %rbx
  10386a:	41 5e                	pop    %r14
  10386c:	41 5f                	pop    %r15
  10386e:	5d                   	pop    %rbp
  10386f:	c3                   	ret

0000000000103870 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>:
  103870:	55                   	push   %rbp
  103871:	41 57                	push   %r15
  103873:	41 56                	push   %r14
  103875:	41 55                	push   %r13
  103877:	53                   	push   %rbx
  103878:	48 83 ec 30          	sub    $0x30,%rsp
  10387c:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  103881:	48 8b df             	mov    %rdi,%rbx
  103884:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  103888:	0f 85 fe 00 00 00    	jne    10398c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex+0x11c>
  10388e:	48 8b d6             	mov    %rsi,%rdx
  103891:	48 33 53 48          	xor    0x48(%rbx),%rdx
  103895:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  10389c:	c1 7c 51 
  10389f:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  1038a3:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  1038a8:	48 89 06             	mov    %rax,(%rsi)
  1038ab:	48 8b f7             	mov    %rdi,%rsi
  1038ae:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  1038b2:	49 8b ff             	mov    %r15,%rdi
  1038b5:	ba 40 00 00 00       	mov    $0x40,%edx
  1038ba:	e8 c1 05 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1038bf:	4c 33 f8             	xor    %rax,%r15
  1038c2:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  1038c9:	c1 7c 51 
  1038cc:	4d 0f af fe          	imul   %r14,%r15
  1038d0:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  1038d4:	48 8b 12             	mov    (%rdx),%rdx
  1038d7:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  1038db:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  1038e0:	48 89 37             	mov    %rsi,(%rdi)
  1038e3:	48 8b f2             	mov    %rdx,%rsi
  1038e6:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  1038ea:	ba 40 00 00 00       	mov    $0x40,%edx
  1038ef:	e8 8c 05 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1038f4:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  1038f8:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  1038fd:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  103901:	48 8b 12             	mov    (%rdx),%rdx
  103904:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  103908:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
--
0000000000103a40 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>:
  103a40:	55                   	push   %rbp
  103a41:	41 57                	push   %r15
  103a43:	41 56                	push   %r14
  103a45:	41 55                	push   %r13
  103a47:	53                   	push   %rbx
  103a48:	48 83 ec 30          	sub    $0x30,%rsp
  103a4c:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  103a51:	48 8b df             	mov    %rdi,%rbx
  103a54:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  103a58:	0f 85 ec 00 00 00    	jne    103b4a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap+0x10a>
  103a5e:	48 8b d6             	mov    %rsi,%rdx
  103a61:	48 33 53 48          	xor    0x48(%rbx),%rdx
  103a65:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  103a6c:	c1 7c 51 
  103a6f:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  103a73:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  103a78:	48 89 06             	mov    %rax,(%rsi)
  103a7b:	48 8b f7             	mov    %rdi,%rsi
  103a7e:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  103a82:	49 8b ff             	mov    %r15,%rdi
  103a85:	ba 40 00 00 00       	mov    $0x40,%edx
  103a8a:	e8 f1 03 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103a8f:	4c 33 f8             	xor    %rax,%r15
  103a92:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  103a99:	c1 7c 51 
  103a9c:	4d 0f af fe          	imul   %r14,%r15
  103aa0:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  103aa4:	48 8b 12             	mov    (%rdx),%rdx
  103aa7:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  103aab:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  103ab0:	48 89 37             	mov    %rsi,(%rdi)
  103ab3:	48 8b f2             	mov    %rdx,%rsi
  103ab6:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  103aba:	ba 40 00 00 00       	mov    $0x40,%edx
  103abf:	e8 bc 03 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103ac4:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  103ac8:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  103acd:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  103ad1:	48 8b 12             	mov    (%rdx),%rdx
  103ad4:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  103ad8:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  103add:	48 89 37             	mov    %rsi,(%rdi)
  103ae0:	48 8b f2             	mov    %rdx,%rsi
  103ae3:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  103ae7:	ba 40 00 00 00       	mov    $0x40,%edx
  103aec:	e8 8f 03 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103af1:	4c 8b e8             	mov    %rax,%r13
  103af4:	4c 0f af 6b 18       	imul   0x18(%rbx),%r13
  103af9:	4c 33 73 48          	xor    0x48(%rbx),%r14
  103afd:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  103b04:	c1 7c 51 
  103b07:	49 0f af d6          	imul   %r14,%rdx
  103b0b:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  103b12:	49 33 d7             	xor    %r15,%rdx
  103b15:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  103b1a:	48 8b 3b             	mov    (%rbx),%rdi
  103b1d:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
  103b21:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  103b26:	48 89 06             	mov    %rax,(%rsi)
  103b29:	48 8b f7             	mov    %rdi,%rsi
  103b2c:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  103b30:	ba 40 00 00 00       	mov    $0x40,%edx
  103b35:	e8 46 03 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103b3a:	49 03 c5             	add    %r13,%rax
  103b3d:	48 83 c4 30          	add    $0x30,%rsp
  103b41:	5b                   	pop    %rbx
  103b42:	41 5d                	pop    %r13
  103b44:	41 5e                	pop    %r14
  103b46:	41 5f                	pop    %r15
  103b48:	5d                   	pop    %rbp
  103b49:	c3                   	ret
  103b4a:	48 8b fe             	mov    %rsi,%rdi
  103b4d:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  103b51:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
  103b55:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  103b5c:	c1 7c 51 
  103b5f:	e8 9c ff f7 ff       	call   83b00 <S_P_CoreLib_System_Math__BigMul_0>
  103b64:	48 8b f0             	mov    %rax,%rsi
  103b67:	4c 8b 7d b8          	mov    -0x48(%rbp),%r15
  103b6b:	49 8b ff             	mov    %r15,%rdi
  103b6e:	ba 40 00 00 00       	mov    $0x40,%edx
  103b73:	e8 08 03 f9 ff       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103b78:	4c 33 f8             	xor    %rax,%r15
  103b7b:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  103b82:	c1 7c 51 
  103b85:	4d 0f af fe          	imul   %r14,%r15
  103b89:	48 8b fb             	mov    %rbx,%rdi
  103b8c:	49 8b f7             	mov    %r15,%rsi
  103b8f:	e8 8c 00 00 00       	call   103c20 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__BucketInPart>
  103b94:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  103b98:	40 0f b6 3c 07       	rex movzbl (%rdi,%rax,1),%edi
  103b9d:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  103ba1:	49 0f af fe          	imul   %r14,%rdi
  103ba5:	48 8d b3 80 00 00 00 	lea    0x80(%rbx),%rsi
  103bac:	49 33 ff             	xor    %r15,%rdi
  103baf:	48 0f af 7e 08       	imul   0x8(%rsi),%rdi
  103bb4:	48 8b 16             	mov    (%rsi),%rdx
  103bb7:	33 f6                	xor    %esi,%esi
  103bb9:	33 c9                	xor    %ecx,%ecx
  103bbb:	e8 80 02 f9 ff       	call   93e40 <S_P_CoreLib_System_UInt128__op_Multiply>
