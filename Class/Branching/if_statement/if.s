/*  - STATEMENT

   Input 1 -> 5 is (Mon -> Fri)
   Output
   Mon & Wed -> CSC 11
   T & Thurs -> CSC 5
   Fri       -> CSC 1

	Output the Class Number given the day
*/

.global _start

_start:
	MOV R0, #4	@ output statement, this is also input
	MOV R1, #1	@ monday    outputs 11
	MOV R2, #2	@ tuesday   outputs 5
	MOV R3, #3	@ wednesday outputs 11
	MOV R4, #4 	@ thursday  outputs 5
	MOV R5, #5	@ Friday    outputs 1

	CMP R0, R1	@ compare with monday
	BEQ _mon        @ if monday
	CMP R0, R2	@ compare with tuesday
	BEQ _tues	@ if tuesday
	CMP R0, R3	@ compare with wednesday
	BEQ _wed	@ if wednesday
	CMP R0, R4	@ compare with thursday
	BEQ _thurs	@ if thursday
	CMP R0, R5	@ compare with friday
	BEQ _friday	@ if friday

_friday:
	MOV R0, #1
	B _exit
_thurs:
	MOV R0, #5
	B _exit
_wed:
	MOV R0, #11
	B _exit
_tues:
	MOV R0, #5
	B _exit
_mon:
	MOV R0, #11
	B _exit
_exit:
	MOV R7, #1
	SWI 0
