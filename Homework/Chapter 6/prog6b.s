/* Add two 64-bit numbers together	*/

	.global _start
_start:
				@number 1 = 8589934591
				@number 2 = 1099511627775
	MOV R2, #0xFFFFFFFF	@ LOW HALF NUMBER 1
	MOV R3, #0x1		@ HI HALF OF NUMBER 1
	MOV R4, #0xFFFFFFFF	@ LOW HALF OF NUMBER 2
	MOV R5, #0xFF		@ HI HALF OF NUMBER 2


	ADDS R0,R2,R4		@ ADD LOW AND SET FLAGS (set flag)
	ADCS R1,R3,R5		@ ADD HI WITH CARRY	(include flag in addition)

	MOV R7, #1		@EXIT THROUGH SYSCALL
	SWI 0
