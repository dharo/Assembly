.data
.balign 4
cats_game: .asciz "\n\nCat's Game, No Winner!\n\n"
.balign 4
winner_p1: .asciz "\n\nPlayer 1 Wins!!\n\n"
.balign 4
winner_p2: .asciz "\n\nPlayer 2 Win!!\n\n"
.balign 4
test_text: .asciz "Testing print: %s\n"
.balign 4
thisthing: .asciz "They are equal!\n"
.balign 4
game_start: .asciz "Game now started...\n"
.balign 4
title: .asciz " TicTacToe\n\n"
.balign 4
placement_input: .asciz "What square would you like to play? "
.balign 4
player: .word 1			//initialized to player 1 with 1
.balign 4
choice: .word 0
.balign 4
AIselected: .asciz "The AI selected # %d\n"
.balign 4
player1mark: .asciz "X"
.balign 4
player2mark: .asciz "O"
//variabeles for squares
.balign 4
text1: .asciz "1"
.balign 4
text2: .asciz "2"
.balign 4
text3: .asciz "3"
.balign 4
text4: .asciz "4"
.balign 4
text5: .asciz "5"
.balign 4
text6: .asciz "6"
.balign 4
text7: .asciz "7"
.balign 4
text8: .asciz "8"
.balign 4
text9: .asciz "9"
.balign 4
square1: .asciz "1"
.balign 4
square2: .asciz "2"
.balign 4
square3: .asciz "3"
.balign 4
square4: .asciz "4"
.balign 4
square5: .asciz "5"
.balign 4
square6: .asciz "6"
.balign 4
square7: .asciz "7"
.balign 4
square8: .asciz "8"
.balign 4
square9: .asciz "9"
//table info
.balign 4
table_row: .asciz "   %s|%s|%s\n"
.balign 4
dashes: .asciz "  -------\n"
//return variables
.balign 4
returnGR: .word 0
//scan pattern
.balign 4
scan_choice	:	.asciz "%d"
.text
.global game_run

returnGR_addr	:	.word returnGR

game_run:
 ldr r1, returnGR_addr
 str lr, [r1]
//game starts here with printf prompt
 ldr r0, =game_start
 bl printf
//print table
 print_table:
	ldr r0, =title
	bl printf
	//top row
	ldr r0, =table_row
	ldr r1, =square1
	ldr r2, =square2
	ldr r3, =square3
	bl printf
	//center row
	ldr r0, =dashes
	bl printf
	ldr r0, =table_row
        ldr r1, =square4
        ldr r2, =square5
        ldr r3, =square6
	bl printf
	//bottom row
        ldr r0, =dashes
        bl printf
        ldr r0, =table_row
        ldr r1, =square7
        ldr r2, =square8
        ldr r3, =square9
        bl printf
	bl start_play
	//bal rando
start_play:			//player turns via (player%2)?1:2
	ldr r1, =player		//r1 = player
	mov r2, #2		//r2 = 2
	bl divMod		//returns 0 or 1 to r1
	cmp r0, #1		//if(r1 == 1) beq player_one
	ldr r0, player_addr	//save player variable
	str r1, [r0]
	beq player_one
	blt player_two
player_one:		//User
	ldr r0, =placement_input	//ask user for input
	bl printf			//print prompt
	ldr r0, =scan_choice		//prepare scanf
	ldr r1, =choice			//for saving input
	bl scanf
	ldr r0, =choice			//load address of their input to r0
	ldr r0, [r0]			//dereference content in r0
	cmp r0, #1			//compare to #1(for square1/invalid input)
	beq square_one_p1 //if (input == 1) go to square 1
	blt player_one		//ask for input again if input<1
	cmp r0, #2
	beq square_two_p1
	cmp r0, #3
	beq square_three_p1
	cmp r0, #4
	beq square_four_p1
	cmp r0, #5
	beq square_five_p1
	cmp r0, #6
	beq square_six_p1
	cmp r0, #7
	beq square_seven_p1
	cmp r0, #8
	beq square_eight_p1
	cmp r0, #9
	beq square_nine_p1
	bgt player_one		//branch back if input is invalid
	square_one_p1:		//if square1 == '1', mark the spot, else
		ldr r0, =text1	//branch back to receive input again
		ldr r1, =square1
		bl strcmp	//compare input string with string in square
		beq writesquare1	//if equal, write in user selections
		bne player_one	//branch back for user input
		writesquare1:
		ldr r1, =square1	//addressof square1 loaded to r0
		ldr r2, =player1mark	//addressof player1mark to r2
		ldr r2,[r2]		//load actual content ot register
		str r2, [r1]		//write playermark to the square
		ldr r0, =test_text	//for testing purposes
        	bl printf		//for testing purposes
		bl player_two		//after marked square, player 2 turn
	       // bal print_table	//print the table
