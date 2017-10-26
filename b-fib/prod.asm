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
	.global	bFib
	.type	bFib, %function
bFib:
	mov	x4, 0
.L6:
	ldr	d1, [x0,x4]
	ldr	d2, [x1,x4]
	mov	w3, 4096
.L4:
	fmadd	d1, d0, d2, d1
	subs	w3, w3, #1
	fmadd	d2, d0, d1, d2
	bne	.L4
	str	d1, [x2,x4]
	add	x4, x4, 8
	cmp	x4, 1920
	bne	.L6
	ret
	.size	bFib, .-bFib
	.align	2
	.global	bFib_uj2
	.type	bFib_uj2, %function
bFib_uj2:
	mov	x4, 0
	movi	v2.2d, 0
	ins	v2.d[0], v0.d[0]
	ins	v2.d[1], v0.d[0]
.L12:
	ldr	d1, [x0,x4]
	fmov	d0, x5
	add	x8, x0, x4
	add	x7, x1, x4
	mov	w3, 4096
	ins	v0.d[1], x6
	ins	v0.d[0], v1.d[0]
	ldr	d6, [x8,8]
	orr	v1.16b, v0.16b, v0.16b
	ldr	d3, [x1,x4]
	ldr	d5, [x7,8]
	orr	v0.16b, v4.16b, v4.16b
	ins	v1.d[1], v6.d[0]
	ins	v0.d[0], v3.d[0]
	ins	v0.d[1], v5.d[0]
.L10:
	subs	w3, w3, #1
	fmla	v1.2d, v2.2d, v0.2d
	fmla	v0.2d, v1.2d, v2.2d
	bne	.L10
	add	x3, x2, x4
	umov	x5, v1.d[0]
	str	x5, [x2,x4]
	add	x4, x4, 16
	cmp	x4, 1920
	umov	x6, v1.d[1]
	str	x6, [x3,8]
	orr	v4.16b, v0.16b, v0.16b
	bne	.L12
	ret
	.size	bFib_uj2, .-bFib_uj2
	.align	2
	.global	bFib_uj4
	.type	bFib_uj4, %function
bFib_uj4:
	add	x3, x2, 8
	add	x11, x2, 1928
	movi	v1.2d, 0
	ins	v1.d[0], v0.d[0]
	ins	v1.d[1], v0.d[0]
.L17:
	fmov	d4, x4
	ldr	d3, [x0]
	fmov	d0, x6
	mov	w2, 4096
	ins	v4.d[1], x5
	ins	v4.d[0], v3.d[0]
	ldr	d3, [x0,16]
	ldr	d5, [x1]
	ins	v0.d[1], x7
	ins	v0.d[0], v3.d[0]
	ins	v2.d[0], v5.d[0]
	orr	v3.16b, v0.16b, v0.16b
	ldr	d7, [x0,8]
	ldr	d6, [x0,24]
	ldr	d16, [x1,8]
	ldr	d17, [x1,16]
	ldr	d5, [x1,24]
	orr	v0.16b, v18.16b, v18.16b
	ins	v2.d[1], v16.d[0]
	ins	v0.d[0], v17.d[0]
	ins	v4.d[1], v7.d[0]
	ins	v3.d[1], v6.d[0]
	ins	v0.d[1], v5.d[0]
.L18:
	subs	w2, w2, #1
	fmla	v4.2d, v1.2d, v2.2d
	fmla	v3.2d, v1.2d, v0.2d
	fmla	v2.2d, v4.2d, v1.2d
	fmla	v0.2d, v3.2d, v1.2d
	bne	.L18
	umov	x4, v4.d[0]
	umov	x5, v4.d[1]
	str	x4, [x3,-8]
	str	x5, [x3]
	umov	x6, v3.d[0]
	umov	x7, v3.d[1]
	str	x6, [x3,8]
	str	x7, [x3,16]
	add	x3, x3, 32
	cmp	x3, x11
	orr	v18.16b, v0.16b, v0.16b
	add	x0, x0, 32
	add	x1, x1, 32
	bne	.L17
	ret
	.size	bFib_uj4, .-bFib_uj4
	.align	2
	.global	bFib_uj8
	.type	bFib_uj8, %function
bFib_uj8:
	sub	sp, sp, #16
	mov	w12, 30
	movi	v1.2d, 0
	str	x19, [sp]
	ins	v1.d[0], v0.d[0]
	ins	v1.d[1], v0.d[0]
.L23:
	fmov	d16, x4
	fmov	d7, x6
	fmov	d6, x8
	ldr	d5, [x0]
	ins	v16.d[1], x5
	ins	v16.d[0], v5.d[0]
	ldr	d5, [x0,16]
	ins	v7.d[1], x7
	ins	v7.d[0], v5.d[0]
	ldr	d5, [x0,32]
	ins	v6.d[1], x9
	fmov	d0, x10
	ins	v6.d[0], v5.d[0]
	ldr	d5, [x0,48]
	ldr	d17, [x1]
	mov	w3, 4096
	ins	v4.d[0], v17.d[0]
	ldr	d17, [x1,16]
	ins	v0.d[1], x11
	ins	v3.d[0], v17.d[0]
	ins	v0.d[0], v5.d[0]
	ldr	d17, [x1,32]
	orr	v5.16b, v0.16b, v0.16b
	ins	v2.d[0], v17.d[0]
	ldr	d23, [x0,8]
	ldr	d22, [x0,24]
	ldr	d20, [x0,40]
	ldr	d18, [x0,56]
	ldr	d24, [x1,8]
	ldr	d21, [x1,24]
	ldr	d19, [x1,40]
	ldr	d25, [x1,48]
	ldr	d17, [x1,56]
	orr	v0.16b, v26.16b, v26.16b
	ins	v4.d[1], v24.d[0]
	ins	v0.d[0], v25.d[0]
	ins	v16.d[1], v23.d[0]
	ins	v7.d[1], v22.d[0]
	ins	v3.d[1], v21.d[0]
	ins	v6.d[1], v20.d[0]
	ins	v2.d[1], v19.d[0]
	ins	v5.d[1], v18.d[0]
	ins	v0.d[1], v17.d[0]
