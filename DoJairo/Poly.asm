	.cpu cortex-a53+fp+simd
	.file	"Poly.c"
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
	.global	PolyU0
	.type	PolyU0, %function
PolyU0:
	cmp	x2, xzr
	lsl	x4, x2, 2
	mov	x3, 0
	ble	.L2
.L8:
	ldr	s3, [x0,x3]
	fmov	s2, s0
	mov	w2, 8192
.L5:
	subs	w2, w2, #1
	fmadd	s2, s2, s3, s1
	bne	.L5
	str	s2, [x1,x3]
	add	x3, x3, 4
	cmp	x3, x4
	bne	.L8
.L2:
	ret
	.size	PolyU0, .-PolyU0
	.align	2
	.global	PolyU2
	.type	PolyU2, %function
PolyU2:
	cmp	x2, xzr
	ble	.L10
	sub	x4, x2, #1
	lsr	x4, x4, 1
	add	x4, x4, 1
	lsl	x4, x4, 3
	mov	x3, 0
.L15:
	add	x2, x0, x3
	ldr	s5, [x0,x3]
	fmov	s2, s0
	fmov	s3, s0
	ldr	s4, [x2,4]
	mov	w2, 8192
.L13:
	subs	w2, w2, #1
	fmadd	s3, s3, s5, s1
	fmadd	s2, s2, s4, s1
	bne	.L13
	str	s3, [x1,x3]
	add	x2, x1, x3
	add	x3, x3, 8
	cmp	x3, x4
	str	s2, [x2,4]
	bne	.L15
.L10:
	ret
	.size	PolyU2, .-PolyU2
	.align	2
	.global	PolyU4
	.type	PolyU4, %function
PolyU4:
	cmp	x2, xzr
	movi	v5.4s, 0
	ins	v5.s[0], v1.s[0]
	ins	v5.s[1], v1.s[0]
	ins	v5.s[2], v1.s[0]
	ins	v5.s[3], v1.s[0]
	ble	.L16
	sub	x8, x2, #1
	lsr	x8, x8, 2
	add	x5, x0, 16
	add	x8, x5, x8, lsl 4
.L21:
	ldr	s2, [x0]
	ins	v3.s[0], v2.s[0]
	ldr	s2, [x0,4]
	fmov	d1, x3
	ins	v3.s[1], v2.s[0]
	ldr	s2, [x0,12]
	mov	w2, 8192
	ins	v1.d[1], x4
	ldr	s4, [x0,8]
	ins	v1.s[0], v0.s[0]
	ins	v3.s[2], v4.s[0]
	ins	v1.s[1], v0.s[0]
	ins	v3.s[3], v2.s[0]
	ins	v1.s[2], v0.s[0]
	fmul	v2.4s, v5.4s, v3.4s
	ins	v1.s[3], v0.s[0]
.L19:
	subs	w2, w2, #1
	fadd	v1.4s, v1.4s, v2.4s
	bne	.L19
	umov	x3, v1.d[0]
	umov	x4, v1.d[1]
	lsr	x5, x3, 32
	lsr	x2, x4, 32
	add	x0, x0, 16
	cmp	x0, x8
	str	w3, [x1]
	str	w5, [x1,4]
	str	w4, [x1,8]
	str	w2, [x1,12]
	add	x1, x1, 16
	bne	.L21
.L16:
	ret
	.size	PolyU4, .-PolyU4
	.align	2
	.global	PolyU8
	.type	PolyU8, %function
PolyU8:
	cmp	x2, xzr
	movi	v7.4s, 0
	ins	v7.s[0], v1.s[0]
	ins	v7.s[1], v1.s[0]
	ins	v7.s[2], v1.s[0]
	ins	v7.s[3], v1.s[0]
	ble	.L22
	sub	x14, x2, #1
	lsr	x14, x14, 3
	add	x7, x0, 32
	add	x14, x7, x14, lsl 5
