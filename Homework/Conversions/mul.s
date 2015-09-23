.global _start
_start:
	MOV R1, #110		@ BP0 WD8
	LDR R2, =0x517CC1	@ BP-24 WD24
	MUL R0, R2, R1		@ BP-24 WD32 this is the result
	LSR R0, #24		@ BP0 WD8
	MOV R7, #1
	SWI 0
