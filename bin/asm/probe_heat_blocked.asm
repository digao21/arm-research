	.arch armv8-a+fp+simd
	.file	"probe_heat_blocked.c"
	.text
	.align	2
	.global	StencilProbeBlocked
	.type	StencilProbeBlocked, %function
StencilProbeBlocked:
	sub	sp, sp, #368
	stp	d8, d9, [sp,80]
	stp	d10, d11, [sp,96]
	ldr	w7, [sp,368]
	stp	x25, x26, [sp,48]
	stp	x27, x28, [sp,64]
	stp	x19, x20, [sp]
	stp	x21, x22, [sp,16]
	stp	x23, x24, [sp,32]
	cmp	w7, wzr
	str	x1, [sp,168]
	str	w3, [sp,188]
	str	w5, [sp,300]
	str	w6, [sp,304]
	stp	d12, d13, [sp,112]
	stp	d14, d15, [sp,128]
	mov	x26, x0
	mov	w27, w2
	ldr	d22, [x0]
	ble	.L1
	sxtw	x0, w2
	uxtw	x6, w6
	mov	w1, 1
	sxtw	x11, w5
	sub	w1, w1, w6
	str	w1, [sp,336]
	sub	w2, w3, #1
	lsl	x22, x0, 3
	sub	w3, w27, #1
	neg	x0, x0, lsl 3
	neg	x7, x11, lsl 3
	str	x11, [sp,328]
	str	w2, [sp,308]
	str	w3, [sp,312]
	ldr	w11, [sp,188]
	str	x0, [sp,160]
	ldr	w2, [sp,336]
	ldr	w0, [sp,188]
	ldr	w3, [sp,188]
	fmov	d14, d22
	mvn	w1, w6
	sub	w4, w4, #1
	lsl	w11, w11, 1
	add	w0, w2, w0
	add	w1, w1, w3
	str	w4, [sp,280]
	str	x7, [sp,344]
	str	w11, [sp,340]
	str	wzr, [sp,316]
	str	w0, [sp,360]
	str	w1, [sp,364]
	fmov	d15, 3.0e+0
	fmov	d21, 2.0e+0
	fmov	d20, 4.0e+0
	fmov	d19, 5.0e+0
	fmov	d18, 6.0e+0
	fmov	d17, 7.0e+0
	fmov	d1, 2.6e+1
	mov	x21, x22
	mov	x28, x26
	fmov	v16.2d, 3.0e+0
	fmov	v7.2d, 2.0e+0
	fmov	v6.2d, 4.0e+0
	fmov	v5.2d, 5.0e+0
	fmov	v4.2d, 6.0e+0
	fmov	v3.2d, 7.0e+0
	fmov	v2.2d, 2.6e+1
.L3:
	ldr	w11, [sp,308]
	cmp	w11, 1
	ble	.L22
	ldr	w0, [sp,304]
	add	x1, x28, 8
	add	w0, w0, 1
	mov	x25, x28
	str	w0, [sp,260]
	str	x1, [sp,288]
	mov	x28, x21
	mov	w22, w27
.L25:
	ldr	w7, [sp,312]
	ldr	w11, [sp,260]
	ldr	w0, [sp,304]
	cmp	w7, 1
	sub	w11, w11, w0
	str	w11, [sp,192]
	ble	.L35
	ldr	w1, [sp,260]
	ldr	w2, [sp,308]
	ldr	w11, [sp,300]
	cmp	w1, w2
	csel	w7, w1, w2, le
	mov	x3, 1
	add	w11, w11, 1
	str	x3, [sp,176]
	mov	x0, -8
	str	w1, [sp,324]
	mov	x1, 16
	str	w7, [sp,156]
	str	w11, [sp,296]
	str	x0, [sp,248]
	str	x1, [sp,240]
	ldr	w3, [sp,360]
	ldr	w2, [sp,260]
	ldr	w11, [sp,364]
	ldr	w7, [sp,260]
	ldr	w1, [sp,336]
	ldr	w0, [sp,260]
	ldr	s29, [sp,176]
	add	w2, w3, w2
	add	w7, w11, w7
	add	w0, w1, w0
	str	w2, [sp,352]
	str	w7, [sp,356]
	str	w0, [sp,284]
