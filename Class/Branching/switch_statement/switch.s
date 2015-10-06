/* Example of SWITCH STATEMENT

	Input: 1 -> 5 os (MON - FRI)
	Output: Mon & Wed = 11
		Tues & Thurs = 5
		Friday = 1
		Anything else = 0
*/

.global _start

_start:
	MOV R0, #4	@ input for day, also output for class
	MOV R1, #1	@ Monday
	MOV R2, #2	@ Tuesday
	MOV R3, #3	@ Wednesday
	MOV R4, #4	@ Thursday
	MOV R5, #5	@ Friday
	BAL _switch	@ branch always to switch
/* Start Switch statements */
_switch:
	CMP R0, R1
	BEQ _mon
	CMP R0, R2
	BEQ _tues
	CMP R0, R3
	BEQ _wed
	CMP R0, R4
	BEQ _thurs
	CMP R0, R5
	BEQ _fri
	BAL _default
_mon:
	MOV R0, #1
	BAL _exit
_tues:
	MOV R0, #2
	BAL _exit
_wed:
	MOV R0, #3
	BAL _exit
_thurs:
	MOV R0, #4
	BAL _exit
_fri:
	MOV R0, #5
	BAL _exit
_default:
	MOV R0, #0
	BAL _exit
_exit:
	MOV R7, #1
	SWI 0
