	.arch armv8-a+fp+simd
	.file	"analise.c"
	.section	.text.unlikely,"ax",%progbits
	.align	2
	.type	handleError.part.0, %function
handleError.part.0:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x1, [x29,24]
	bl	PAPI_strerror
	adrp	x1, .LC0
	ldr	x2, [x29,24]
	mov	x3, x0
	add	x1, x1, :lo12:.LC0
	mov	w0, 1
	bl	__printf_chk
	mov	w0, 1
	bl	exit
	.size	handleError.part.0, .-handleError.part.0
	.text
	.align	2
	.global	handleError
	.type	handleError, %function
handleError:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	tbnz	w0, #31, .L5
	ldp	x29, x30, [sp], 16
	ret
.L5:
	bl	handleError.part.0
	.size	handleError, .-handleError
	.align	2
	.global	initAnalise
	.type	initAnalise, %function
initAnalise:
	stp	x29, x30, [sp, -64]!
	add	x29, sp, 0
	stp	x19, x20, [sp,16]
	mov	w20, w0
	mov	x0, 48
	stp	x21, x22, [sp,32]
	str	x23, [sp,48]
	bl	malloc
	cmp	w20, 1
	str	w20, [x0]
	mov	x19, x0
	beq	.L8
	cmp	w20, 2
	beq	.L9
	cbz	w20, .L19
	adrp	x1, .LC1
	mov	w0, 1
	add	x1, x1, :lo12:.LC1
	bl	__printf_chk
	mov	w0, 1
	bl	exit
.L19:
	mov	x0, 12
	mov	x22, 24
	bl	malloc
	mov	x21, x0
	mov	w1, 64
	movk	w1, 0x8000, lsl 16
	mov	w0, 2
	movk	w0, 0x8000, lsl 16
	str	w1, [x21]
	str	w0, [x21,8]
	mov	w1, -2147483648
	mov	w20, 3
	str	w1, [x21,4]
.L11:
	mov	w0, 84148224
	bl	PAPI_library_init
	tbnz	w0, #31, .L20
	bl	PAPI_num_counters
	tbnz	w0, #31, .L21
	cmp	w20, w0
	bgt	.L22
	mov	w1, w20
	mov	x0, x21
	bl	PAPI_start_counters
	tbnz	w0, #31, .L23
	str	w20, [x19,4]
	bl	seconds_per_tick
	mov	x0, x22
	str	d0, [x19,32]
	bl	malloc
	str	x0, [x19,8]
	mov	x0, 64
	bl	malloc
	mov	x22, x0
	mov	x0, 64
	bl	malloc
	mov	x21, x0
	bl	PAPI_get_real_cyc
	mov	x23, x0
	ldr	x0, [x19,8]
	mov	w1, w20
	bl	PAPI_read_counters
	tbnz	w0, #31, .L24
	mov	w2, 2
	mov	x0, x22
	mov	x1, x21
	mov	w3, w2
	mov	w4, w2
	mov	w5, 5
	bl	StencilProbe
	ldr	x0, [x19,8]
	mov	w1, w20
	bl	PAPI_read_counters
	tbnz	w0, #31, .L25
	bl	PAPI_get_real_cyc
	sub	x0, x0, x23
	ldr	d0, [x19,32]
	scvtf	d1, x0
	mov	x0, x22
	fmul	d0, d0, d1
	str	d0, [x19,40]
	bl	free
	mov	x0, x21
	bl	free
	mov	x0, x19
	ldp	x21, x22, [sp,32]
	ldp	x19, x20, [sp,16]
	ldr	x23, [sp,48]
	ldp	x29, x30, [sp], 64
	ret
.L9:
	mov	x0, 4
	mov	x22, 8
	bl	malloc
	mov	x21, x0
	mov	w0, 50
	movk	w0, 0x8000, lsl 16
	mov	w20, 1
	str	w0, [x21]
	b	.L11
.L8:
	mov	x0, 8
	mov	x22, 16
	bl	malloc
	mov	x21, x0
	mov	w1, 50
	mov	w0, 59
	movk	w1, 0x8000, lsl 16
	movk	w0, 0x8000, lsl 16
	str	w1, [x21]
	str	w0, [x21,4]
	mov	w20, 2
	b	.L11
.L20:
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	bl	handleError.part.0
.L21:
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	bl	handleError.part.0
.L22:
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	puts
	mov	w0, 1
	bl	exit
.L23:
	adrp	x1, .LC5
	add	x1, x1, :lo12:.LC5
	bl	handleError.part.0
.L24:
	adrp	x1, .LC6
	add	x1, x1, :lo12:.LC6
	bl	handleError.part.0
.L25:
	adrp	x1, .LC7
	add	x1, x1, :lo12:.LC7
	bl	handleError.part.0
	.size	initAnalise, .-initAnalise
	.align	2
	.global	startAnalise
	.type	startAnalise, %function
startAnalise:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp,16]
	mov	x19, x0
	bl	PAPI_get_real_cyc
	ldr	w1, [x19,4]
	str	x0, [x19,16]
	ldr	x0, [x19,8]
	bl	PAPI_read_counters
	tbnz	w0, #31, .L28
	ldr	x19, [sp,16]
	ldp	x29, x30, [sp], 32
	ret