.L24:
	subs	w3, w3, #1
	fmla	v16.2d, v1.2d, v4.2d
	fmla	v7.2d, v1.2d, v3.2d
	fmla	v6.2d, v1.2d, v2.2d
	fmla	v5.2d, v1.2d, v0.2d
	fmla	v4.2d, v16.2d, v1.2d
	fmla	v3.2d, v7.2d, v1.2d
	fmla	v2.2d, v6.2d, v1.2d
	fmla	v0.2d, v5.2d, v1.2d
	bne	.L24
	subs	w12, w12, #1
	umov	x4, v16.d[0]
	umov	x5, v16.d[1]
	umov	x6, v7.d[0]
	umov	x7, v7.d[1]
	umov	x8, v6.d[0]
	umov	x9, v6.d[1]
	umov	x10, v5.d[0]
	umov	x11, v5.d[1]
	str	x4, [x2]
	str	x5, [x2,8]
	str	x6, [x2,16]
	str	x7, [x2,24]
	str	x8, [x2,32]
	str	x9, [x2,40]
	str	x10, [x2,48]
	str	x11, [x2,56]
	orr	v26.16b, v0.16b, v0.16b
	add	x0, x0, 64
	add	x1, x1, 64
	add	x2, x2, 64
	bne	.L23
	ldr	x19, [sp]
	add	sp, sp, 16
	ret
	.size	bFib_uj8, .-bFib_uj8
	.align	2
	.global	bFib_uj16
	.type	bFib_uj16, %function
bFib_uj16:
	sub	sp, sp, #112
	movi	v1.2d, 0
	stp	d8, d9, [sp,80]
	stp	x19, x20, [sp]
	stp	x21, x22, [sp,16]
	stp	x23, x24, [sp,32]
	stp	x25, x26, [sp,48]
	stp	x27, x28, [sp,64]
	mov	w20, 15
	ins	v1.d[0], v0.d[0]
	str	d10, [sp,96]
	ins	v1.d[1], v0.d[0]
.L29:
	fmov	d8, x4
	fmov	d23, x6
	fmov	d22, x8
	ldr	d0, [x0]
	fmov	d21, x10
	fmov	d19, x14
	ins	v8.d[1], x5
	fmov	d20, x12
	ins	v8.d[0], v0.d[0]
	fmov	d18, x16
	ldr	d0, [x0,16]
	ins	v23.d[1], x7
	ins	v23.d[0], v0.d[0]
	ldr	d0, [x0,32]
	ldr	d17, [x0,80]
	ins	v22.d[1], x9
	ins	v22.d[0], v0.d[0]
	ldr	d0, [x0,48]
	ins	v21.d[1], x11
	ins	v19.d[1], x15
	ins	v21.d[0], v0.d[0]
	ins	v19.d[0], v17.d[0]
	ldr	d0, [x0,64]
	ldr	d17, [x0,96]
	ins	v20.d[1], x13
	ins	v18.d[1], x17
	ins	v20.d[0], v0.d[0]
	ins	v18.d[0], v17.d[0]
	fmov	d0, x18
	ldr	d17, [x0,112]
	ldr	d24, [x1]
	ins	v16.d[0], v24.d[0]
	ldr	d24, [x1,16]
	ins	v7.d[0], v24.d[0]
	ldr	d24, [x1,32]
	ldr	d10, [x1,112]
	ins	v6.d[0], v24.d[0]
	ins	v0.d[1], x19
	ldr	d24, [x1,48]
	ins	v0.d[0], v17.d[0]
	ins	v5.d[0], v24.d[0]
	orr	v17.16b, v0.16b, v0.16b
	ldr	d24, [x1,64]
	orr	v0.16b, v9.16b, v9.16b
	ldr	d9, [x1,8]
	ins	v0.d[0], v10.d[0]
	ldr	d10, [x0,8]
	ins	v4.d[0], v24.d[0]
	ins	v16.d[1], v9.d[0]
	ldr	d24, [x1,80]
	ldr	d9, [x0,24]
	ins	v8.d[1], v10.d[0]
	mov	w3, 4096
	ldr	d10, [x1,24]
	ins	v3.d[0], v24.d[0]
	ins	v23.d[1], v9.d[0]
	ldr	d24, [x1,96]
	ldr	d9, [x0,40]
	ins	v7.d[1], v10.d[0]
	ldr	d10, [x1,40]
	ins	v2.d[0], v24.d[0]
	ldr	d31, [x0,72]
	ldr	d29, [x0,88]
	ldr	d27, [x0,104]
	ldr	d25, [x0,120]
	ldr	d30, [x1,72]
	ldr	d28, [x1,88]
	ldr	d26, [x1,104]
	ldr	d24, [x1,120]
	ins	v22.d[1], v9.d[0]
	ins	v6.d[1], v10.d[0]
	ldr	d9, [x0,56]
	ldr	d10, [x1,56]
	ins	v21.d[1], v9.d[0]
	ins	v5.d[1], v10.d[0]
	ins	v20.d[1], v31.d[0]
	ins	v4.d[1], v30.d[0]
	ins	v19.d[1], v29.d[0]
	ins	v3.d[1], v28.d[0]
	ins	v18.d[1], v27.d[0]
	ins	v2.d[1], v26.d[0]
	ins	v17.d[1], v25.d[0]
	ins	v0.d[1], v24.d[0]
