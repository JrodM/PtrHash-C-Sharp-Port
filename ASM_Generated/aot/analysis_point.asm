0000000000098bc0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds>:
   98bc0:	55                   	push   %rbp
   98bc1:	48 8b ec             	mov    %rsp,%rbp
   98bc4:	8b c6                	mov    %esi,%eax
   98bc6:	33 c9                	xor    %ecx,%ecx
   98bc8:	c6 02 00             	movb   $0x0,(%rdx)
   98bcb:	8b 77 08             	mov    0x8(%rdi),%esi
   98bce:	3b f0                	cmp    %eax,%esi
   98bd0:	7e 74                	jle    98c46 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x86>
   98bd2:	3b c6                	cmp    %esi,%eax
   98bd4:	73 77                	jae    98c4d <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8d>
   98bd6:	44 8b c0             	mov    %eax,%r8d
   98bd9:	46 0f b7 44 47 0c    	movzwl 0xc(%rdi,%r8,2),%r8d
   98bdf:	41 83 f8 48          	cmp    $0x48,%r8d
   98be3:	77 14                	ja     98bf9 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x39>
   98be5:	41 83 f8 20          	cmp    $0x20,%r8d
   98be9:	74 4c                	je     98c37 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x77>
   98beb:	41 83 f8 27          	cmp    $0x27,%r8d
   98bef:	74 2a                	je     98c1b <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x5b>
   98bf1:	41 83 f8 48          	cmp    $0x48,%r8d
   98bf5:	74 45                	je     98c3c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   98bf7:	eb 47                	jmp    98c40 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98bf9:	41 83 f8 68          	cmp    $0x68,%r8d
   98bfd:	77 0e                	ja     98c0d <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x4d>
   98bff:	41 83 f8 5c          	cmp    $0x5c,%r8d
   98c03:	74 20                	je     98c25 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x65>
   98c05:	41 83 f8 68          	cmp    $0x68,%r8d
   98c09:	74 31                	je     98c3c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   98c0b:	eb 33                	jmp    98c40 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98c0d:	41 83 f8 6d          	cmp    $0x6d,%r8d
   98c11:	74 29                	je     98c3c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   98c13:	41 83 f8 74          	cmp    $0x74,%r8d
   98c17:	74 23                	je     98c3c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   98c19:	eb 25                	jmp    98c40 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98c1b:	85 c9                	test   %ecx,%ecx
   98c1d:	0f 94 c1             	sete   %cl
   98c20:	0f b6 c9             	movzbl %cl,%ecx
   98c23:	eb 1b                	jmp    98c40 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98c25:	ff c0                	inc    %eax
   98c27:	3b c6                	cmp    %esi,%eax
   98c29:	73 22                	jae    98c4d <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8d>
   98c2b:	44 8b c0             	mov    %eax,%r8d
   98c2e:	66 42 83 7c 47 0c 20 	cmpw   $0x20,0xc(%rdi,%r8,2)
   98c35:	75 09                	jne    98c40 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98c37:	c6 02 01             	movb   $0x1,(%rdx)
   98c3a:	eb 04                	jmp    98c40 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98c3c:	85 c9                	test   %ecx,%ecx
   98c3e:	74 0b                	je     98c4b <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8b>
   98c40:	ff c0                	inc    %eax
   98c42:	3b f0                	cmp    %eax,%esi
   98c44:	7f 8c                	jg     98bd2 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x12>
   98c46:	c6 02 00             	movb   $0x0,(%rdx)
   98c49:	5d                   	pop    %rbp
   98c4a:	c3                   	ret
   98c4b:	5d                   	pop    %rbp
   98c4c:	c3                   	ret
   98c4d:	e8 6e 22 03 00       	call   caec0 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   98c52:	cc                   	int3
   98c53:	90                   	nop
   98c54:	90                   	nop
   98c55:	90                   	nop
   98c56:	90                   	nop
   98c57:	90                   	nop
   98c58:	90                   	nop
   98c59:	90                   	nop
   98c5a:	90                   	nop
   98c5b:	90                   	nop
   98c5c:	90                   	nop
   98c5d:	90                   	nop
   98c5e:	90                   	nop
   98c5f:	90                   	nop

0000000000098c60 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek>:
   98c60:	55                   	push   %rbp
   98c61:	53                   	push   %rbx
   98c62:	50                   	push   %rax
   98c63:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   98c68:	48 8b df             	mov    %rdi,%rbx
   98c6b:	83 bb 98 01 00 00 ff 	cmpl   $0xffffffff,0x198(%rbx)
   98c72:	75 2e                	jne    98ca2 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x42>
   98c74:	48 8d 3d bd f9 1b 00 	lea    0x1bf9bd(%rip),%rdi        # 258638 <__NONGCSTATICSS_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   98c7b:	48 83 7f f8 00       	cmpq   $0x0,-0x8(%rdi)
   98c80:	75 2d                	jne    98caf <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x4f>
   98c82:	33 ff                	xor    %edi,%edi
   98c84:	89 7d f0             	mov    %edi,-0x10(%rbp)
   98c87:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   98c8b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
   98c8f:	be 0c 10 00 00       	mov    $0x100c,%esi
   98c94:	e8 57 39 03 00       	call   cc5f0 <S_P_CoreLib_Interop_Globalization__GetLocaleInfoInt>
   98c99:	8b 45 f0             	mov    -0x10(%rbp),%eax
   98c9c:	89 83 98 01 00 00    	mov    %eax,0x198(%rbx)
   98ca2:	8b 83 98 01 00 00    	mov    0x198(%rbx),%eax
   98ca8:	48 83 c4 08          	add    $0x8,%rsp
   98cac:	5b                   	pop    %rbx
   98cad:	5d                   	pop    %rbp
   98cae:	c3                   	ret
   98caf:	e8 06 f4 f6 ff       	call   80ba <__GetNonGCStaticBase_S_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   98cb4:	eb cc                	jmp    98c82 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x22>
   98cb6:	90                   	nop
   98cb7:	90                   	nop
   98cb8:	90                   	nop
