//ISP Assembly
/*
        Assembly Midterm Problem 2
 An ISP has 3 different subscription packages
        a)  $30 per month, 11 hours access.  Additional hours
            are $3 up to 22 hours then $6 for all additional
                hours.
        b)  $35 per month, 22 hours access.  Additional hours
        are $2 up to 44 hours then $4 for each
                hour above this limit.
        c)  $40 per month, 33 hours access.  Additional hours
        are $1 up to 66 hours then $2 for each
                hour above this limit.
Write a program that calculates a customers monthly bill.  Ask which
package how many hours then display the monthly charge.  Input the
monthly package as a or b or c for full credit.
*/
.data
//Into Messages
.balign 4
intro_text: .asciz "Select your subscription package:\n\n"
.balign 4
package1_text: .asciz "1) $30 per month w/ 11 hours access\n   Additional hours: $3 up to 22 hrs, $6 for additional hours\n\n"
.balign 4
package2_text: .asciz "2) $35 per month w/ 22 hours access\n   Additional hours: $2 up to 44 hrs, $4 for additional hours\n\n"
.balign 4
package3_text: .asciz "3) $40 per month w/ 33 hours access\n   Additional hours: $1 up to 66 hrs, $2 for each additional hours\n\n"
.balign 4
choice_prompt: .asciz "Select the plan you have (1-3): Press 4 to exit\n"
.balign 4
exit_prompt: .asciz "Now exiting program...\n"
/* Second message */
.balign 4
message2: .asciz "You selected option #%d\n"
.balign 4
output_in: .asciz "You Entered: %d\n"
//enter hours prompt
.balign 4
enter_hours: .asciz "Enter the number of hours used: "
//prompt for the bill
.balign 4
the_bill: .asciz "Your bill for the use of %d hours is $%d \n\n"
/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d"
/* Where scanf will store the number read */
.balign 4
number_read: .word 0
.balign 4
return: .word 0
//this is line 41
//do the codes
.text
.global main
/////////////////////////////pack 1//////////////////////////////////////////////
pack1:
 ldr r0, addressof_hoursp		//get input for hours
 bl printf
 ldr r0, address_of_scan_pattern
 ldr r1, address_of_number_read
 bl scanf
 ldr r0, addressof_input
 ldr r1, address_of_number_read
 ldr r1, [r1]
 bl printf				//display hours entered
 ldr r1, address_of_number_read		//load r1 with hours input
 ldr r1, [r1]
 cmp r1, #1
 blt pack1
 cmp r1, #11
 ble tier1_1
 cmp r1, #22
 ble tier2_1
 bgt tier3_1
 bal prompt
tier1_1:		//PART OF PACK1
 ldr r0, addressof_thebill
 mov r2, #30
 bl printf
 bal prompt
tier2_1:		//PART OF PACK1
 mov r5, #3		//excess multiplier
 mov r2, #30		//current bill for hours > 11 && hours <=22
 mov r4, r1		//get hours and save in r4
 sub r4, r4, #11	//hours = hours - 11
 mul r4, r4, r5		//get cost of excess hours
 add r2, r2, r4		//sum bill + excess hours
 ldr r0, addressof_thebill
 bl printf
 bal prompt
tier3_1:		//PART OF PACK1
 mov r5, #6
 mov r2, #63		//first 11 hrs = 30, next 11 hrs = 33 total to 63 for 22hrs
 mov r4, r1		//get hours and save in r4
 sub r4, r4, #22	//hours = hours - 22
 mul r4, r4, r5		//cost of excess hours
 add r2, r2, r4		//sum bill + excess hours
 ldr r0, addressof_thebill
 bl printf
 bal prompt
//////////////////////////////////pack 2/////////////////////////////////////////
pack2:
 ldr r0, addressof_hoursp               //get input for hours
 bl printf
 ldr r0, address_of_scan_pattern
 ldr r1, address_of_number_read
 bl scanf
 ldr r0, addressof_input
 ldr r1, address_of_number_read
 ldr r1, [r1]
 bl printf                              //display hours entered
 ldr r1, address_of_number_read         //load r1 with hours input
 ldr r1, [r1]
 cmp r1, #1
 blt pack2
 cmp r1, #22
 ble tier1_2
 cmp r1, #44
 ble tier2_2
 bgt tier3_2
 bal prompt
tier1_2:                //PART OF PACK2
 ldr r0, addressof_thebill
 mov r2, #35
 bl printf
 bal prompt
tier2_2:                //PART OF PACK2
 mov r5, #2             //excess multiplier
 mov r2, #35            //current bill for hours > 22 && hours <=44
 mov r4, r1             //get hours and save in r4
 sub r4, r4, #22        //hours = hours - 22
 mul r4, r4, r5         //get cost of excess hours
 add r2, r2, r4         //sum bill + excess hours
 ldr r0, addressof_thebill
 bl printf
 bal prompt
