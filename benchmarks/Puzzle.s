	.file	"Puzzle.c"
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
	.globl	Fit
	.type	Fit, @function
Fit:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L5
.L8:
	movl	-4(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$9, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L6
	movl	-24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	puzzl(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L6
	movl	$0, %eax
	jmp	.L7
.L6:
	addl	$1, -4(%rbp)
.L5:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	piecemax(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	%eax, -4(%rbp)
	jle	.L8
	movl	$1, %eax
.L7:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	Fit, .-Fit
	.globl	Place
	.type	Place, @function
Place:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L10
.L12:
	movl	-4(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$9, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L11
	movl	-24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	puzzl(%rip), %rax
	movl	$1, (%rdx,%rax)
.L11:
	addl	$1, -4(%rbp)
.L10:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	piecemax(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	%eax, -4(%rbp)
	jle	.L12
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	class(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	piececount(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	class(%rip), %rax
	movl	(%rcx,%rax), %eax
	leal	-1(%rdx), %ecx
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	piececount(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	-24(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L13
.L16:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	puzzl(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	jne	.L14
	movl	-4(%rbp), %eax
	jmp	.L15
.L14:
	addl	$1, -4(%rbp)
.L13:
	cmpl	$511, -4(%rbp)
	jle	.L16
	movl	$0, %eax
.L15:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	Place, .-Place
	.globl	Remove
	.type	Remove, @function
Remove:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L18
.L20:
	movl	-4(%rbp), %eax
	cltq
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$9, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L19
	movl	-24(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	puzzl(%rip), %rax
	movl	$0, (%rdx,%rax)
.L19:
	addl	$1, -4(%rbp)
.L18:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	piecemax(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	%eax, -4(%rbp)
	jle	.L20
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	class(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	piececount(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	class(%rip), %rax
	movl	(%rcx,%rax), %eax
	leal	1(%rdx), %ecx
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	piececount(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	Remove, .-Remove
	.globl	Trial
	.type	Trial, @function
Trial:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	kount(%rip), %eax
	addl	$1, %eax
	movl	%eax, kount(%rip)
	movl	$0, -8(%rbp)
	jmp	.L22
.L27:
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	class(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	piececount(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	je	.L23
	movl	-20(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	Fit
	testl	%eax, %eax
	je	.L23
	movl	-20(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	Place
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	Trial
	testl	%eax, %eax
	jne	.L24
	cmpl	$0, -4(%rbp)
	jne	.L25
.L24:
	movl	$1, %eax
	jmp	.L26
.L25:
	movl	-20(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	Remove
.L23:
	addl	$1, -8(%rbp)
.L22:
	cmpl	$12, -8(%rbp)
	jle	.L27
	movl	$0, %eax
.L26:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	Trial, .-Trial
	.section	.rodata
.LC0:
	.string	"Error1 in Puzzle"
.LC1:
	.string	"Error2 in Puzzle."
.LC2:
	.string	"Error3 in Puzzle."
.LC3:
	.string	"%d\n"
	.text
	.globl	Puzzle
	.type	Puzzle, @function
Puzzle:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	jmp	.L29
.L30:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	puzzl(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L29:
	cmpl	$511, -4(%rbp)
	jle	.L30
	movl	$1, -16(%rbp)
	jmp	.L31
.L36:
	movl	$1, -12(%rbp)
	jmp	.L32
.L35:
	movl	$1, -8(%rbp)
	jmp	.L33
.L34:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	puzzl(%rip), %rax
	movl	$0, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L33:
	cmpl	$5, -8(%rbp)
	jle	.L34
	addl	$1, -12(%rbp)
.L32:
	cmpl	$5, -12(%rbp)
	jle	.L35
	addl	$1, -16(%rbp)
.L31:
	cmpl	$5, -16(%rbp)
	jle	.L36
	movl	$0, -16(%rbp)
	jmp	.L37
.L40:
	movl	$0, -4(%rbp)
	jmp	.L38
.L39:
	movl	-4(%rbp), %eax
	cltq
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$9, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$0, (%rdx,%rax)
	addl	$1, -4(%rbp)
.L38:
	cmpl	$511, -4(%rbp)
	jle	.L39
	addl	$1, -16(%rbp)
.L37:
	cmpl	$12, -16(%rbp)
	jle	.L40
	movl	$0, -16(%rbp)
	jmp	.L41
.L46:
	movl	$0, -12(%rbp)
	jmp	.L42
.L45:
	movl	$0, -8(%rbp)
	jmp	.L43
.L44:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L43:
	cmpl	$0, -8(%rbp)
	jle	.L44
	addl	$1, -12(%rbp)
.L42:
	cmpl	$1, -12(%rbp)
	jle	.L45
	addl	$1, -16(%rbp)
.L41:
	cmpl	$3, -16(%rbp)
	jle	.L46
	movl	$0, class(%rip)
	movl	$11, piecemax(%rip)
	movl	$0, -16(%rbp)
	jmp	.L47
.L52:
	movl	$0, -12(%rbp)
	jmp	.L48
.L51:
	movl	$0, -8(%rbp)
	jmp	.L49
.L50:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$512, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L49:
	cmpl	$3, -8(%rbp)
	jle	.L50
	addl	$1, -12(%rbp)
.L48:
	cmpl	$0, -12(%rbp)
	jle	.L51
	addl	$1, -16(%rbp)
.L47:
	cmpl	$1, -16(%rbp)
	jle	.L52
	movl	$0, 4+class(%rip)
	movl	$193, 4+piecemax(%rip)
	movl	$0, -16(%rbp)
	jmp	.L53
.L58:
	movl	$0, -12(%rbp)
	jmp	.L54
.L57:
	movl	$0, -8(%rbp)
	jmp	.L55
.L56:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1024, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L55:
	cmpl	$1, -8(%rbp)
	jle	.L56
	addl	$1, -12(%rbp)
.L54:
	cmpl	$3, -12(%rbp)
	jle	.L57
	addl	$1, -16(%rbp)
.L53:
	cmpl	$0, -16(%rbp)
	jle	.L58
	movl	$0, 8+class(%rip)
	movl	$88, 8+piecemax(%rip)
	movl	$0, -16(%rbp)
	jmp	.L59
.L64:
	movl	$0, -12(%rbp)
	jmp	.L60
.L63:
	movl	$0, -8(%rbp)
	jmp	.L61
.L62:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$1536, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L61:
	cmpl	$0, -8(%rbp)
	jle	.L62
	addl	$1, -12(%rbp)
.L60:
	cmpl	$3, -12(%rbp)
	jle	.L63
	addl	$1, -16(%rbp)
.L59:
	cmpl	$1, -16(%rbp)
	jle	.L64
	movl	$0, 12+class(%rip)
	movl	$25, 12+piecemax(%rip)
	movl	$0, -16(%rbp)
	jmp	.L65
.L70:
	movl	$0, -12(%rbp)
	jmp	.L66
.L69:
	movl	$0, -8(%rbp)
	jmp	.L67
.L68:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2048, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L67:
	cmpl	$1, -8(%rbp)
	jle	.L68
	addl	$1, -12(%rbp)
.L66:
	cmpl	$0, -12(%rbp)
	jle	.L69
	addl	$1, -16(%rbp)
.L65:
	cmpl	$3, -16(%rbp)
	jle	.L70
	movl	$0, 16+class(%rip)
	movl	$67, 16+piecemax(%rip)
	movl	$0, -16(%rbp)
	jmp	.L71
.L76:
	movl	$0, -12(%rbp)
	jmp	.L72
.L75:
	movl	$0, -8(%rbp)
	jmp	.L73
.L74:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$2560, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L73:
	cmpl	$3, -8(%rbp)
	jle	.L74
	addl	$1, -12(%rbp)
.L72:
	cmpl	$1, -12(%rbp)
	jle	.L75
	addl	$1, -16(%rbp)
.L71:
	cmpl	$0, -16(%rbp)
	jle	.L76
	movl	$0, 20+class(%rip)
	movl	$200, 20+piecemax(%rip)
	movl	$0, -16(%rbp)
	jmp	.L77
.L82:
	movl	$0, -12(%rbp)
	jmp	.L78
.L81:
	movl	$0, -8(%rbp)
	jmp	.L79
.L80:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3072, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L79:
	cmpl	$0, -8(%rbp)
	jle	.L80
	addl	$1, -12(%rbp)
.L78:
	cmpl	$0, -12(%rbp)
	jle	.L81
	addl	$1, -16(%rbp)
.L77:
	cmpl	$2, -16(%rbp)
	jle	.L82
	movl	$1, 24+class(%rip)
	movl	$2, 24+piecemax(%rip)
	movl	$0, -16(%rbp)
	jmp	.L83
.L88:
	movl	$0, -12(%rbp)
	jmp	.L84
.L87:
	movl	$0, -8(%rbp)
	jmp	.L85
.L86:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$3584, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L85:
	cmpl	$0, -8(%rbp)
	jle	.L86
	addl	$1, -12(%rbp)
.L84:
	cmpl	$2, -12(%rbp)
	jle	.L87
	addl	$1, -16(%rbp)
.L83:
	cmpl	$0, -16(%rbp)
	jle	.L88
	movl	$1, 28+class(%rip)
	movl	$16, 28+piecemax(%rip)
	movl	$0, -16(%rbp)
	jmp	.L89
.L94:
	movl	$0, -12(%rbp)
	jmp	.L90
.L93:
	movl	$0, -8(%rbp)
	jmp	.L91
.L92:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$4096, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L91:
	cmpl	$2, -8(%rbp)
	jle	.L92
	addl	$1, -12(%rbp)
.L90:
	cmpl	$0, -12(%rbp)
	jle	.L93
	addl	$1, -16(%rbp)
.L89:
	cmpl	$0, -16(%rbp)
	jle	.L94
	movl	$1, 32+class(%rip)
	movl	$128, 32+piecemax(%rip)
	movl	$0, -16(%rbp)
	jmp	.L95
.L100:
	movl	$0, -12(%rbp)
	jmp	.L96
.L99:
	movl	$0, -8(%rbp)
	jmp	.L97
.L98:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$4608, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L97:
	cmpl	$0, -8(%rbp)
	jle	.L98
	addl	$1, -12(%rbp)
.L96:
	cmpl	$1, -12(%rbp)
	jle	.L99
	addl	$1, -16(%rbp)
.L95:
	cmpl	$1, -16(%rbp)
	jle	.L100
	movl	$2, 36+class(%rip)
	movl	$9, 36+piecemax(%rip)
	movl	$0, -16(%rbp)
	jmp	.L101
.L106:
	movl	$0, -12(%rbp)
	jmp	.L102
.L105:
	movl	$0, -8(%rbp)
	jmp	.L103
.L104:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$5120, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L103:
	cmpl	$1, -8(%rbp)
	jle	.L104
	addl	$1, -12(%rbp)
.L102:
	cmpl	$0, -12(%rbp)
	jle	.L105
	addl	$1, -16(%rbp)
.L101:
	cmpl	$1, -16(%rbp)
	jle	.L106
	movl	$2, 40+class(%rip)
	movl	$65, 40+piecemax(%rip)
	movl	$0, -16(%rbp)
	jmp	.L107
.L112:
	movl	$0, -12(%rbp)
	jmp	.L108
.L111:
	movl	$0, -8(%rbp)
	jmp	.L109
.L110:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$5632, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L109:
	cmpl	$1, -8(%rbp)
	jle	.L110
	addl	$1, -12(%rbp)
.L108:
	cmpl	$1, -12(%rbp)
	jle	.L111
	addl	$1, -16(%rbp)
.L107:
	cmpl	$0, -16(%rbp)
	jle	.L112
	movl	$2, 44+class(%rip)
	movl	$72, 44+piecemax(%rip)
	movl	$0, -16(%rbp)
	jmp	.L113
.L118:
	movl	$0, -12(%rbp)
	jmp	.L114
.L117:
	movl	$0, -8(%rbp)
	jmp	.L115
.L116:
	movl	-8(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	leal	0(,%rax,8), %edx
	movl	-16(%rbp), %eax
	addl	%edx, %eax
	cltq
	addq	$6144, %rax
	leaq	0(,%rax,4), %rdx
	leaq	p(%rip), %rax
	movl	$1, (%rdx,%rax)
	addl	$1, -8(%rbp)
.L115:
	cmpl	$1, -8(%rbp)
	jle	.L116
	addl	$1, -12(%rbp)
.L114:
	cmpl	$1, -12(%rbp)
	jle	.L117
	addl	$1, -16(%rbp)
.L113:
	cmpl	$1, -16(%rbp)
	jle	.L118
	movl	$3, 48+class(%rip)
	movl	$73, 48+piecemax(%rip)
	movl	$13, piececount(%rip)
	movl	$3, 4+piececount(%rip)
	movl	$1, 8+piececount(%rip)
	movl	$1, 12+piececount(%rip)
	movl	$73, -4(%rbp)
	movl	$0, kount(%rip)
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$0, %edi
	call	Fit
	testl	%eax, %eax
	je	.L119
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$0, %edi
	call	Place
	movl	%eax, n(%rip)
	jmp	.L120
.L119:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
.L120:
	movl	n(%rip), %eax
	movl	%eax, %edi
	call	Trial
	testl	%eax, %eax
	jne	.L121
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
	jmp	.L122
.L121:
	movl	kount(%rip), %eax
	cmpl	$2005, %eax
	je	.L122
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
.L122:
	movl	n(%rip), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	kount(%rip), %eax
	movl	%eax, %esi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	Puzzle, .-Puzzle
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
	jmp	.L124
.L125:
	movl	$0, %eax
	call	Puzzle
	addl	$1, -4(%rbp)
.L124:
	cmpl	$4, -4(%rbp)
	jle	.L125
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
