//Assembly Midterm
.data
//intro message
.balign 4
intro: .asciz "CSC11 Assembly Midterm: Produced by David Haro\n%s\n%s\n%s"
//offer options
.balign 4
problem1text: .asciz "1) Gross Pay \n"
.balign 4
problem2text: .asciz "2) ISP Subscription Bill\n"
.balign 4
problem3text: .asciz "3) Fibonacci Sequence\n"
.balign 4
input_prompt: .asciz "Make a selection, press 4 to exit\n"
//scan pattern
.balign 4
scan_pattern : .asciz "%d"
//store inputs
.balign 4
input_read: .word 0
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
 ldr r0, addressof_scan		//load scan pattern
 ldr r1, addressof_input	//save input
 bl scanf
 ldr r0, addressof_input	//save address to r0
 ldr r0, [r0]			//save inputted value to readable r0
//if(input == program)
 cmp r0, #1
 blt top
 beq gross_problem1
 cmp r0, #2
 beq ISP_problem2
 cmp r0, #3
 beq fibonacci
 cmp r0, #4
 beq exit
 bgt top
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
