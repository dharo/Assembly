/* Perform r0=r1+r2	*/

     .global _start
_start:
	MOV R1, #50		@ GET 50 INTO R1
	MOV R2, #60		@ GET 60 INTO R2
	ADDS R0,R1,R2		@ ADD THE TWO, RESULT IN R0

	MOV R7, #1		@ EXIT THROUGH SYSCALL
	SWI 0
