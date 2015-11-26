//Fibonacci with Local Array
.data
.balign 4
a: .skip 180		//180 = 45 * 4 == 45 elements of 4byte integers

.text
.global fib_loc_array
fib_loc_array:
	ldr r1, =a	//load array(at beginning)
	mov r2, #0	//set counter at 0
loop:
	cmp r2, #45	//compare to 100
	beq end		//leave loop if reached 100

