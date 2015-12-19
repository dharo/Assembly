.data
//intro message
.balign 4
welcome: .asciz "48982 CSC 11: Assembly Final\nDavid Haro\n\n"
.balign 4
menu: .asciz "1. Guess the Number\n2. Savings Formula\n3. Quadratic Equation: Integer\n4. Quadratic Equation: Float\nEnter your selection (1-4)\n"
.balign 4
selection: .word 0
.balign 4
scan_pattern: .asciz "%d"

.text
.global main

main:
	push {lr}
prompt:
	ldr r0, =welcome
	bl printf
	ldr r0, =menu
	bl printf
input_selection:
	ldr r0, =scan_pattern
	ldr r1, =selection
	bl scanf
	ldr r0, =selection
	ldr r0, [r0]

	ldr r1, =1		//compare input to choices, branch to selection
	cmp r0, r1
	beq num_guess		//if selection == 1

	ldr r0,=selection
	ldr r0, [r0]
	cmp r0, #2
	beq savings_func		//if selection == 2
/*
	ldr r0, =selection
	ldr r0, [r0]
	cmp r0, #3
	beq qeq_int			//if selection == 3

	ldr r0, =selection
	ldr r0, [r0]
	cmp r0, #4
	beq qeq_flt			//if selection == 4
*/
exit:
	pop {lr}
	bx lr
num_guess:
	bl guess_num
	bal prompt
savings_func:
	bl savings
	bal prompt

//external
.global printf
.global scanf