square_two_p1:          //if square1 == '1', mark the spot, else
                ldr r0, =text2  //branch back to receive input again
                ldr r1, =square2
                bl strcmp       //compare input string with string in square
                beq writesquare2        //if equal, write in user selections
                bne player_one  //branch back for user input
                writesquare2:
                ldr r1, =square2        //addressof square1 loaded to r0
                ldr r2, =player1mark    //addressof player1mark to r2
                ldr r2,[r2]             //load actual content ot register
                str r2, [r1]            //write playermark to the square
                ldr r0, =test_text      //for testing purposes
                bl printf               //for testing purposes
                bl player_two           //after marked square, player 2 turn
               // bal print_table       //print the table
square_three_p1:          //if square1 == '1', mark the spot, else
                ldr r0, =text3  //branch back to receive input again
                ldr r1, =square3
                bl strcmp       //compare input string with string in square
                beq writesquare3        //if equal, write in user selections
                bne player_one  //branch back for user input
                writesquare3:
                ldr r1, =square3        //addressof square1 loaded to r0
                ldr r2, =player1mark    //addressof player1mark to r2
                ldr r2,[r2]             //load actual content ot register
                str r2, [r1]            //write playermark to the square
                ldr r0, =test_text      //for testing purposes
                bl printf               //for testing purposes
                bl player_two           //after marked square, player 2 turn
               // bal print_table       //print the table
square_four_p1:          //if square1 == '1', mark the spot, else
                ldr r0, =text4  //branch back to receive input again
                ldr r1, =square4
                bl strcmp       //compare input string with string in square
                beq writesquare4        //if equal, write in user selections
                bne player_one  //branch back for user input
                writesquare4:
                ldr r1, =square4        //addressof square1 loaded to r0
                ldr r2, =player1mark    //addressof player1mark to r2
                ldr r2,[r2]             //load actual content ot register
                str r2, [r1]            //write playermark to the square
                ldr r0, =test_text      //for testing purposes
                bl printf               //for testing purposes
                bl player_two           //after marked square, player 2 turn
               // bal print_table       //print the table
square_five_p1:          //if square1 == '1', mark the spot, else
                ldr r0, =text5  //branch back to receive input again
                ldr r1, =square5
                bl strcmp       //compare input string with string in square
                beq writesquare5        //if equal, write in user selections
                bne player_one  //branch back for user input
                writesquare5:
                ldr r1, =square5        //addressof square1 loaded to r0
                ldr r2, =player1mark    //addressof player1mark to r2
                ldr r2,[r2]             //load actual content ot register
                str r2, [r1]            //write playermark to the square
                ldr r0, =test_text      //for testing purposes
                bl printf               //for testing purposes
                bl player_two           //after marked square, player 2 turn
               // bal print_table       //print the table
square_six_p1:          //if square1 == '1', mark the spot, else
                ldr r0, =text6  //branch back to receive input again
                ldr r1, =square6
                bl strcmp       //compare input string with string in square
                beq writesquare6        //if equal, write in user selections
                bne player_one  //branch back for user input
                writesquare6:
                ldr r1, =square6        //addressof square1 loaded to r0
                ldr r2, =player1mark    //addressof player1mark to r2
                ldr r2,[r2]             //load actual content ot register
                str r2, [r1]            //write playermark to the square
                ldr r0, =test_text      //for testing purposes
                bl printf               //for testing purposes
                bl player_two           //after marked square, player 2 turn
               // bal print_table       //print the table