.L30:
	subs	w3, w3, #1
	fmla	v8.2d, v1.2d, v16.2d
	fmla	v23.2d, v1.2d, v7.2d
	fmla	v22.2d, v1.2d, v6.2d
	fmla	v21.2d, v1.2d, v5.2d
	fmla	v20.2d, v1.2d, v4.2d
	fmla	v19.2d, v1.2d, v3.2d
	fmla	v18.2d, v1.2d, v2.2d
	fmla	v17.2d, v1.2d, v0.2d
	fmla	v16.2d, v8.2d, v1.2d
	fmla	v7.2d, v23.2d, v1.2d
	fmla	v6.2d, v22.2d, v1.2d
	fmla	v5.2d, v21.2d, v1.2d
	fmla	v4.2d, v20.2d, v1.2d
	fmla	v3.2d, v19.2d, v1.2d
	fmla	v2.2d, v18.2d, v1.2d
	fmla	v0.2d, v17.2d, v1.2d
	bne	.L30
	subs	w20, w20, #1
	umov	x4, v8.d[0]
	umov	x5, v8.d[1]
	umov	x6, v23.d[0]
	umov	x7, v23.d[1]
	umov	x8, v22.d[0]
	umov	x9, v22.d[1]
	umov	x10, v21.d[0]
	umov	x11, v21.d[1]
	umov	x12, v20.d[0]
	umov	x13, v20.d[1]
	umov	x14, v19.d[0]
	umov	x15, v19.d[1]
	umov	x16, v18.d[0]
	umov	x17, v18.d[1]
	umov	x18, v17.d[0]
	umov	x19, v17.d[1]
	str	x4, [x2]
	str	x5, [x2,8]
	str	x6, [x2,16]
	str	x7, [x2,24]
	str	x8, [x2,32]
	str	x9, [x2,40]
	str	x10, [x2,48]
	str	x11, [x2,56]
	str	x12, [x2,64]
	str	x13, [x2,72]
	str	x14, [x2,80]
	str	x15, [x2,88]
	str	x16, [x2,96]
	str	x17, [x2,104]
	str	x18, [x2,112]
	str	x19, [x2,120]
	orr	v9.16b, v0.16b, v0.16b
	add	x0, x0, 128
	add	x1, x1, 128
	add	x2, x2, 128
	bne	.L29
	ldp	x19, x20, [sp]
	ldp	x21, x22, [sp,16]
	ldp	x23, x24, [sp,32]
	ldp	x25, x26, [sp,48]
	ldp	x27, x28, [sp,64]
	ldp	d8, d9, [sp,80]
	ldr	d10, [sp,96]
	add	sp, sp, 112
	ret
	.size	bFib_uj16, .-bFib_uj16
	.align	2
	.global	bFib_uj30
	.type	bFib_uj30, %function
bFib_uj30:
	sub	sp, sp, #288
	movi	v1.2d, 0
	ins	v1.d[0], v0.d[0]
	ins	v1.d[1], v0.d[0]
	fmov	d0, x25
	stp	x19, x20, [sp]
	stp	x21, x22, [sp,16]
	stp	x23, x24, [sp,32]
	stp	x25, x26, [sp,48]
	stp	x27, x28, [sp,64]
	stp	d8, d9, [sp,80]
	stp	d10, d11, [sp,96]
	stp	d12, d13, [sp,112]
	stp	d14, d15, [sp,128]
	ins	v0.d[1], x26
	add	x27, sp, 256
	st1	{v0.2d}, [x27]
	fmov	d0, x17
	mov	x26, x21
	add	x21, sp, 192
	add	x17, sp, 208
	ins	v0.d[1], x18
	st1	{v0.2d}, [x21]
	fmov	d0, x13
	add	x13, sp, 224
	mov	w28, 8
	mov	x21, x16
	ins	v0.d[1], x14
	st1	{v0.2d}, [x17]
	fmov	d0, x9
	mov	x17, x12
	add	x9, sp, 240
	mov	x12, x7
	ins	v0.d[1], x10
	st1	{v0.2d}, [x13]
	fmov	d0, x5
	add	x7, sp, 256
	ld1	{v8.2d}, [x7]
	mov	x13, x8
	ins	v0.d[1], x6
	add	x7, sp, 240
	st1	{v0.2d}, [x9]
	mov	x8, x3
	mov	x9, x4
	umov	x3, v8.d[1]
	mov	x4, x2
	umov	x2, v8.d[0]
	ld1	{v8.2d}, [x7]
	mov	x16, x11
	add	x7, sp, 224
	umov	x10, v8.d[0]
	umov	x11, v8.d[1]
	str	w28, [sp,284]
	ld1	{v8.2d}, [x7]
	mov	x25, x20
	add	x7, sp, 208
	mov	x20, x15
	umov	x14, v8.d[0]
	umov	x15, v8.d[1]
	ld1	{v8.2d}, [x7]
	mov	x27, x22
	mov	x5, x1
	mov	x6, x0
	mov	x1, x24
	mov	x0, x23
	mov	x24, x19
	umov	x18, v8.d[0]
	umov	x19, v8.d[1]
	add	x7, sp, 192
	orr	v0.16b, v15.16b, v15.16b
	ld1	{v8.2d}, [x7]
	umov	x22, v8.d[0]
	umov	x23, v8.d[1]
