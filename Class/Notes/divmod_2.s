/* Div Mod with shifted subtraction */

.global _start


_start:

MOV R1, #0		@ result of R5/R4
MOV R2, #1		@ increment of division
MOV R4, #6		@ denominator
MOV R5, #55		@ numerator
MOV R0, R5		@ result of R5%R4 start with numerator
MOV R3, R4		@ decriment value start with denominator

_shiftleft:
	LSL R3, #1	@ denominator shift left
	LSL R2, #1	@ division shift left
	CMP R0, R3
BGT _shiftleft
LSR R3, #1
LSR R2, #1

/* Loop and keep subtracting off the shifted denominator*/

CMP R0, R3
BLT _output
			@ BGE _whileR0_GE_R3
_whileR0_GE_R3:		@ increment the division by the increment
	ADD R1,R1,R2
	SUB R0,R0,R3
	_whileR2_GT1_and_R3GTR0:	@ unsure how to perform logical and
		LSR R2, #1		@ of two compares
		LSR R3, #1
		CMP R2, #1
		BGT _whileR2_GT1_and_R3GTR0
CMP R0, R3	@ keep looping until division is complete
BGE _whileR0_GE_R3

_output:
	MOV R0, R1		@ comment out to provide modulus answer
	MOV R7, #1
	SWI 0