--
00000000000accc0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>:
   accc0:	55                   	push   %rbp
   accc1:	c5 f8 77             	vzeroupper
   accc4:	48 8b ec             	mov    %rsp,%rbp
   accc7:	48 8b c7             	mov    %rdi,%rax
   accca:	48 81 fe 80 00 00 00 	cmp    $0x80,%rsi
   accd1:	72 5a                	jb     acd2d <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x6d>
   accd3:	62 f1 7c 48 10 00    	vmovups (%rax),%zmm0
   accd9:	62 f2 7e 48 29 c8    	vpmovb2m %zmm0,%k1
   accdf:	c4 e1 fb 93 c9       	kmovq  %k1,%rcx
   acce4:	0f 1f 00             	nopl   (%rax)
   acce7:	48 85 c9             	test   %rcx,%rcx
   accea:	0f 85 d7 00 00 00    	jne    acdc7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   accf0:	48 8d 4c 30 c0       	lea    -0x40(%rax,%rsi,1),%rcx
   accf5:	48 8d 78 40          	lea    0x40(%rax),%rdi
   accf9:	48 83 e7 c0          	and    $0xffffffffffffffc0,%rdi
   accfd:	62 f1 7d 48 6f 07    	vmovdqa32 (%rdi),%zmm0
   acd03:	62 f2 7e 48 29 c8    	vpmovb2m %zmm0,%k1
   acd09:	c4 e1 fb 93 d1       	kmovq  %k1,%rdx
   acd0e:	0f 1f 00             	nopl   (%rax)
   acd11:	48 85 d2             	test   %rdx,%rdx
   acd14:	75 09                	jne    acd1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   acd16:	48 83 c7 40          	add    $0x40,%rdi
   acd1a:	48 3b f9             	cmp    %rcx,%rdi
   acd1d:	76 de                	jbe    accfd <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x3d>
   acd1f:	48 2b f7             	sub    %rdi,%rsi
   acd22:	48 03 f0             	add    %rax,%rsi
   acd25:	e9 9d 00 00 00       	jmp    acdc7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   acd2a:	0f 1f 00             	nopl   (%rax)
   acd2d:	48 83 fe 40          	cmp    $0x40,%rsi
   acd31:	72 34                	jb     acd67 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xa7>
   acd33:	c5 fc 10 00          	vmovups (%rax),%ymm0
   acd37:	c5 fd d7 c8          	vpmovmskb %ymm0,%ecx
   acd3b:	85 c9                	test   %ecx,%ecx
   acd3d:	0f 85 84 00 00 00    	jne    acdc7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   acd43:	48 8d 4c 30 e0       	lea    -0x20(%rax,%rsi,1),%rcx
   acd48:	48 8d 78 20          	lea    0x20(%rax),%rdi
   acd4c:	48 83 e7 e0          	and    $0xffffffffffffffe0,%rdi
   acd50:	c5 fd 6f 07          	vmovdqa (%rdi),%ymm0
   acd54:	c5 fd d7 d0          	vpmovmskb %ymm0,%edx
   acd58:	85 d2                	test   %edx,%edx
   acd5a:	75 c3                	jne    acd1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   acd5c:	48 83 c7 20          	add    $0x20,%rdi
   acd60:	48 3b f9             	cmp    %rcx,%rdi
   acd63:	76 eb                	jbe    acd50 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x90>
   acd65:	eb b8                	jmp    acd1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   acd67:	48 83 fe 20          	cmp    $0x20,%rsi
   acd6b:	72 5a                	jb     acdc7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   acd6d:	c5 f8 10 05 2b dd 0d 	vmovups 0xddd2b(%rip),%xmm0        # 18aaa0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>
   acd74:	00 
   acd75:	c4 e2 79 17 00       	vptest (%rax),%xmm0
   acd7a:	75 4b                	jne    acdc7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   acd7c:	48 8d 4c 30 f0       	lea    -0x10(%rax,%rsi,1),%rcx
   acd81:	48 8d 78 10          	lea    0x10(%rax),%rdi
   acd85:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   acd89:	c4 e2 79 17 07       	vptest (%rdi),%xmm0
   acd8e:	75 8f                	jne    acd1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   acd90:	48 83 c7 10          	add    $0x10,%rdi
   acd94:	48 3b f9             	cmp    %rcx,%rdi
   acd97:	76 f0                	jbe    acd89 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xc9>
   acd99:	eb 84                	jmp    acd1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   acd9b:	8b 0f                	mov    (%rdi),%ecx
   acd9d:	8b 57 04             	mov    0x4(%rdi),%edx
   acda0:	44 8b c1             	mov    %ecx,%r8d
   acda3:	44 0b c2             	or     %edx,%r8d
   acda6:	41 f7 c0 80 80 80 80 	test   $0x80808080,%r8d
   acdad:	74 10                	je     acdbf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xff>
   acdaf:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   acdb5:	75 5e                	jne    ace15 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   acdb7:	8b ca                	mov    %edx,%ecx
   acdb9:	48 83 c7 04          	add    $0x4,%rdi
   acdbd:	eb 56                	jmp    ace15 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   acdbf:	48 83 c7 08          	add    $0x8,%rdi
   acdc3:	48 83 c6 f8          	add    $0xfffffffffffffff8,%rsi
   acdc7:	48 83 fe 08          	cmp    $0x8,%rsi
   acdcb:	73 ce                	jae    acd9b <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xdb>
   acdcd:	40 f6 c6 04          	test   $0x4,%sil
   acdd1:	74 0e                	je     acde1 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x121>
   acdd3:	8b 0f                	mov    (%rdi),%ecx
   acdd5:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   acddb:	75 38                	jne    ace15 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   acddd:	48 83 c7 04          	add    $0x4,%rdi
   acde1:	40 f6 c6 02          	test   $0x2,%sil
   acde5:	74 0f                	je     acdf6 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x136>
   acde7:	0f b7 0f             	movzwl (%rdi),%ecx
   acdea:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   acdf0:	75 23                	jne    ace15 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   acdf2:	48 83 c7 02          	add    $0x2,%rdi
   acdf6:	40 f6 c6 01          	test   $0x1,%sil
   acdfa:	74 0b                	je     ace07 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x147>
   acdfc:	48 8d 4f 01          	lea    0x1(%rdi),%rcx
   ace00:	80 3f 00             	cmpb   $0x0,(%rdi)
   ace03:	48 0f 4d f9          	cmovge %rcx,%rdi
   ace07:	48 8b cf             	mov    %rdi,%rcx
   ace0a:	48 2b c8             	sub    %rax,%rcx
   ace0d:	48 8b c1             	mov    %rcx,%rax
   ace10:	c5 f8 77             	vzeroupper
   ace13:	5d                   	pop    %rbp
   ace14:	c3                   	ret
   ace15:	81 e1 80 80 80 80    	and    $0x80808080,%ecx
   ace1b:	f3 0f bc c9          	tzcnt  %ecx,%ecx