.L35:
	ldr	d8, [x6]
	fmov	d27, x8
	add	x7, sp, 144
	fmov	d26, x10
	ld1	{v30.2d}, [x7]
	ins	v30.d[0], v8.d[0]
	ldr	d8, [x6,16]
	add	x7, sp, 160
	fmov	d25, x12
	ld1	{v29.2d}, [x7]
	ins	v29.d[0], v8.d[0]
	ldr	d8, [x6,32]
	add	x7, sp, 176
	fmov	d24, x14
	ld1	{v28.2d}, [x7]
	ins	v28.d[0], v8.d[0]
	ldr	d8, [x6,48]
	ins	v27.d[1], x9
	fmov	d15, x16
	ins	v27.d[0], v8.d[0]
	ldr	d8, [x6,64]
	ins	v26.d[1], x11
	fmov	d14, x18
	ins	v26.d[0], v8.d[0]
	ldr	d8, [x6,80]
	ins	v25.d[1], x13
	fmov	d13, x20
	ins	v25.d[0], v8.d[0]
	ldr	d8, [x6,96]
	ins	v24.d[1], x15
	fmov	d12, x22
	ins	v24.d[0], v8.d[0]
	ldr	d8, [x6,112]
	ins	v15.d[1], x17
	fmov	d11, x24
	ins	v15.d[0], v8.d[0]
	ldr	d8, [x6,128]
	ins	v14.d[1], x19
	fmov	d10, x26
	ins	v14.d[0], v8.d[0]
	ldr	d8, [x6,144]
	ins	v13.d[1], x21
	fmov	d9, x0
	ins	v13.d[0], v8.d[0]
	ldr	d8, [x6,160]
	ins	v12.d[1], x23
	ins	v12.d[0], v8.d[0]
	ldr	d8, [x6,176]
	ins	v11.d[1], x25
	ins	v11.d[0], v8.d[0]
	ldr	d8, [x6,192]
	ins	v10.d[1], x27
	ins	v10.d[0], v8.d[0]
	ldr	d8, [x6,208]
	ins	v9.d[1], x1
	fmov	d31, x2
	ins	v9.d[0], v8.d[0]
	ldr	d8, [x6,224]
	mov	w28, 4096
	ins	v31.d[1], x3
	ins	v31.d[0], v8.d[0]
	orr	v8.16b, v31.16b, v31.16b
	ldr	d31, [x5]
	ins	v23.d[0], v31.d[0]
	ldr	d31, [x5,16]
	ins	v22.d[0], v31.d[0]
	ldr	d31, [x5,32]
	ins	v21.d[0], v31.d[0]
	ldr	d31, [x5,48]
	ins	v20.d[0], v31.d[0]
	ldr	d31, [x5,64]
	ins	v19.d[0], v31.d[0]
	ldr	d31, [x5,80]
	ins	v18.d[0], v31.d[0]
	ldr	d31, [x5,96]
	ins	v17.d[0], v31.d[0]
	ldr	d31, [x5,112]
	ins	v16.d[0], v31.d[0]
	ldr	d31, [x5,128]
	ins	v7.d[0], v31.d[0]
	ldr	d31, [x5,144]
	ins	v6.d[0], v31.d[0]
	ldr	d31, [x5,160]
	ins	v5.d[0], v31.d[0]
	ldr	d31, [x5,176]
	ins	v4.d[0], v31.d[0]
	ldr	d31, [x5,192]
	ins	v3.d[0], v31.d[0]
	ldr	d31, [x5,208]
	ins	v2.d[0], v31.d[0]
	ldr	d31, [x5,224]
	ins	v0.d[0], v31.d[0]
	ldr	d31, [x5,8]
	ins	v23.d[1], v31.d[0]
	ldr	d31, [x6,8]
	ins	v30.d[1], v31.d[0]
	ldr	d31, [x6,24]
	ins	v29.d[1], v31.d[0]
	ldr	d31, [x5,24]
	ins	v22.d[1], v31.d[0]
	ldr	d31, [x6,40]
	ins	v28.d[1], v31.d[0]
	ldr	d31, [x5,40]
	ins	v21.d[1], v31.d[0]
	ldr	d31, [x6,56]
	ins	v27.d[1], v31.d[0]
	ldr	d31, [x5,56]
	ins	v20.d[1], v31.d[0]
	ldr	d31, [x6,72]
	ins	v26.d[1], v31.d[0]
	ldr	d31, [x5,72]
	ins	v19.d[1], v31.d[0]
	ldr	d31, [x6,88]
	ins	v25.d[1], v31.d[0]
	ldr	d31, [x5,88]
	ins	v18.d[1], v31.d[0]
	ldr	d31, [x6,104]
	ins	v24.d[1], v31.d[0]
	ldr	d31, [x5,104]
	ins	v17.d[1], v31.d[0]
	ldr	d31, [x6,120]
	ins	v15.d[1], v31.d[0]
	ldr	d31, [x5,120]
	ins	v16.d[1], v31.d[0]
	ldr	d31, [x6,136]
	ins	v14.d[1], v31.d[0]
	ldr	d31, [x5,136]
	ins	v7.d[1], v31.d[0]
	ldr	d31, [x6,152]
	ins	v13.d[1], v31.d[0]
	ldr	d31, [x5,152]
	ins	v6.d[1], v31.d[0]
	ldr	d31, [x6,168]
	ins	v12.d[1], v31.d[0]
	ldr	d31, [x5,168]
	ins	v5.d[1], v31.d[0]
	ldr	d31, [x6,184]
	ins	v11.d[1], v31.d[0]
	ldr	d31, [x5,184]
	ins	v4.d[1], v31.d[0]
	ldr	d31, [x6,200]
	ins	v10.d[1], v31.d[0]
	ldr	d31, [x5,200]
	ins	v3.d[1], v31.d[0]
	ldr	d31, [x6,216]
	ins	v9.d[1], v31.d[0]
	ldr	d31, [x5,216]
	ins	v2.d[1], v31.d[0]
	ldr	d31, [x6,232]
	ins	v8.d[1], v31.d[0]
	ldr	d31, [x5,232]
	ins	v0.d[1], v31.d[0]
