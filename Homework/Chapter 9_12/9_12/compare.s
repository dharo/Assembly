.global main
.func main

main:
    MOV R0, #1           @ initialize count
loop:
    ADD R0, R0, #1       @ count++
    CMP R0, #50          @ compare with limit
    BLE loop
    bx lr
