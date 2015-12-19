.data
.balign 4
intro_text: .asciz "This program will calculate future savings\n\n"
.balign 4
balance_prompt: .asciz "Please input the present balance for the account: "
.balign 4
scan_int: .asciz "%d"
.balign 4
rate_prompt: .asciz "Please enter the interest (range 5 - 10): "
.balign 4
years_prompt: .asciz "Please enter the number of years\nto calculate (range 1-20): "
.balign 4
present_val: .word 0
.balign 4
rate: .word 0
.balign 4
years: .word 0
.balign 4
year_out: .asciz "Year: %d  "
future_valu_out: .asciz "Value: $ %.2f \n"

//declare array
.balign 4
future_val: .skip 128		//integers hold 4, and we have 20


.text
.global savings
savings:
	push {ip,lr}
	ldr r0, =intro_text
	bl printf
get_balance:			//prompt for balance and save it
	ldr r0, =balance_prompt
	bl printf
	ldr r0, =scan_int
	ldr r1, =present_val
	bl scanf
	ldr r0, =present_val	//grab info from variable
	ldr r0, [r0]
	cmp r0, #1000		//is input < 1000?
	blt get_balance
	ldr r0, =present_val
	ldr r0, [r0]
	ldr r1, =5000
	cmp r0, r1		//is input > 5000?
	bgt get_balance
get_rate:
	ldr r0, =rate_prompt	//get rate
	bl printf
	ldr r0, =scan_int
	ldr r1, =rate
	bl scanf
	ldr r0, =rate
	ldr r0, [r0]
	cmp r0, #5		//is input < 5?
	blt get_rate
	ldr r0, =rate
	ldr r0, [r0]
	cmp r0, #10		//in input > 10?
	bgt get_rate
get_years:
	ldr r0, =years_prompt
	bl printf
	ldr r0, =scan_int
	ldr r1, =years
	bl scanf
	ldr r0, =years
	ldr r0, [r0]
	cmp r0, #1		//input < 1?
	blt get_years
	ldr r0, =years
	ldr r0, [r0]
	cmp r0, #20		//input > 20?
	bgt get_years
fix_rate:
	mov r8, #0
	ldr r1, =years
	ldr r9, [r1]		//lead years into r5

	ldr r1, =rate
	ldr r1,[r1]
	add r1, r1,#100		//input is scaled, adding 100 to make 1.05 * 10^2
	vmov s0,r1		//s0 = rate
	vcvt.f32.s32 s14, s0	//s4 is now rate in float
	mov r1, #100
	vmov s0, r1
	vcvt.f32.s32 s31, s0	//s5 = 100 in float
	vdiv.f32 s0, s14, s31	//s0 = interest rate

	ldr r4, =future_val
	ldr r1, =present_val
	ldr r1, [r1]
	vmov s31, r1
	vcvt.f32.s32 s14, s31
do_math:
	vmul.f32 s31,s14,s0	//s31 holds value of year+1
	vmov s14,s31
	vmov r1, s14
	str r1, [r4,r8,lsl #2]
	add r8,r8,#1
	cmp r8,r9
	blt do_math
	mov r8, #0		//seset index counter
	mov r7, #1
display_array:
	ldr r0, =year_out
	mov r1, r7
	bl printf
	ldr r0,=future_valu_out
	ldr r5,[r4,r8,lsl #2]
	vmov s0, r5
	vcvt.f64.f32 d5, s0
	vmov r1,r2,d5
	bl printf
	add r7,r7,#1
	add r8,r8,#1
	cmp r8,r9
	blt display_array
exit_savings:
	pop {ip,lr}
	bx lr