.L36:
	subs	w28, w28, #1
	fmla	v30.2d, v1.2d, v23.2d
	fmla	v29.2d, v1.2d, v22.2d
	fmla	v28.2d, v1.2d, v21.2d
	fmla	v27.2d, v1.2d, v20.2d
	fmla	v26.2d, v1.2d, v19.2d
	fmla	v25.2d, v1.2d, v18.2d
	fmla	v24.2d, v1.2d, v17.2d
	fmla	v15.2d, v1.2d, v16.2d
	fmla	v14.2d, v1.2d, v7.2d
	fmla	v13.2d, v1.2d, v6.2d
	fmla	v12.2d, v1.2d, v5.2d
	fmla	v11.2d, v1.2d, v4.2d
	fmla	v10.2d, v1.2d, v3.2d
	fmla	v9.2d, v1.2d, v2.2d
	fmla	v8.2d, v1.2d, v0.2d
	fmla	v23.2d, v30.2d, v1.2d
	fmla	v22.2d, v29.2d, v1.2d
	fmla	v21.2d, v28.2d, v1.2d
	fmla	v20.2d, v27.2d, v1.2d
	fmla	v19.2d, v26.2d, v1.2d
	fmla	v18.2d, v25.2d, v1.2d
	fmla	v17.2d, v24.2d, v1.2d
	fmla	v16.2d, v15.2d, v1.2d
	fmla	v7.2d, v14.2d, v1.2d
	fmla	v6.2d, v13.2d, v1.2d
	fmla	v5.2d, v12.2d, v1.2d
	fmla	v4.2d, v11.2d, v1.2d
	fmla	v3.2d, v10.2d, v1.2d
	fmla	v2.2d, v9.2d, v1.2d
	fmla	v0.2d, v8.2d, v1.2d
	bne	.L36
	add	x7, sp, 160
	add	x0, sp, 144
	st1	{v29.2d}, [x7]
	st1	{v30.2d}, [x0]
	ldr	x7, [sp,144]
	add	x9, sp, 176
	st1	{v28.2d}, [x9]
	umov	x8, v27.d[0]
	umov	x9, v27.d[1]
	str	x7, [x4]
	ldr	x7, [sp,152]
	str	x8, [x4,48]
	str	x9, [x4,56]
	umov	x10, v26.d[0]
	umov	x11, v26.d[1]
	str	x7, [x4,8]
	ldr	x7, [sp,160]
	str	x10, [x4,64]
	str	x11, [x4,72]
	umov	x12, v25.d[0]
	umov	x13, v25.d[1]
	str	x7, [x4,16]
	ldr	x7, [sp,168]
	str	x12, [x4,80]
	str	x13, [x4,88]
	umov	x14, v24.d[0]
	umov	x15, v24.d[1]
	str	x7, [x4,24]
	ldr	x7, [sp,176]
	str	x14, [x4,96]
	str	x15, [x4,104]
	umov	x16, v15.d[0]
	umov	x17, v15.d[1]
	str	x7, [x4,32]
	ldr	x7, [sp,184]
	str	x16, [x4,112]
	str	x17, [x4,120]
	umov	x18, v14.d[0]
	umov	x19, v14.d[1]
	str	x7, [x4,40]
	ldr	w7, [sp,284]
	str	x18, [x4,128]
	subs	w7, w7, #1
	str	w7, [sp,284]
	str	x19, [x4,136]
	umov	x20, v13.d[0]
	umov	x26, v10.d[0]
	str	x20, [x4,144]
	str	x26, [x4,192]
	umov	x27, v10.d[1]
	umov	x2, v8.d[0]
	str	x27, [x4,200]
	str	x2, [x4,224]
	umov	x21, v13.d[1]
	umov	x22, v12.d[0]
	str	x21, [x4,152]
	umov	x23, v12.d[1]
	umov	x24, v11.d[0]
	umov	x25, v11.d[1]
	umov	x0, v9.d[0]
	umov	x1, v9.d[1]
	umov	x3, v8.d[1]
	str	x22, [x4,160]
	str	x23, [x4,168]
	str	x24, [x4,176]
	str	x25, [x4,184]
	str	x0, [x4,208]
	str	x1, [x4,216]
	str	x3, [x4,232]
	add	x6, x6, 240
	add	x5, x5, 240
	add	x4, x4, 240
	bne	.L35
	ldp	x19, x20, [sp]
	ldp	x21, x22, [sp,16]
	ldp	x23, x24, [sp,32]
	ldp	x25, x26, [sp,48]
	ldp	x27, x28, [sp,64]
	ldp	d8, d9, [sp,80]
	ldp	d10, d11, [sp,96]
	ldp	d12, d13, [sp,112]
	ldp	d14, d15, [sp,128]
	add	sp, sp, 288
	ret
	.size	bFib_uj30, .-bFib_uj30
	.align	2
	.global	cheat
	.type	cheat, %function
cheat:
	sub	sp, sp, #432
	mov	w0, 4
	movi	v1.2d, 0
	stp	x19, x20, [sp]
	stp	x21, x22, [sp,16]
	stp	x23, x24, [sp,32]
	stp	x25, x26, [sp,48]
	stp	x27, x28, [sp,64]
	ins	v1.d[0], v0.d[0]
	stp	d8, d9, [sp,80]
	stp	d10, d11, [sp,96]
	stp	d12, d13, [sp,112]
	stp	d14, d15, [sp,128]
	str	xzr, [sp,424]
	ins	v1.d[1], v0.d[0]
.L41:
	add	x1, sp, 144
	ld1	{v14.2d}, [x1]
	add	x1, sp, 160
	fmov	d0, 1.0e+0
	ld1	{v13.2d}, [x1]
	add	x1, sp, 176
	ld1	{v12.2d}, [x1]
	add	x1, sp, 192
	ins	v14.d[0], v0.d[0]
	ins	v13.d[0], v0.d[0]
	ins	v12.d[0], v0.d[0]
	ld1	{v0.2d}, [x1]
	add	x1, sp, 208
	ld1	{v22.2d}, [x1]
	add	x1, sp, 224
	ld1	{v21.2d}, [x1]
	add	x1, sp, 240
	ld1	{v20.2d}, [x1]
	add	x1, sp, 256
	ld1	{v19.2d}, [x1]
	add	x1, sp, 272
	ld1	{v18.2d}, [x1]
	add	x1, sp, 288
	ld1	{v17.2d}, [x1]
	add	x1, sp, 304
	ld1	{v16.2d}, [x1]
	add	x1, sp, 320
	fmov	d11, x2
	ld1	{v7.2d}, [x1]
	fmov	d10, x4
	add	x1, sp, 336
	fmov	d9, x6
	fmov	d8, x8
	fmov	d31, x10
	fmov	d30, x12
	fmov	d29, x14
	fmov	d28, x16
	fmov	d27, x18
	fmov	d26, x20
	fmov	d25, x22
	fmov	d24, x24
	fmov	d23, x26
	ld1	{v6.2d}, [x1]
	add	x1, sp, 352
	fmov	d15, 1.0e+0
	fmov	d2, 1.0e+0
	ld1	{v5.2d}, [x1]
	mov	w28, 8192
	add	x1, sp, 368
	ld1	{v4.2d}, [x1]
	add	x1, sp, 384
	ins	v0.d[0], v2.d[0]
	ins	v22.d[0], v2.d[0]
	ins	v21.d[0], v2.d[0]
	ins	v20.d[0], v2.d[0]
	ins	v19.d[0], v2.d[0]
	ins	v18.d[0], v2.d[0]
	ins	v17.d[0], v2.d[0]
	ins	v16.d[0], v2.d[0]
	ins	v7.d[0], v2.d[0]
	ins	v6.d[0], v2.d[0]
	ins	v5.d[0], v2.d[0]
	ins	v4.d[0], v2.d[0]
	ld1	{v3.2d}, [x1]
	ins	v11.d[1], x3
	ins	v3.d[0], v2.d[0]
	ins	v11.d[0], v2.d[0]
	ins	v10.d[1], x5
	ins	v9.d[1], x7
	ins	v10.d[0], v2.d[0]
	ins	v9.d[0], v2.d[0]
	ins	v8.d[1], x9
	ins	v31.d[1], x11
	ins	v8.d[0], v2.d[0]
	ins	v31.d[0], v2.d[0]
	ins	v30.d[1], x13
	ins	v29.d[1], x15
	ins	v30.d[0], v2.d[0]
	ins	v29.d[0], v2.d[0]
	ins	v28.d[1], x17
	ins	v27.d[1], x19
	ins	v28.d[0], v2.d[0]
	ins	v27.d[0], v2.d[0]
	ins	v26.d[1], x21
	ins	v25.d[1], x23
	ins	v26.d[0], v2.d[0]
	ins	v25.d[0], v2.d[0]
	ins	v24.d[1], x25
	ins	v23.d[1], x27
	ins	v24.d[0], v2.d[0]
	ins	v23.d[0], v2.d[0]
	add	x1, sp, 400
	ins	v14.d[1], v15.d[0]
	ld1	{v2.2d}, [x1]
	ins	v13.d[1], v15.d[0]
	ins	v2.d[0], v15.d[0]
	ins	v12.d[1], v15.d[0]
	ins	v0.d[1], v15.d[0]
	ins	v11.d[1], v15.d[0]
	ins	v10.d[1], v15.d[0]
	ins	v9.d[1], v15.d[0]
	ins	v8.d[1], v15.d[0]
	ins	v31.d[1], v15.d[0]
	ins	v30.d[1], v15.d[0]
	ins	v29.d[1], v15.d[0]
	ins	v28.d[1], v15.d[0]
	ins	v27.d[1], v15.d[0]
	ins	v26.d[1], v15.d[0]
	ins	v25.d[1], v15.d[0]
	ins	v24.d[1], v15.d[0]
	ins	v23.d[1], v15.d[0]
	ins	v22.d[1], v15.d[0]
	ins	v21.d[1], v15.d[0]
	ins	v20.d[1], v15.d[0]
	ins	v19.d[1], v15.d[0]
	ins	v18.d[1], v15.d[0]
	ins	v17.d[1], v15.d[0]
	ins	v16.d[1], v15.d[0]
	ins	v7.d[1], v15.d[0]
	ins	v6.d[1], v15.d[0]
	ins	v5.d[1], v15.d[0]
	ins	v4.d[1], v15.d[0]
	ins	v3.d[1], v15.d[0]
	ins	v2.d[1], v15.d[0]
