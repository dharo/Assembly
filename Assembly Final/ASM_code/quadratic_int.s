.data
.balign 4
qint_intro: .asciz "This program will calculate a(x^2) + bx\nWhere a=0.073, b=0.876, the result will be scaled.\n"
.balign 4
in_prompt: .asciz "Enter a value for x (0-255): "
.balign 4
scan_int: .asciz "%d"
.balign 4
x_val: .word 0
.balign 4
ans_prompt: .asciz "The answer when x is %d is %d * 10^-3\n\n"


.text
.global quad_int

quad_int:
	push {lr}
start_fun:
	ldr r0, =qint_intro
	bl printf
user_input:
	ldr r0, =in_prompt	//prompt for input
	bl printf
	ldr r0, =scan_int
	ldr r1, =x_val
	bl scanf		//read input
	ldr r0, =x_val
	ldr r0,[r0]
	cmp r0, #255		//if x > 255 goto user_input
	bgt user_input
	ldr r0, =x_val
	ldr r0,[r0]
	cmp r0, #0		//if x < 0 goto user_input
	blt user_input
do_the_math:			//result = (a*(x*x))+(b*x);
	mov r4, #73		//a = 0.073 * 10^3
	mov r5, #876		//b = 0.876 * 10^3
	ldr r3, =x_val
	ldr r3,[r3]		//r3 = x
	mov r1, r3
	mul r3, r3, r3		// x * x
	mul r3, r3, r4		//a * (x*x)
	mul r2, r5, r1		//r2 = b*x
	add r2, r3, r2		//result
display_result:
	ldr r0, =ans_prompt
	bl printf 




exit_qint:
	pop {lr}
