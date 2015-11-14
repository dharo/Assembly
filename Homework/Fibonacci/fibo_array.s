//Fibonacci with Arrays
.data
.balign 4
a: .skip 400		//400 = 100 * 4 == 100 elements of 4byte integers

.text
.global main
main:
	ldr r1, =a	//load array(at beginning)
	mov r2, #0	//set counter at 0
loop:
	cmp r2, #100	//compare to 100
	beq end		//leave loop if reached 100

