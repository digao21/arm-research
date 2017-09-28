	.arch armv8-a+fp+simd
	.file	"probe_heat_circqueue.c"
	.text
	.align	2
	.global	CircularQueueInit
	.type	CircularQueueInit, %function
CircularQueueInit:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp,16]
	sub	w19, w2, #1
	mov	w20, w0
	sbfiz	x0, x19, 2, 32
	str	x1, [x29,40]
	str	x2, [x29,32]
	bl	malloc
	mov	x3, x0
	adrp	x0, queuePlanesIndices
	ldr	x1, [x29,40]
	ldr	x2, [x29,32]
	str	x3, [x0,#:lo12:queuePlanesIndices]
	cbz	x3, .L2
	cmp	w2, 1
	ble	.L9
	add	w1, w1, w19, lsl 1
	sub	w2, w2, #2
	mul	w1, w20, w1
	mov	x4, 4
	neg	w0, w20, lsl 1
	add	x2, x4, x2, uxtw 2
	mov	w19, 0
	add	x2, x3, x2
.L6:
	str	w19, [x3],4
	add	w19, w19, w1
	cmp	x3, x2
	add	w1, w1, w0
	bne	.L6
	add	w0, w19, w19, lsl 1
	sbfiz	x0, x0, 3, 32
.L4:
	bl	malloc
	adrp	x1, queuePlanes
	str	x0, [x1,#:lo12:queuePlanes]
	cbz	x0, .L10
	adrp	x2, queuePlane0
	sbfiz	x19, x19, 3, 32
	add	x1, x0, x19
	str	x0, [x2,#:lo12:queuePlane0]
	adrp	x0, queuePlane1
	add	x19, x1, x19
	str	x1, [x0,#:lo12:queuePlane1]
	adrp	x0, queuePlane2
	str	x19, [x0,#:lo12:queuePlane2]
	ldp	x19, x20, [sp,16]
	ldp	x29, x30, [sp], 48
	ret
.L9:
	mov	x0, 0
	mov	w19, w0
	b	.L4
.L10:
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	puts
	mov	w0, 1
	bl	exit
.L2:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
	mov	w0, 1
	bl	exit
	.size	CircularQueueInit, .-CircularQueueInit
	.align	2
	.global	StencilProbeCircqueue
	.type	StencilProbeCircqueue, %function
StencilProbeCircqueue:
	sub	sp, sp, #400
	stp	d8, d9, [sp,80]
	stp	d10, d11, [sp,96]
	str	w3, [sp,196]
	uxtw	x3, w3
	sub	w3, w3, #2
	stp	x25, x26, [sp,48]
	sdiv	w3, w3, w6
	stp	x19, x20, [sp]
	stp	x21, x22, [sp,16]
	stp	x23, x24, [sp,32]
	stp	x27, x28, [sp,64]
	str	w6, [sp,368]
	str	x0, [sp,240]
	str	w3, [sp,384]
	str	x1, [sp,392]
	cmp	w3, wzr
	stp	d12, d13, [sp,112]
	stp	d14, d15, [sp,128]
	mov	w26, w2
	ldr	d14, [x0]
	ble	.L11
	sub	w1, w2, #2
	lsr	w27, w1, 1
	lsl	w5, w27, 1
	ldr	w6, [sp,400]
	fmov	s26, w5
	add	w5, w5, 1
	str	w5, [sp,360]
	add	w5, w4, w6
	sub	w5, w5, #2
	str	w5, [sp,332]
	adrp	x5, queuePlanesIndices
	ldr	w3, [sp,196]
	adrp	x6, queuePlane1
	mov	x25, x0
	ldr	x5, [x5,#:lo12:queuePlanesIndices]
	sub	w0, w4, #1
	str	x5, [sp,256]
	adrp	x5, queuePlane0
	mul	w2, w3, w0
	ldr	x6, [x6,#:lo12:queuePlane1]
	str	x6, [sp,264]
	fmov	w6, s26
	ldr	x5, [x5,#:lo12:queuePlane0]
	mul	w2, w26, w2
	str	x5, [sp,272]
	add	x2, x25, x2, sxtw 3
	ldr	w5, [sp,196]
	str	w0, [sp,252]
	fmov	s25, w1
	sxtw	x0, w26
	lsl	w1, w26, 1
	str	x2, [sp,304]
	adrp	x25, queuePlane2
	sub	w2, w26, #1
	add	w6, w6, 1
	sub	w3, w26, #3
	str	w2, [sp,156]
	ldr	w2, [sp,196]
	lsl	x23, x0, 3
	add	x3, x3, 1
	mul	w1, w1, w5
	neg	x0, x0, lsl 3
	ldr	x25, [x25,#:lo12:queuePlane2]
	lsl	x28, x3, 3
	str	w1, [sp,364]
	str	x0, [sp,176]
	mov	w1, 1
	uxtw	x0, w6
	ldr	w3, [sp,400]
	fmov	s31, w6
	fmov	d1, d14
	mul	w2, w26, w2
	sub	w0, w0, #1
	str	x25, [sp,200]
	str	w1, [sp,328]
	uxtw	x25, w6
	mov	w1, w26
	str	w2, [sp,324]
	add	w25, w25, 1
	str	w0, [sp,188]
	neg	w2, w5
	sub	w3, w3, #1
	sub	w4, w4, #2
	mov	x24, x23
	mov	w26, w27
	str	w25, [sp,192]
	mov	w0, 0
	str	w2, [sp,248]
	str	w3, [sp,280]
	str	w4, [sp,316]
	fmov	d12, 6.0e+0
	mov	x23, x28
	mov	w27, w1
	fmov	v13.2d, 6.0e+0
.L13:
	ldr	w5, [sp,332]
	cmp	w5, 1
	ble	.L103
	ldr	w3, [sp,368]
	ldr	w25, [sp,400]
	ldr	w2, [sp,400]
	add	w3, w0, w3
	ldr	w4, [sp,328]
	ldr	w5, [sp,196]
	mov	w6, 2
	add	w25, w25, w3
	sub	w0, w0, w2
	str	w3, [sp,372]
	str	w4, [sp,388]
	str	w5, [sp,312]
	mov	w1, 0
	str	w6, [sp,284]
	str	w25, [sp,376]
	str	w0, [sp,380]
.L69:
	ldr	w25, [sp,400]
	ldr	w0, [sp,284]
	cmp	w25, wzr
	sub	w0, w0, #1
	str	w0, [sp,184]
	ble	.L104
	ldr	s29, .LC2
	str	xzr, [sp,168]
	ldr	w4, [sp,324]
	ldr	w5, [sp,364]
	ldr	w22, [sp,168]
	ldr	w3, [sp,380]
	fmov	s3, s29
	add	w4, w1, w4
	ldr	x25, [sp,240]
	add	w0, w1, w5
	ldr	w6, [sp,284]
	add	x1, x25, x1, sxtw 3
	ldr	w2, [sp,376]
	ldr	s2, [sp,312]
	str	x1, [sp,336]
	add	x0, x25, x0, sxtw 3
	add	x1, x25, x4, sxtw 3
	add	w3, w3, 2
	mov	w28, w26
	str	w4, [sp,288]
	mov	w26, w27
	str	w6, [sp,320]
	mov	w27, w22
	str	x1, [sp,344]
	str	x0, [sp,352]
	str	w2, [sp,160]
	str	w3, [sp,164]
	mov	x22, x23
.L66:
	ldr	w4, [sp,184]
	fmov	s16, s3
	cmp	w4, w27
	ble	.L16
	ldr	w5, [sp,252]
	add	w0, w27, w5
	cmp	w4, w0
	bge	.L16
	cbz	w27, .L70
	ldr	x25, [sp,256]
	ldr	x6, [sp,168]
	ldr	x1, [sp,272]
	add	x0, x25, x6
	ldr	x3, [sp,200]
	ldr	x2, [sp,264]
	ldrsw	x0, [x0,-4]
	lsl	x0, x0, 3
	add	x1, x1, x0
	add	x3, x3, x0
	fmov	d18, x1
	fmov	d9, x3
	add	x17, x2, x0
.L17:
	ldr	w4, [sp,164]
	ldr	w9, [sp,160]
	cmp	w4, wzr
	mov	x1, x4
	ble	.L71
	cmp	w27, wzr
	cset	w0, eq
	mov	x8, x4
	mov	w10, 0
.L18:
	ldr	w5, [sp,196]
	ldr	w6, [sp,160]
	ldr	s8, [sp,160]
	cmp	w5, w6
	bgt	.L19
	sub	w5, w5, #1
	ldr	w9, [sp,196]
	fmov	s8, w5
.L19:
	ldr	w25, [sp,280]
	cmp	w25, w27
	beq	.L105
	fmov	w5, s2
	ldr	x3, [sp,168]
	ldr	x4, [sp,256]
	ldr	x6, [sp,200]
	ldrsw	x2, [x4,x3]
	add	w3, w5, w1
	mul	w3, w3, w26
	add	x6, x6, x2, lsl 3
	fmov	s17, w3
	fmov	d14, x6
.L21:
	cbz	w0, .L22
	fmov	w25, s2
	mul	w19, w26, w25
.L23:
	fmov	w3, s3
	fmov	x5, d18
	ldr	w2, [sp,184]
	ldr	w4, [sp,316]
	fmov	x25, d9
	ldr	x6, [sp,240]
	cmp	w2, w3
	add	w0, w4, w27
	csel	x5, x5, x6, ne
	cmp	w2, w0
	ldr	x0, [sp,304]
	ldr	w2, [sp,280]
	csel	x25, x25, x0, ne
	cmp	w2, w27
	fmov	d18, x5
	fmov	d9, x25
	fmov	s16, s3
	ble	.L34
	add	w1, w1, 1
	sub	w3, w9, #1
	cmp	w1, w3
	bge	.L31
	fmov	w4, s2
	fmov	w5, s17
	ldr	w25, [sp,156]
	add	w0, w1, w4
	sxtw	x2, w5
	mul	w0, w26, w0
	sxtw	x4, w19
	sbfiz	x6, x0, 3, 32
	neg	x4, x4, lsl 3
	add	w0, w25, w0
	neg	x2, x2, lsl 3
	add	x7, x4, x6
	add	x4, x4, x0, sxtw 3
	add	x6, x2, x6
	add	x2, x2, x0, sxtw 3
	fmov	x0, d14
	add	x5, x17, x4
	add	x7, x17, x7
	add	x6, x0, x6
	add	x4, x0, x2
	mov	x0, 0
.L32:
	ldr	x2, [x7,x0]
	add	w1, w1, 1
	cmp	w1, w3
	str	x2, [x6,x0]
	ldr	x2, [x5,x0]
	str	x2, [x4,x0]
	add	x0, x0, x26, sxtw 3
	bne	.L32
.L31:
	cbz	w10, .L106
	ldr	w6, [sp,156]
	cmp	w6, 1
	ble	.L34
	fmov	w25, s2
	fmov	w1, s17
	fmov	x3, d14
	sxtw	x4, w19
	mul	w0, w26, w25
	sxtw	x2, w1
	sxtw	x1, w0
	sub	x5, x1, x4
	sub	x1, x1, x2
	add	x5, x17, x5, lsl 3
	add	x1, x3, x1, lsl 3
	add	x6, x5, 24
	add	x3, x1, 8
	cmp	x3, x6
	add	x1, x1, 24
	add	x5, x5, 8
	cset	w6, cs
	cmp	x5, x1
	cset	w1, cs
	orr	w1, w6, w1
	cbz	w1, .L36
	fmov	w6, s25
	cmp	w6, 10
	bls	.L36
	fmov	w25, s26
	cbz	w25, .L37
	mov	w1, 0
.L40:
	add	w1, w1, 1
	cmp	w1, w28
	ld1	{v0.2d}, [x5],16
	st1	{v0.2d}, [x3],16
	bcc	.L40
	fmov	w1, s25
	fmov	w3, s26
	cmp	w1, w3
	beq	.L41
.L37:
	ldr	w5, [sp,360]
	fmov	w6, s17
	add	w0, w0, w5
	sub	w1, w0, w19
	fmov	x25, d14
	ldr	x1, [x17,w1,sxtw 3]
	sub	w0, w0, w6
	str	x1, [x25,w0,sxtw 3]
.L41:
	ldr	w3, [sp,196]
	cmp	w9, w3
	beq	.L33
.L34:
	fmov	w3, s8
	cmp	w8, w3
	bge	.L16
	fmov	w4, s2
	add	w21, w8, 1
	sub	w0, w8, #1
	fmov	x5, d18
	add	w1, w4, w21
	add	w8, w8, w4
	add	w0, w4, w0
	mul	w1, w26, w1
	mul	w8, w26, w8
	mul	w0, w26, w0
	fmov	s7, w1
	sxtw	x18, w19
	sxtw	x14, w8
	sxtw	x1, w1
	sub	x2, x14, x18
	add	x20, x14, 1
	add	x1, x1, 1
	fmov	w6, s17
	fmov	s10, w0
	sxtw	x0, w0
	lsl	x2, x2, 3
	sub	x16, x0, x18
	sub	x20, x20, x18
	sub	x18, x1, x18
	fmov	x1, d9
	add	x15, x5, x2
	fmov	w5, s7
	fmov	x25, d14
	lsl	x12, x14, 3
	sub	x14, x14, x6, sxtw
	fmov	x6, d9
	sub	x3, x12, x19, sxtw 3
	add	x3, x3, x1
	add	x1, x1, x2
	add	x3, x3, 24
	add	x1, x1, 8
	add	x4, x17, x5, sxtw 3
	fmov	s5, s8
	sub	x4, x4, x19, sxtw 3
	fmov	s4, w8
	add	x4, x4, 24
	fmov	s6, w26
	fmov	s8, w28
	add	x14, x25, x14, lsl 3
	mvn	x0, x0
	str	x1, [sp,216]
	mov	x1, 8
	fmov	d15, x4
	fmov	d29, x3
	add	x25, x15, 8
	add	x3, x1, x5, sxtw 3
	add	x4, x14, x1
	fmov	s19, w27
	add	x16, x17, x16, lsl 3
	lsl	x0, x0, 3
	add	x20, x6, x20, lsl 3
	add	x2, x17, x2
	add	x18, x17, x18, lsl 3
	mov	w11, 0
	mov	x13, 0
	str	x25, [sp,208]
	str	x3, [sp,224]
	str	x4, [sp,232]
	mov	x27, x22
.L43:
	ldr	w4, [sp,156]
	mov	w22, w21
	cmp	w4, 1
	ble	.L58
	add	x10, x14, 8
	add	x1, x2, 24
	add	x4, x14, 24
	cmp	x10, x1
	fmov	w6, s25
	add	x9, x2, 8
	cset	w5, cs
	add	x1, x2, 32
	cmp	x4, x9
	add	x7, x2, 16
	cset	w23, ls
	cmp	x10, x1
	cset	w28, cs
	fmov	s24, w5
	cmp	x4, x7
	cset	w25, ls
	cmp	w6, 3
	cset	w26, hi
	cmp	x10, x7
	fmov	s21, w26
	fmov	w26, s24
	cset	w1, cs
	cmp	x4, x2
	fmov	s20, w1
	add	x1, x16, 24
	cset	w22, ls
	orr	w23, w26, w23
	cmp	x10, x1
	fmov	w26, s21
	add	x5, x16, 8
	cset	w8, cs
	add	x1, x15, 24
	cmp	x4, x5
	cset	w6, ls
	cmp	x10, x1
	orr	w1, w28, w25
	and	w23, w23, w1
	fmov	x25, d15
	and	w23, w26, w23
	fmov	w26, s20
	add	x3, x15, 8
	cset	w28, cs
	add	x1, x25, x13
	cmp	x4, x3
	cset	w25, ls
	cmp	x10, x1
	orr	w1, w26, w22
	and	w23, w23, w1
	cset	w22, cs
	orr	w6, w8, w6
	cmp	x4, x18
	cset	w1, ls
	and	w8, w23, w6
	fmov	w26, s7
	orr	w6, w28, w25
	orr	w1, w22, w1
	and	w6, w8, w6
	tst	w6, w1
	fmov	w1, s4
	fmov	w6, s10
	add	w26, w26, w11
	mov	w22, w21
	add	w28, w1, w11
	add	w25, w6, w11
	fmov	s28, w26
	fmul	d27, d1, d1
	beq	.L61
	fmov	x6, d29
	add	x1, x6, x13
	cmp	x10, x1
	cset	w6, cs
	cmp	x4, x20
	cset	w1, ls
	orr	w1, w6, w1
	cbz	w1, .L61
	fmov	w26, s26
	cbz	w26, .L54
	fmov	w26, s8
	mov	x8, x18
	mov	x6, x2
	mov	x4, x20
	mov	w1, 0
	dup	v30.2d, v27.d[0]
.L51:
	add	w1, w1, 1
	cmp	w1, w26
	ld1	{v23.2d}, [x3],16
	ld1	{v0.2d}, [x4],16
	ld1	{v22.2d}, [x5],16
	ld1	{v21.2d}, [x6],16
	ld1	{v20.2d}, [x7],16
	ld1	{v11.2d}, [x8],16
	ld1	{v8.2d}, [x9],16
	fadd	v0.2d, v23.2d, v0.2d
	fmul	v8.2d, v8.2d, v13.2d
	fadd	v0.2d, v0.2d, v22.2d
	fdiv	v8.2d, v8.2d, v30.2d
	fadd	v0.2d, v0.2d, v21.2d
	fadd	v0.2d, v0.2d, v20.2d
	fadd	v0.2d, v0.2d, v11.2d
	fsub	v0.2d, v0.2d, v8.2d
	st1	{v0.2d}, [x10],16
	bcc	.L51
	fmov	w1, s25
	fmov	w3, s26
	fmov	s8, w26
	cmp	w1, w3
	beq	.L58
.L54:
	fmov	w4, s31
	fmov	x6, d18
	ldr	w26, [sp,188]
	add	w1, w4, w28
	sub	w3, w1, w19
	sbfiz	x3, x3, 3, 32
	add	w5, w4, w25
	ldr	d0, [x17,x3]
	fmov	x25, d9
	fmul	d20, d0, d12
	ldr	d21, [x6,x3]
	sub	w5, w5, w19
	ldr	d0, [x25,x3]
	fdiv	d27, d20, d27
	fadd	d0, d21, d0
	ldr	d20, [x17,w5,sxtw 3]
	ldr	w3, [sp,192]
	add	w5, w26, w28
	sub	w5, w5, w19
	fadd	d0, d0, d20
	add	w4, w3, w28
	ldr	d20, [x17,w5,sxtw 3]
	sub	w4, w4, w19
	fadd	d0, d0, d20
	fmov	w5, s31
	ldr	d20, [x17,w4,sxtw 3]
	fmov	w4, s28
	fadd	d0, d0, d20
	fmov	w6, s17
	fmov	x25, d14
	add	w3, w5, w4
	sub	w3, w3, w19
	sub	w1, w1, w6
	ldr	d20, [x17,w3,sxtw 3]
	fadd	d0, d0, d20
	fsub	d27, d0, d27
	str	d27, [x25,w1,sxtw 3]
.L58:
	fmov	w26, s5
	fmov	w3, s6
	ldr	x1, [sp,176]
	add	w21, w21, 1
	cmp	w26, w22
	add	x13, x13, x24
	add	x16, x16, x24
	add	x12, x12, x24
	add	x0, x0, x1
	add	x15, x15, x24
	add	x14, x14, x24
	add	x20, x20, x24
	add	x2, x2, x24
	add	x18, x18, x24
	add	w11, w11, w3
	bgt	.L43
	mov	x22, x27
	fmov	w28, s8
	fmov	w27, s19
	fmov	w26, s6
.L16:
	fmov	w1, s3
	fmov	w3, s2
	fmov	w0, s16
	ldr	x4, [sp,168]
	ldr	w5, [sp,160]
	ldr	w6, [sp,164]
	ldr	w25, [sp,400]
	ldr	w2, [sp,248]
	add	w1, w1, 1
	add	w3, w3, w2
	add	x4, x4, 4
	sub	w5, w5, #1
	add	w6, w6, 1
	cmp	w25, w0
	str	x4, [sp,168]
	str	w5, [sp,160]
	str	w6, [sp,164]
	add	w27, w27, 1
	fmov	s3, w1
	fmov	s2, w3
	bgt	.L66
	ldr	x0, [sp,272]
	ldr	x25, [sp,264]
	ldr	x1, [sp,200]
	mov	w27, w26
	mov	x23, x22
	mov	w26, w28
	str	x25, [sp,272]
	str	x1, [sp,264]
	str	x0, [sp,200]
.L65:
	ldr	w4, [sp,284]
	ldr	w6, [sp,312]
	ldr	w2, [sp,332]
	ldr	w3, [sp,320]
	ldr	w5, [sp,196]
	add	w4, w4, 1
	add	w6, w6, w5
	cmp	w2, w3
	str	w4, [sp,284]
	str	w6, [sp,312]
	ldr	w1, [sp,288]
	bgt	.L69
	ldr	w25, [sp,328]
	ldr	w5, [sp,384]
	ldr	w6, [sp,388]
	add	w25, w25, 1
	cmp	w5, w6
	str	w25, [sp,328]
	ldr	w0, [sp,372]
	bgt	.L13
.L107:
	adrp	x0, queuePlane0
	adrp	x2, queuePlane1
	adrp	x4, queuePlane2
	ldr	x26, [sp,272]
	ldr	x1, [sp,264]
	ldr	x3, [sp,200]
	str	x26, [x0,#:lo12:queuePlane0]
	str	x1, [x2,#:lo12:queuePlane1]
	str	x3, [x4,#:lo12:queuePlane2]
.L11:
	ldp	x19, x20, [sp]
	ldp	x21, x22, [sp,16]
	ldp	x23, x24, [sp,32]
	ldp	x25, x26, [sp,48]
	ldp	x27, x28, [sp,64]
	ldp	d8, d9, [sp,80]
	ldp	d10, d11, [sp,96]
	ldp	d12, d13, [sp,112]
	ldp	d14, d15, [sp,128]
	add	sp, sp, 400
	ret
.L61:
	ldr	x1, [sp,208]
	ldr	x3, [sp,216]
	ldr	x4, [sp,224]
	ldr	x25, [sp,232]
	fmov	w26, s8
	add	x8, x1, x13
	add	x7, x3, x13
	add	x6, x4, x13
	mov	x1, 0
	add	x4, x25, x13
	add	x9, x12, 16
	add	x3, x12, 8
.L53:
	add	x10, x3, x5
	ldr	d0, [x7,x1]
	ldr	d11, [x10,x0]
	ldr	d8, [x8,x1]
	fmul	d11, d11, d12
	fadd	d8, d8, d0
	ldr	d0, [x5]
	add	x10, x12, x5
	fdiv	d11, d11, d27
	fadd	d0, d8, d0
	ldr	d20, [x10,x0]
	add	x23, x9, x5
	add	x10, x5, x6
	fadd	d0, d0, d20
	ldr	d21, [x23,x0]
	ldr	d20, [x10,x0]
	add	x5, x5, 8
	fadd	d0, d0, d21
	fadd	d0, d0, d20
	fsub	d0, d0, d11
	str	d0, [x4,x1]
	add	x1, x1, 8
	cmp	x1, x27
	bne	.L53
	fmov	s8, w26
	b	.L58
.L106:
	ldr	w5, [sp,196]
	cmp	w9, w5
	bne	.L34
	ldr	w2, [sp,156]
	fmov	w3, s17
	cmp	w2, 1
	sxtw	x4, w19
	sxtw	x2, w3
	ble	.L34
.L33:
	fmov	w6, s8
	fmov	w5, s2
	fmov	x25, d14
	add	w0, w6, w5
	mul	w0, w26, w0
	sxtw	x1, w0
	sub	x3, x1, x4
	sub	x1, x1, x2
	add	x3, x17, x3, lsl 3
	add	x1, x25, x1, lsl 3
	add	x6, x3, 24
	add	x5, x1, 8
	cmp	x5, x6
	add	x1, x1, 24
	add	x3, x3, 8
	cset	w6, cs
	cmp	x3, x1
	cset	w1, cs
	orr	w1, w6, w1
	cbz	w1, .L44
	fmov	w1, s25
	cmp	w1, 10
	bls	.L44
	fmov	w2, s26
	cbz	w2, .L45
	mov	x2, x5
	mov	w1, 0
.L48:
	add	w1, w1, 1
	cmp	w1, w28
	ld1	{v0.2d}, [x3],16
	st1	{v0.2d}, [x2],16
	bcc	.L48
	fmov	w3, s25
	fmov	w4, s26
	cmp	w3, w4
	beq	.L34
.L45:
	fmov	w5, s31
	fmov	w6, s17
	fmov	x25, d14
	add	w0, w0, w5
	sub	w1, w0, w19
	sub	w0, w0, w6
	ldr	x1, [x17,w1,sxtw 3]
	str	x1, [x25,w0,sxtw 3]
	b	.L34
.L22:
	fmov	w0, s2
	sub	w19, w1, #1
	add	w19, w19, w0
	mul	w19, w19, w26
	b	.L23
.L71:
	mov	w0, 1
	mov	w10, w0
	mov	w8, w0
	mov	w1, 0
	b	.L18
.L36:
	fmov	x1, d14
	add	w0, w0, 1
	sbfiz	x0, x0, 3, 32
	sub	x5, x0, x4, lsl 3
	sub	x0, x0, x2, lsl 3
	add	x3, x1, x0
	add	x5, x17, x5
	mov	x0, 0
.L42:
	ldr	x1, [x5,x0]
	str	x1, [x3,x0]
	add	x0, x0, 8
	cmp	x0, x22
	bne	.L42
	b	.L41
.L44:
	add	w0, w0, 1
	sbfiz	x0, x0, 3, 32
	sub	x4, x0, x4, lsl 3
	sub	x2, x0, x2, lsl 3
	fmov	x0, d14
	add	x4, x17, x4
	add	x2, x0, x2
	mov	x0, 0
.L50:
	ldr	x1, [x4,x0]
	str	x1, [x2,x0]
	add	x0, x0, 8
	cmp	x22, x0
	bne	.L50
	b	.L34
.L104:
	ldr	w3, [sp,324]
	ldr	w2, [sp,284]
	add	w1, w1, w3
	str	w2, [sp,320]
	str	w1, [sp,288]
	b	.L65
.L103:
	ldr	w6, [sp,328]
	ldr	w25, [sp,368]
	str	w6, [sp,388]
	add	w0, w0, w25
	ldr	w5, [sp,384]
	ldr	w25, [sp,328]
	ldr	w6, [sp,388]
	str	w0, [sp,372]
	add	w25, w25, 1
	cmp	w5, w6
	str	w25, [sp,328]
	ldr	w0, [sp,372]
	bgt	.L13
	b	.L107
.L105:
	ldr	d14, [sp,392]
	fmov	s17, wzr
	b	.L21
.L70:
	ldr	d9, [sp,352]
	ldr	x17, [sp,344]
	ldr	d18, [sp,336]
	b	.L17
	.size	StencilProbeCircqueue, .-StencilProbeCircqueue
	.align	2
.LC2:
	.word	1
	.comm	queuePlanesIndices,8,8
	.comm	queuePlane2,8,8
	.comm	queuePlane1,8,8
	.comm	queuePlane0,8,8
	.comm	queuePlanes,8,8
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	.string	"Error on array queuePlanesIndices malloc."
	.zero	6
.LC1:
	.string	"Error on array queuePlanes malloc."
	.ident	"GCC: (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",%progbits
