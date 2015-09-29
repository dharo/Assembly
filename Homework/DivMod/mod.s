.global _start
_start:			@ This is going to mod% 16 by 3
	MOV R0,#0
	MOV R1,#16
	MOV R2,#3
_divide:
	SUB R1,R1,R2	@ R1 = R1-R3
			@ADD R0,R0,#1	@ counter (integer division result)
	CMP R1,R2	@ Compare 3 and the value that we subtracted from
	BGT _divide	@ If greater than, repeat
	MOV R0,R1
	B _output	@ else exit program
_output:
	MOV R7, #1
	SWI 0
