	.file	"Quicksort.c"
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
	.globl	Initarr
	.type	Initarr, @function
Initarr:
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
	cmpl	$5000, -12(%rbp)
	jle	.L8
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	Initarr, .-Initarr
	.globl	Quicksort
	.type	Quicksort, @function
Quicksort:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-28(%rbp), %edx
	movl	-32(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
	jmp	.L10
.L11:
	addl	$1, -16(%rbp)
.L10:
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -8(%rbp)
	jg	.L11
	jmp	.L12
.L13:
	subl	$1, -12(%rbp)
.L12:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L13
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jg	.L14
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,4), %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	movl	%eax, (%rdx)
	addl	$1, -16(%rbp)
	subl	$1, -12(%rbp)
.L14:
	movl	-16(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jle	.L10
	movl	-28(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	.L16
	movl	-12(%rbp), %edx
	movl	-28(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	Quicksort
.L16:
	movl	-16(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jge	.L18
	movl	-32(%rbp), %edx
	movl	-16(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	Quicksort
.L18:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	Quicksort, .-Quicksort
	.section	.rodata
.LC0:
	.string	" Error in Quick."
.LC1:
	.string	"%d\n"
	.text
	.globl	Quick
	.type	Quick, @function
Quick:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	$0, %eax
	call	Initarr
	movl	$5000, %edx
	movl	$1, %esi
	leaq	sortlist(%rip), %rdi
	call	Quicksort
	movl	4+sortlist(%rip), %edx
	movl	littlest(%rip), %eax
	cmpl	%eax, %edx
	jne	.L20
	movl	20000+sortlist(%rip), %edx
	movl	biggest(%rip), %eax
	cmpl	%eax, %edx
	je	.L21
.L20:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
.L21:
	movl	-4(%rbp), %eax
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
.LFE9:
	.size	Quick, .-Quick
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L23
.L24:
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	Quick
	addl	$1, -4(%rbp)
.L23:
	cmpl	$14, -4(%rbp)
	jle	.L24
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
