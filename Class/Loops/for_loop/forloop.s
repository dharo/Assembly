/* For-Loop sum of numbers 1-10 */

.global _start

_start:
	MOV R0, #0	@ sum
	MOV R1, #1	@ counter	int i = 1
	MOV R2, #10	@ stop @ 10

_add:
	CMP R1, R2
	BGT _exit
	ADD R0, R1, R0	@ this would be statement inside for-loop
	ADD R1, #1	@ i++
	CMP R1, R2	@ R1 <= R2
	BLE _add	@ repeat is previous is true
_exit:
	MOV R7, #1
	SWI 0
