.global main
.func main
main:
     MOV R0, #100
     MOV R1, #20
loop:
     CMP R0, R1         @ Are they the same as Z=1?
     BEQ stop           @ if so stop
     BLT less           @ if R0 < than R1 go to less
     SUB R0, R0, R1     @ otherwise sub R1 from R0
     BAL loop           @ branch always back to start
less:
     SUB R1, R1, R0     @ subtract R0 from R1
     BAL loop
stop:
     bx lr
