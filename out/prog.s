	.file	"prog.cpp"
	.text
	.section	.rodata._ZStL19piecewise_construct,"a",@progbits
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.section	.bss._ZStL8__ioinit,"aw",@nobits
	.type	_ZStL8__ioinit, @object
	.size	_ZStL8__ioinit, 1
_ZStL8__ioinit:
	.zero	1
	.section	.rodata._ZL9constTest,"a",@progbits
	.type	_ZL9constTest, @object
	.size	_ZL9constTest, 1
_ZL9constTest:
	.byte	8
	.section	.rodata._ZL15staticConstTest,"a",@progbits
	.type	_ZL15staticConstTest, @object
	.size	_ZL15staticConstTest, 1
_ZL15staticConstTest:
	.byte	7
	.section	.rodata._ZL12constVarTest,"a",@progbits
	.align 2
	.type	_ZL12constVarTest, @object
	.size	_ZL12constVarTest, 2
_ZL12constVarTest:
	.value	6
	.globl	extConstVarTest
	.section	.rodata.extConstVarTest,"a",@progbits
	.align 2
	.type	extConstVarTest, @object
	.size	extConstVarTest, 2
extConstVarTest:
	.value	5
	.section	.rodata._ZL13staticVarTest,"a",@progbits
	.align 4
	.type	_ZL13staticVarTest, @object
	.size	_ZL13staticVarTest, 4
_ZL13staticVarTest:
	.long	4
	.globl	varTest
	.section	.data.varTest,"aw",@progbits
	.align 4
	.type	varTest, @object
	.size	varTest, 4
varTest:
	.long	3
	.section	.text._Z9testDelayv,"axG",@progbits,_Z9testDelayv,comdat
	.weak	_Z9testDelayv
	.type	_Z9testDelayv, @function
_Z9testDelayv:
.LFB1493:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$100663295, -4(%rbp)
	movl	$0, -8(%rbp)
.L3:
	cmpl	$100663294, -8(%rbp)
	ja	.L4
	addl	$1, -8(%rbp)
	jmp	.L3
.L4:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1493:
	.size	_Z9testDelayv, .-_Z9testDelayv
	.section	.text._ZL9testfunc2v,"ax",@progbits
	.type	_ZL9testfunc2v, @function
_ZL9testfunc2v:
.LFB1494:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movb	$15, -2(%rbp)
	movb	$15, -1(%rbp)
	call	_Z9testDelayv
	movzbl	-1(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1494:
	.size	_ZL9testfunc2v, .-_ZL9testfunc2v
	.section	.bss._ZZ9testfunc1vE13locStaticTest,"aw",@nobits
	.align 2
	.type	_ZZ9testfunc1vE13locStaticTest, @object
	.size	_ZZ9testfunc1vE13locStaticTest, 2
_ZZ9testfunc1vE13locStaticTest:
	.zero	2
	.section	.rodata._ZZ9testfunc1vE18locStaticConstReps,"a",@progbits
	.align 8
	.type	_ZZ9testfunc1vE18locStaticConstReps, @object
	.size	_ZZ9testfunc1vE18locStaticConstReps, 8
_ZZ9testfunc1vE18locStaticConstReps:
	.quad	8
	.section	.text._Z9testfunc1v,"ax",@progbits
	.globl	_Z9testfunc1v
	.type	_Z9testfunc1v, @function
_Z9testfunc1v:
.LFB1495:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movzwl	_ZZ9testfunc1vE13locStaticTest(%rip), %eax
	addl	$1, %eax
	movw	%ax, _ZZ9testfunc1vE13locStaticTest(%rip)
	call	_Z9testDelayv
	movl	$8, -4(%rbp)
.L9:
	cmpl	$0, -4(%rbp)
	je	.L8
	call	_ZL9testfunc2v
	subl	$1, -4(%rbp)
	jmp	.L9
.L8:
	movl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1495:
	.size	_Z9testfunc1v, .-_Z9testfunc1v
	.section	.rodata
.LC0:
	.string	"Test: "
	.section	.text.main,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB1496:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	$0, -8(%rbp)
	leaq	.LC0(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movl	$8, %esi
	movq	%rax, %rdi
	call	_ZNSolsEj@PLT
	movq	%rax, %rdx
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSolsEPFRSoS_E@PLT
	call	_Z9testfunc1v
	call	_ZL9testfunc2v
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1496:
	.size	main, .-main
	.section	.text._Z41__static_initialization_and_destruction_0ii,"ax",@progbits
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB1986:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L15
	cmpl	$65535, -8(%rbp)
	jne	.L15
	leaq	_ZStL8__ioinit(%rip), %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	__cxa_atexit@PLT
.L15:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1986:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.section	.text._GLOBAL__sub_I_extConstVarTest,"ax",@progbits
	.type	_GLOBAL__sub_I_extConstVarTest, @function
_GLOBAL__sub_I_extConstVarTest:
.LFB1987:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1987:
	.size	_GLOBAL__sub_I_extConstVarTest, .-_GLOBAL__sub_I_extConstVarTest
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_extConstVarTest
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