--
00000000000ace40 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>:
   ace40:	55                   	push   %rbp
   ace41:	c5 f8 77             	vzeroupper
   ace44:	48 8b ec             	mov    %rsp,%rbp
   ace47:	48 8b cf             	mov    %rdi,%rcx
   ace4a:	48 83 fe 40          	cmp    $0x40,%rsi
   ace4e:	72 57                	jb     acea7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x67>
   ace50:	62 f1 7c 48 10 05 66 	vmovups 0xddc66(%rip),%zmm0        # 18aac0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   ace57:	dc 0d 00 
   ace5a:	62 f2 fd 48 26 09    	vptestmw (%rcx),%zmm0,%k1
   ace60:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   ace65:	0f 1f 00             	nopl   (%rax)
   ace68:	0f 85 d1 00 00 00    	jne    acf3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   ace6e:	48 8d 44 71 c0       	lea    -0x40(%rcx,%rsi,2),%rax
   ace73:	48 8d 79 40          	lea    0x40(%rcx),%rdi
   ace77:	48 83 e7 c0          	and    $0xffffffffffffffc0,%rdi
   ace7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   ace80:	62 f2 fd 48 26 0f    	vptestmw (%rdi),%zmm0,%k1
   ace86:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   ace8b:	75 09                	jne    ace96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   ace8d:	48 83 c7 40          	add    $0x40,%rdi
   ace91:	48 3b f8             	cmp    %rax,%rdi
   ace94:	76 ea                	jbe    ace80 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x40>
   ace96:	48 8b c7             	mov    %rdi,%rax
   ace99:	48 2b c1             	sub    %rcx,%rax
   ace9c:	48 d1 e8             	shr    $1,%rax
   ace9f:	48 2b f0             	sub    %rax,%rsi
   acea2:	e9 98 00 00 00       	jmp    acf3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acea7:	48 83 fe 20          	cmp    $0x20,%rsi
   aceab:	72 32                	jb     acedf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x9f>
   acead:	c5 fc 10 05 0b dc 0d 	vmovups 0xddc0b(%rip),%ymm0        # 18aac0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   aceb4:	00 
   aceb5:	c4 e2 7d 17 01       	vptest (%rcx),%ymm0
   aceba:	0f 85 7f 00 00 00    	jne    acf3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acec0:	48 8d 44 71 e0       	lea    -0x20(%rcx,%rsi,2),%rax
   acec5:	48 8d 79 20          	lea    0x20(%rcx),%rdi
   acec9:	48 83 e7 e0          	and    $0xffffffffffffffe0,%rdi
   acecd:	c4 e2 7d 17 07       	vptest (%rdi),%ymm0
   aced2:	75 c2                	jne    ace96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   aced4:	48 83 c7 20          	add    $0x20,%rdi
   aced8:	48 3b f8             	cmp    %rax,%rdi
   acedb:	76 f0                	jbe    acecd <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x8d>
   acedd:	eb b7                	jmp    ace96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acedf:	48 83 fe 10          	cmp    $0x10,%rsi
   acee3:	72 5a                	jb     acf3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acee5:	c5 f8 10 05 d3 db 0d 	vmovups 0xddbd3(%rip),%xmm0        # 18aac0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   aceec:	00 
   aceed:	c4 e2 79 17 01       	vptest (%rcx),%xmm0
   acef2:	75 4b                	jne    acf3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acef4:	48 8d 44 71 f0       	lea    -0x10(%rcx,%rsi,2),%rax
   acef9:	48 8d 79 10          	lea    0x10(%rcx),%rdi
   acefd:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   acf01:	c4 e2 79 17 07       	vptest (%rdi),%xmm0
   acf06:	75 8e                	jne    ace96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acf08:	48 83 c7 10          	add    $0x10,%rdi
   acf0c:	48 3b f8             	cmp    %rax,%rdi
   acf0f:	76 f0                	jbe    acf01 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xc1>
   acf11:	eb 83                	jmp    ace96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acf13:	8b 17                	mov    (%rdi),%edx
   acf15:	8b 47 04             	mov    0x4(%rdi),%eax
   acf18:	44 8b c2             	mov    %edx,%r8d
   acf1b:	44 0b c0             	or     %eax,%r8d
   acf1e:	41 f7 c0 80 ff 80 ff 	test   $0xff80ff80,%r8d
   acf25:	74 10                	je     acf37 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xf7>
   acf27:	f7 c2 80 ff 80 ff    	test   $0xff80ff80,%edx
   acf2d:	75 48                	jne    acf77 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acf2f:	8b d0                	mov    %eax,%edx
   acf31:	48 83 c7 04          	add    $0x4,%rdi
   acf35:	eb 40                	jmp    acf77 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acf37:	48 83 c7 08          	add    $0x8,%rdi
   acf3b:	48 83 c6 fc          	add    $0xfffffffffffffffc,%rsi
   acf3f:	48 83 fe 04          	cmp    $0x4,%rsi
   acf43:	73 ce                	jae    acf13 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xd3>
   acf45:	40 f6 c6 02          	test   $0x2,%sil
   acf49:	74 0e                	je     acf59 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x119>
   acf4b:	8b 17                	mov    (%rdi),%edx
   acf4d:	f7 c2 80 ff 80 ff    	test   $0xff80ff80,%edx
   acf53:	75 22                	jne    acf77 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acf55:	48 83 c7 04          	add    $0x4,%rdi
   acf59:	40 f6 c6 01          	test   $0x1,%sil
   acf5d:	74 0a                	je     acf69 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acf5f:	66 83 3f 7f          	cmpw   $0x7f,(%rdi)
   acf63:	77 04                	ja     acf69 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acf65:	48 83 c7 02          	add    $0x2,%rdi
   acf69:	48 8b c7             	mov    %rdi,%rax
   acf6c:	48 2b c1             	sub    %rcx,%rax
   acf6f:	48 d1 e8             	shr    $1,%rax
   acf72:	c5 f8 77             	vzeroupper
   acf75:	5d                   	pop    %rbp
   acf76:	c3                   	ret
   acf77:	f7 c2 80 ff 00 00    	test   $0xff80,%edx
   acf7d:	74 e6                	je     acf65 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x125>
   acf7f:	eb e8                	jmp    acf69 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acf81:	90                   	nop
   acf82:	90                   	nop
   acf83:	90                   	nop
   acf84:	90                   	nop
   acf85:	90                   	nop
   acf86:	90                   	nop
   acf87:	90                   	nop
   acf88:	90                   	nop