.L24:
	ldr	w7, [sp,280]
	cmp	w7, 1
	ble	.L36
	ldr	w0, [sp,296]
	ldr	w1, [sp,312]
	fmov	w3, s29
	cmp	w0, w1
	csel	w2, w0, w1, le
	str	w2, [sp,184]
	mvn	w0, w3
	ldr	w11, [sp,184]
	sub	w2, w2, w3
	add	w1, w11, w0
	fmov	w11, s29
	lsr	w19, w2, 1
	lsl	w7, w19, 1
	ldr	w3, [sp,296]
	add	w11, w7, w11
	fmov	s30, w2
	str	w3, [sp,320]
	ldr	x2, [sp,240]
	ldr	w3, [sp,352]
	str	w11, [sp,196]
	ldr	w11, [sp,340]
	str	w3, [sp,204]
	str	w11, [sp,216]
	ldr	x3, [sp,176]
	ldr	x11, [sp,248]
	sub	x0, x2, #16
	str	w7, [sp,152]
	ldr	w2, [sp,356]
	ldr	w7, [sp,188]
	str	w2, [sp,212]
	str	w7, [sp,208]
	mov	w2, 2
	add	x1, x1, x3
	add	x7, x3, 1
	add	x0, x0, x11
	str	wzr, [sp,220]
	str	w2, [sp,200]
	str	x1, [sp,264]
	str	x7, [sp,272]
	str	x0, [sp,232]
.L21:
	ldr	w7, [sp,156]
	ldr	w11, [sp,192]
	cmp	w7, w11
	ble	.L37
	ldr	w2, [sp,192]
	ldr	w7, [sp,216]
	ldr	w3, [sp,208]
	add	w0, w2, w7
	ldr	w11, [sp,220]
	mul	w0, w22, w0
	add	w1, w3, w2
	ldr	x7, [sp,264]
	fmov	s23, w0
	add	w0, w2, w11
	mul	w1, w1, w22
	mul	w0, w22, w0
	ldr	x3, [sp,176]
	sxtw	x2, w1
	fmov	s31, w0
	fmov	s24, w1
	fmov	w1, s23
	ldr	w0, [sp,204]
	add	x4, x2, x3
	ldr	x11, [sp,272]
	sxtw	x13, w1
	fmov	w1, s31
	add	x9, x13, x3
	add	x15, x13, x7
	mul	w0, w22, w0
	add	x8, x3, x1, sxtw
	add	x7, x3, x0, sxtw
	ldr	w3, [sp,212]
	fmov	s25, w0
	ldr	x0, [sp,176]
	mul	w3, w22, w3
	add	x6, x0, x3, sxtw
	ldr	x0, [sp,288]
	fmov	s22, w3
	add	x15, x0, x15, lsl 3
	add	x14, x2, x11
	ldr	w11, [sp,200]
	fmov	w0, s22
	str	w11, [sp,256]
	ldr	x11, [sp,168]
	lsl	x4, x4, 3
	add	x1, x11, x4
	ldr	x3, [sp,248]
	ldr	x11, [sp,240]
	fmov	s22, s31
	fmov	s31, w0
	sub	x16, x4, #8
	ldr	w21, [sp,284]
	add	x3, x11, x3
	add	x9, x25, x9, lsl 3
	neg	x13, x13, lsl 3
	lsl	x2, x2, 3
	add	x8, x25, x8, lsl 3
	add	x7, x25, x7, lsl 3
	add	x6, x25, x6, lsl 3
	add	x4, x25, x4
	add	x14, x25, x14, lsl 3
	add	x16, x25, x16
	mov	w5, 0
	mov	x23, 0
	str	x3, [sp,224]
