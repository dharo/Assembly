/*  While loop sum of numbers 1-10 */

.global _start

_start:
	MOV R0, #0	@ sum
	MOV R1, #1	@ counter
	MOV R2, #10	@ stop @ 10

_add:
	CMP R1, R2
	BGT _exit
	ADD R0, R1, R0
	ADD R1, #1
	CMP R1, R2
	BLE _add
_exit:
	MOV R7, #1
	SWI 0
