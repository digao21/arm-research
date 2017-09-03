	.file	"analise.c"
	.text
	.p2align 4,,15
.globl getTime
	.type	getTime, @function
getTime:
.LFB28:
	.cfi_startproc
	movq	24(%rdi), %rax
	subq	16(%rdi), %rax
	cvtsi2sdq	%rax, %xmm0
	mulsd	32(%rdi), %xmm0
	subsd	40(%rdi), %xmm0
	ret
	.cfi_endproc
.LFE28:
	.size	getTime, .-getTime
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%ld;%g;%g;%g;%g\n"
.LC2:
	.string	"%ld;%g;%g;%g\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[printResult] - undefined analise type"
	.text
	.p2align 4,,15
.globl printResult
	.type	printResult, @function
printResult:
.LFB26:
	.cfi_startproc
	movl	%edx, %eax
	leal	(%rsi,%rsi,2), %r8d
	subl	$2, %edx
	imull	%esi, %eax
	leal	-26(%rsi,%r8,4), %r8d
	imull	%ecx, %eax
	subl	$2, %ecx
	imull	%r8d, %edx
	movslq	%eax, %r9
	movq	24(%rdi), %rax
	subq	16(%rdi), %rax
	imull	%ecx, %edx
	cvtsi2sdq	%rax, %xmm0
	cvtsi2sd	%edx, %xmm1
	movl	(%rdi), %edx
	cmpl	$1, %edx
	mulsd	32(%rdi), %xmm0
	subsd	40(%rdi), %xmm0
	divsd	%xmm0, %xmm1
	mulsd	.LC0(%rip), %xmm1
	je	.L6
	cmpl	$2, %edx
	je	.L8
	testl	%edx, %edx
	jne	.L9
	movq	8(%rdi), %rax
	movq	%r9, %rsi
	movl	$.LC1, %edi
	movq	32(%rax), %rcx
	movq	16(%rax), %rdx
	addq	8(%rax), %rdx
	cvtsi2sdq	%rcx, %xmm3
	addq	24(%rax), %rcx
	cvtsi2sdq	%rdx, %xmm4
	cvtsi2sdq	%rcx, %xmm5
	movq	%rdx, %rcx
	subq	(%rax), %rcx
	movl	$4, %eax
	cvtsi2sdq	%rcx, %xmm2
	divsd	%xmm5, %xmm3
	divsd	%xmm4, %xmm2
	jmp	printf
	.p2align 4,,10
	.p2align 3
.L9:
	movl	$.LC3, %edi
	jmp	puts
	.p2align 4,,10
	.p2align 3
.L8:
	rep
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	movq	8(%rdi), %rax
	movq	%r9, %rsi
	movl	$.LC2, %edi
	cvtsi2sdq	(%rax), %xmm2
	cvtsi2sdq	8(%rax), %xmm3
	divsd	%xmm3, %xmm2
	movl	$3, %eax
	jmp	printf
	.cfi_endproc
.LFE26:
	.size	printResult, .-printResult
	.section	.rodata.str1.1
.LC4:
	.string	"[%s] - %s\n"
	.text
	.p2align 4,,15
.globl handleError
	.type	handleError, @function
handleError:
.LFB22:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	testl	%edi, %edi
	js	.L14
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L14:
	.cfi_restore_state
	movq	%rsi, 8(%rsp)
	call	PAPI_strerror
	movq	8(%rsp), %rsi
	movq	%rax, %rdx
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE22:
	.size	handleError, .-handleError
	.section	.rodata.str1.1
.LC5:
	.string	"startAnalise"
	.text
	.p2align 4,,15
.globl startAnalise
	.type	startAnalise, @function
startAnalise:
.LFB24:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	PAPI_get_real_cyc
	movl	4(%rbx), %esi
	movq	8(%rbx), %rdi
	movq	%rax, 16(%rbx)
	call	PAPI_read_counters
	testl	%eax, %eax
	js	.L18
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	movl	%eax, %edi
	.p2align 4,,7
	call	PAPI_strerror
	movl	$.LC4, %edi
	movq	%rax, %rdx
	movl	$.LC5, %esi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE24:
	.size	startAnalise, .-startAnalise
	.section	.rodata.str1.1
.LC6:
	.string	"releaseAnaliseData"
	.text
	.p2align 4,,15
.globl releaseAnaliseData
	.type	releaseAnaliseData, @function
releaseAnaliseData:
.LFB27:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movl	4(%rdi), %esi
	movq	8(%rdi), %rdi
	call	PAPI_stop_counters
	testl	%eax, %eax
	js	.L22
	movq	8(%rbx), %rdi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	free
.L22:
	.cfi_restore_state
	movl	%eax, %edi
	call	PAPI_strerror
	movl	$.LC4, %edi
	movq	%rax, %rdx
	movl	$.LC6, %esi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE27:
	.size	releaseAnaliseData, .-releaseAnaliseData
	.section	.rodata.str1.1
.LC7:
	.string	"finishAnalise"
	.text
	.p2align 4,,15
.globl finishAnalise
	.type	finishAnalise, @function
