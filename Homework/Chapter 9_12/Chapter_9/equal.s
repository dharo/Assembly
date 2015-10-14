.global main
.func main
main:
	MOV R1, #0
	MOVS R0, R1	@ Move R1 into R0 and set flags
	MOVEQ R0, #1	@ If 0, load R0 with 1
	bx lr

