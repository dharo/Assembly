.data
.balign 4
exit_prompt: .asciz "\n\nThank you for Playing!\n\n"
.balign 4
intro_message: .asciz "Welcome to Tic Tac Toe\n"
.balign 4
menu: .asciz "Press 1 to Play\nPress 2 to Exit\n"
.balign 4
prompt: .asciz "Enter your selection: "
.balign 4
scan: .asciz "%d"
.balign 4
number_read: .word 0
.balign 4
return: .word 0
.balign 4
returnGR: .word 0
.text
.global main

main:
	ldr r1, return_addr
	str lr, [r1]

	ldr r0, intro_addr
	bl printf
	ldr r0, menu_addr
	bl printf
	try_again:
	ldr r0, prompt_addr
	bl printf
	ldr r0, =scan		//prepare to read in input
	ldr r1, =number_read
	bl scanf
	ldr r0, num_addr	//throw input to register
	ldr r0, [r0]		//to validate input
	cmp r0, #1
	blt try_again
	beq game_runf		//if(input == 1) jump to label
	cmp r0, #2
	beq exit
	bgt try_again
	game_runf:		//label jumps to function
		bl game_run
	exit:
	ldr r0, =exit_prompt
	bl printf
	ldr lr, return_addr	//prepare return address
	ldr lr, [lr]
	bx lr			//exit
//addresses
return_addr	:	.word return
intro_addr	:	.word intro_message
menu_addr	:	.word menu
prompt_addr	:	.word prompt
num_addr	:	.word number_read
//external
.global printf
.global scanf
.global returnGR

