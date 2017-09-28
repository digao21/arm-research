	.arch armv8-a+fp+simd
	.file	"probe_heat.c"
	.text
	.align	2
	.global	StencilProbe
	.type	StencilProbe, %function
StencilProbe:
	sub	sp, sp, #272
	cmp	w5, wzr
	stp	d8, d9, [sp,80]
	stp	x19, x20, [sp]
	stp	x21, x22, [sp,16]
	stp	x23, x24, [sp,32]
	stp	x25, x26, [sp,48]
	stp	x27, x28, [sp,64]
	str	w5, [sp,264]
	str	x1, [sp,200]
	str	w3, [sp,220]
	stp	d10, d11, [sp,96]
	stp	d12, d13, [sp,112]
	stp	d14, d15, [sp,128]
	ldr	d19, [x0]
	ble	.L1
	sub	w1, w2, #2
	lsr	w24, w1, 1
	lsl	w3, w24, 1
	fmov	s30, w1
	sxtw	x1, w2
	add	w23, w3, 1
	sub	w4, w4, #1
	ldr	w5, [sp,220]
	ldr	w7, [sp,220]
	fmov	s31, w3
	fmov	d23, d19
	sub	w25, w23, #1
	str	w4, [sp,256]
	lsl	x4, x1, 3
	neg	x1, x1, lsl 3
	sub	w5, w5, #1
	sub	w6, w2, #1
	lsl	w7, w7, 1
	str	x1, [sp,160]
	add	w8, w23, 1
	str	w25, [sp,212]
	sub	w1, w2, #3
	str	w5, [sp,148]
	str	w6, [sp,156]
	str	w7, [sp,268]
	str	w8, [sp,208]
	str	wzr, [sp,260]
	str	x1, [sp,248]
	fmov	d16, 3.0e+0
	fmov	d7, 2.0e+0
	fmov	d6, 4.0e+0
	fmov	d5, 5.0e+0
	fmov	d4, 6.0e+0
	fmov	d3, 7.0e+0
	fmov	d2, 2.6e+1
	mov	w25, w24
	mov	w26, w23
	mov	w27, w2
	fmov	v11.2d, 3.0e+0
	fmov	v12.2d, 2.0e+0
	fmov	v13.2d, 4.0e+0
	fmov	v14.2d, 5.0e+0
	fmov	v15.2d, 6.0e+0
	fmov	v18.2d, 7.0e+0
	fmov	v17.2d, 2.6e+1
.L3:
	ldr	w6, [sp,256]
	cmp	w6, 1
	ble	.L16
	ldr	w7, [sp,268]
	ldr	w8, [sp,220]
	mov	w24, 2
	add	x1, x0, 16
	str	w7, [sp,228]
	str	w8, [sp,216]
	str	wzr, [sp,232]
	str	w24, [sp,224]
	str	x1, [sp,240]
.L19:
	ldr	w7, [sp,148]
	cmp	w7, 1
	ble	.L29
	ldr	w24, [sp,216]
	ldr	w2, [sp,228]
	ldr	w6, [sp,232]
	add	w1, w24, 1
	add	w5, w2, 1
	add	w3, w6, 1
	add	w2, w24, 2
	mul	w5, w27, w5
	mul	w3, w27, w3
	mul	w2, w27, w2
	mul	w24, w27, w24
	mul	w1, w27, w1
	ldr	x7, [sp,248]
	sxtw	x22, w5
	sxtw	x15, w1
	sxtw	x21, w3
	sxtw	x18, w2
	sxtw	x17, w24
	add	x8, x0, x24, sxtw 3
	fmov	s25, w24
	ldr	w24, [sp,224]
	add	x14, x15, x7
	fmov	s28, w5
	str	w1, [sp,152]
	add	x22, x22, 1
	add	x1, x0, x5, sxtw 3
	add	x21, x21, 1
	ldr	x5, [sp,200]
	add	x18, x18, 1
	add	x17, x17, 1
	str	w24, [sp,236]
	fmov	s10, w25
	ldr	x24, [sp,240]
	lsl	x16, x15, 3
	add	x6, x0, x3, sxtw 3
	add	x7, x0, x2, sxtw 3
	fmov	s27, w3
	fmov	s26, w2
	add	x8, x8, 24
	add	x2, x0, x16
	add	x7, x7, 24
	add	x16, x5, x16
	add	x6, x6, 24
	add	x1, x1, 24
	neg	x15, x15, lsl 3
	add	x14, x24, x14, lsl 3
	add	x22, x0, x22, lsl 3
	add	x21, x0, x21, lsl 3
	add	x18, x0, x18, lsl 3
	add	x17, x0, x17, lsl 3
	mov	w3, 0
	mov	x5, 0
	mov	w23, 2
	str	x8, [sp,168]
	str	x7, [sp,176]
	str	x6, [sp,184]
	str	x1, [sp,192]