.L39:
	subs	w28, w28, #1
	fmla	v14.2d, v1.2d, v14.2d
	fmla	v13.2d, v1.2d, v13.2d
	fmla	v12.2d, v1.2d, v12.2d
	fmla	v0.2d, v1.2d, v0.2d
	fmla	v11.2d, v1.2d, v11.2d
	fmla	v10.2d, v1.2d, v10.2d
	fmla	v9.2d, v1.2d, v9.2d
	fmla	v8.2d, v1.2d, v8.2d
	fmla	v31.2d, v1.2d, v31.2d
	fmla	v30.2d, v1.2d, v30.2d
	fmla	v29.2d, v1.2d, v29.2d
	fmla	v28.2d, v1.2d, v28.2d
	fmla	v27.2d, v1.2d, v27.2d
	fmla	v26.2d, v1.2d, v26.2d
	fmla	v25.2d, v1.2d, v25.2d
	fmla	v24.2d, v1.2d, v24.2d
	fmla	v23.2d, v1.2d, v23.2d
	fmla	v22.2d, v1.2d, v22.2d
	fmla	v21.2d, v1.2d, v21.2d
	fmla	v20.2d, v1.2d, v20.2d
	fmla	v19.2d, v1.2d, v19.2d
	fmla	v18.2d, v1.2d, v18.2d
	fmla	v17.2d, v1.2d, v17.2d
	fmla	v16.2d, v1.2d, v16.2d
	fmla	v7.2d, v1.2d, v7.2d
	fmla	v6.2d, v1.2d, v6.2d
	fmla	v5.2d, v1.2d, v5.2d
	fmla	v4.2d, v1.2d, v4.2d
	fmla	v3.2d, v1.2d, v3.2d
	fmla	v2.2d, v1.2d, v2.2d
	bne	.L39
	add	x1, sp, 144
	st1	{v14.2d}, [x1]
	ldr	d14, [sp,424]
	ldr	d15, [sp,144]
	add	x1, sp, 160
	fadd	d14, d14, d15
	st1	{v13.2d}, [x1]
	add	x1, sp, 176
	st1	{v12.2d}, [x1]
	ldr	d12, [sp,152]
	add	x1, sp, 192
	st1	{v0.2d}, [x1]
	fadd	d0, d14, d12
	ldr	d13, [sp,160]
	ldr	d14, [sp,168]
	ldr	d15, [sp,176]
	fadd	d0, d0, d13
	umov	x8, v8.d[0]
	umov	x9, v8.d[1]
	ldr	d8, [sp,184]
	fadd	d0, d0, d14
	add	x1, sp, 208
	st1	{v22.2d}, [x1]
	add	x1, sp, 224
	fadd	d0, d0, d15
	st1	{v21.2d}, [x1]
	add	x1, sp, 240
	st1	{v20.2d}, [x1]
	fadd	d0, d0, d8
	ldr	d8, [sp,192]
	add	x1, sp, 256
	st1	{v19.2d}, [x1]
	fadd	d0, d0, d8
	add	x1, sp, 272
	st1	{v18.2d}, [x1]
	ldr	d8, [sp,200]
	add	x1, sp, 288
	st1	{v17.2d}, [x1]
	add	x1, sp, 304
	st1	{v16.2d}, [x1]
	fadd	d0, d0, d8
	add	x1, sp, 320
	umov	x2, v11.d[0]
	st1	{v7.2d}, [x1]
	fmov	d7, x2
	add	x1, sp, 336
	st1	{v6.2d}, [x1]
	add	x1, sp, 352
	st1	{v5.2d}, [x1]
	fadd	d0, d0, d7
	add	x1, sp, 368
	umov	x3, v11.d[1]
	st1	{v4.2d}, [x1]
	fmov	d4, x3
	add	x1, sp, 384
	st1	{v3.2d}, [x1]
	umov	x4, v10.d[0]
	fadd	d0, d0, d4
	add	x1, sp, 400
	st1	{v2.2d}, [x1]
	fmov	d2, x4
	umov	x5, v10.d[1]
	fmov	d4, x5
	umov	x6, v9.d[0]
	fadd	d0, d0, d2
	fmov	d7, x6
	umov	x7, v9.d[1]
	fmov	d8, x7
	fadd	d0, d0, d4
	fmov	d9, x8
	fmov	d12, x9
	umov	x10, v31.d[0]
	fadd	d0, d0, d7
	fmov	d13, x10
	umov	x11, v31.d[1]
	fmov	d14, x11
	fadd	d0, d0, d8
	umov	x12, v30.d[0]
	fmov	d15, x12
	umov	x13, v30.d[1]
	fadd	d0, d0, d9
	fmov	d2, x13
	umov	x14, v29.d[0]
	fmov	d4, x14
	fadd	d0, d0, d12
	umov	x15, v29.d[1]
	fmov	d7, x15
	umov	x16, v28.d[0]
	fadd	d0, d0, d13
	fmov	d8, x16
	umov	x17, v28.d[1]
	fmov	d9, x17
	fadd	d0, d0, d14
	umov	x18, v27.d[0]
	fmov	d12, x18
	umov	x19, v27.d[1]
	fadd	d0, d0, d15
	fmov	d13, x19
	umov	x20, v26.d[0]
	fmov	d14, x20
	fadd	d0, d0, d2
	umov	x21, v26.d[1]
	fmov	d15, x21
	umov	x22, v25.d[0]
	fadd	d0, d0, d4
	fmov	d2, x22
	umov	x23, v25.d[1]
	fmov	d4, x23
	fadd	d0, d0, d7
	umov	x24, v24.d[0]
	fmov	d7, x24
	umov	x25, v24.d[1]
	fadd	d0, d0, d8
	fmov	d8, x25
	umov	x26, v23.d[0]
	umov	x27, v23.d[1]
	fadd	d0, d0, d9
	fmov	d9, x26
	subs	w0, w0, #1
	fadd	d0, d0, d12
	fmov	d12, x27
	fadd	d0, d0, d13
	ldr	d13, [sp,208]
	fadd	d0, d0, d14
	ldr	d14, [sp,216]
	fadd	d0, d0, d15
	ldr	d15, [sp,224]
	fadd	d0, d0, d2
	ldr	d2, [sp,232]
	fadd	d0, d0, d4
	ldr	d4, [sp,240]
	fadd	d0, d0, d7
	ldr	d7, [sp,248]
	fadd	d0, d0, d8
	ldr	d8, [sp,256]
	fadd	d0, d0, d9
	ldr	d9, [sp,264]
	fadd	d0, d0, d12
	ldr	d12, [sp,272]
	fadd	d0, d0, d13
	ldr	d13, [sp,280]
	fadd	d0, d0, d14
	ldr	d14, [sp,288]
	fadd	d0, d0, d15
	ldr	d15, [sp,296]
	fadd	d0, d0, d2
	ldr	d2, [sp,304]
	fadd	d0, d0, d4
	ldr	d4, [sp,312]
	fadd	d0, d0, d7
	ldr	d7, [sp,320]
	fadd	d0, d0, d8
	ldr	d8, [sp,328]
	fadd	d0, d0, d9
	ldr	d9, [sp,336]
	fadd	d0, d0, d12
	ldr	d12, [sp,344]
	fadd	d0, d0, d13
	ldr	d13, [sp,352]
	fadd	d0, d0, d14
	ldr	d14, [sp,360]
	fadd	d0, d0, d15
	ldr	d15, [sp,368]
	fadd	d0, d0, d2
	ldr	d2, [sp,376]
	fadd	d0, d0, d4
	ldr	d4, [sp,384]
	fadd	d0, d0, d7
	ldr	d7, [sp,392]
	fadd	d0, d0, d8
	ldr	d8, [sp,400]
	fadd	d0, d0, d9
	ldr	d9, [sp,408]
	fadd	d0, d0, d12
	fadd	d0, d0, d13
	fadd	d0, d0, d14
	fadd	d0, d0, d15
	fadd	d0, d0, d2
	fadd	d0, d0, d4
	fadd	d0, d0, d7
	fadd	d0, d0, d8
	fadd	d0, d0, d9
	str	d0, [sp,424]
	bne	.L41
	ldp	x19, x20, [sp]
	ldp	x21, x22, [sp,16]
	ldp	x23, x24, [sp,32]
	ldp	x25, x26, [sp,48]
	ldp	x27, x28, [sp,64]
	ldp	d8, d9, [sp,80]
	ldp	d10, d11, [sp,96]
	ldp	d12, d13, [sp,112]
	ldp	d14, d15, [sp,128]
	add	sp, sp, 432
	ret
	.size	cheat, .-cheat
	.align	2
	.global	initVector
	.type	initVector, %function
