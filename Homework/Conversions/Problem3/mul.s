@ This is calculating r^2 
@ area = 113.4 stored to 2 bytes
@ conversion of 1/pi is stored in R2 as 3 bytes 0x517CC1
@ result (R0) stored as 1 byte
.global _start
_start:
	LDR R1, =0x7166		@ BP-8  WD 16
	LDR R2, =0x517C		@ BP-16 WD 16
	MUL R0, R2, R1		@ BP-24 WD 32 this is the result
	LSR R0, #24		@ BP 0 WD 8 <--result should be saved to 1 byte
	MOV R7, #1
	SWI 0