.L28:
	adrp	x1, .LC8
	add	x1, x1, :lo12:.LC8
	bl	handleError.part.0
	.size	startAnalise, .-startAnalise
	.align	2
	.global	finishAnalise
	.type	finishAnalise, %function
finishAnalise:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp,16]
	mov	x19, x0
	ldr	x0, [x0,8]
	ldr	w1, [x19,4]
	bl	PAPI_read_counters
	tbnz	w0, #31, .L31
	bl	PAPI_get_real_cyc
	str	x0, [x19,24]
	ldr	x19, [sp,16]
	ldp	x29, x30, [sp], 32
	ret
.L31:
	adrp	x1, .LC9
	add	x1, x1, :lo12:.LC9
	bl	handleError.part.0
	.size	finishAnalise, .-finishAnalise
	.align	2
	.global	printResult
	.type	printResult, %function
printResult:
	sub	w4, w1, #2
	ldr	x6, [x0,24]
	ldr	x5, [x0,16]
	add	w7, w4, w4, lsl 1
	sub	x5, x6, x5
	add	w4, w4, w7, lsl 2
	scvtf	d0, x5
	sub	w5, w2, #2
	ldr	d2, [x0,32]
	ldr	d1, [x0,40]
	mul	w4, w4, w5
	sub	w6, w3, #2
	fnmsub	d0, d2, d0, d1
	mul	w4, w4, w6
	mul	w1, w1, w2
	ldr	w5, [x0]
	ldr	d2, .LC10
	scvtf	d1, w4
	mul	w3, w1, w3
	cmp	w5, 1
	fdiv	d1, d1, d0
	sxtw	x2, w3
	fmul	d1, d1, d2
	beq	.L34
	cmp	w5, 2
	beq	.L32
	cbz	w5, .L38
	adrp	x0, .LC13
	add	x0, x0, :lo12:.LC13
	b	puts
.L38:
	ldr	x1, [x0,8]
	ldr	x0, [x1,8]
	ldr	x3, [x1]
	ldr	x1, [x1,16]
	sub	x4, x3, x0
	sub	x1, x0, x1
	scvtf	d5, x4
	scvtf	d4, x1
	scvtf	d2, x3
	scvtf	d3, x0
	adrp	x1, .LC11
	mov	w0, 1
	fdiv	d2, d5, d2
	add	x1, x1, :lo12:.LC11
	fdiv	d3, d4, d3
	b	__printf_chk
.L32:
	ret
.L34:
	ldr	x0, [x0,8]
	ldr	x1, [x0]
	ldr	x0, [x0,8]
	scvtf	d3, x1
	scvtf	d2, x0
	adrp	x1, .LC12
	mov	w0, w5
	add	x1, x1, :lo12:.LC12
	fdiv	d2, d3, d2
	b	__printf_chk
	.size	printResult, .-printResult
	.align	3
.LC10:
	.word	0
	.word	1041235968
	.align	2
	.global	releaseAnaliseData
	.type	releaseAnaliseData, %function
releaseAnaliseData:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	str	x19, [sp,16]
	mov	x19, x0
	ldr	x0, [x0,8]
	ldr	w1, [x19,4]
	bl	PAPI_stop_counters
	tbnz	w0, #31, .L41
	ldr	x0, [x19,8]
	ldr	x19, [sp,16]
	ldp	x29, x30, [sp], 32
	b	free
.L41:
	adrp	x1, .LC14
	add	x1, x1, :lo12:.LC14
	bl	handleError.part.0
	.size	releaseAnaliseData, .-releaseAnaliseData
	.align	2
	.global	getTime
	.type	getTime, %function
getTime:
	ldr	x2, [x0,24]
	ldr	x1, [x0,16]
	ldr	d2, [x0,32]
	ldr	d1, [x0,40]
	sub	x0, x2, x1
	scvtf	d0, x0
	fnmsub	d0, d2, d0, d1
	ret
	.size	getTime, .-getTime
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	.string	"[%s] - %s\n"
	.zero	5
.LC1:
	.string	"[initAnalise] - Undefined analise"
	.zero	6
.LC2:
	.string	"initAnalise.library_init"
	.zero	7
.LC3:
	.string	"initAnalise.num_couters"
.LC4:
	.string	"[initAnalise] - Insufficient counters"
	.zero	2
.LC5:
	.string	"initAnalise.start_counters"
	.zero	5
.LC6:
	.string	"initAnalise.read_counters1"
	.zero	5
.LC7:
	.string	"initAnalise.read_counters2"
	.zero	5
.LC8:
	.string	"startAnalise"
	.zero	3
.LC9:
	.string	"finishAnalise"
	.zero	2
.LC11:
	.string	"%ld;%g;%g;%g;%g\n"
	.zero	7
.LC12:
	.string	"%ld;%g;%g;%g\n"
	.zero	2
.LC13:
	.string	"[printResult] - undefined analise type"
	.zero	1
.LC14:
	.string	"releaseAnaliseData"
	.ident	"GCC: (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",%progbits
