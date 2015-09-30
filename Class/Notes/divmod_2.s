/* Div Mod with shifted subtraction */





MOV R1, #0
MOV R2, #1		@ increment of division
MOV R4, #6		@ denominator
MOV R5, #55		@ numerator
MOV R0, R5
MOV R3, R4

_shiftleft:
	LSL R3, #1	@ denominator shift left
	LSL R2, #1	@ division shift left
	CMP R0, R3
BGT _shiftleft
LSR R3, #1
LSR R2, #1

/* Loop and keep subtracting off the shifted denominator*/


CMP R0, R3	@ keep looping until division is complete
BGE _whileR0_GE_R3	@ increment the division by the increment
_whileR0_GE_R3:
	ADD R1,R1,R2
	SUB R0,R0,R3
	_whileR2_GT1_and_R3GTR0:
		LSR R2, #1
		LSR R3, #1
		CMP R2, #1
CMP R0, R3

_output:
	MOV R7, #1
	SWI 0
