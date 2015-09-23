@ This is Converting months to years 
@ months = 88 months save in 1 byte
@ conversion = 1/12 save in 3 bytes
@ result (R0) stored as 1 byte
.global _start
_start:
	MOV R1, #88		@ BP0 WD8
	LDR R2, =0x155556	@ BP-24 WD24
	MUL R0, R2, R1		@ BP-24 WD32 this is the result
	LSR R0, #24		@ BP0 WD8 changes width down to 1 byte
	MOV R7, #1		@ get ready to leave
	SWI 0			@ exit