.L18:
	ldr	w8, [sp,156]
	mov	w28, w23
	cmp	w8, 1
	ble	.L12
	add	x13, x16, 8
	add	x1, x2, 24
	add	x6, x16, 24
	cmp	x13, x1
	fmov	w25, s30
	add	x12, x2, 8
	cset	w24, cs
	add	x10, x2, 16
	cmp	x6, x12
	cset	w20, ls
	cmp	x13, x10
	cset	w28, cs
	fmov	s1, w24
	cmp	x6, x2
	cset	w24, ls
	add	x1, x2, 32
	cmp	w25, 3
	ldr	x7, [sp,168]
	cset	w11, hi
	ldr	x25, [sp,176]
	cmp	x13, x1
	cset	w9, cs
	add	x1, x7, x5
	cmp	x6, x10
	cset	w8, ls
	cmp	x13, x1
	add	x1, x25, x5
	fmov	w25, s1
	orr	w24, w28, w24
	cset	w19, cs
	cmp	x6, x17
	orr	w20, w25, w20
	and	w20, w20, w24
	ldr	x24, [sp,184]
	cset	w7, ls
	cmp	x13, x1
	cset	w28, cs
	add	x1, x24, x5
	cmp	x6, x18
	cset	w24, ls
	and	w11, w11, w20
	cmp	x13, x1
	orr	w8, w9, w8
	ldr	w25, [sp,152]
	cset	w9, cs
	and	w8, w11, w8
	cmp	x6, x21
	orr	w7, w19, w7
	orr	w28, w28, w24
	cset	w1, ls
	and	w7, w8, w7
	add	w24, w25, w3
	fmov	w8, s26
	fmov	w25, s25
	and	w7, w7, w28
	orr	w1, w9, w1
	tst	w7, w1
	fmov	w1, s28
	fmov	w7, s27
	add	w8, w8, w3
	add	w25, w25, w3
	add	w20, w1, w3
	add	w19, w7, w3
	mov	w28, w23
	fmov	s29, w8
	fmov	s24, w25
	fmul	d21, d23, d23
	beq	.L15
	ldr	x7, [sp,192]
	add	x1, x7, x5
	cmp	x13, x1
	cset	w7, cs
	cmp	x6, x22
	cset	w1, ls
	orr	w1, w7, w1
	cbz	w1, .L15
	fmov	w1, s31
	cbz	w1, .L7
	fmov	w25, s10
	mov	x11, x2
	mov	x9, x17
	mov	x8, x18
	mov	x7, x21
	mov	x6, x22
	mov	w1, 0
	dup	v22.2d, v21.d[0]
.L4:
	add	w1, w1, 1
	cmp	w25, w1
	ld1	{v8.2d}, [x11],16
	ld1	{v9.2d}, [x10],16
	ld1	{v10.2d}, [x9],16
	ld1	{v19.2d}, [x8],16
	ld1	{v20.2d}, [x6],16
	ld1	{v0.2d}, [x7],16
	ld1	{v1.2d}, [x12],16
	fmul	v0.2d, v0.2d, v11.2d
	fmul	v1.2d, v1.2d, v17.2d
	fmla	v0.2d, v20.2d, v12.2d
	fdiv	v1.2d, v1.2d, v22.2d
	fmla	v0.2d, v19.2d, v13.2d
	fmla	v0.2d, v10.2d, v14.2d
	fmla	v0.2d, v9.2d, v15.2d
	fmla	v0.2d, v8.2d, v18.2d
	fsub	v0.2d, v0.2d, v1.2d
	st1	{v0.2d}, [x13],16
	bhi	.L4
	fmov	w6, s31
	fmov	w7, s30
	fmov	s10, w25
	cmp	w6, w7
	beq	.L12
