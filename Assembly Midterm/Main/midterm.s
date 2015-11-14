//Assembly Midterm
.data
//intro message
.balign 4
intro: .asciz "CSC11 Assembly Midterm: Produced by David Haro\n%s\n%s\n%s"
//offer options
.balign 4
problem1text: .asciz "a) Gross Pay \n"
.balign 4
problem2text: .asciz "b) ISP Subscription Bill\n"
.balign 4
problem3text: .asciz "c) Fibonacci Sequence\n"
.balign 4
input_prompt: .asciz "Make a selection, press q to exit\n"
.balign 4
a:	.asciz "a"
.balign 4
b:	.asciz "b"
.balign 4
c:	.asciz "c"
.balign 4
q:	.asciz "q"
//scan pattern
.balign 4
scan_pattern : .asciz "%s"
//store inputs
.balign 4
input_read: .asciz ""
//return
.balign 4
return: .word 0
.balign 4
return_prob1: .word 0
.text
.global main
main:
 ldr r6, main_return	        /* r1 ← &address_of_return */
 str lr, [r6]                   /* *r1 ← lr */
top:
 ldr r0, addressof_intro	//load up intro messages
 ldr r1, addressof_prob1txt	//selection for prob 1
 ldr r2, addressof_prob2txt	//selection for prob 2
 ldr r3, addressof_prob3txt	//selection for prob 3
 bl printf
 ldr r0, addressof_inpmpt	//prompt for input
 bl printf
//get user input for problem
 ldr r0, =scan_pattern		//load scan pattern
 ldr r1, =input_read	//save input
 bl scanf
 ldr r0, =input_read	//save address to r0
 ldr r0, [r0]			//save inputted value to readable r0
//if(input == program)
 //chack for A
 ldr r0, =input_read
 ldr r0, [r0]
 ldr r1, =a			//load r1 with text "a"
 ldr r1, [r1]
 cmp r0, r1
 beq gross_problem1_menu
 //check for B
 ldr r0, =input_read
 ldr r0, [r0]
 ldr r1, =b
 ldr r1, [r1]
 cmp r0, r1
 beq ISP_problem2_menu
 //check for C
 ldr r0, =input_read
 ldr r0, [r0]
 ldr r1, =c
 ldr r1, [r1]
 cmp r0, r1
 beq fibonacci_menu
 //check for q
 ldr r0, =input_read
 ldr r0, [r0]
 ldr r1, =q
 ldr r1, [r1]
 cmp r0, r1
 beq exit
 bal top
gross_problem1_menu:
	bl gross_problem1
	bal top
ISP_problem2_menu:
	bl ISP_problem2
	bal top
fibonacci_menu:
	bl fibonacci
	bal top
exit:
 ldr lr, main_return       /* lr ← &address_of_return */
 ldr lr, [lr]                    /* lr ← *lr */
 bx lr
//addresses
main_return		:	.word return
addressof_intro		:	.word intro
addressof_prob1txt	:	.word problem1text
addressof_prob2txt	:	.word problem2text
addressof_prob3txt	:	.word problem3text
addressof_inpmpt	:	.word input_prompt
addressof_input		:	.word input_read
addressof_scan		:	.word scan_pattern
//external
.global scanf
.global printf
.global return_prob1
.global strcmp
