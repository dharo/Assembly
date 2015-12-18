.data
.balign 4
randum_tst: .asciz "Random number generated: %d\n\n"
.balign 4
guess: .word 0
.balign 4
secret_num: .word 0
.balign 4
start_prompt: .asciz "Guess a number between 1 and 1000\n"
.balign 4
scan_guess: .asciz "%d"
.balign
you_win: .asciz "Correct! \n\n\n\n"
.balign 4
too_low: .asciz "Too Low, try again!\n"
.balign 4
too_high: .asciz "Too High, try again!\n"
.balign 4
max_prompt: .asciz "Max number of 10 attempts reached!!\n\n"

.text
.global guess_num

guess_num:
	push {lr}
	mov r5, #0	//attempts
	bl rando	//generate random number
	rando:
		mov r0, #0
		bl time
		bl srand
		bl rand
		mov r1,r0,ASR #1
		mov r2, #1000
		bl divMod
		add r1, #1
		ldr r0, =secret_num
		str r1,[r0]	//store secret number
intro_guess:
	ldr r0, =start_prompt
	bl printf
make_selection:
	ldr r0,=scan_guess
	ldr r1,=guess
	bl scanf
//compare results
	ldr r0,=guess
	ldr r0,[r0]		//load guessed num
	ldr r1, =secret_num
	ldr r1,[r1]		//load secret number
	cmp r0,r1
	beq correct_guess
	bgt little_high
	blt little_low
exit_guess_game:
	pop {lr}
	bx lr


little_high:
	ldr r0, =too_high
	bl printf
	add r5, r5, #1
	cmp r5, #10
	blt intro_guess
	beq max_attempts
little_low:
	ldr r0, =too_low
	bl printf
	add r5, r5, #1
	cmp r5, #10
	blt intro_guess
	beq max_attempts
correct_guess:
	ldr r0, =you_win
	bl printf
	bal exit_guess_game
max_attempts:
	ldr r0, =max_prompt
	bl printf
	bal exit_guess_game