.L7:
	add	w6, w26, w19
	add	w1, w26, w20
	ldr	d1, [x0,w6,sxtw 3]
	ldr	d0, [x0,w1,sxtw 3]
	fmul	d1, d1, d16
	add	w7, w26, w24
	sbfiz	x7, x7, 3, 32
	fmov	w8, s29
	fmadd	d1, d0, d7, d1
	ldr	d0, [x0,x7]
	fmov	w25, s24
	add	w1, w26, w8
	fmul	d0, d0, d2
	ldr	d8, [x0,w1,sxtw 3]
	add	w6, w26, w25
	ldr	w8, [sp,208]
	fdiv	d21, d0, d21
	fmadd	d0, d8, d6, d1
	ldr	d9, [x0,w6,sxtw 3]
	add	w1, w8, w24
	ldr	w25, [sp,212]
	ldr	d8, [x0,w1,sxtw 3]
	add	w24, w25, w24
	ldr	x1, [sp,200]
	ldr	d1, [x0,w24,sxtw 3]
	fmadd	d0, d9, d5, d0
	fmadd	d0, d8, d4, d0
	fmadd	d0, d1, d3, d0
	fsub	d21, d0, d21
	str	d21, [x1,x7]
.L12:
	ldr	w6, [sp,148]
	ldr	x7, [sp,160]
	cmp	w6, w28
	add	w23, w23, 1
	add	x5, x5, x27, sxtw 3
	add	x2, x2, x4
	add	x16, x16, x4
	add	x15, x15, x7
	add	x14, x14, x4
	add	x22, x22, x4
	add	x21, x21, x4
	add	x18, x18, x4
	add	x17, x17, x4
	add	w3, w3, w27
	bgt	.L18
	fmov	w25, s10
.L10:
	ldr	w2, [sp,220]
	ldr	w1, [sp,224]
	ldr	w3, [sp,216]
	ldr	w5, [sp,232]
	ldr	w6, [sp,228]
	ldr	w8, [sp,256]
	ldr	w24, [sp,236]
	add	w1, w1, 1
	add	w3, w3, w2
	add	w5, w5, w2
	add	w6, w6, w2
	cmp	w8, w24
	str	w1, [sp,224]
	str	w3, [sp,216]
	str	w5, [sp,232]
	str	w6, [sp,228]
	bgt	.L19
.L16:
	ldr	w1, [sp,260]
	ldr	w5, [sp,264]
	add	w1, w1, 1
	cmp	w1, w5
	str	w1, [sp,260]
	beq	.L1
	ldr	x1, [sp,200]
	str	x0, [sp,200]
	mov	x0, x1
	b	.L3
.L15:
	fmov	w6, s28
	fmov	w25, s25
	fmov	w7, s27
	fmov	w24, s26
	add	x9, x5, x6, sxtw 3
	add	x6, x5, x25, sxtw 3
	fmov	w25, s10
	add	x8, x5, x7, sxtw 3
	add	x7, x5, x24, sxtw 3
.L6:
	add	x1, x12, x15
	ldr	d10, [x12,8]
	ldr	d1, [x1,x8]
	ldr	d0, [x1,x9]
	fmul	d1, d1, d16
	ldr	d9, [x12,-8]
	ldr	d8, [x12],8
	ldr	d20, [x1,x7]
	fmadd	d0, d0, d7, d1
	fmul	d8, d8, d2
	ldr	d19, [x1,x6]
	cmp	x12, x14
	fdiv	d8, d8, d21
	fmadd	d0, d20, d6, d0
	fmadd	d0, d19, d5, d0
	fmadd	d0, d10, d4, d0
	fmadd	d0, d9, d3, d0
	fsub	d0, d0, d8
	str	d0, [x13],8
	bne	.L6
	fmov	s10, w25
	b	.L12
.L29:
	ldr	w8, [sp,224]
	str	w8, [sp,236]
	b	.L10
.L1:
	ldp	x19, x20, [sp]
	ldp	x21, x22, [sp,16]
	ldp	x23, x24, [sp,32]
	ldp	x25, x26, [sp,48]
	ldp	x27, x28, [sp,64]
	ldp	d8, d9, [sp,80]
	ldp	d10, d11, [sp,96]
	ldp	d12, d13, [sp,112]
	ldp	d14, d15, [sp,128]
	add	sp, sp, 272
	ret
	.size	StencilProbe, .-StencilProbe
	.ident	"GCC: (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",%progbits
