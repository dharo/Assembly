.global main
.func main
main:
     CMP R5, R6		@ Compare R6 with  R5 and set flags
     ADDNE R0, R5, R6	@ If not zero R5+R6 and put in R0
     bx lr
