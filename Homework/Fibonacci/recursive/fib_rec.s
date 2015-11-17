.global fib
fib:
	push {r3,r4,r5,lr}

	cmp r0,#1	//r0 == 1   (BASE CASE)
	beq end
	cmp r0,#2	//r0 == 2   (BASE CASE)
	moveq r0,#1	//second term in fibonacci sequence is 1
	beq end		//if eq, mov #1 to R0 and branch to end

	sub r0, r0, #1	//else r0 = r0 - #1
	mov r4,r0 	//save r0 in R3
	bl fib		//recursive call  fibo(n-1)
	mov r5, r0	//mov r0 to r5
	sub r0, r4, #1	// r0 = r4--
	//mov r0,r2 	//load previous r0
	//sub r0,r0,#1	//recursive call fibo(n-2)
	bl fib
	add r0,r0,r5
end:
	pop {r3,r4,r5,lr}
	bx lr
