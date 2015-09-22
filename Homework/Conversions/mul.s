.global _start
_start:
	MOV R1, #48		@ BP0 WD6
	MOV R2, #0x00000009	@ BP-4 WD4
	MUL R0, R2, R1		@ BP-4 WD10 this is the result
	LSR R0, #4		@ because the BP has been -4
				@ it needs to be 0
	MOV R7, #1
	SWI 0
