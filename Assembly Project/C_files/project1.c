/*
	Project 1 - Assembly CSC 11
Options, TIC TAC TOE
	 BattleShip
	 Salvo

*/
//include
#include <stdio.h>
#include <string.h>
#include <time.h>
//func prototypes
void gameStart();
void printTable();
void gameRun();
int checkWin();
//square variables
char square1 = '1';	char square6 = '6';
char square2 = '2';	char square7 = '7';
char square3 = '3';	char square8 = '8';
char square4 = '4';	char square9 = '9';
char square5 = '5';
//start execution
int main( int argc, const char* argv[] ){
	int choice = 0;
	do{
		printf("Welcome to Tic Tac Toe\n");
		printf("Press 1 to Play\nPress 2 to Exit\n");
		printf("Enter your selection: ");
		scanf("%d", &choice);
	}while(choice > 2 || choice < 1);
	if(choice == 1){
		//go to start of game
		gameRun();				//start game
	}
	else if(choice == 2)
		printf("Now exiting game...\n");
    return 0;
}
//prints table
void printTable(){
	//this function prints the table to play in
	printf("TicTacToe\n\n");
	printf("   %c|%c|%c\n",square1,square2,square3);
	printf("  -------\n");
	printf("   %c|%c|%c\n",square4,square5,square6);
	printf("  -------\n");
	printf("   %c|%c|%c\n",square7,square8,square9);
}
//runs game
void gameRun(){
	//Function that game operates in
	int player = 1;			//initialize with first player
	int choice;			//user's board placement
	char mark;			//placeholder for X or O
	int progress = 3;		//3=in progress
	//random number generator
	int seed = time(0);
	srand(seed);
	//start
	printf("Good luck, Have fun!\n");
	printTable();
	//make sure player selects within range
	do{
	        player=(player%2)?1:2;      //determine if player 1 or player 2
//	        mark=(player==1)?'X':'O';
		if(player == 1){
			mark = 'X';
	                //get user input
                	do{
                	        printf("Enter the square you'd like to place your mark: ");
        	                scanf("%d", &choice);
	                }while(choice > 9 || choice < 1);
			//mark the board
			if(choice == 1 && square1 == '1')
				square1 = mark;
			else if(choice == 2 && square2 == '2')
				square2 = mark;
			else if(choice == 3 && square3 == '3')
	    		        square3 = mark;
			else if(choice == 4 && square4 == '4')
        		        square4 = mark;
			else if(choice == 5 && square5 == '5')
	        	        square5 = mark;
			else if(choice == 6 && square6 == '6')
        		        square6 = mark;
			else if(choice == 7 && square7 == '7')
                		square7 = mark;
			else if(choice == 8 && square8 == '8')
				square8 = mark;
			else if(choice == 9 && square9 == '9')
				square9 = mark;
			else{
				printf("Invalid move!!\n");
				player--; //make sure player tries again
			}
		}//end if player 1 turn
		if(player == 2){
			mark = 'O';
			choice=1+rand()%9;		//pick at random
		 	if(choice == 1 && square1 == '1')
                        	square1 = mark;
                	else if(choice == 2 && square2 == '2')
                        	square2 = mark;
                	else if(choice == 3 && square3 == '3')
                        	square3 = mark;
                	else if(choice == 4 && square4 == '4')
                        	square4 = mark;
                	else if(choice == 5 && square5 == '5')
                        	square5 = mark;
                	else if(choice == 6 && square6 == '6')
                        	square6 = mark;
                	else if(choice == 7 && square7 == '7')
                        	square7 = mark;
                	else if(choice == 8 && square8 == '8')
                       		square8 = mark;
                	else if(choice == 9 && square9 == '9')
                        	square9 = mark;
                	else{
//                      	printf("Invalid move!!\n");
                	        player--; //make sure player tries again
        	        }

		}//end of player 2 turn
		player++;
		progress = checkWin();		//checks if game is in progress/win/draw
		printTable();
	}while(progress == 3);
	if(progress == 1){
		player = player - 1;
		printf("Player %d WINS!!\n",player);
		printTable();
	}else{
		printf("----------DRAW----------\n");
	}
}

int checkWin(){
	int inprogress = 3, draw = 0, gameover = 1;

	if (square1 == square2 && square2 == square3){	//row 1
		return gameover;
	}
	else if (square4 == square5 && square5 == square6){//row 2
		return gameover;
	}
	else if (square7 == square8 && square8 == square9){//row 3
		return gameover;
	}
	else if (square1 == square4 && square4 == square7){//col 1
		return gameover;
	}
	else if (square2 == square5 && square5 == square8){//col 2
		return gameover;
	}
	else if (square3 == square6 && square6 == square9){//col3
		return gameover;
	}
	else if (square1 == square5 && square5 == square9){//diagonal 1 \
		return gameover;
	}
	else if (square3 == square5 && square5 == square7){//diagonal 2 /
		return gameover;
	}
	else if (square1 != '1' && square2 != '2' && square3 != '3' && square4 != '4' && square5 != '5' && square6 != '6' && square7 != '7' && square8 != '8' && square9 != '9'){
		return draw;       //returns 0 if game is over with no result
	}
	else{
		return inprogress;       //returns 3 if game is in progress.
	}
}
