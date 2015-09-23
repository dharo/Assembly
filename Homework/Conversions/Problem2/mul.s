@ This is calculating r^2 
@ area = 110 stored to 1 byte
@ conversion of 1/pi is stored in R2 as 3 bytes 0x517CC1
@ result (R0) stored as 1 byte
.global _start
_start:
	MOV R1, #110		@ BP0 WD8
	LDR R2, =0x517CC1	@ BP-24 WD24
	MUL R0, R2, R1		@ BP-24 WD32 this is the result
	LSR R0, #24		@ BP0 WD8
	MOV R7, #1
	SWI 0
