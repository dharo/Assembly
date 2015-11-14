.data
message1: .asciz "To what nth term do you want to calculate the Fibonacci sequence? "
format:	  .asciz "%d"
message2: .asciz "\nThe %dth term of the Fibonacci Sequence is %d\n"

.text
.global main
main:
	str lr, [sp,#-4]!	//Push lr to top of stack
	sub sp, sp, #4		//make room for 4byte integer
				//to hold input from user
	ldr r0, =message1
	bl printf
	ldr r0, =format		//_____("%d",__);
	mov r1, sp		//_____("%d",topofstack);
	bl scanf		//scanf("%d",topofstack);

	ldr r0, [sp]		//loads data inputted to stack to r0
	bl fib
	mov r2, r0
	ldr r1, [sp]
	ldr r0, =message2
	bl printf
exit:
	add sp, sp, #+4		//discard number read by scanf
	ldr lr, [sp], #+4	//pop the top of stack and out in lr
	bx lr
