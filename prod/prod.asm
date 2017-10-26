	.cpu cortex-a53+fp+simd
	.file	"prod.c"
	.text
	.align	2
	.global	wall_time
	.type	wall_time, %function
wall_time:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	add	x1, x29, 24
	add	x0, x29, 32
	bl	gettimeofday
	ldr	x0, [x29,40]
	ldr	d0, .LC0
	scvtf	d2, x0
	ldr	x0, [x29,32]
	ldp	x29, x30, [sp], 48
	fdiv	d0, d2, d0
	scvtf	d1, x0
	fadd	d0, d1, d0
	ret
	.size	wall_time, .-wall_time
	.align	3
.LC0:
	.word	0
	.word	1093567616
	.align	2
	.global	prodInterno
	.type	prodInterno, %function
prodInterno:
	ldr	d3, [x0,8]
	ldr	d5, [x0]
	ldr	d4, [x1]
	ldr	d2, [x1,8]
	fmul	d4, d5, d4
	fmul	d2, d3, d2
	add	x2, x0, 16
	add	x0, x1, 16
	mov	w1, 4095
	movi	v3.2d, 0
	ins	v3.d[0], v4.d[0]
	ins	v3.d[1], v2.d[0]
	umov	x3, v3.d[0]
	umov	x4, v3.d[1]
.L4:
	ldr	d2, [x0,8]
	ldr	d4, [x0]
	ins	v1.d[0], v4.d[0]
	ins	v1.d[1], v2.d[0]
	fmov	d2, x3
	subs	w1, w1, #1
	ldr	d5, [x2]
	ldr	d3, [x2,8]
	ins	v2.d[1], x4
	ins	v0.d[0], v5.d[0]
	add	x2, x2, 16
	ins	v0.d[1], v3.d[0]
	add	x0, x0, 16
	fmla	v2.2d, v0.2d, v1.2d
	umov	x3, v2.d[0]
	umov	x4, v2.d[1]
	bne	.L4
	fmov	d3, x3
	fmov	d1, x4
	fadd	d0, d3, d1
	ret
	.size	prodInterno, .-prodInterno
	.align	2
	.global	initVector
	.type	initVector, %function
initVector:
	ubfx	x2, x0, 3, 1
	cbz	w2, .L11
	mov	w6, 1
	str	d0, [x0]
.L7:
	mov	w4, 8192
	sub	w4, w4, w2
	uxtw	x2, w2
	lsr	w3, w4, 1
	lsl	w5, w3, 1
	add	x2, x0, x2, lsl 3
	mov	w1, 0
	dup	v1.2d, v0.d[0]
.L10:
	add	w1, w1, 1
	cmp	w1, w3
	st1	{v1.2d}, [x2],16
	bcc	.L10
	cmp	w4, w5
	add	w5, w6, w5
	beq	.L6
	str	d0, [x0,w5,sxtw 3]
.L6:
	ret
.L11:
	mov	w6, w2
	b	.L7
	.size	initVector, .-initVector
	.align	2
	.global	verify
	.type	verify, %function
verify:
	fsub	d0, d0, d1
	ldr	d1, .LC1
	mov	w0, 0
	fcmpe	d0, d1
	ble	.L13
	ldr	d1, .LC2
	fcmpe	d0, d1
	cset	w0, mi
.L13:
	ret
	.size	verify, .-verify
	.align	3
.LC1:
	.word	3539053052
	.word	-1085250995
	.align	3
.LC2:
	.word	3539053052
	.word	1062232653
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -64]!
	mov	x0, 65536
	add	x29, sp, 0
	str	x19, [sp,16]
	stp	d8, d9, [sp,24]
	bl	malloc
	mov	x19, x0
	mov	x0, 65536
	bl	malloc
	ubfx	x3, x19, 3, 1
	mov	x1, x0
	cbz	w3, .L31
	ldr	x0, .LC3
	mov	w6, 1
	str	x0, [x19]