--
00000000000b2de0 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>:
   b2de0:	55                   	push   %rbp
   b2de1:	41 57                	push   %r15
   b2de3:	53                   	push   %rbx
   b2de4:	c5 f8 77             	vzeroupper
   b2de7:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   b2dec:	48 8b df             	mov    %rdi,%rbx
   b2def:	48 85 f6             	test   %rsi,%rsi
   b2df2:	75 07                	jne    b2dfb <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x1b>
   b2df4:	33 c0                	xor    %eax,%eax
   b2df6:	5b                   	pop    %rbx
   b2df7:	41 5f                	pop    %r15
   b2df9:	5d                   	pop    %rbp
   b2dfa:	c3                   	ret
   b2dfb:	4c 8b fb             	mov    %rbx,%r15
   b2dfe:	48 83 fe 08          	cmp    $0x8,%rsi
   b2e02:	0f 82 0b 01 00 00    	jb     b2f13 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x133>
   b2e08:	c5 f8 10 05 70 7d 0d 	vmovups 0xd7d70(%rip),%xmm0        # 18ab80 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2e0f:	00 
   b2e10:	c4 c1 78 10 0f       	vmovups (%r15),%xmm1
   b2e15:	c5 f1 dd 0d 73 7d 0d 	vpaddusw 0xd7d73(%rip),%xmm1,%xmm1        # 18ab90 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10>
   b2e1c:	00 
   b2e1d:	c5 f9 d7 f9          	vpmovmskb %xmm1,%edi
   b2e21:	f7 c7 aa aa 00 00    	test   $0xaaaa,%edi
   b2e27:	0f 85 c2 00 00 00    	jne    b2eef <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10f>
   b2e2d:	48 03 f6             	add    %rsi,%rsi
   b2e30:	48 83 fe 20          	cmp    $0x20,%rsi
   b2e34:	72 5c                	jb     b2e92 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xb2>
   b2e36:	49 8d 5f 10          	lea    0x10(%r15),%rbx
   b2e3a:	48 83 e3 f0          	and    $0xfffffffffffffff0,%rbx
   b2e3e:	49 03 f7             	add    %r15,%rsi
   b2e41:	48 2b f3             	sub    %rbx,%rsi
   b2e44:	48 83 fe 20          	cmp    $0x20,%rsi
   b2e48:	72 33                	jb     b2e7d <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x9d>
   b2e4a:	48 8d 04 33          	lea    (%rbx,%rsi,1),%rax
   b2e4e:	48 83 e8 20          	sub    $0x20,%rax
   b2e52:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   b2e59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   b2e60:	c5 f9 6f 0b          	vmovdqa (%rbx),%xmm1
   b2e64:	c5 f9 6f 53 10       	vmovdqa 0x10(%rbx),%xmm2
   b2e69:	c5 f1 eb da          	vpor   %xmm2,%xmm1,%xmm3
   b2e6d:	c4 e2 79 17 d8       	vptest %xmm0,%xmm3
   b2e72:	75 5c                	jne    b2ed0 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xf0>
   b2e74:	48 83 c3 20          	add    $0x20,%rbx
   b2e78:	48 3b d8             	cmp    %rax,%rbx
   b2e7b:	76 e3                	jbe    b2e60 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x80>
   b2e7d:	40 f6 c6 10          	test   $0x10,%sil
   b2e81:	74 13                	je     b2e96 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xb6>
   b2e83:	c5 f9 6f 0b          	vmovdqa (%rbx),%xmm1
   b2e87:	c4 e2 79 17 0d f0 7c 	vptest 0xd7cf0(%rip),%xmm1        # 18ab80 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2e8e:	0d 00 
   b2e90:	75 51                	jne    b2ee3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2e92:	48 83 c3 10          	add    $0x10,%rbx
   b2e96:	40 0f b6 c6          	movzbl %sil,%eax
   b2e9a:	a8 0f                	test   $0xf,%al
   b2e9c:	74 24                	je     b2ec2 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2e9e:	48 8b c6             	mov    %rsi,%rax
   b2ea1:	48 83 e0 0f          	and    $0xf,%rax
   b2ea5:	48 03 c3             	add    %rbx,%rax
   b2ea8:	48 8b d8             	mov    %rax,%rbx
   b2eab:	48 83 eb 10          	sub    $0x10,%rbx
   b2eaf:	c5 f8 10 0b          	vmovups (%rbx),%xmm1
   b2eb3:	c4 e2 79 17 0d c4 7c 	vptest 0xd7cc4(%rip),%xmm1        # 18ab80 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2eba:	0d 00 
   b2ebc:	75 25                	jne    b2ee3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2ebe:	48 83 c3 10          	add    $0x10,%rbx
   b2ec2:	48 8b c3             	mov    %rbx,%rax
   b2ec5:	49 2b c7             	sub    %r15,%rax
   b2ec8:	48 d1 e8             	shr    $1,%rax
   b2ecb:	5b                   	pop    %rbx
   b2ecc:	41 5f                	pop    %r15
   b2ece:	5d                   	pop    %rbp
   b2ecf:	c3                   	ret
   b2ed0:	c4 e2 79 17 0d a7 7c 	vptest 0xd7ca7(%rip),%xmm1        # 18ab80 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2ed7:	0d 00 
   b2ed9:	75 08                	jne    b2ee3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2edb:	48 83 c3 10          	add    $0x10,%rbx
   b2edf:	c5 f8 28 ca          	vmovaps %xmm2,%xmm1
   b2ee3:	c5 f1 dd 05 a5 7c 0d 	vpaddusw 0xd7ca5(%rip),%xmm1,%xmm0        # 18ab90 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10>
   b2eea:	00 
   b2eeb:	c5 f9 d7 f8          	vpmovmskb %xmm0,%edi
   b2eef:	81 e7 aa aa 00 00    	and    $0xaaaa,%edi
   b2ef5:	33 f6                	xor    %esi,%esi
   b2ef7:	f3 0f bc f7          	tzcnt  %edi,%esi
   b2efb:	8b fe                	mov    %esi,%edi
   b2efd:	48 8d 5c 3b ff       	lea    -0x1(%rbx,%rdi,1),%rbx
   b2f02:	eb be                	jmp    b2ec2 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2f04:	e8 37 03 00 00       	call   b3240 <S_P_CoreLib_System_Text_Latin1Utility__FirstCharInUInt32IsLatin1>
   b2f09:	85 c0                	test   %eax,%eax
   b2f0b:	74 b5                	je     b2ec2 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2f0d:	48 83 c3 02          	add    $0x2,%rbx
   b2f11:	eb af                	jmp    b2ec2 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2f13:	40 f6 c6 04          	test   $0x4,%sil
   b2f17:	74 2a                	je     b2f43 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x163>
   b2f19:	49 8b 3f             	mov    (%r15),%rdi
   b2f1c:	48 b8 00 ff 00 ff 00 	movabs $0xff00ff00ff00ff00,%rax
   b2f23:	ff 00 ff 
   b2f26:	48 23 f8             	and    %rax,%rdi
   b2f29:	74 14                	je     b2f3f <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x15f>
   b2f2b:	33 db                	xor    %ebx,%ebx
   b2f2d:	f3 48 0f bc df       	tzcnt  %rdi,%rbx