.L27:
	ldr	s3, [x0]
	ins	v5.s[0], v3.s[0]
	ldr	s3, [x0,8]
	ldr	s4, [x0,4]
	ins	v5.s[1], v4.s[0]
	ins	v5.s[2], v3.s[0]
	ldr	s3, [x0,16]
	ldr	s4, [x0,12]
	ins	v6.s[0], v3.s[0]
	ldr	s3, [x0,20]
	ins	v5.s[3], v4.s[0]
	ins	v6.s[1], v3.s[0]
	ldr	s4, [x0,24]
	ldr	s3, [x0,28]
	fmov	d2, x3
	fmov	d1, x5
	mov	w2, 8192
	ins	v6.s[2], v4.s[0]
	ins	v2.d[1], x4
	ins	v1.d[1], x6
	ins	v2.s[0], v0.s[0]
	ins	v1.s[0], v0.s[0]
	ins	v2.s[1], v0.s[0]
	ins	v1.s[1], v0.s[0]
	ins	v2.s[2], v0.s[0]
	ins	v1.s[2], v0.s[0]
	ins	v6.s[3], v3.s[0]
	ins	v2.s[3], v0.s[0]
	ins	v1.s[3], v0.s[0]
	fmul	v4.4s, v7.4s, v5.4s
	fmul	v3.4s, v7.4s, v6.4s
.L25:
	subs	w2, w2, #1
	fadd	v2.4s, v2.4s, v4.4s
	fadd	v1.4s, v1.4s, v3.4s
	bne	.L25
	umov	x3, v2.d[0]
	umov	x4, v2.d[1]
	umov	x5, v1.d[0]
	umov	x6, v1.d[1]
	lsr	x9, x3, 32
	lsr	x8, x4, 32
	lsr	x7, x5, 32
	lsr	x2, x6, 32
	add	x0, x0, 32
	cmp	x0, x14
	str	w3, [x1]
	str	w9, [x1,4]
	str	w4, [x1,8]
	str	w8, [x1,12]
	str	w5, [x1,16]
	str	w7, [x1,20]
	str	w6, [x1,24]
	str	w2, [x1,28]
	add	x1, x1, 32
	bne	.L27
.L22:
	ret
	.size	PolyU8, .-PolyU8
	.align	2
	.global	PolyU16
	.type	PolyU16, %function
PolyU16:
	sub	sp, sp, #80
	cmp	x2, xzr
	movi	v21.4s, 0
	stp	x19, x20, [sp]
	stp	x21, x22, [sp,16]
	stp	x23, x24, [sp,32]
	stp	x25, x26, [sp,48]
	str	x27, [sp,64]
	ins	v21.s[0], v1.s[0]
	ins	v21.s[1], v1.s[0]
	ins	v21.s[2], v1.s[0]
	ins	v21.s[3], v1.s[0]
	ble	.L28
	mov	x12, 0
.L33:
	ldr	s5, [x0]
	ins	v17.s[0], v5.s[0]
	ldr	s5, [x0,8]
	ldr	s6, [x0,4]
	ins	v17.s[1], v6.s[0]
	ins	v17.s[2], v5.s[0]
	ldr	s5, [x0,16]
	ldr	s6, [x0,12]
	ins	v18.s[0], v5.s[0]
	ldr	s5, [x0,24]
	ins	v17.s[3], v6.s[0]
	ldr	s6, [x0,20]
	ins	v18.s[1], v6.s[0]
	ins	v18.s[2], v5.s[0]
	ldr	s5, [x0,32]
	ldr	s6, [x0,28]
	ins	v19.s[0], v5.s[0]
	ldr	s5, [x0,40]
	ins	v18.s[3], v6.s[0]
	ldr	s6, [x0,36]
	ins	v19.s[1], v6.s[0]
	ins	v19.s[2], v5.s[0]
	ldr	s5, [x0,48]
	ldr	s6, [x0,44]
	ins	v20.s[0], v5.s[0]
	ldr	s5, [x0,52]
	ins	v19.s[3], v6.s[0]
	ins	v20.s[1], v5.s[0]
	ldr	s6, [x0,56]
	ldr	s5, [x0,60]
	fmov	d4, x4
	fmov	d3, x6
	fmov	d2, x8
	fmov	d1, x10
	mov	w3, 8192
	ins	v20.s[2], v6.s[0]
	ins	v4.d[1], x5
	ins	v3.d[1], x7
	ins	v4.s[0], v0.s[0]
	ins	v3.s[0], v0.s[0]
	ins	v4.s[1], v0.s[0]
	ins	v3.s[1], v0.s[0]
	ins	v4.s[2], v0.s[0]
	ins	v3.s[2], v0.s[0]
	ins	v2.d[1], x9
	ins	v1.d[1], x11
	ins	v2.s[0], v0.s[0]
	ins	v1.s[0], v0.s[0]
	ins	v2.s[1], v0.s[0]
	ins	v1.s[1], v0.s[0]
	ins	v2.s[2], v0.s[0]
	ins	v1.s[2], v0.s[0]
	ins	v20.s[3], v5.s[0]
	ins	v4.s[3], v0.s[0]
	ins	v3.s[3], v0.s[0]
	ins	v2.s[3], v0.s[0]
	ins	v1.s[3], v0.s[0]
	fmul	v16.4s, v21.4s, v17.4s
	fmul	v7.4s, v21.4s, v18.4s
	fmul	v6.4s, v21.4s, v19.4s
	fmul	v5.4s, v21.4s, v20.4s
