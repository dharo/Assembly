/*
	IF-STATEMENTS
	Input: 	Mon - Fri (1-5)
	Output:	Mon/Wed = 11
		Tues/Thurs = 5
		Friday = 1
		Anything else -> 0
*/

.global _start
_start:
	MOV R0, #4	@ input, also output to be changed inside conditional
	MOV R1, #1	@ Monday
	MOV R2, #2	@ Tuesday
	MOV R3, #3	@ Wednesady
	MOV R4, #4	@ Thursday
	MOV R5, #5	@ Friday
	BAL _check
_check:
	
