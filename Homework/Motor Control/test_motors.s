/*
	Connect Signal wire from ESC to pin #4 on Raspberry Pi GPIO
	Connect GND wire from ESC to GND on Raspberry Pi GPIO
	to compile:
		gcc -Wall -pthread -o PROGRAM_NAME test_motors.s -lpigpio -lrt
	to run:
		sudo ./PROGRAM_NAME

*/


.data
.balign 4
hello: .asciz "Hello this is a test of motor control\n Using software PWM in Assembly via Raspberry Pi GPIO\n"
.balign 4
gpio_start_txt: .asciz "GPIO has been initialized\n"
.balign 4
set_mode_txt: .asciz "Setting GPIO Modes \n"
.balign 4
motor_init_txt: .asciz "Initializing Motors\n"
.balign 4
motor_start_warning: .asciz "Starting motors in 3 seconds...\n"

.text
.global main

main:
        push {lr}
        ldr r0, =hello
        bl printf
//initialize GPIO
        bl gpioInitialise
        cmp r0, #0
        blt exit
//if initialize success, set GPIO pins for output
        ldr r0, =gpio_start_txt
        ldr r1, =set_mode_txt
        bl printf
        mov r0, #4      //pin #4
        mov r1, #1      //1 == PI_OUTPUT
        bl gpioSetMode
        ldr r0, =motor_init_txt
        bl printf
//initialize motors
        mov r0, #4      //pin 4
        mov r1, #1000   //pwm sig 1000
        bl gpioServo
//starting motors
        ldr r0, =motor_start_warning
        bl printf
        mov r0, #3
        bl sleep
//spin up to 1700 pwm
        mov r0, #4
        ldr r1, =2000
        bl gpioServo
        mov r0, #10
        bl sleep
//spin motors down
        mov r0, #4
        mov r1, #1000
        bl gpioServo
        mov r0, #4      //pin 4
        mov r1, #1000   //pwm sig 1000
        bl gpioServo
//starting motors
        ldr r0, =motor_start_warning
        bl printf
        mov r0, #3
        bl sleep
//spin up to 1700 pwm
        mov r0, #4
        ldr r1, =2000
        bl gpioServo
        mov r0, #10
        bl sleep
//spin motors down
        mov r0, #4
        mov r1, #1000
        bl gpioServo
exit:
        mov r0, #3
        bl sleep
//terminate
        bl gpioTerminate
        pop {lr}


.global printf
.extern sleep
.global pigpio
.extern gpioInitialise
