@ This is calculating Area
@ radius = 6
@ area = pi(r^2)
@ result (R0) stored as 1 byte
.global _start
_start:
	LDR R1, =0x6		@ BP 0  WD  8    radius = 6
	LDR R2, =0x324275	@ BP-20 WD 24	 this is pi
	MUL R3, R1,R1		@ R3=R1*R1	this is  radius^2
	MUL R0, R2, R3		@ BP-20 WD 32 this is the result
	LSR R0, #20		@ BP 0 WD 8 <--result should be saved to 1 byte
	MOV R7, #1
	SWI 0