square_seven_p1:          //if square1 == '1', mark the spot, else
                ldr r0, =text7  //branch back to receive input again
                ldr r1, =square7
                bl strcmp       //compare input string with string in square
                beq writesquare7        //if equal, write in user selections
                bne player_one  //branch back for user input
                writesquare7:
                ldr r1, =square7        //addressof square1 loaded to r0
                ldr r2, =player1mark    //addressof player1mark to r2
                ldr r2,[r2]             //load actual content ot register
                str r2, [r1]            //write playermark to the square
                ldr r0, =test_text      //for testing purposes
                bl printf               //for testing purposes
                bl player_two           //after marked square, player 2 turn
               // bal print_table       //print the table
square_eight_p1:          //if square1 == '1', mark the spot, else
                ldr r0, =text8  //branch back to receive input again
                ldr r1, =square8
                bl strcmp       //compare input string with string in square
                beq writesquare8        //if equal, write in user selections
                bne player_one  //branch back for user input
                writesquare8:
                ldr r1, =square8        //addressof square1 loaded to r0
                ldr r2, =player1mark    //addressof player1mark to r2
                ldr r2,[r2]             //load actual content ot register
                str r2, [r1]            //write playermark to the square
                ldr r0, =test_text      //for testing purposes
                bl printf               //for testing purposes
                bl player_two           //after marked square, player 2 turn
               // bal print_table       //print the table
square_nine_p1:          //if square1 == '1', mark the spot, else
                ldr r0, =text9  //branch back to receive input again
                ldr r1, =square9
                bl strcmp       //compare input string with string in square
                beq writesquare9        //if equal, write in user selections
                bne player_one  //branch back for user input
                writesquare9:
                ldr r1, =square9        //addressof square1 loaded to r0
                ldr r2, =player1mark    //addressof player1mark to r2
                ldr r2,[r2]             //load actual content ot register
                str r2, [r1]            //write playermark to the square
                ldr r0, =test_text      //for testing purposes
                bl printf               //for testing purposes
                bl player_two           //after marked square, player 2 turn
               // bal print_table       //print the table

player_two:		//Stupid AI
	bl rando	//get random number
//prepare rand num generator
rando:
	mov r0, #0		//for seed of time()
	bl time			//time(0)
	bl srand		//srand(time(0))
AI_repeat:			//repeats here if the input is not valid
	bl rand			//r0 = rand()
	mov r1, r0, ASR #1	//r1 = r0(shift right if number is negative)
	mov r2, #9		//r2 = 9
	bl divMod		//divmod son!
	add r1, #1		//add 1 to R1 to make sure there is no 0