.L31:
	subs	w3, w3, #1
	fadd	v4.4s, v4.4s, v16.4s
	fadd	v3.4s, v3.4s, v7.4s
	fadd	v2.4s, v2.4s, v6.4s
	fadd	v1.4s, v1.4s, v5.4s
	bne	.L31
	umov	x4, v4.d[0]
	umov	x5, v4.d[1]
	umov	x6, v3.d[0]
	umov	x7, v3.d[1]
	umov	x8, v2.d[0]
	umov	x9, v2.d[1]
	umov	x10, v1.d[0]
	umov	x11, v1.d[1]
	lsr	x19, x4, 32
	lsr	x18, x5, 32
	lsr	x17, x6, 32
	lsr	x16, x7, 32
	lsr	x15, x8, 32
	lsr	x14, x9, 32
	lsr	x13, x10, 32
	lsr	x3, x11, 32
	add	x12, x12, 16
	cmp	x2, x12
	str	w4, [x1]
	str	w19, [x1,4]
	str	w5, [x1,8]
	str	w18, [x1,12]
	str	w6, [x1,16]
	str	w17, [x1,20]
	str	w7, [x1,24]
	str	w16, [x1,28]
	str	w8, [x1,32]
	str	w15, [x1,36]
	str	w9, [x1,40]
	str	w14, [x1,44]
	str	w10, [x1,48]
	str	w13, [x1,52]
	str	w11, [x1,56]
	str	w3, [x1,60]
	add	x0, x0, 64
	add	x1, x1, 64
	bgt	.L33
.L28:
	ldp	x19, x20, [sp]
	ldp	x21, x22, [sp,16]
	ldp	x23, x24, [sp,32]
	ldp	x25, x26, [sp,48]
	ldr	x27, [sp,64]
	add	sp, sp, 80
	ret
	.size	PolyU16, .-PolyU16
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -80]!
	mov	x0, 1048576
	add	x29, sp, 0
	stp	x19, x20, [sp,16]
	stp	x21, x22, [sp,32]
	stp	d8, d9, [sp,48]
	str	d10, [sp,64]
	bl	malloc
	mov	x20, x0
	mov	x0, 1048576
	bl	malloc
	ubfx	x1, x20, 2, 2
	neg	x1, x1
	ands	x1, x1, 3
	mov	x21, x0
	beq	.L46
	fmov	s0, 1.0e+0
	cmp	x1, 1
	str	s0, [x20]
	bls	.L47
	cmp	x1, 2
	str	s0, [x20,4]
	bls	.L48
	mov	x0, 65533
	movk	x0, 0x3, lsl 16
	mov	x2, 3
	str	s0, [x20,8]
.L35:
	mov	x5, 262144
	sub	x5, x5, x1
	lsr	x6, x5, 2
	lsl	x3, x6, 2
	add	x1, x20, x1, lsl 2
	mov	x4, 0
	fmov	v0.4s, 1.0e+0
.L41:
	add	x4, x4, 1
	cmp	x4, x6
	st1	{v0.4s}, [x1],16
	bcc	.L41
	cmp	x5, x3
	add	x2, x2, x3
	sub	x0, x0, x3
	beq	.L39
	fmov	s0, 1.0e+0
	cmp	x0, 1
	str	s0, [x20,x2,lsl 2]
	add	x1, x2, 1
	beq	.L39
	cmp	x0, 2
	str	s0, [x20,x1,lsl 2]
	add	x2, x2, 2
	beq	.L39
	str	s0, [x20,x2,lsl 2]
.L39:
	mov	x2, 1048576
	mov	w1, 0
	mov	x0, x21
	bl	memset
	bl	wall_time
	fmov	d8, d0
	mov	x2, 0
	fmov	s3, 1.0e+0