initVector:
	ubfx	x2, x0, 3, 1
	cbz	w2, .L47
	mov	w6, 1
	str	d0, [x0]
.L43:
	mov	w4, 240
	sub	w4, w4, w2
	uxtw	x2, w2
	lsr	w3, w4, 1
	lsl	w5, w3, 1
	add	x2, x0, x2, lsl 3
	mov	w1, 0
	dup	v1.2d, v0.d[0]
.L46:
	add	w1, w1, 1
	cmp	w1, w3
	st1	{v1.2d}, [x2],16
	bcc	.L46
	cmp	w4, w5
	add	w5, w6, w5
	beq	.L42
	str	d0, [x0,w5,sxtw 3]
.L42:
	ret
.L47:
	mov	w6, w2
	b	.L43
	.size	initVector, .-initVector
	.align	2
	.global	verify
	.type	verify, %function
verify:
	ldr	d2, .LC1
	ldr	d3, .LC2
	mov	x2, 0
	b	.L53
.L56:
	fcmpe	d0, d3
	bgt	.L49
	cmp	x2, 1920
	beq	.L55
.L53:
	ldr	d1, [x0,x2]
	ldr	d0, [x1,x2]
	add	x2, x2, 8
	fsub	d0, d1, d0
	fcmpe	d0, d2
	bpl	.L56
.L49:
	adrp	x1, .LC3
	mov	w0, 1
	add	x1, x1, :lo12:.LC3
	b	__printf_chk
.L55:
	adrp	x1, .LC4
	mov	w0, 1
	add	x1, x1, :lo12:.LC4
	b	__printf_chk
	.size	verify, .-verify
	.align	3
.LC1:
	.word	2576980378
	.word	-1078355559
	.align	3