//	ldr r0, =AIselected	//test print
//	bl printf		//test print
//	mov r6, r1		//save input to r6
	cmp r1, #1		//check if AI selected square1
	beq square1_p2		//if r1==1, AI selected square1
	blt AI_repeat		//in case AI input 0 (wall in case above math is faulty)
	cmp r1, #2
	beq square2_p2
        cmp r1, #3
        beq square3_p2
        cmp r1, #4
        beq square4_p2
        cmp r1, #5
        beq square5_p2
        cmp r1, #6
        beq square6_p2
        cmp r1, #7
        beq square7_p2
        cmp r1, #8
        beq square8_p2
	cmp r1, #9
	beq square9_p2
	bgt AI_repeat
	square1_p2:
		ldr r0, =text1	//load default square1 text
		ldr r1, =square1//load current square1 text
		bl strcmp	//copare strings
		beq writesquare1_p2	//if square is free, write to it
		bne AI_repeat		//get input again if square is taken
		writesquare1_p2:
		ldr r1, =square1	//addressof square1 loaded to r0
		ldr r2, =player2mark	//addressof player2mark to r2
		ldr r2,[r2]		//dereference register content
		str r2,[r1]		//write playermark to square
		ldr r0, =test_text
		bl printf
		bal player_chkwin
        square2_p2:
                ldr r0, =text2  //load default square1 text
                ldr r1, =square2//load current square1 text
                bl strcmp       //copare strings
                beq writesquare2_p2     //if square is free, write to it
                bne AI_repeat           //get input again if square is taken
                writesquare2_p2:
                ldr r1, =square2        //addressof square1 loaded to r0
                ldr r2, =player2mark    //addressof player2mark to r2
                ldr r2,[r2]             //dereference register content
                str r2,[r1]             //write playermark to square
                ldr r0, =test_text
                bl printf
                bal player_chkwin
        square3_p2:
                ldr r0, =text3  //load default square1 text
                ldr r1, =square3//load current square1 text
                bl strcmp       //copare strings
                beq writesquare3_p2     //if square is free, write to it
                bne AI_repeat           //get input again if square is taken
                writesquare3_p2:
                ldr r1, =square3        //addressof square1 loaded to r0
                ldr r2, =player2mark    //addressof player2mark to r2
                ldr r2,[r2]             //dereference register content
                str r2,[r1]             //write playermark to square
                ldr r0, =test_text
                bl printf
                bal player_chkwin
        square4_p2:
                ldr r0, =text4  //load default square1 text
                ldr r1, =square4//load current square1 text
                bl strcmp       //copare strings
                beq writesquare4_p2     //if square is free, write to it
                bne AI_repeat           //get input again if square is taken
                writesquare4_p2:
                ldr r1, =square4        //addressof square1 loaded to r0
                ldr r2, =player2mark    //addressof player2mark to r2
                ldr r2,[r2]             //dereference register content
                str r2,[r1]             //write playermark to square
                ldr r0, =test_text
                bl printf
                bal player_chkwin
        square5_p2:
                ldr r0, =text5  //load default square1 text
                ldr r1, =square5//load current square1 text
                bl strcmp       //copare strings
                beq writesquare5_p2     //if square is free, write to it
                bne AI_repeat           //get input again if square is taken
                writesquare5_p2:
                ldr r1, =square5        //addressof square1 loaded to r0
                ldr r2, =player2mark    //addressof player2mark to r2
                ldr r2,[r2]             //dereference register content
                str r2,[r1]             //write playermark to square
                ldr r0, =test_text
                bl printf
                bal player_chkwin
        square6_p2:
                ldr r0, =text6  //load default square1 text
                ldr r1, =square6//load current square1 text
                bl strcmp       //copare strings
                beq writesquare6_p2     //if square is free, write to it
                bne AI_repeat           //get input again if square is taken
                writesquare6_p2:
                ldr r1, =square6        //addressof square1 loaded to r0
                ldr r2, =player2mark    //addressof player2mark to r2
                ldr r2,[r2]             //dereference register content
                str r2,[r1]             //write playermark to square
                ldr r0, =test_text
                bl printf
                bal player_chkwin
        square7_p2:
                ldr r0, =text7  //load default square1 text
                ldr r1, =square7//load current square1 text
                bl strcmp       //copare strings
                beq writesquare7_p2     //if square is free, write to it
                bne AI_repeat           //get input again if square is taken
                writesquare7_p2:
                ldr r1, =square7        //addressof square1 loaded to r0
                ldr r2, =player2mark    //addressof player2mark to r2
                ldr r2,[r2]             //dereference register content
                str r2,[r1]             //write playermark to square
                ldr r0, =test_text
                bl printf
                bal player_chkwin
        square8_p2:
                ldr r0, =text8  //load default square1 text
                ldr r1, =square8//load current square1 text
                bl strcmp       //copare strings
                beq writesquare8_p2     //if square is free, write to it
                bne AI_repeat           //get input again if square is taken
                writesquare8_p2:
                ldr r1, =square8        //addressof square1 loaded to r0
                ldr r2, =player2mark    //addressof player2mark to r2
                ldr r2,[r2]             //dereference register content
                str r2,[r1]             //write playermark to square
                ldr r0, =test_text
                bl printf
                bal player_chkwin
        square9_p2:
                ldr r0, =text9  //load default square1 text
                ldr r1, =square9//load current square1 text
                bl strcmp       //copare strings
                beq writesquare9_p2     //if square is free, write to it
                bne AI_repeat           //get input again if square is taken
                writesquare9_p2:
                ldr r1, =square9        //addressof square1 loaded to r0
                ldr r2, =player2mark    //addressof player2mark to r2
                ldr r2,[r2]             //dereference register content
                str r2,[r1]             //write playermark to square
                ldr r0, =test_text
                bl printf
                bal player_chkwin