--
0000000000103fe0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>:
  103fe0:	55                   	push   %rbp
  103fe1:	41 57                	push   %r15
  103fe3:	41 56                	push   %r14
  103fe5:	41 55                	push   %r13
  103fe7:	53                   	push   %rbx
  103fe8:	48 83 ec 20          	sub    $0x20,%rsp
  103fec:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
  103ff1:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  103ff6:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  103ffb:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  104000:	48 8b df             	mov    %rdi,%rbx
  104003:	48 8b d6             	mov    %rsi,%rdx
  104006:	48 33 53 48          	xor    0x48(%rbx),%rdx
  10400a:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  104011:	c1 7c 51 
  104014:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  104018:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  10401d:	48 89 06             	mov    %rax,(%rsi)
  104020:	48 8b f7             	mov    %rdi,%rsi
  104023:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  104027:	49 8b ff             	mov    %r15,%rdi
  10402a:	ba 40 00 00 00       	mov    $0x40,%edx
  10402f:	e8 4c 01 f9 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104034:	4c 33 f8             	xor    %rax,%r15
  104037:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  10403e:	c1 7c 51 
  104041:	4d 0f af fe          	imul   %r14,%r15
  104045:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  104049:	48 8b 12             	mov    (%rdx),%rdx
  10404c:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  104050:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  104055:	48 89 37             	mov    %rsi,(%rdi)
  104058:	48 8b f2             	mov    %rdx,%rsi
  10405b:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  10405f:	ba 40 00 00 00       	mov    $0x40,%edx
  104064:	e8 17 01 f9 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104069:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  10406d:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  104072:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  104076:	48 8b 12             	mov    (%rdx),%rdx
  104079:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  10407d:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  104082:	48 89 37             	mov    %rsi,(%rdi)
  104085:	48 8b f2             	mov    %rdx,%rsi
  104088:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  10408c:	ba 40 00 00 00       	mov    $0x40,%edx
  104091:	e8 ea 00 f9 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104096:	4c 8b e8             	mov    %rax,%r13
  104099:	4c 0f af 6b 18       	imul   0x18(%rbx),%r13
  10409e:	4c 33 73 48          	xor    0x48(%rbx),%r14
  1040a2:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  1040a9:	c1 7c 51 
  1040ac:	49 0f af d6          	imul   %r14,%rdx
  1040b0:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  1040b7:	49 33 d7             	xor    %r15,%rdx
  1040ba:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  1040bf:	48 8b 3b             	mov    (%rbx),%rdi
  1040c2:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
  1040c6:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  1040cb:	48 89 06             	mov    %rax,(%rsi)
  1040ce:	48 8b f7             	mov    %rdi,%rsi
  1040d1:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  1040d5:	ba 40 00 00 00       	mov    $0x40,%edx
  1040da:	e8 a1 00 f9 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1040df:	49 03 c5             	add    %r13,%rax
  1040e2:	48 83 c4 20          	add    $0x20,%rsp
  1040e6:	5b                   	pop    %rbx
  1040e7:	41 5d                	pop    %r13
  1040e9:	41 5e                	pop    %r14
  1040eb:	41 5f                	pop    %r15
  1040ed:	5d                   	pop    %rbp
  1040ee:	c3                   	ret
  1040ef:	90                   	nop