.LC2:
	.word	2576980378
	.word	1069128089
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -96]!
	mov	x0, 1920
	add	x29, sp, 0
	stp	d8, d9, [sp,48]
	stp	d10, d11, [sp,64]
	str	d12, [sp,80]
	stp	x19, x20, [sp,16]
	stp	x21, x22, [sp,32]
	bl	malloc
	mov	x19, x0
	mov	x0, 1920
	bl	malloc
	mov	x22, x0
	mov	x0, 1920
	bl	malloc
	mov	x20, x0
	mov	x0, 1920
	bl	malloc
	ubfx	x4, x19, 3, 1
	mov	x21, x0
	cbz	w4, .L62
	fmov	d0, 5.0e-1
	mov	w2, 1
	str	d0, [x19]
.L58:
	mov	w0, 240
	sub	w0, w0, w4
	uxtw	x4, w4
	lsr	w5, w0, 1
	lsl	w1, w5, 1
	add	x4, x19, x4, lsl 3
	mov	w3, 0
	fmov	v0.2d, 5.0e-1
.L61:
	add	w3, w3, 1
	cmp	w3, w5
	st1	{v0.2d}, [x4],16
	bcc	.L61
	cmp	w0, w1
	add	w1, w2, w1
	beq	.L60
	fmov	d0, 5.0e-1
	str	d0, [x19,w1,sxtw 3]
.L60:
	mov	w1, 0
	mov	x2, 1920
	mov	x0, x22
	bl	memset
	bl	wall_time
	ldr	d10, .LC5
	fmov	d8, d0
	fmov	d0, d10
	mov	x2, x21
	mov	x0, x19
	mov	x1, x22
	bl	bFib
	bl	wall_time
	fsub	d11, d0, d8
	mov	x1, x21
	mov	x0, x21
	bl	verify
	ldr	d9, .LC7
	ldr	d8, .LC8
	fdiv	d0, d9, d11
	adrp	x1, .LC6
	add	x1, x1, :lo12:.LC6
	mov	w0, 1
	fmul	d0, d0, d8
	bl	__printf_chk
	bl	wall_time
	fmov	d11, d0
	fmov	d0, d10
	mov	x2, x20
	mov	x0, x19
	mov	x1, x22
	bl	bFib_uj2
	bl	wall_time
	fsub	d11, d0, d11
	mov	x1, x21
	mov	x0, x20
	bl	verify
	fdiv	d0, d9, d11
	adrp	x1, .LC9
	add	x1, x1, :lo12:.LC9
	mov	w0, 1
	fmul	d0, d0, d8
	bl	__printf_chk
	bl	wall_time
	fmov	d11, d0
	fmov	d0, d10
	mov	x2, x20
	mov	x0, x19
	mov	x1, x22
	bl	bFib_uj4
	bl	wall_time
	fsub	d11, d0, d11
	mov	x1, x21
	mov	x0, x20
	bl	verify
	fdiv	d0, d9, d11
	adrp	x1, .LC10
	add	x1, x1, :lo12:.LC10
	mov	w0, 1
	fmul	d0, d0, d8
	bl	__printf_chk
	bl	wall_time
	fmov	d11, d0
	fmov	d0, d10
	mov	x2, x20
	mov	x0, x19
	mov	x1, x22
	bl	bFib_uj8
	bl	wall_time
	fsub	d11, d0, d11
	mov	x1, x21
	mov	x0, x20
	bl	verify
	fdiv	d0, d9, d11
	adrp	x1, .LC11
	add	x1, x1, :lo12:.LC11
	mov	w0, 1
	fmul	d0, d0, d8
	bl	__printf_chk
	bl	wall_time
	fmov	d11, d0
	fmov	d0, d10
	mov	x2, x20
	mov	x0, x19
	mov	x1, x22
	bl	bFib_uj16
	bl	wall_time
	fsub	d11, d0, d11
	mov	x1, x21
	mov	x0, x20
	bl	verify
	fdiv	d0, d9, d11
	adrp	x1, .LC12
	add	x1, x1, :lo12:.LC12
	mov	w0, 1
	fmul	d0, d0, d8
	bl	__printf_chk
	bl	wall_time
	fmov	d11, d0
	fmov	d0, d10
	mov	x2, x20
	mov	x0, x19
	mov	x1, x22
	bl	bFib_uj30
	bl	wall_time
	fsub	d11, d0, d11
	mov	x1, x21
	mov	x0, x20
	bl	verify
	fdiv	d0, d9, d11
	adrp	x1, .LC13
	add	x1, x1, :lo12:.LC13
	mov	w0, 1
	fmul	d0, d0, d8
	bl	__printf_chk
	bl	wall_time
	fmov	d10, d0
	fmov	d0, xzr
	bl	cheat
	fmov	d12, d0
	bl	wall_time
	fmov	d11, d0
	fmov	d0, d12
	adrp	x1, .LC14
	add	x1, x1, :lo12:.LC14
	mov	w0, 1
	bl	__printf_chk
	fsub	d0, d11, d10
	adrp	x1, .LC15
	add	x1, x1, :lo12:.LC15
	mov	w0, 1
	fdiv	d0, d9, d0
	fmul	d0, d0, d8
	bl	__printf_chk
	mov	w0, 0
	ldp	x19, x20, [sp,16]
	ldp	x21, x22, [sp,32]
	ldp	d8, d9, [sp,48]
	ldp	d10, d11, [sp,64]
	ldr	d12, [sp,80]
	ldp	x29, x30, [sp], 96
	ret
.L62:
	mov	w2, w4
	b	.L58
	.size	main, .-main
	.align	3
.LC5:
	.word	3944497965
	.word	1057634018
	.align	3
.LC7:
	.word	0
	.word	1095630848
	.align	3
.LC8:
	.word	0
	.word	1041235968
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC3:
	.string	"[ERROR] "
	.zero	7
.LC4:
	.string	"[OK] "
	.zero	2
.LC6:
	.string	"normal   perf = %f (gflops)\n"
	.zero	3
.LC9:
	.string	"unroll2  perf = %f (gflops)\n"
	.zero	3
.LC10:
	.string	"unroll4  perf = %f (gflops)\n"
	.zero	3
.LC11:
	.string	"unroll8  perf = %f (gflops)\n"
	.zero	3
.LC12:
	.string	"unroll16  perf = %f (gflops)\n"
	.zero	2
.LC13:
	.string	"unroll30  perf = %f (gflops)\n"
	.zero	2
.LC14:
	.string	"%f -- "
	.zero	1
.LC15:
	.string	"cheat  perf = %f (gflops)\n"
	.ident	"GCC: (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",%progbits
