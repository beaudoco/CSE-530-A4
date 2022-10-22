	.file	"Bubblesort.c"
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
	.globl	bInitarr
	.type	bInitarr, @function
bInitarr:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, %eax
	call	Initrand
	movl	$0, biggest(%rip)
	movl	$0, littlest(%rip)
	movl	$1, -12(%rbp)
	jmp	.L5
.L8:
	movl	$0, %eax
	call	Rand
	cltq
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	%eax, %esi
	movq	-8(%rbp), %rcx
	movabsq	$3022314549036572937, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	sarq	$14, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	imull	$100000, %eax, %eax
	subl	%eax, %esi
	movl	%esi, %eax
	subl	$50000, %eax
	movl	%eax, %ecx
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	sortlist(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	sortlist(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	biggest(%rip), %eax
	cmpl	%eax, %edx
	jle	.L6
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	sortlist(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, biggest(%rip)
	jmp	.L7
.L6:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	sortlist(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	littlest(%rip), %eax
	cmpl	%eax, %edx
	jge	.L7
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	sortlist(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, littlest(%rip)
.L7:
	addl	$1, -12(%rbp)
.L5:
	cmpl	$500, -12(%rbp)
	jle	.L8
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	bInitarr, .-bInitarr
	.section	.rodata
.LC0:
	.string	"Error3 in Bubble."
.LC1:
	.string	"%d\n"
	.text
	.globl	Bubble
	.type	Bubble, @function
Bubble:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$0, %eax
	call	bInitarr
	movl	$500, top(%rip)
	jmp	.L10
.L14:
	movl	$1, -8(%rbp)
	jmp	.L11
.L13:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	sortlist(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-8(%rbp), %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	sortlist(%rip), %rax
	movl	(%rcx,%rax), %eax
	cmpl	%eax, %edx
	jle	.L12
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	sortlist(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	sortlist(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	sortlist(%rip), %rax
	movl	%edx, (%rcx,%rax)
	movl	-8(%rbp), %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	sortlist(%rip), %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rcx,%rax)
.L12:
	addl	$1, -8(%rbp)
.L11:
	movl	top(%rip), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L13
	movl	top(%rip), %eax
	subl	$1, %eax
	movl	%eax, top(%rip)
.L10:
	movl	top(%rip), %eax
	cmpl	$1, %eax
	jg	.L14
	movl	4+sortlist(%rip), %edx
	movl	littlest(%rip), %eax
	cmpl	%eax, %edx
	jne	.L15
	movl	2000+sortlist(%rip), %edx
	movl	biggest(%rip), %eax
	cmpl	%eax, %edx
	je	.L16
.L15:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
.L16:
	movl	-20(%rbp), %eax
	addl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	sortlist(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	Bubble, .-Bubble
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L18
.L19:
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	Bubble
	addl	$1, -4(%rbp)
.L18:
	cmpl	$9, -4(%rbp)
	jle	.L19
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