00000000001040f0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexSinglePart>:
  1040f0:	55                   	push   %rbp
  1040f1:	41 57                	push   %r15
  1040f3:	41 56                	push   %r14
  1040f5:	53                   	push   %rbx
  1040f6:	48 83 ec 18          	sub    $0x18,%rsp
  1040fa:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
  1040ff:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104104:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  104109:	33 c0                	xor    %eax,%eax
  10410b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  10410f:	48 8b df             	mov    %rdi,%rbx
  104112:	48 8b d6             	mov    %rsi,%rdx
  104115:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104119:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  104120:	c1 7c 51 
  104123:	48 8d 75 e0          	lea    -0x20(%rbp),%rsi
  104127:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  10412c:	48 89 06             	mov    %rax,(%rsi)
  10412f:	48 8b f7             	mov    %rdi,%rsi
  104132:	4c 8b 7d e0          	mov    -0x20(%rbp),%r15
  104136:	49 8b ff             	mov    %r15,%rdi
  104139:	ba 40 00 00 00       	mov    $0x40,%edx
  10413e:	e8 3d 00 f9 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104143:	4c 33 f8             	xor    %rax,%r15
  104146:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  10414d:	c1 7c 51 
  104150:	4d 0f af fe          	imul   %r14,%r15
  104154:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  104158:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
  10415c:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  104161:	48 89 37             	mov    %rsi,(%rdi)
  104164:	48 8b f2             	mov    %rdx,%rsi
  104167:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
  10416b:	ba 40 00 00 00       	mov    $0x40,%edx
  104170:	e8 0b 00 f9 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104175:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  104179:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
  10417d:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104181:	49 0f af d6          	imul   %r14,%rdx
  104185:	48 8d bb 80 00 00 00 	lea    0x80(%rbx),%rdi
  10418c:	49 33 d7             	xor    %r15,%rdx
  10418f:	48 0f af 57 08       	imul   0x8(%rdi),%rdx
  104194:	48 8b 3f             	mov    (%rdi),%rdi
  104197:	48 8d 75 d0          	lea    -0x30(%rbp),%rsi
  10419b:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  1041a0:	48 89 06             	mov    %rax,(%rsi)
  1041a3:	48 8b f7             	mov    %rdi,%rsi
  1041a6:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  1041aa:	ba 40 00 00 00       	mov    $0x40,%edx
  1041af:	e8 cc ff f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1041b4:	48 3b 43 38          	cmp    0x38(%rbx),%rax
  1041b8:	72 17                	jb     1041d1 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexSinglePart+0xe1>
  1041ba:	48 8b 4b 58          	mov    0x58(%rbx),%rcx
  1041be:	2b 43 38             	sub    0x38(%rbx),%eax
  1041c1:	48 98                	cltq
  1041c3:	8b 04 81             	mov    (%rcx,%rax,4),%eax
  1041c6:	48 83 c4 18          	add    $0x18,%rsp
  1041ca:	5b                   	pop    %rbx
  1041cb:	41 5e                	pop    %r14
  1041cd:	41 5f                	pop    %r15
  1041cf:	5d                   	pop    %rbp
  1041d0:	c3                   	ret
  1041d1:	48 83 c4 18          	add    $0x18,%rsp
  1041d5:	5b                   	pop    %rbx
  1041d6:	41 5e                	pop    %r14
  1041d8:	41 5f                	pop    %r15
  1041da:	5d                   	pop    %rbp
  1041db:	c3                   	ret
  1041dc:	90                   	nop
  1041dd:	90                   	nop
  1041de:	90                   	nop
  1041df:	90                   	nop

