	.file	"Treesort.c"
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
	.globl	tInitarr
	.type	tInitarr, @function
tInitarr:
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
	.size	tInitarr, .-tInitarr
	.globl	CreateNode
	.type	CreateNode, @function
CreateNode:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	$0, 8(%rax)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movl	%edx, 16(%rax)
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	CreateNode, .-CreateNode
	.globl	Insert
	.type	Insert, @function
Insert:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jle	.L11
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L12
	movq	-16(%rbp), %rax
	movl	-4(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	call	CreateNode
	jmp	.L16
.L12:
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	Insert
	jmp	.L16
.L11:
	movq	-16(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jge	.L16
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	jne	.L15
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rdx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	CreateNode
	jmp	.L16
.L15:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	Insert
.L16:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	Insert, .-Insert
	.globl	Checktree
	.type	Checktree, @function
Checktree:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$1, -4(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L18
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	16(%rax), %edx
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	%eax, %edx
	jg	.L19
	movl	$0, -4(%rbp)
	jmp	.L18
.L19:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	Checktree
	testl	%eax, %eax
	je	.L20
	cmpl	$0, -4(%rbp)
	je	.L20
	movl	$1, %eax
	jmp	.L21
.L20:
	movl	$0, %eax
.L21:
	movl	%eax, -4(%rbp)
.L18:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L22
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	16(%rax), %edx
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	cmpl	%eax, %edx
	jl	.L23
	movl	$0, -4(%rbp)
	jmp	.L22
.L23:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	Checktree
	testl	%eax, %eax
	je	.L24
	cmpl	$0, -4(%rbp)
	je	.L24
	movl	$1, %eax
	jmp	.L25
.L24:
	movl	$0, %eax
.L25:
	movl	%eax, -4(%rbp)
.L22:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	Checktree, .-Checktree
	.section	.rodata
.LC0:
	.string	"%d\n"
.LC1:
	.string	" Error in Tree."
	.text
	.globl	Trees
	.type	Trees, @function
Trees:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$0, %eax
	call	tInitarr
	movl	$24, %edi
	call	malloc@PLT
	movq	%rax, tree(%rip)
	movq	tree(%rip), %rax
	movq	$0, (%rax)
	movq	tree(%rip), %rax
	movq	$0, 8(%rax)
	movq	tree(%rip), %rax
	movl	4+sortlist(%rip), %edx
	movl	%edx, 16(%rax)
	movl	$2, -4(%rbp)
	jmp	.L28
.L29:
	movq	tree(%rip), %rdx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	sortlist(%rip), %rax
	movl	(%rcx,%rax), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	Insert
	addl	$1, -4(%rbp)
.L28:
	cmpl	$5000, -4(%rbp)
	jle	.L29
	movl	-20(%rbp), %eax
	addl	$2, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	sortlist(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	tree(%rip), %rax
	movq	%rax, %rdi
	call	Checktree
	testl	%eax, %eax
	jne	.L31
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
.L31:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	Trees, .-Trees
	.globl	main
	.type	main, @function
main:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L33
.L34:
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	Trees
	addl	$1, -4(%rbp)
.L33:
	cmpl	$9, -4(%rbp)
	jle	.L34
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