.L45:
	ldr	s2, [x20,x2]
	mov	w19, 8192
	fmov	s1, 1.0e+0
.L43:
	subs	w19, w19, #1
	fmadd	s1, s2, s1, s3
	bne	.L43
	str	s1, [x21,x2]
	add	x2, x2, 4
	cmp	x2, 1048576
	bne	.L45
	bl	wall_time
	fsub	d1, d0, d8
	ldr	d9, .LC2
	ldr	d8, .LC3
	adrp	x22, .LC1
	fdiv	d2, d8, d1
	fmov	d0, d1
	add	x22, x22, :lo12:.LC1
	mov	x3, 262144
	mov	w2, w19
	mov	x1, x22
	mov	w0, 1
	fdiv	d3, d9, d1
	fcvt	s2, d2
	fcvt	d2, s2
	fcvt	s1, d3
	fcvt	d1, s1
	bl	__printf_chk
	bl	wall_time
	fmov	d10, d0
	fmov	s0, 1.0e+0
	mov	x0, x20
	fmov	s1, s0
	mov	x1, x21
	mov	x2, 262144
	bl	PolyU2
	bl	wall_time
	fsub	d1, d0, d10
	mov	x3, 262144
	mov	x1, x22
	mov	w2, 2
	fdiv	d2, d8, d1
	fmov	d0, d1
	mov	w0, 1
	fdiv	d3, d9, d1
	fcvt	s2, d2
	fcvt	d2, s2
	fcvt	s1, d3
	fcvt	d1, s1
	bl	__printf_chk
	bl	wall_time
	fmov	d10, d0
	fmov	s0, 1.0e+0
	mov	x0, x20
	fmov	s1, s0
	mov	x1, x21
	mov	x2, 262144
	bl	PolyU4
	bl	wall_time
	fsub	d1, d0, d10
	mov	x3, 262144
	mov	x1, x22
	mov	w2, 4
	fdiv	d2, d8, d1
	fmov	d0, d1
	mov	w0, 1
	fdiv	d3, d9, d1
	fcvt	s2, d2
	fcvt	d2, s2
	fcvt	s1, d3
	fcvt	d1, s1
	bl	__printf_chk
	bl	wall_time
	fmov	d10, d0
	fmov	s0, 1.0e+0
	mov	x0, x20
	fmov	s1, s0
	mov	x1, x21
	mov	x2, 262144
	bl	PolyU8
	bl	wall_time
	fsub	d1, d0, d10
	mov	x3, 262144
	mov	x1, x22
	mov	w2, 8
	fdiv	d3, d9, d1
	fmov	d0, d1
	mov	w0, 1
	fdiv	d2, d8, d1
	fcvt	s1, d3
	fcvt	d1, s1
	fcvt	s2, d2
	fcvt	d2, s2
	bl	__printf_chk
	bl	wall_time
	fmov	d10, d0
	fmov	s0, 1.0e+0
	mov	x0, x20
	fmov	s1, s0
	mov	x1, x21
	mov	x2, 262144
	bl	PolyU16
	bl	wall_time
	fsub	d1, d0, d10
	mov	x1, x22
	mov	w2, 16
	mov	x3, 262144
	fdiv	d2, d8, d1
	fmov	d0, d1
	mov	w0, 1
	fdiv	d9, d9, d1
	fcvt	s2, d2
	fcvt	d2, s2
	fcvt	s1, d9
	fcvt	d1, s1
	bl	__printf_chk
	mov	x0, x20
	bl	free
	mov	x0, x21
	bl	free
	mov	w0, w19
	ldp	x21, x22, [sp,32]
	ldp	x19, x20, [sp,16]
	ldp	d8, d9, [sp,48]
	ldr	d10, [sp,64]
	ldp	x29, x30, [sp], 80
	ret
.L48:
	mov	x0, 262142
	mov	x2, 2
	b	.L35
.L47:
	mov	x0, 262143
	mov	x2, 1
	b	.L35
.L46:
	mov	x0, 262144
	mov	x2, x1
	b	.L35
	.size	main, .-main
	.align	3
.LC2:
	.word	3894859413
	.word	1063333387
	.align	3
.LC3:
	.word	3894859413
	.word	1074867723
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC1:
	.string	"unroll=%d, tamanho=%ld, tempo=%f, gBytes=%f, gFlops=%f\n"
	.ident	"GCC: (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",%progbits