00000000001041e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapSinglePart>:
  1041e0:	55                   	push   %rbp
  1041e1:	41 57                	push   %r15
  1041e3:	41 56                	push   %r14
  1041e5:	53                   	push   %rbx
  1041e6:	48 83 ec 18          	sub    $0x18,%rsp
  1041ea:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
  1041ef:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  1041f4:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  1041f9:	33 c0                	xor    %eax,%eax
  1041fb:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  1041ff:	48 8b df             	mov    %rdi,%rbx
  104202:	48 8b d6             	mov    %rsi,%rdx
  104205:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104209:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  104210:	c1 7c 51 
  104213:	48 8d 75 e0          	lea    -0x20(%rbp),%rsi
  104217:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  10421c:	48 89 06             	mov    %rax,(%rsi)
  10421f:	48 8b f7             	mov    %rdi,%rsi
  104222:	4c 8b 7d e0          	mov    -0x20(%rbp),%r15
  104226:	49 8b ff             	mov    %r15,%rdi
  104229:	ba 40 00 00 00       	mov    $0x40,%edx
  10422e:	e8 4d ff f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104233:	4c 33 f8             	xor    %rax,%r15
  104236:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  10423d:	c1 7c 51 
  104240:	4d 0f af fe          	imul   %r14,%r15
  104244:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  104248:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
  10424c:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  104251:	48 89 37             	mov    %rsi,(%rdi)
  104254:	48 8b f2             	mov    %rdx,%rsi
  104257:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
  10425b:	ba 40 00 00 00       	mov    $0x40,%edx
  104260:	e8 1b ff f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104265:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  104269:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
  10426d:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104271:	49 0f af d6          	imul   %r14,%rdx
  104275:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  10427c:	49 33 d7             	xor    %r15,%rdx
  10427f:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  104284:	48 8b 3b             	mov    (%rbx),%rdi
  104287:	48 8d 75 d0          	lea    -0x30(%rbp),%rsi
  10428b:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  104290:	48 89 06             	mov    %rax,(%rsi)
  104293:	48 8b f7             	mov    %rdi,%rsi
  104296:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  10429a:	ba 40 00 00 00       	mov    $0x40,%edx
  10429f:	e8 dc fe f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1042a4:	90                   	nop
  1042a5:	48 83 c4 18          	add    $0x18,%rsp
  1042a9:	5b                   	pop    %rbx
  1042aa:	41 5e                	pop    %r14
  1042ac:	41 5f                	pop    %r15
  1042ae:	5d                   	pop    %rbp
  1042af:	c3                   	ret

00000000001042b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>:
  1042b0:	55                   	push   %rbp
  1042b1:	41 57                	push   %r15
  1042b3:	41 56                	push   %r14
  1042b5:	41 55                	push   %r13
  1042b7:	53                   	push   %rbx
  1042b8:	48 83 ec 30          	sub    $0x30,%rsp
  1042bc:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  1042c1:	48 8b df             	mov    %rdi,%rbx
  1042c4:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  1042c8:	0f 85 fe 00 00 00    	jne    1043cc <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex+0x11c>
  1042ce:	48 8b d6             	mov    %rsi,%rdx
  1042d1:	48 33 53 48          	xor    0x48(%rbx),%rdx
  1042d5:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  1042dc:	c1 7c 51 
  1042df:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  1042e3:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  1042e8:	48 89 06             	mov    %rax,(%rsi)
  1042eb:	48 8b f7             	mov    %rdi,%rsi
  1042ee:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  1042f2:	49 8b ff             	mov    %r15,%rdi
  1042f5:	ba 40 00 00 00       	mov    $0x40,%edx
  1042fa:	e8 81 fe f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1042ff:	4c 33 f8             	xor    %rax,%r15
  104302:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  104309:	c1 7c 51 
  10430c:	4d 0f af fe          	imul   %r14,%r15
  104310:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  104314:	48 8b 12             	mov    (%rdx),%rdx
  104317:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  10431b:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  104320:	48 89 37             	mov    %rsi,(%rdi)
  104323:	48 8b f2             	mov    %rdx,%rsi
  104326:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  10432a:	ba 40 00 00 00       	mov    $0x40,%edx
  10432f:	e8 4c fe f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104334:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  104338:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  10433d:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  104341:	48 8b 12             	mov    (%rdx),%rdx
  104344:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  104348:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