.L19:
	mov	w0, 8192
	sub	w0, w0, w3
	uxtw	x3, w3
	lsr	w4, w0, 1
	lsl	w5, w4, 1
	add	x3, x19, x3, lsl 3
	mov	w2, 0
	adr	x7, .LC4
	ld1	{v0.2d}, [x7]
.L22:
	add	w2, w2, 1
	cmp	w2, w4
	st1	{v0.2d}, [x3],16
	bcc	.L22
	cmp	w0, w5
	add	w5, w6, w5
	beq	.L21
	ldr	x0, .LC3
	str	x0, [x19,w5,sxtw 3]
.L21:
	ubfx	x3, x1, 3, 1
	cbz	w3, .L32
	ldr	x0, .LC6
	mov	w6, 1
	str	x0, [x1]
.L23:
	mov	w0, 8192
	sub	w0, w0, w3
	uxtw	x3, w3
	lsr	w4, w0, 1
	lsl	w5, w4, 1
	add	x3, x1, x3, lsl 3
	mov	w2, 0
	adr	x7, .LC7
	ld1	{v0.2d}, [x7]
.L26:
	add	w2, w2, 1
	cmp	w2, w4
	st1	{v0.2d}, [x3],16
	bcc	.L26
	cmp	w0, w5
	add	w5, w6, w5
	beq	.L25
	ldr	x0, .LC6
	str	x0, [x1,w5,sxtw 3]
.L25:
	str	x1, [x29,56]
	bl	wall_time
	fmov	d8, d0
	ldr	x1, [x29,56]
	mov	x0, x19
	bl	prodInterno
	fmov	d9, d0
	bl	wall_time
	ldr	d2, .LC9
	fsub	d8, d0, d8
	fsub	d2, d9, d2
	ldr	d0, .LC10
	fcmpe	d2, d0
	bgt	.L35
.L27:
	adrp	x1, .LC16
	add	x1, x1, :lo12:.LC16
	mov	w0, 1
	bl	__printf_chk
.L30:
	ldr	d1, .LC13
	ldr	d0, .LC14
	fdiv	d1, d1, d8
	adrp	x1, .LC12
	add	x1, x1, :lo12:.LC12
	mov	w0, 1
	fmul	d0, d1, d0
	bl	__printf_chk
	mov	w0, 0
	ldr	x19, [sp,16]
	ldp	d8, d9, [sp,24]
	ldp	x29, x30, [sp], 64
	ret
.L35:
	ldr	d0, .LC11
	fcmpe	d2, d0
	bpl	.L27
	adrp	x1, .LC15
	add	x1, x1, :lo12:.LC15
	mov	w0, 1
	bl	__printf_chk
	b	.L30
.L31:
	mov	w6, w3
	b	.L19
.L32:
	mov	w6, w3
	b	.L23
	.size	main, .-main
	.align	3
.LC3:
	.word	3435973837
	.word	1073794252
	.align	4
.LC4:
	.word	3435973837
	.word	1073794252
	.word	3435973837
	.word	1073794252
	.align	3
.LC6:
	.word	2576980378
	.word	1074370969
	.align	4
.LC7:
	.word	2576980378
	.word	1074370969
	.word	2576980378
	.word	1074370969
	.align	3
.LC9:
	.word	2920577762
	.word	1089134919
	.align	3
.LC10:
	.word	3539053052
	.word	-1085250995
	.align	3
.LC11:
	.word	3539053052
	.word	1062232653
	.align	3
.LC13:
	.word	0
	.word	1087373184
	.align	3
.LC14:
	.word	0
	.word	1041235968
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC12:
	.string	"perf = %f (gflops)\n"
	.zero	4
.LC15:
	.string	"[OK] "
	.zero	2
.LC16:
	.string	"[ERROR] "
	.ident	"GCC: (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",%progbits
