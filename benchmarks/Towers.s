	.file	"Towers.c"
	.text
	.comm	value,4,4
	.comm	fixed,4,4
	.comm	floated,4,4
	.comm	seed,8,8
	.comm	permarray,44,32
	.comm	pctr,4,4
	.comm	tree,8,8
	.comm	stack,16,16
	.comm	cellspace,152,32
	.comm	freelist,4,4
	.comm	movesdone,4,4
	.comm	ima,6724,32
	.comm	imb,6724,32
	.comm	imr,6724,32
	.comm	rma,6724,32
	.comm	rmb,6724,32
	.comm	rmr,6724,32
	.comm	piececount,16,16
	.comm	class,52,32
	.comm	piecemax,52,32
	.comm	puzzl,2048,32
	.comm	p,26624,32
	.comm	n,4,4
	.comm	kount,4,4
	.comm	sortlist,20004,32
	.comm	biggest,4,4
	.comm	littlest,4,4
	.comm	top,4,4
	.comm	z,2056,32
	.comm	w,2056,32
	.comm	e,1040,32
	.comm	zr,4,4
	.comm	zi,4,4
	.globl	Initrand
	.type	Initrand, @function
Initrand:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	$74755, seed(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	Initrand, .-Initrand
	.globl	Rand
	.type	Rand, @function
Rand:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	seed(%rip), %rax
	imulq	$1309, %rax, %rax
	addq	$13849, %rax
	movzwl	%ax, %eax
	movq	%rax, seed(%rip)
	movq	seed(%rip), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	Rand, .-Rand
	.section	.rodata
.LC0:
	.string	" Error in Towers: %s\n"
	.text
	.globl	Error
	.type	Error, @function
Error:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	Error, .-Error
	.globl	Makenull
	.type	Makenull, @function
Makenull:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	stack(%rip), %rax
	movl	$0, (%rdx,%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	Makenull, .-Makenull
	.section	.rodata
.LC1:
	.string	"out of space   "
	.text
	.globl	Getelement
	.type	Getelement, @function
Getelement:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	freelist(%rip), %eax
	testl	%eax, %eax
	jle	.L7
	movl	freelist(%rip), %eax
	movl	%eax, -4(%rbp)
	movl	freelist(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	4+cellspace(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, freelist(%rip)
	jmp	.L8
.L7:
	leaq	.LC1(%rip), %rdi
	call	Error
.L8:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	Getelement, .-Getelement
	.section	.rodata
.LC2:
	.string	"disc size error"
	.text
	.globl	Push
	.type	Push, @function
Push:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$0, -8(%rbp)
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	stack(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	jle	.L11
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	stack(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	cellspace(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L11
	movl	$1, -8(%rbp)
	leaq	.LC2(%rip), %rdi
	call	Error
.L11:
	cmpl	$0, -8(%rbp)
	jne	.L13
	movl	$0, %eax
	call	Getelement
	movl	%eax, -4(%rbp)
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	stack(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	4+cellspace(%rip), %rax
	movl	%edx, (%rcx,%rax)
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	stack(%rip), %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rcx,%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	cellspace(%rip), %rax
	movl	-20(%rbp), %edx
	movl	%edx, (%rcx,%rax)
.L13:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	Push, .-Push
	.globl	Init
	.type	Init, @function
Init:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	Makenull
	movl	-24(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L15
.L16:
	movl	-20(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	Push
	subl	$1, -4(%rbp)
.L15:
	cmpl	$0, -4(%rbp)
	jg	.L16
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	Init, .-Init
	.section	.rodata
.LC3:
	.string	"nothing to pop "
	.text
	.globl	Pop
	.type	Pop, @function
Pop:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	stack(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	jle	.L18
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	stack(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	cellspace(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, -8(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	stack(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	4+cellspace(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	stack(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	freelist(%rip), %edx
	cltq
	leaq	0(,%rax,8), %rcx
	leaq	4+cellspace(%rip), %rax
	movl	%edx, (%rcx,%rax)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	stack(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, freelist(%rip)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	stack(%rip), %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rcx,%rax)
	movl	-8(%rbp), %eax
	jmp	.L19
.L18:
	leaq	.LC3(%rip), %rdi
	call	Error
	movl	$0, %eax
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	Pop, .-Pop
	.globl	Move
	.type	Move, @function
Move:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	Pop
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	%edx, %edi
	call	Push
	movl	movesdone(%rip), %eax
	addl	$1, %eax
	movl	%eax, movesdone(%rip)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	Move, .-Move
	.globl	tower
	.type	tower, @function
tower:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	cmpl	$1, -28(%rbp)
	jne	.L22
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	Move
	jmp	.L24
.L22:
	movl	$6, %eax
	subl	-20(%rbp), %eax
	subl	-24(%rbp), %eax
	movl	%eax, -4(%rbp)
	movl	-28(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-4(%rbp), %ecx
	movl	-20(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	tower
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	Move
	movl	-28(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-24(%rbp), %ecx
	movl	-4(%rbp), %eax
	movl	%ecx, %esi
	movl	%eax, %edi
	call	tower
.L24:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	tower, .-tower
	.section	.rodata
.LC4:
	.string	" Error in Towers."
.LC5:
	.string	"%d\n"
	.text
	.globl	Towers
	.type	Towers, @function
Towers:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$1, -4(%rbp)
	jmp	.L26
.L27:
	movl	-4(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	4+cellspace(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L26:
	cmpl	$18, -4(%rbp)
	jle	.L27
	movl	$18, freelist(%rip)
	movl	$14, %esi
	movl	$1, %edi
	call	Init
	movl	$2, %edi
	call	Makenull
	movl	$3, %edi
	call	Makenull
	movl	$0, movesdone(%rip)
	movl	$14, %edx
	movl	$2, %esi
	movl	$1, %edi
	call	tower
	movl	movesdone(%rip), %eax
	cmpl	$16383, %eax
	je	.L28
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
.L28:
	movl	movesdone(%rip), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	Towers, .-Towers
	.globl	main
	.type	main, @function
main:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L30
.L31:
	movl	$0, %eax
	call	Towers
	addl	$1, -4(%rbp)
.L30:
	cmpl	$9, -4(%rbp)
	jle	.L31
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
