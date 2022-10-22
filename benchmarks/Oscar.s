	.file	"Oscar.c"
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
	.globl	Cos
	.type	Cos, @function
Cos:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -20(%rbp)
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, -8(%rbp)
	movl	$1, -12(%rbp)
	movss	-20(%rbp), %xmm0
	movss	%xmm0, -4(%rbp)
	movl	$2, -16(%rbp)
	jmp	.L5
.L8:
	movl	-12(%rbp), %eax
	imull	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
	movss	-4(%rbp), %xmm0
	mulss	-20(%rbp), %xmm0
	movss	%xmm0, -4(%rbp)
	movl	-16(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L6
	movl	-16(%rbp), %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	.L7
	cvtsi2ss	-12(%rbp), %xmm0
	movss	-4(%rbp), %xmm1
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	-8(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
	jmp	.L6
.L7:
	cvtsi2ss	-12(%rbp), %xmm0
	movss	-4(%rbp), %xmm1
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	-8(%rbp), %xmm1
	subss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movss	%xmm0, -8(%rbp)
.L6:
	addl	$1, -16(%rbp)
.L5:
	cmpl	$10, -16(%rbp)
	jle	.L8
	movss	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	Cos, .-Cos
	.globl	Min0
	.type	Min0, @function
Min0:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.L11
	movl	-4(%rbp), %eax
	jmp	.L12
.L11:
	movl	-8(%rbp), %eax
.L12:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	Min0, .-Min0
	.section	.rodata
.LC1:
	.string	"  %15.3f%15.3f"
	.text
	.globl	Printcomplex
	.type	Printcomplex, @function
Printcomplex:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movl	$10, %edi
	call	putchar@PLT
	movl	-28(%rbp), %eax
	movl	%eax, -4(%rbp)
.L14:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC1(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	movl	-36(%rbp), %eax
	addl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm1
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC1(%rip), %rdi
	movl	$2, %eax
	call	printf@PLT
	movl	$10, %edi
	call	putchar@PLT
	movl	-36(%rbp), %eax
	addl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jle	.L14
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	Printcomplex, .-Printcomplex
	.globl	Uniform11
	.type	Uniform11, @function
Uniform11:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	imull	$4855, %eax, %eax
	addl	$1731, %eax
	andl	$8191, %eax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cvtsi2ss	%eax, %xmm0
	movss	.LC2(%rip), %xmm1
	divss	%xmm1, %xmm0
	movq	-16(%rbp), %rax
	movss	%xmm0, (%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	Uniform11, .-Uniform11
	.globl	Exptab
	.type	Exptab, @function
Exptab:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movl	%edi, -148(%rbp)
	movq	%rsi, -160(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movss	.LC3(%rip), %xmm0
	movss	%xmm0, -120(%rbp)
	movss	.LC4(%rip), %xmm0
	movss	%xmm0, -140(%rbp)
	movl	$1, -136(%rbp)
	jmp	.L17
.L18:
	movss	-120(%rbp), %xmm0
	divss	-140(%rbp), %xmm0
	call	Cos
	addss	%xmm0, %xmm0
	movss	.LC0(%rip), %xmm1
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	movl	-136(%rbp), %eax
	cltq
	movss	%xmm0, -112(%rbp,%rax,4)
	movss	-140(%rbp), %xmm0
	addss	%xmm0, %xmm0
	movss	%xmm0, -140(%rbp)
	addl	$1, -136(%rbp)
.L17:
	cmpl	$25, -136(%rbp)
	jle	.L18
	movl	-148(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -116(%rbp)
	movl	-116(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -124(%rbp)
	movl	$1, -132(%rbp)
	movq	-160(%rbp), %rax
	addq	$8, %rax
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, (%rax)
	movq	-160(%rbp), %rax
	addq	$8, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, 4(%rax)
	movl	-124(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	movl	-124(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, 4(%rax)
	movl	-116(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movss	.LC6(%rip), %xmm0
	movss	%xmm0, (%rax)
	movl	-116(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, 4(%rax)
.L20:
	movl	-124(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -136(%rbp)
	movl	-136(%rbp), %eax
	movl	%eax, -128(%rbp)
.L19:
	movl	-132(%rbp), %eax
	cltq
	movss	-112(%rbp,%rax,4), %xmm1
	movl	-128(%rbp), %edx
	movl	-136(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm2
	movl	-128(%rbp), %eax
	subl	-136(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	addss	%xmm2, %xmm0
	movl	-128(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	mulss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	movl	-132(%rbp), %eax
	cltq
	movss	-112(%rbp,%rax,4), %xmm1
	movl	-128(%rbp), %edx
	movl	-136(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm2
	movl	-128(%rbp), %eax
	subl	-136(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	addss	%xmm2, %xmm0
	movl	-128(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	mulss	%xmm1, %xmm0
	movss	%xmm0, 4(%rax)
	movl	-124(%rbp), %eax
	addl	%eax, -128(%rbp)
	movl	-128(%rbp), %eax
	cmpl	-116(%rbp), %eax
	jle	.L19
	movl	-132(%rbp), %eax
	addl	$1, %eax
	movl	$25, %esi
	movl	%eax, %edi
	call	Min0
	movl	%eax, -132(%rbp)
	movl	-136(%rbp), %eax
	movl	%eax, -124(%rbp)
	cmpl	$1, -124(%rbp)
	jg	.L20
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	Exptab, .-Exptab
	.globl	Fft
	.type	Fft, @function
Fft:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movss	%xmm0, -40(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -4(%rbp)
	movl	$1, -12(%rbp)
.L25:
	movl	$0, -16(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	$1, -24(%rbp)
.L23:
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movl	-4(%rbp), %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movl	-24(%rbp), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movl	-4(%rbp), %edx
	movl	-24(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	movl	-24(%rbp), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	addss	%xmm1, %xmm0
	movss	%xmm0, 4(%rax)
	movl	-16(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movl	-24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm2
	subss	%xmm2, %xmm0
	mulss	%xmm1, %xmm0
	movl	-16(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm2
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movl	-24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm3
	subss	%xmm3, %xmm1
	mulss	%xmm2, %xmm1
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	subss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	movl	-16(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm0
	movl	-24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm2
	subss	%xmm2, %xmm0
	mulss	%xmm0, %xmm1
	movl	-16(%rbp), %eax
	cltq
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm2
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movl	-24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm3
	subss	%xmm3, %xmm0
	mulss	%xmm2, %xmm0
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	addss	%xmm1, %xmm0
	movss	%xmm0, 4(%rax)
	addl	$1, -24(%rbp)
	movl	-24(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jle	.L23
	movl	-20(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jle	.L23
	movl	$1, -8(%rbp)
.L24:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-48(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	addl	$1, -8(%rbp)
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jle	.L24
	sall	-12(%rbp)
	movl	-12(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jle	.L25
	movl	$1, -24(%rbp)
	jmp	.L26
.L27:
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	mulss	-40(%rbp), %xmm0
	movss	%xmm0, (%rax)
	movss	-40(%rbp), %xmm1
	movss	.LC7(%rip), %xmm0
	xorps	%xmm1, %xmm0
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm1
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	mulss	%xmm1, %xmm0
	movss	%xmm0, 4(%rax)
	addl	$1, -24(%rbp)
.L26:
	movl	-24(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jle	.L27
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	Fft, .-Fft
	.globl	Oscar
	.type	Oscar, @function
Oscar:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	e(%rip), %rsi
	movl	$256, %edi
	call	Exptab
	movq	$5767, seed(%rip)
	movl	$1, -12(%rbp)
	jmp	.L29
.L30:
	movq	seed(%rip), %rax
	movl	%eax, -16(%rbp)
	leaq	-16(%rbp), %rax
	leaq	zr(%rip), %rsi
	movq	%rax, %rdi
	call	Uniform11
	movl	-16(%rbp), %eax
	cltq
	movq	%rax, seed(%rip)
	leaq	-16(%rbp), %rax
	leaq	zi(%rip), %rsi
	movq	%rax, %rdi
	call	Uniform11
	movl	-16(%rbp), %eax
	cltq
	movq	%rax, seed(%rip)
	movss	zr(%rip), %xmm1
	movss	.LC8(%rip), %xmm0
	mulss	%xmm1, %xmm0
	movss	.LC9(%rip), %xmm1
	subss	%xmm1, %xmm0
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	z(%rip), %rax
	movss	%xmm0, (%rdx,%rax)
	movss	zi(%rip), %xmm1
	movss	.LC8(%rip), %xmm0
	mulss	%xmm1, %xmm0
	movss	.LC9(%rip), %xmm1
	subss	%xmm1, %xmm0
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	4+z(%rip), %rax
	movss	%xmm0, (%rdx,%rax)
	addl	$1, -12(%rbp)
.L29:
	cmpl	$256, -12(%rbp)
	jle	.L30
	movl	$1, -12(%rbp)
	jmp	.L31
.L32:
	movss	.LC10(%rip), %xmm0
	leaq	e(%rip), %rcx
	leaq	w(%rip), %rdx
	leaq	z(%rip), %rsi
	movl	$256, %edi
	call	Fft
	addl	$1, -12(%rbp)
.L31:
	cmpl	$20, -12(%rbp)
	jle	.L32
	movl	$17, %ecx
	movl	$256, %edx
	movl	$1, %esi
	leaq	z(%rip), %rdi
	call	Printcomplex
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L33
	call	__stack_chk_fail@PLT
.L33:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	Oscar, .-Oscar
	.globl	main
	.type	main, @function
main:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L35
.L36:
	movl	$0, %eax
	call	Oscar
	addl	$1, -4(%rbp)
.L35:
	cmpl	$9, -4(%rbp)
	jle	.L36
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1065353216
	.align 4
.LC2:
	.long	1174405120
	.align 4
.LC3:
	.long	1078530011
	.align 4
.LC4:
	.long	1082130432
	.align 4
.LC6:
	.long	3212836864
	.align 16
.LC7:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.align 4
.LC8:
	.long	1101004800
	.align 4
.LC9:
	.long	1092616192
	.align 4
.LC10:
	.long	1031798784
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
