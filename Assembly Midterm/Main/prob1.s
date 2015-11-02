//prob1.s
.data
//Intro message
.balign 4
intro_message: .asciz "This Program will Calculate Gross Pay\n"
//Prompt for input message
.balign 4
enter_pay: .asciz "Enter your pay rate: "
//Prompt for hours worked
.balign 4
enter_hours: .asciz "Enter the number of hours worked: "
//tell user hwat they entered
.balign 4
print_form: .asciz "You entered %d \n"
.balign 4
in_progress: .asciz "Calculating Gross Pay...\n"
//display gross pay
.balign 4
gross_pay_msg: .asciz "Gross pay: $%d\n"
//formatted string for scanf
.balign 4
scan_pattern : .asciz "%d"
//save number from scanf here
.balign 4
number_read: .word 0
//hours worked and payrate = gross pay
.balign 4
hours_worked: .word 0
.balign 4
rate: .word 0
.balign 4
gross: .word 0
//return
.balign 4
return2: .word 0
.text
//functions and labels
straight:		//straight pay calc
 mul r0, r2, r3		//r4 = r2*r3
 ldr r4, addr_gross
 str r0, [r4]		//save to variable for later
 bal exit_gPay
double:
 cmp r3, #50
 bgt triple
 mul r0, r2, r6		//basepay for 40 hours
 sub r3, r3, r6		//get doubletime hours
 mul r2, r2, r7		//payrate*2
 mul r4, r3, r2		//doubletime pay
 add r0, r0, r4		//gross pay
 ldr r4, addr_gross
 str r0, [r4]
 bal exit_gPay
triple:
 mul r0, r2, r6         //basepay for 40 hours
 mul r5, r2, r7		//doubletime payrate
 mul r5, r5, r8		//10 hours of doubletime
 add r0, r0, r5		//sum of basepay and dbltime pay
 sub r3, r3, #50	//subtract 40 hours and 10 hrs of doubletime
 mul r5, r2, r9		//get triple time payrate
 mul r5, r5, r3		//get triple time pay
 add r0, r0, r5		//summ of basepay, doubletime pay, triple time pay
 ldr r4, addr_gross
 str r0, [r4]
 bal exit_gPay

gPay:     		//r2 = payrate     r3 = hours
 mov r6, #40            //hours
 mov r7, #2             //doubletime multiplier
 mov r8, #10		//doubletime max hrs
 mov r9, #3		//triple time multiplier
 ldr r1, address_of_return2     // r1 ← &address_of_return
 str lr, [r1]                   // *r1 ← lr
 ldr r3, addr_of_hours		//load hours worked
 ldr r3, [r3]
 ldr r2, addr_of_rate		//load pay rate
 ldr r2, [r2]
 cmp r3, #40
 ble straight
 bgt double
exit_gPay:
 ldr lr, address_of_return2     // lr ← &address_of_return
 ldr lr, [lr]                   // lr ← *lr
 bx lr                          // return from main using lr
address_of_return2 : .word return2
addr_of_hours : .word hours_worked
addr_of_rate : .word rate
addr_gross : .word gross
.global gross_problem1
gross_problem1:
 ldr r8, gross_return      // r1 ← &address_of_return
 str lr, [r8]                   // *r1 ← lr
//print intro
 ldr r0, address_of_intro       // r0 ← &message1
 bl printf                      // printf("This Program will calc gpay")
//prompt for payrate
 ldr r0, address_enter_pay		//load r0 with user prompt
 bl printf
//input payrate and display what was entered to user
 ldr r0, address_of_scan_pattern // r0 ← &scan_pattern scanf("%d")
 ldr r1, address_of_number_read  // r1 ← &number_read   scanf("%d",&number_read)
 bl scanf                        // call to scanf
 ldr r0, address_of_number_read  // r0 ← &number_read
 ldr r1, [r0]                    // r1 ← *r0
//figure out how to save values to variable
 ldr r3, addr_rate	 	 //load address where i want to save payrate
 str r1, [r3]			 //store contents of r1 to r3
 ldr r0, address_of_printform
 bl printf			 //dipslay user input

//prompt for input for hours worked
 ldr r0, address_enter_hours
 bl printf

//input hours worked and display what was entered by user
 ldr r0, address_of_scan_pattern // r0 ← &scan_pattern scanf("%d")
 ldr r1, address_of_number_read  // r1 ← &number_read   scanf("%d",&number_read)
 bl scanf                        // call to scanf
 ldr r0, address_of_number_read  // r0 ← &number_read
 ldr r1, [r0]                    // r1 ← *r0

 //figure out how to save values to variable
 ldr r3, addr_hrs_worked         //load address where i want to save hours
 str r1, [r3]                    //store contents of r1 to r3

 ldr r0, address_of_printform
 bl printf                       //dipslay user input

//calculate gross pay
 bl gPay
//print gross pay
 ldr r0, address_of_grossmsg
 ldr r1, addr_gpay
 ldr r1, [r1]
 bl printf

 ldr lr, gross_return      // lr ← &address_of_return
 ldr lr, [lr]                   // lr ← *lr
 bx lr                          // return from main using lr

//calls to the content
address_of_intro : .word intro_message
address_enter_pay : .word enter_pay
address_enter_hours : .word enter_hours
address_of_scan_pattern : .word scan_pattern
address_of_number_read : .word number_read
addr_hrs_worked : .word hours_worked
addr_rate : .word rate
gross_return : .word return_prob1
address_of_printform : .word print_form
address_of_grossmsg : .word gross_pay_msg
addr_gpay : .word gross
//External
.global printf
.global scanf