.L18:
	fmov	w11, s29
	ldr	w0, [sp,184]
	mov	w24, w21
	cmp	w11, w0
	bge	.L12
	add	x0, x4, 16
	add	x3, x1, 16
	cmp	x1, x0
	fmov	w11, s30
	cset	w27, cs
	cmp	x4, x3
	cset	w24, cs
	cmp	x3, x16
	cset	w17, ls
	cmp	x1, x14
	cset	w10, cs
	add	x0, x4, 24
	cmp	w11, 3
	cset	w26, hi
	cmp	x1, x0
	cset	w20, cs
	add	x0, x6, 16
	cmp	x14, x3
	cset	w11, cs
	cmp	x1, x0
	cset	w18, cs
	add	x0, x7, 16
	cmp	x6, x3
	orr	w24, w27, w24
	cset	w12, cs
	cmp	x1, x0
	orr	w0, w17, w10
	and	w17, w24, w0
	cset	w10, cs
	add	x0, x8, 16
	cmp	x7, x3
	cset	w24, cs
	and	w17, w26, w17
	cmp	x1, x0
	orr	w0, w20, w11
	and	w17, w17, w0
	cset	w11, cs
	orr	w12, w18, w12
	cmp	x8, x3
	cset	w0, cs
	orr	w10, w10, w24
	and	w12, w17, w12
	orr	w0, w11, w0
	and	w10, w12, w10
	tst	w10, w0
	fmov	w0, s24
	fmov	w11, s23
	mov	w24, w21
	fmul	d13, d14, d14
	add	w18, w0, w5
	fmov	w0, s22
	add	w20, w11, w5
	fmov	w11, s25
	add	w26, w0, w5
	fmov	w0, s31
	add	w27, w11, w5
	add	w0, w0, w5
	fmov	s27, w0
	beq	.L15
	add	x0, x9, 16
	cmp	x1, x0
	cset	w10, cs
	cmp	x9, x3
	cset	w0, cs
	orr	w0, w10, w0
	cbz	w0, .L15
	ldr	w0, [sp,152]
	cbz	w0, .L26
	mov	x0, 0
	mov	x11, x16
	mov	x10, x14
	mov	w3, w0
	dup	v28.2d, v13.d[0]
.L4:
	add	x17, x6, x0
	add	x12, x7, x0
	add	w3, w3, 1
	ld1	{v11.2d}, [x17]
	ld1	{v12.2d}, [x12]
	add	x17, x9, x0
	add	x12, x8, x0
	cmp	w3, w19
	ld1	{v26.2d}, [x17]
	ld1	{v0.2d}, [x12]
	ld1	{v9.2d}, [x11],16
	ld1	{v10.2d}, [x10],16
	add	x17, x4, x0
	add	x12, x1, x0
	ld1	{v8.2d}, [x17]
	fmul	v0.2d, v0.2d, v16.2d
	fmul	v8.2d, v8.2d, v2.2d
	fmla	v0.2d, v26.2d, v7.2d
	fdiv	v8.2d, v8.2d, v28.2d
	fmla	v0.2d, v12.2d, v6.2d
	fmla	v0.2d, v11.2d, v5.2d
	fmla	v0.2d, v10.2d, v4.2d
	fmla	v0.2d, v9.2d, v3.2d
	fsub	v0.2d, v0.2d, v8.2d
	st1	{v0.2d}, [x12]
	add	x0, x0, 16
	bcc	.L4
	fmov	w11, s30
	ldr	w3, [sp,152]
	cmp	w3, w11
	beq	.L12
	ldr	w12, [sp,196]
.L7:
	add	w11, w12, w26
	add	w10, w12, w20
	ldr	d8, [x25,w11,sxtw 3]
	ldr	d0, [x25,w10,sxtw 3]
	fmul	d8, d8, d15
	add	w10, w12, w18
	sbfiz	x10, x10, 3, 32
	add	w3, w12, w27
	fmadd	d8, d0, d21, d8
	ldr	d0, [x25,x10]
	ldr	d9, [x25,w3,sxtw 3]
	fmul	d0, d0, d1
	ldr	x11, [sp,168]
	fmov	w3, s27
	fdiv	d13, d0, d13
	fmadd	d0, d9, d20, d8
	add	w0, w12, w3
	add	w3, w12, 1
	ldr	d10, [x25,w0,sxtw 3]
	add	w0, w3, w18
	sub	w12, w12, #1
	ldr	d9, [x25,w0,sxtw 3]
	add	w0, w12, w18
	fmadd	d0, d10, d19, d0
	ldr	d8, [x25,w0,sxtw 3]
	fmadd	d0, d9, d18, d0
	fmadd	d0, d8, d17, d0
	fsub	d13, d0, d13
	str	d13, [x11,x10]
.L12:
	ldr	w0, [sp,156]
	ldr	x3, [sp,160]
	cmp	w0, w24
	add	w21, w21, 1
	add	x9, x9, x22, sxtw 3
	add	x23, x23, x28
	add	x1, x1, x28
	add	x13, x13, x3
	add	x2, x2, x28
	add	x15, x15, x28
	add	x8, x8, x28
	add	x7, x7, x28
	add	x6, x6, x28
	add	x4, x4, x28
	add	x14, x14, x28
	add	x16, x16, x28
	add	w5, w5, w22
	bgt	.L18