finishAnalise:
.LFB25:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movl	4(%rdi), %esi
	movq	8(%rdi), %rdi
	call	PAPI_read_counters
	testl	%eax, %eax
	js	.L26
	call	PAPI_get_real_cyc
	movq	%rax, 24(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	.p2align 4,,1
	ret
.L26:
	.cfi_restore_state
	movl	%eax, %edi
	call	PAPI_strerror
	movl	$.LC4, %edi
	movq	%rax, %rdx
	movl	$.LC7, %esi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE25:
	.size	finishAnalise, .-finishAnalise
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"[initAnalise] - Undefined analise"
	.section	.rodata.str1.1
.LC9:
	.string	"initAnalise.library_init"
.LC10:
	.string	"initAnalise.num_couters"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"[initAnalise] - Insufficient counters"
	.section	.rodata.str1.1
.LC12:
	.string	"initAnalise.start_counters"
.LC13:
	.string	"initAnalise.read_counters1"
.LC14:
	.string	"initAnalise.read_counters2"
	.text
	.p2align 4,,15
.globl initAnalise
	.type	initAnalise, @function
initAnalise:
.LFB23:
	.cfi_startproc
	movq	%rbx, -40(%rsp)
	movq	%rbp, -32(%rsp)
	movl	%edi, %ebp
	.cfi_offset 6, -40
	.cfi_offset 3, -48
	movq	%r12, -24(%rsp)
	movq	%r13, -16(%rsp)
	movl	$48, %edi
	movq	%r14, -8(%rsp)
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset 14, -16
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	call	malloc
	cmpl	$1, %ebp
	movq	%rax, %rbx
	movl	%ebp, (%rax)
	je	.L30
	cmpl	$2, %ebp
	je	.L31
	testl	%ebp, %ebp
	jne	.L40
	movl	$20, %edi
	movl	$40, %r13d
	movb	$5, %bpl
	call	malloc
	movq	%rax, %r12
	movl	$-2147483648, (%rax)
	movl	$-2147483595, 4(%rax)
	movl	$-2147483594, 8(%rax)
	movl	$-2147483646, 12(%rax)
	movl	$-2147483585, 16(%rax)
.L32:
	movl	$84148224, %edi
	call	PAPI_library_init
	testl	%eax, %eax
	js	.L42
	call	PAPI_num_counters
	testl	%eax, %eax
	.p2align 4,,4
	js	.L43
	cmpl	%eax, %ebp
	.p2align 4,,4
	jg	.L44
	movl	%ebp, %esi
	movq	%r12, %rdi
	call	PAPI_start_counters
	testl	%eax, %eax
	js	.L45
	xorl	%eax, %eax
	movl	%ebp, 4(%rbx)
	call	seconds_per_tick
	movq	%r13, %rdi
	movsd	%xmm0, 32(%rbx)
	call	malloc
	movl	$64, %edi
	movq	%rax, 8(%rbx)
	call	malloc
	movl	$64, %edi
	movq	%rax, %r12
	call	malloc
	movq	%rax, %r13
	call	PAPI_get_real_cyc
	movq	8(%rbx), %rdi
	movl	%ebp, %esi
	movq	%rax, %r14
	call	PAPI_read_counters
	testl	%eax, %eax
	js	.L46
	movl	$5, %r9d
	movl	$2, %r8d
	movl	$2, %ecx
	movl	$2, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	StencilProbe
	movq	8(%rbx), %rdi
	movl	%ebp, %esi
	call	PAPI_read_counters
	testl	%eax, %eax
	js	.L47
	call	PAPI_get_real_cyc
	subq	%r14, %rax
	movq	%r12, %rdi
	cvtsi2sdq	%rax, %xmm0
	mulsd	32(%rbx), %xmm0
	movsd	%xmm0, 40(%rbx)
	call	free
	movq	%r13, %rdi
	call	free
	movq	%rbx, %rax
	movq	8(%rsp), %rbp
	movq	(%rsp), %rbx
	movq	16(%rsp), %r12
	movq	24(%rsp), %r13
	movq	32(%rsp), %r14
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	.cfi_restore_state
	movl	$.LC8, %edi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L31:
	movl	$4, %edi
	movl	$8, %r13d
	movl	$1, %ebp
	call	malloc
	movq	%rax, %r12
	movl	$-2147483598, (%rax)
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L30:
	movl	$8, %edi
	movl	$16, %r13d
	movl	$2, %ebp
	call	malloc
	movq	%rax, %r12
	movl	$-2147483598, (%rax)
	movl	$-2147483589, 4(%rax)
	jmp	.L32
.L42:
	movl	%eax, %edi
	call	PAPI_strerror
	movl	$.LC9, %esi
	movq	%rax, %rdx
.L41:
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$1, %edi
	call	exit
.L43:
	movl	%eax, %edi
	call	PAPI_strerror
	movl	$.LC10, %esi
	movq	%rax, %rdx
	jmp	.L41
.L44:
	movl	$.LC11, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L45:
	movl	%eax, %edi
	call	PAPI_strerror
	movl	$.LC12, %esi
	movq	%rax, %rdx
	jmp	.L41
.L46:
	movl	%eax, %edi
	call	PAPI_strerror
	movl	$.LC13, %esi
	movq	%rax, %rdx
	jmp	.L41
.L47:
	movl	%eax, %edi
	call	PAPI_strerror
	movl	$.LC14, %esi
	movq	%rax, %rdx
	jmp	.L41
	.cfi_endproc
.LFE23:
	.size	initAnalise, .-initAnalise
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1041235968
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-11)"
	.section	.note.GNU-stack,"",@progbits
