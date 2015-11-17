.data
//first message
.balign 4
welcome: .asciz "This program will prompt for the nth number in the Fibonacci Series\n"
//prompt for input
.balign 4
prompt_in: .asciz "Enter the nth Number: "
//output message
.balign 4
output: .asciz "The %dth term in the Fibonacci Series is %d\n"
//scan formatter
.balign 4
scan_pattern : .asciz "%d"
//input
.balign 4
input: .word 0
//return
.balign 4
return: .word 0

.text
.global main

main:
 ldr r1, address_of_return      /* r1 ← &address_of_return */
 str lr, [r1]                   /* *r1 ← lr */
welc:
 ldr r0, addressof_welc
 bl printf
//prompt for input
 ldr r0, addressof_scan
 ldr r1, addressof_input
 bl scanf
 ldr r2, addressof_input
 ldr r2, [r2]
 cmp r2, #1
 blt welc
 bal fibo
fibo:
 mov r1, #1			//int i = 1
 mov r4, #0			//first
 mov r5, #1			//second
 bal for
for:				//r2 = user input
 cmp r1, r2			//stop at nth term
 bgt exit
 bge if_c_eq_n
 cmp r1, #1			//if c == 1
 beq if_c_eq_1
 bal else
if_c_eq_1:
 mov r3, r1		//next = c
 add r1, r1, #1		//c++
 bal for
else:
 add r3, r4, r5		//next = first + second
 mov r4, r5		//first = second
 mov r5, r3		//second = next
 add r1, r1, #1		//c++
 bal for
if_c_eq_n:
 add r3, r4, r5
 ldr r0, addressof_out
 mov r1, r2		//r2 = user input
 mov r2, r3		//r3 = next
 bl printf
 bal exit
exit:
 ldr lr, address_of_return      /* lr ← &address_of_return */
 ldr lr, [lr]                   /* lr ← *lr */
 bx lr                          /* return from main using lr */
//addresses to variables
addressof_welc		:	.word welcome
addressof_out		:	.word output
address_of_return	:	.word return
addressof_input		:	.word input
addressof_scan		:	.word scan_pattern
//external
.global printf
.global scanf
