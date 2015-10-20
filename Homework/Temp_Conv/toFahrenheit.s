/* -- printf02.s */
.data
/* First message */
.balign 4
message1: .asciz "Type a Celsius Number to convert to Fahrenheit: "
/* Second message */
.balign 4
message2: .asciz "%d Celsius is approx %d Fahrenheit\n"
/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d"
/* Where scanf will store the number read */
.balign 4
number_read: .word 0
.balign 4
return: .word 0
.balign 4
return2: .word 0
.text
/*
Celsius to Fahrenheit
Fahrenheit = 9/5 * cel+32
*/
toFahrenheit:
 ldr r1, address_of_return2 	/* r1 ← &address_of_return */
 str lr, [r1] 			/* *r1 ← lr */
 MOV R5, #0x20		/* 32 in hex (used for Addition)*/
 LDR R2, =0x12		/* 9/5 = 1.8   BP -4 WD 6*/
 ADD R3, R0, R5		/* R3 = Celsius(input) + 32*/
 MUL R0, R2, R3		/* R0 = (9/5)*(C+32) */
 LSR R0, #4		/* Scale back down to fraction size*/
 ldr lr, address_of_return2 	/* lr ← &address_of_return */
 ldr lr, [lr] 			/* lr ← *lr */
 bx lr 				/* return from main using lr */
address_of_return2 : .word return2

.global main
main:
 ldr r1, address_of_return 	/* r1 ← &address_of_return */
 str lr, [r1] 			/* *r1 ← lr */
 ldr r0, address_of_message1 	/* r0 ← &message1 */
 bl printf 			/* call to printf */
 ldr r0, address_of_scan_pattern /* r0 ← &scan_pattern */
 ldr r1, address_of_number_read /* r1 ← &number_read */
 bl scanf 			/* call to scanf */
 ldr r0, address_of_number_read /* r0 ← &number_read */
 ldr r0, [r0] 			/* r0 ← *r0 */
 bl toCelsius
 mov r2, r0 			/* r2 ← r0 */
 ldr r1, address_of_number_read /* r1 ← &number_read */
 ldr r1, [r1] 			/* r1 ← *r1 */
 ldr r0, address_of_message2 	/* r0 ← &message2 */
 bl printf 			/* call to printf */
 ldr lr, address_of_return 	/* lr ← &address_of_return */
 ldr lr, [lr] 			/* lr ← *lr */
 bx lr 				/* return from main using lr */
address_of_message1 : .word message1
address_of_message2 : .word message2
address_of_scan_pattern : .word scan_pattern
address_of_number_read : .word number_read
address_of_return : .word return
/* External */
.global printf
.global scanf