.L10:
	ldr	w3, [sp,200]
	ldr	w1, [sp,280]
	ldr	w2, [sp,256]
	add	w3, w3, 1
	ldr	w7, [sp,188]
	cmp	w1, w2
	ldr	w11, [sp,216]
	ldr	w0, [sp,220]
	ldr	w1, [sp,208]
	ldr	w2, [sp,204]
	str	w3, [sp,200]
	ldr	w3, [sp,212]
	add	w11, w11, w7
	add	w0, w0, w7
	add	w1, w1, w7
	add	w2, w2, w7
	add	w3, w3, w7
	str	w11, [sp,216]
	str	w0, [sp,220]
	str	w1, [sp,208]
	str	w2, [sp,204]
	str	w3, [sp,212]
	bgt	.L21
.L16:
	fmov	w7, s29
	ldr	w2, [sp,300]
	ldr	w3, [sp,296]
	ldr	w0, [sp,312]
	ldr	w1, [sp,320]
	add	w3, w3, w2
	cmp	w0, w1
	add	w7, w7, w2
	ldr	x0, [sp,176]
	ldr	x1, [sp,240]
	str	w3, [sp,296]
	add	x1, x1, x2, sxtw 3
	ldr	x3, [sp,248]
	ldr	x11, [sp,328]
	ldr	x2, [sp,344]
	add	x0, x0, x11
	add	x3, x3, x2
	str	x0, [sp,176]
	str	x1, [sp,240]
	str	x3, [sp,248]
	fmov	s29, w7
	bgt	.L24
	ldr	w3, [sp,260]
	ldr	w0, [sp,308]
	ldr	w1, [sp,324]
	ldr	w2, [sp,304]
	cmp	w0, w1
	add	w3, w3, w2
	str	w3, [sp,260]
	bgt	.L25
.L33:
	mov	x21, x28
	mov	w27, w22
	mov	x28, x25
.L22:
	ldr	w2, [sp,316]
	ldr	w7, [sp,368]
	add	w2, w2, 1
	cmp	w2, w7
	str	w2, [sp,316]
	beq	.L1
	ldr	x0, [sp,168]
	str	x28, [sp,168]
	mov	x28, x0
	b	.L3
.L26:
	fmov	w12, s29
	b	.L7
.L15:
	ldr	x11, [sp,232]
	ldr	x3, [sp,224]
	add	x27, x11, x13
	fmov	w11, s22
	add	x26, x3, x13
	fmov	w3, s25
	mov	x10, x1
	add	x20, x23, x11, sxtw 3
	fmov	w11, s31
	mov	x0, x9
	add	x18, x23, x3, sxtw 3
	add	x17, x23, x11, sxtw 3
.L6:
	add	x3, x0, x13
	add	x11, x27, x0
	ldr	d0, [x3,x20]
	add	x12, x26, x0
	fmul	d8, d0, d15
	ldr	d12, [x0],8
	ldr	d0, [x3,x2]
	ldr	d26, [x3,x18]
	fmadd	d12, d12, d21, d8
	fmul	d0, d0, d1
	ldr	d11, [x3,x17]
	ldr	d10, [x12,x2]
	ldr	d9, [x11,x2]
	fdiv	d8, d0, d13
	cmp	x0, x15
	fmadd	d0, d26, d20, d12
	fmadd	d0, d11, d19, d0
	fmadd	d0, d10, d18, d0
	fmadd	d0, d9, d17, d0
	fsub	d0, d0, d8
	str	d0, [x10],8
	bne	.L6
	b	.L12
.L37:
	ldr	w0, [sp,200]
	str	w0, [sp,256]
	b	.L10
.L36:
	ldr	w11, [sp,296]
	str	w11, [sp,320]
	b	.L16
.L35:
	ldr	w0, [sp,260]
	str	w0, [sp,324]
	ldr	w3, [sp,260]
	ldr	w0, [sp,308]
	ldr	w1, [sp,324]
	ldr	w2, [sp,304]
	cmp	w0, w1
	add	w3, w3, w2
	str	w3, [sp,260]
	bgt	.L25
	b	.L33
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
	add	sp, sp, 368
	ret
	.size	StencilProbeBlocked, .-StencilProbeBlocked
	.ident	"GCC: (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",%progbits
