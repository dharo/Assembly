.text
.globl r_fibonacci
r_fibonacci:
	push {r4,lr}      		// Push r4 and lr onto the stack
	mov r4, r0         	// Keep a copy of the initial value of r0 in r4
	cmp r0, #0		//if r0 == 0, brach to end
	beq end
	cmp r0, #1		//if r0 == 1, branch to end
	beq end
is_gt_one:
	sub r0, r4, #1		//n-1
	bl r_fibonacci		//r0 = fibo(n-1)
	mov r1, r0
	bl r_fibonacci
	mov r2, r0
	add r4, r1,r2
end:
	pop {r4,lr}	       	// Pop lr and r4 from the stack
	bx lr              	//exit