player_chkwin:
	//read in player2 mark
	//makes checks  for each square
	//if the squares make up a winning row, check what mark is the winner
	//display winner player 1 or 2
	ldr r0, =square1		//first row
	ldr r1, =square2
	bl strcmp
	beq checkrow1
	ldr r0, =square4		//second row
	ldr r1, =square5
	bl strcmp
	beq checkrow2
	ldr r0, =square7		//third row
	ldr r1, =square8
	bl strcmp
	beq checkrow3
	ldr r0, =square1		//first column
	ldr r1, =square4
	bl strcmp
	beq checkcol1
	ldr r0, =square2		//second column
	ldr r1, =square5
	bl strcmp
	beq checkcol2
	ldr r0, =square3		//third column
	ldr r1, =square6
	bl strcmp
	beq checkcol3
	ldr r0, =square1		//diagonal 1 \
	ldr r1, =square5
	bl strcmp
	beq chkdiag1
	ldr r0, =square3		//diagonal 2 /
	ldr r1, =square5
	bl strcmp
	beq chkdiag2
	bal print_table
	checkrow1:
		ldr r0, =square2
		ldr r1, =square3
		bl strcmp
		beq checkmark_row1
		bne print_table
		checkmark_row1:
		ldr r0, =square3
		ldr r1, =player1mark
		bl strcmp
		beq player1wins
		bne player2wins
	checkrow2:
                ldr r0, =square5
                ldr r1, =square6
                bl strcmp
                beq checkmark_row2
		bne print_table
                checkmark_row2:
                ldr r0, =square6
                ldr r1, =player1mark
                bl strcmp
                beq player1wins
                bne player2wins
        checkrow3:
                ldr r0, =square8
                ldr r1, =square9
                bl strcmp
                beq checkmark_row3
		bne print_table
                checkmark_row3:
                ldr r0, =square9
                ldr r1, =player1mark
                bl strcmp
                beq player1wins
                bne player2wins
        checkcol1:
                ldr r0, =square4
                ldr r1, =square7
                bl strcmp
                beq checkmark_col1
		bne print_table
                checkmark_col1:
                ldr r0, =square7
                ldr r1, =player1mark
                bl strcmp
                beq player1wins
                bne player2wins
        checkcol2:
                ldr r0, =square5
                ldr r1, =square8
                bl strcmp
                beq checkmark_col2
		bne print_table
                checkmark_col2:
                ldr r0, =square8
                ldr r1, =player1mark
                bl strcmp
                beq player1wins
                bne player2wins
        checkcol3:
                ldr r0, =square6
                ldr r1, =square9
                bl strcmp
                beq checkmark_col3
		bne print_table
                checkmark_col3:
                ldr r0, =square9
                ldr r1, =player1mark
                bl strcmp
                beq player1wins
                bne player2wins
        chkdiag1:
                ldr r0, =square5
                ldr r1, =square9
                bl strcmp
                beq check_diagonal1
		bne print_table
                check_diagonal1:
                ldr r0, =square9
                ldr r1, =player1mark
                bl strcmp
                beq player1wins
                bne player2wins
        chkdiag2:
                ldr r0, =square5
                ldr r1, =square7
                bl strcmp
                beq check_diagonal2
		bne print_table
                check_diagonal2:
                ldr r0, =square7
                ldr r1, =player1mark
                bl strcmp
                beq player1wins
                bne player2wins
	no_winner:
		ldr r0, =cats_game
		bl printf
		bal exit
player1wins:			//display message when player 1 wins
	ldr r0, =winner_p1
	bl printf
	bal exit
player2wins:
	ldr r0, =winner_p2
	bl printf
	bal exit
//exit
exit:
 ldr lr, returnGR_addr
 ldr lr, [lr]
 bx lr
//address
player_addr	:	.word player
//external libraries
.global time
.global srand
.global rand
.global strcmp
