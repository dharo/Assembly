.data
.balign 4
intro_qfloat: .asciz "This program will calculate quadratic formula: a(x^2) + bx\nWhere a = 0.073 and b = 0.876\n"
.balign 4
promptfor_x: .asciz "Enter a value for x (0-255): "
.balign 4
valOf_x: .word 0
.balign 4
scanfor_int: .asciz "%d"
.balign 4
display_answer: .asciz "The asnwer is %f\n\n"
.balign 4
display_x: .asciz "When x is: %d\n"
.balign 4
valOf_a: .float 0.073
.balign 4
valOf_b: .float 0.876

.text
.global quad_flt
quad_flt:
	push {lr}
display_msg:
	ldr r0, =intro_qfloat
	bl printf
get_x:
	ldr r0, =promptfor_x
	bl printf
	ldr r0, =scanfor_int
	ldr r1, =valOf_x
	bl scanf
	ldr r0, =valOf_x
	ldr r0,[r0]
	cmp r0, #0
	blt get_x
	ldr r0, =valOf_x
	ldr r0,[r0]
	cmp r0, #255
	bgt get_x
calc_func:
	ldr r5, =valOf_x
	ldr r5,[r5]		//this is x
	mov r7, r5
	mul r5, r5, r5		//r5 = x * x
	vmov s10, r5
	vcvt.f32.s32 s0, s10	//convert r5 to float, save in s0

	ldr r9, =valOf_a	//address of a
	vldr s11, [r9]		//load to float register s1
	vcvt.f64.f32 d9, s11	//convert to float and save to s1
	vcvt.f32.f64 s1, d9
	vmul.f32 s0, s0, s1	//s0 = a*(x^2)	float multiplication

	ldr r8, =valOf_b
	vldr s12, [r8]		//bit copt to float register
	vcvt.f64.f32 d10, s12	//convert to float and store back in register
	vcvt.f32.f64 s2, d10
	vmov s13, r7
	vcvt.f32.s32 s3, s13
	vmul.f32 s4, s2, s3	//s4 = b*x
	vadd.f32 s28, s0, s4	//s0 = result
display_result:
	ldr r0, =display_x
	mov r1, r7
	bl printf
	ldr r0, =display_answer
	vcvt.f64.s32 d8, s10
	vmov r1,r2,d8
	bl printf

exit_quadflt:
	pop {lr}
	bx lr

test_print:
	ldr r0, =display_answer
	vcvt.f64.f32 d8, s0
	vmov r1,r2,d8
	bl printf
	bal exit_quadflt
