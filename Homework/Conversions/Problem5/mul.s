@ This is calculating Area
@ radius = 6.5     0x68   BP -4 WD 8 (using 2 bytes) 
@ area = pi(r^2)   0x3242 BP-12 WD 16(using 2 bytes)
@ result (R0) stored as 1 byte
.global _start
_start:
	LDR R1, =0x68		@ BP -4 WD 8    radius = 6.5
	LDR R2, =0x3242		@ BP-12 WD 16   this is pi
		 @ Multiplication done here to square fraction in R1
	MUL R3, R1,R1		@ R3=R1*R1	this is  radius^2
				@ BP -8 WD 16   binary point grows
	MUL R0, R2, R3		@ BP-20 WD 32   this is the result
	LSR R0, #20		@ BP 0  WD 8 <--result should be saved to 1 byte
	MOV R7, #1
	SWI 0
