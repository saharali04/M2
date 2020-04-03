	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initSnake
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSnake, %function
initSnake:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, #0
	mov	r6, #66
	mov	r3, #8
	mov	r9, #1
	mov	r8, #76
	mov	r7, #2
	mov	r4, r6
	mov	lr, r5
	mov	r2, #84
	mov	ip, #3
	ldr	r0, .L6
	mov	r1, r3
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	str	r3, [r0, #12]
	str	r3, [r0, #8]
	ldr	r3, .L6+4
	str	r9, [r0, #36]
	str	r8, [r0, #4]
	str	r7, [r0, #48]
	str	r6, [r0]
	str	r5, [r0, #24]
	str	r5, [r0, #28]
	str	r5, [r0, #40]
	str	r5, [r0, #44]
	add	r0, r3, #1040
.L2:
	str	r2, [r3, #4]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r4, [r3]
	str	ip, [r3, #28]
	str	lr, [r3, #36]
	add	r3, r3, #52
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L2
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	snakeHead
	.word	snakeBodyArray
	.size	initSnake, .-initSnake
	.global	__aeabi_idivmod
	.align	2
	.global	updateSnake
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSnake, %function
updateSnake:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L48
	ldr	r3, [r4, #28]
	cmp	r3, #6
	movne	r2, #0
	strne	r3, [r4, #32]
	strne	r2, [r4, #28]
	ldr	r1, .L48+4
	ldr	r2, [r4, #24]
	ldr	r3, .L48+8
	mla	r3, r2, r3, r1
	ldr	r1, .L48+12
	cmp	r3, r1
	addhi	r2, r2, #1
	strhi	r2, [r4, #24]
	bhi	.L11
	ldr	r0, [r4, #44]
	ldr	r3, .L48+16
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L11:
	ldr	r3, .L48+20
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldr	r5, .L48+24
	ldm	r4, {ip, lr}
	bne	.L12
	mov	r3, r5
	sub	r2, r5, #1040
.L13:
	ldr	r0, [r3, #992]
	ldr	r1, [r3, #988]
	str	r0, [r3, #1044]
	str	r1, [r3, #1040]
	sub	r3, r3, #52
	cmp	r3, r2
	bne	.L13
	mov	r3, #2
	ldr	r2, [r4, #8]
	str	ip, [r5]
	sub	ip, ip, r2
	str	lr, [r5, #4]
	str	ip, [r4]
	str	r3, [r4, #28]
.L12:
	ldr	r3, .L48+20
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L14
	ldr	r3, .L48+24
	sub	r2, r3, #1040
.L15:
	ldr	r0, [r3, #992]
	ldr	r1, [r3, #988]
	str	r0, [r3, #1044]
	str	r1, [r3, #1040]
	sub	r3, r3, #52
	cmp	r3, r2
	bne	.L15
	mov	r3, #2
	ldr	r2, [r4, #8]
	str	ip, [r5]
	add	ip, ip, r2
	str	lr, [r5, #4]
	str	ip, [r4]
	str	r3, [r4, #28]
.L14:
	ldr	r3, .L48+20
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L16
	ldr	r3, .L48+24
	sub	r2, r3, #1040
.L17:
	ldr	r0, [r3, #992]
	ldr	r1, [r3, #988]
	str	r0, [r3, #1044]
	str	r1, [r3, #1040]
	sub	r3, r3, #52
	cmp	r3, r2
	bne	.L17
	mov	r3, #1
	ldr	r1, .L48+20
	ldrh	r1, [r1, #48]
	tst	r1, #16
	ldr	r1, [r4, #12]
	str	lr, [r5, #4]
	sub	lr, lr, r1
	str	ip, [r5]
	str	lr, [r4, #4]
	str	r3, [r4, #28]
	bne	.L23
.L18:
	ldr	r3, .L48+24
.L21:
	ldr	r0, [r3, #992]
	ldr	r1, [r3, #988]
	str	r0, [r3, #1044]
	str	r1, [r3, #1040]
	sub	r3, r3, #52
	cmp	r2, r3
	bne	.L21
	mov	r3, #1
	ldr	r2, [r4, #12]
	str	lr, [r5, #4]
	add	lr, lr, r2
	str	ip, [r5]
	str	lr, [r4, #4]
	str	r3, [r4, #28]
.L22:
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #44]
	add	r2, r2, #1
	add	r3, r3, r1, lsl #5
	lsl	r3, r3, #16
	str	r2, [r4, #24]
	lsr	r3, r3, #16
.L24:
	ldr	r5, .L48+28
	ldr	r4, .L48+24
	mov	r7, r5
	strh	ip, [r5]	@ movhi
	strh	lr, [r5, #2]	@ movhi
	strh	r3, [r5, #4]	@ movhi
	ldr	r8, .L48+32
	add	r5, r5, #264
	add	r6, r4, #1040
	b	.L26
.L25:
	add	r4, r4, #52
	cmp	r4, r6
	add	r5, r5, #8
	beq	.L46
.L26:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L25
	ldm	r4, {r9, lr}
	ldr	ip, [r4, #28]
	strh	r9, [r5]	@ movhi
	strh	lr, [r5, #2]	@ movhi
	strh	ip, [r5, #4]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r7
	mov	r0, #3
	add	r4, r4, #52
	mov	lr, pc
	bx	r8
	cmp	r4, r6
	add	r5, r5, #8
	bne	.L26
.L46:
	ldr	r3, .L48+36
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L48+28
	mov	lr, pc
	bx	r8
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L16:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L47
	ldr	r3, [r4, #28]
	cmp	r3, #6
	bne	.L23
	mov	r3, #0
	str	r3, [r4, #44]
	str	r3, [r4, #28]
	b	.L24
.L47:
	ldr	r2, .L48+40
	b	.L18
.L23:
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	b	.L22
.L49:
	.align	2
.L48:
	.word	snakeHead
	.word	85899345
	.word	-1030792151
	.word	171798690
	.word	__aeabi_idivmod
	.word	67109120
	.word	snakeBodyArray
	.word	shadowOAM
	.word	DMANow
	.word	waitForVBlank
	.word	snakeBodyArray-1040
	.size	updateSnake, .-updateSnake
	.align	2
	.global	extendBody
	.syntax unified
	.arm
	.fpu softvfp
	.type	extendBody, %function
extendBody:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L55
	mov	r3, #0
	mov	r2, r0
	b	.L53
.L51:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #52
	bxeq	lr
.L53:
	ldr	r1, [r2, #36]
	cmp	r1, #0
	bne	.L51
	mov	r2, #1
	add	r1, r3, r3, lsl r2
	add	r3, r3, r1, lsl #2
	add	r3, r0, r3, lsl #2
	str	r2, [r3, #36]
	bx	lr
.L56:
	.align	2
.L55:
	.word	snakeBodyArray
	.size	extendBody, .-extendBody
	.align	2
	.global	initApples
	.syntax unified
	.arm
	.fpu softvfp
	.type	initApples, %function
initApples:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #8
	push	{r4, r5, r6, lr}
	ldr	r4, .L59
	ldr	r5, .L59+4
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	mov	lr, pc
	bx	r5
	ldr	r2, .L59+8
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #7
	rsb	r3, r3, r3, lsl #3
	sub	r0, r0, r3, lsl #5
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	mov	r1, #4
	mov	ip, #1
	ldr	r3, .L59+12
	smull	lr, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #3
	sub	r0, r0, r3, lsl r1
	str	r0, [r4]
	str	ip, [r4, #28]
	str	r1, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	apple
	.word	rand
	.word	-1840700269
	.word	954437177
	.size	initApples, .-initApples
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	initSnake
	pop	{r4, lr}
	b	initApples
	.size	initGame, .-initGame
	.align	2
	.global	drawApple
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawApple, %function
drawApple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L65
	ldr	r1, .L65+4
	ldr	r2, [r3]
	ldr	r0, [r3, #4]
	ldr	ip, [r3, #24]
	ldr	r4, .L65+8
	strh	r2, [r1, #16]	@ movhi
	strh	r0, [r1, #18]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	strh	ip, [r1, #20]	@ movhi
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	apple
	.word	shadowOAM
	.word	DMANow
	.size	drawApple, .-drawApple
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L93
	sub	sp, sp, #20
	bl	drawApple
	bl	updateSnake
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r5, .L93+4
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	r7, .L93+8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L91
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L70
.L77:
	ldm	r5, {r2, r3}
	cmp	r3, #232
	cmpls	r2, #152
	movhi	r2, #1
	ldrhi	r3, .L93+12
	ldr	r4, .L93+16
	mov	r9, #1
	strhi	r2, [r3]
	ldr	r8, .L93+12
	add	r6, r4, #1040
	b	.L76
.L74:
	add	r4, r4, #52
	cmp	r4, r6
	beq	.L92
.L76:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L74
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r7
	add	r4, r4, #52
	cmp	r0, #0
	strne	r9, [r8]
	cmp	r4, r6
	bne	.L76
.L92:
	ldr	r3, .L93+20
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L91:
	mov	r2, #5
	ldm	r4, {r0, ip}
	ldr	r1, .L93+24
	mov	r3, #512
	strh	r2, [r1, #20]	@ movhi
	strh	r0, [r1, #16]	@ movhi
	strh	ip, [r1, #18]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	ldr	r6, .L93+28
	mov	lr, pc
	bx	r6
	mov	ip, #0
	ldr	r1, [r5, #40]
	ldr	r0, .L93+16
	add	r1, r1, #1
	mov	r3, ip
	mov	r2, r0
	str	r1, [r5, #40]
	str	ip, [r4, #28]
	b	.L71
.L69:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #52
	beq	.L70
.L71:
	ldr	r1, [r2, #36]
	cmp	r1, #0
	bne	.L69
	mov	r2, #1
	add	r1, r3, r3, lsl r2
	add	r3, r3, r1, lsl #2
	add	r3, r0, r3, lsl #2
	str	r2, [r3, #36]
.L70:
	bl	initApples
	b	.L77
.L94:
	.align	2
.L93:
	.word	apple
	.word	snakeHead
	.word	collision
	.word	hasLost
	.word	snakeBodyArray
	.word	waitForVBlank
	.word	shadowOAM
	.word	DMANow
	.size	updateGame, .-updateGame
	.comm	hasLost,4,4
	.comm	apple,32,4
	.comm	snakeBodyArray,1456,4
	.comm	snakeHead,52,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
