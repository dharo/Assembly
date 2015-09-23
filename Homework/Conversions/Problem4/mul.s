@ This is calculating Area
@ radius = 6
@ area = pi(r^2)
@ result (R0) stored as 1 byte
.global _start
_start:
	LDR R1, =0x6		@ BP 0  WD  8    radius = 6
	LDR R2, =0x624275	@ BP-20 WD 24	 this is pi
	MUL R0, R2, R1		@ BP-24 WD 32 this is the result
	LSR R0, #24		@ BP 0 WD 8 <--result should be saved to 1 byte
	MOV R7, #1
	SWI 0
