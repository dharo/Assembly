#include <stdio.h>
#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;

float getPow(float,int);
void problem1();
void problem2();
void problem3();
void problem4();

int main (){
	//declare variables
	int selection = 0;
	bool quit = false;
    do{
	cout<<"48982 CSC 11: Assembly Final\nDavid Haro\n\n";
	cout<<"1. Guess the Number\n";
	cout<<"2. Savings Formula\n";
	cout<<"3. Quadratic Equation: Integer\n";
	cout<<"4. Quadratic Equation: Float\n";
	cout<<"Enter your selection (1-4)\n";
	cin>>selection;

	switch(selection){
		case 1: problem1();
			break;
		case 2: problem2();
			break;
		case 3: problem3();
			break;
		case 4: problem4();
			break;
		default: cout<<"Now Exiting Program...\n"; quit = true;
			break;
	}
     }while(quit != true);
     return 0;
}

void problem1(){
	cout<<"Guessing the Number\n";
	//generate random number from 1 to 1000
	//do until guess == 10 || guess_correct == 1
	//if input == generated number: cout<<Correct! exit loop
	//else if input < generated number: cout<<Too low, try again.
	//else if input > generated number: cout<<Too High, try again.
	//initialize seed for random number generator
	srand(time(0));
	int hidden_num = rand()%1000 + 1;
	int guess;
	int tries = 0;
	int guess_correct = 0;
	do{
		printf("Guess a number between 1 and 1000\n");
		scanf("%d",&guess);
		if(hidden_num == guess){
			printf("Correct!! \n\n\n\n");
			guess_correct++;
		}
		if(hidden_num > guess){
			 printf("Too low, try again!\n"); tries++;
		}
		if(hidden_num < guess){
			 printf("Too high, try again!\n"); tries++;
		}
	}while(tries < 10 && guess_correct < 1);
}

void problem2(){
	cout<<"Saving Formula\n";
	/*
	Write a program that fills an array then prints
	the result for the following. (* Fill array with generated amounts)

	Input the number of years, range => 1 to 20
	Input the interest rate, range   => 5% to 10%
	Input the present value          => $1000 to $5000

	Calculate the Future Value for year 1 to the
	number of years using the following equation
	FV=PV*(1+i)^n
	*/
	float future_val[20];
	int years;
	float rate;
	float present_val;
	printf("This Program will calculate future savings\n\n");
	do{
		printf("Please input the present balance for the account: ");
		scanf("%f",&present_val);
	}while(present_val < 1000 || present_val > 5000);
	do{
		printf("Please enter the interest range (5 - 10): ");
		scanf("%f",&rate);
	}while(rate < 5 || rate > 10);
	do{
		printf("Please enter the number of years you would like to calculate: ");
		scanf("%d",&years);
	}while(years < 1 || years > 20);
	if(rate == 5)
		rate=1.05f;
	if(rate == 6)
		rate=1.06f;
	if(rate == 7)
		rate=1.07f;
	if(rate == 8)
		rate=1.08f;
	if(rate == 9)
		rate=1.09f;
	if(rate == 10)
		rate=1.10f;
	//fill array with results and print as its filled
	for(int i=0;i<years;i++){
		future_val[i] = present_val * getPow(rate,i+1);
		printf("Future value after %d year(s): $%.2f \n",i+1,future_val[i]);
	}
}
float getPow(float base,int exp){
	float result = 1;
   	float a = base;
 	  int n = exp;
	while(n>0){
    		if(n%2 == 1)result*=a;
    		a *= a;
    		n /= 2;
	}
	return result;

}
void problem3(){
	/*
	**Use Integers***
 	We have a quadratic equation ax^2+bx

	Let x be and integer from 0 to 255
	a=0.073, b=0.876

	Input x,

	Scale a and b as integers.  Only use integers
	giving the maximum amount of accuracy.

	Output the result.
	*/
	int a = 73;		//0.073 * 10^3
	int b = 876;		//0.876 * 10^3
	int x;
	int result;
	printf("This program will calculate a(x^2)+bx\n");
	do{
		printf("Enter a value for x (0-255): ");
		scanf("%d",&x);
	}while(x > 255 || x < 0);

	//calculate quadratic formula
	result = (a*(x*x))+(b*x);
	//printf results
	printf("the answer when x is %d is %d * 10^-3\n\n",x,result);
}

void problem4(){
	cout<<"Quadratic Formula: Float\n";
        /*
	***Use Floats***
        We have a quadratic equation ax^2+bx

        Let x be and integer from 0 to 255
        a=0.073, b=0.876

        Input x,

        Scale a and b as integers.  Only use integers
        giving the maximum amount of accuracy.

        Output the result.
	*/
	float a = 0.073;
        float b = 0.876;
        int x;
        float result;
        printf("This program will calculate a(x^2)+bx\n");
        do{
                printf("Enter a value for x (0-255): ");
                scanf("%d",&x);
        }while(x > 255 || x < 0);

        //calculate quadratic formula
        result = (a*(x*x))+(b*x);
        //printf results
        printf("the answer when x is %d is %f\n\n",x,result);
}