--
0000000000104480 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>:
  104480:	55                   	push   %rbp
  104481:	41 57                	push   %r15
  104483:	41 56                	push   %r14
  104485:	41 55                	push   %r13
  104487:	53                   	push   %rbx
  104488:	48 83 ec 30          	sub    $0x30,%rsp
  10448c:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  104491:	48 8b df             	mov    %rdi,%rbx
  104494:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  104498:	0f 85 ec 00 00 00    	jne    10458a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap+0x10a>
  10449e:	48 8b d6             	mov    %rsi,%rdx
  1044a1:	48 33 53 48          	xor    0x48(%rbx),%rdx
  1044a5:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  1044ac:	c1 7c 51 
  1044af:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  1044b3:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  1044b8:	48 89 06             	mov    %rax,(%rsi)
  1044bb:	48 8b f7             	mov    %rdi,%rsi
  1044be:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  1044c2:	49 8b ff             	mov    %r15,%rdi
  1044c5:	ba 40 00 00 00       	mov    $0x40,%edx
  1044ca:	e8 b1 fc f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1044cf:	4c 33 f8             	xor    %rax,%r15
  1044d2:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  1044d9:	c1 7c 51 
  1044dc:	4d 0f af fe          	imul   %r14,%r15
  1044e0:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  1044e4:	48 8b 12             	mov    (%rdx),%rdx
  1044e7:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  1044eb:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  1044f0:	48 89 37             	mov    %rsi,(%rdi)
  1044f3:	48 8b f2             	mov    %rdx,%rsi
  1044f6:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  1044fa:	ba 40 00 00 00       	mov    $0x40,%edx
  1044ff:	e8 7c fc f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104504:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  104508:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  10450d:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  104511:	48 8b 12             	mov    (%rdx),%rdx
  104514:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  104518:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  10451d:	48 89 37             	mov    %rsi,(%rdi)
  104520:	48 8b f2             	mov    %rdx,%rsi
  104523:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  104527:	ba 40 00 00 00       	mov    $0x40,%edx
  10452c:	e8 4f fc f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104531:	4c 8b e8             	mov    %rax,%r13
  104534:	4c 0f af 6b 18       	imul   0x18(%rbx),%r13
  104539:	4c 33 73 48          	xor    0x48(%rbx),%r14
  10453d:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  104544:	c1 7c 51 
  104547:	49 0f af d6          	imul   %r14,%rdx
  10454b:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  104552:	49 33 d7             	xor    %r15,%rdx
  104555:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  10455a:	48 8b 3b             	mov    (%rbx),%rdi
  10455d:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
  104561:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  104566:	48 89 06             	mov    %rax,(%rsi)
  104569:	48 8b f7             	mov    %rdi,%rsi
  10456c:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  104570:	ba 40 00 00 00       	mov    $0x40,%edx
  104575:	e8 06 fc f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  10457a:	49 03 c5             	add    %r13,%rax
  10457d:	48 83 c4 30          	add    $0x30,%rsp
  104581:	5b                   	pop    %rbx
  104582:	41 5d                	pop    %r13
  104584:	41 5e                	pop    %r14
  104586:	41 5f                	pop    %r15
  104588:	5d                   	pop    %rbp
  104589:	c3                   	ret
  10458a:	48 8b fe             	mov    %rsi,%rdi
  10458d:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  104591:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
  104595:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  10459c:	c1 7c 51 
  10459f:	e8 3c f8 f7 ff       	call   83de0 <S_P_CoreLib_System_Math__BigMul_0>
  1045a4:	48 8b f0             	mov    %rax,%rsi
  1045a7:	4c 8b 7d b8          	mov    -0x48(%rbp),%r15
  1045ab:	49 8b ff             	mov    %r15,%rdi
  1045ae:	ba 40 00 00 00       	mov    $0x40,%edx
  1045b3:	e8 c8 fb f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1045b8:	4c 33 f8             	xor    %rax,%r15
  1045bb:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  1045c2:	c1 7c 51 
  1045c5:	4d 0f af fe          	imul   %r14,%r15
  1045c9:	48 8b fb             	mov    %rbx,%rdi
  1045cc:	49 8b f7             	mov    %r15,%rsi
  1045cf:	e8 8c 00 00 00       	call   104660 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__BucketInPart>
  1045d4:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  1045d8:	40 0f b6 3c 07       	rex movzbl (%rdi,%rax,1),%edi
  1045dd:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  1045e1:	49 0f af fe          	imul   %r14,%rdi
  1045e5:	48 8d b3 80 00 00 00 	lea    0x80(%rbx),%rsi
  1045ec:	49 33 ff             	xor    %r15,%rdi
  1045ef:	48 0f af 7e 08       	imul   0x8(%rsi),%rdi
  1045f4:	48 8b 16             	mov    (%rsi),%rdx
  1045f7:	33 f6                	xor    %esi,%esi
  1045f9:	33 c9                	xor    %ecx,%ecx
  1045fb:	e8 30 fb f8 ff       	call   94130 <S_P_CoreLib_System_UInt128__op_Multiply>