tier3_2:                //PART OF PACK2
 mov r5, #6
 mov r2, #79            //first 22 hrs = 35, next 22 hrs = 44 total to $79
 mov r4, r1             //get hours and save in r4
 sub r4, r4, #44        //hours = hours - 22
 mul r4, r4, r5         //cost of excess hours
 add r2, r2, r4         //sum bill + excess hours
 ldr r0, addressof_thebill
 bl printf
 bal prompt
/////////////////////////pack 3//////////////////////////////////////////////////
pack3:
 ldr r0, addressof_hoursp               //get input for hours
 bl printf
 ldr r0, address_of_scan_pattern
 ldr r1, address_of_number_read
 bl scanf
 ldr r0, addressof_input
 ldr r1, address_of_number_read
 ldr r1, [r1]
 bl printf                              //display hours entered
 ldr r1, address_of_number_read         //load r1 with hours input
 ldr r1, [r1]
 cmp r1, #1
 blt pack3
 cmp r1, #33
 ble tier1_3
 cmp r1, #66
 ble tier2_3
 bgt tier3_3
 bal prompt
tier1_3:                //PART OF PACK3
 ldr r0, addressof_thebill
 mov r2, #40
 bl printf
 bal prompt
tier2_3:                //PART OF PACK3
 mov r5, #1             //excess multiplier
 mov r2, #40            //current bill for hours > 33 && hours <=66
 mov r4, r1             //get hours and save in r4
 sub r4, r4, #33        //hours = hours - 33
 mul r4, r4, r5         //get cost of excess hours
 add r2, r2, r4         //sum bill + excess hours
 ldr r0, addressof_thebill
 bl printf
 bal prompt
tier3_3:                //PART OF PACK3
 mov r5, #2
 mov r2, #73            //first 33 hrs = 40, next 33 hrs = 33 total to $73
 mov r4, r1             //get hours and save in r4
 sub r4, r4, #66        //hours = hours - 66
 mul r4, r4, r5         //cost of excess hours
 add r2, r2, r4         //sum bill + excess hours
 ldr r0, addressof_thebill
 bl printf
 bal prompt
/////////////////////////main////////////////////////////////////////////////////
main:		//Line 45
 ldr r1, address_of_return 		/* r1 ← &address_of_return */
 str lr, [r1] 				/* *r1 ← lr */
prompt:
 ldr r0, address_of_intro 		/* r0 ← &message1 */
 bl printf 				/* call to printf */
 ldr r0, address_pack1			//display prompts
 bl printf
 ldr r0, address_pack2
 bl printf
 ldr r0, address_pack3
 bl printf
 ldr r0, address_choicep
 bl printf
//ask for input		//this is line 59
 ldr r0, address_of_scan_pattern 	/* r0 ← &scan_pattern */
 ldr r1, address_of_number_read 	/* r1 ← &number_read */
 bl scanf 				/* call to scanf */
 ldr r0, address_of_message2 		/* r0 ← &message2 */
 ldr r1, address_of_number_read 	/* r1 ← &number_read */
 ldr r1, [r1] 				/* r1 ← *r1 */
 bl printf 				/* call to printf */
//branch to selection
 ldr r1, address_of_number_read
 ldr r1, [r1]
 cmp r1, #4				//#4 is exit
 beq exit				//if input == 4, branch to exit
 bgt prompt				//if input > 4, prompt for input again
 cmp r1, #1
 beq pack1				//if input == 1, branch to pack #1
 blt prompt				//if input < 1, prompt for input again
 cmp r1, #2				//if input == 2, branch to pack #2
 beq pack2
 cmp r1, #3				//if input ==3, branch to pack #3
 beq pack3
exit:
 ldr r0, address_of_exitp
 bl printf
 ldr lr, address_of_return 		/* lr ← &address_of_return */
 ldr lr, [lr] 				/* lr ← *lr */
 bx lr 					/* return from main using lr */
address_of_intro	 : .word intro_text
address_pack1    	 : .word package1_text
address_pack2		 : .word package2_text
address_pack3		 : .word package3_text
address_choicep	 	 : .word choice_prompt
address_of_message2	 : .word message2
address_of_scan_pattern  : .word scan_pattern
address_of_number_read   : .word number_read
address_of_exitp	 : .word exit_prompt
address_of_return 	 : .word return
addressof_hoursp	 : .word enter_hours
addressof_input		 : .word output_in
addressof_thebill	 : .word the_bill
//external
.global printf
.global scanf

