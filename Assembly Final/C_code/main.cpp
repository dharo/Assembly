#include <stdio.h>
#include <iostream>
#include <cstdlib>
using namespace std;

void problem1();
void problem2();
void problem3();
void problem4();

int main (){
	//declare variables
	int selection = 0;
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
		default: cout<<"Now Exiting Program...\n";
			break;
	}
     return 0;
}

void problem1(){
	cout<<"Guessing the Number\n";
	//generate random number from 1 to 1000
	//do until guess == 10 || guess_correct == 1
	//if input == generated number: cout<<Correct! exit loop
	//else if input < generated number: cout<<Too low, try again.
	//else if input > generated number: cout<<Too High, try again.
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
}

void problem3(){
	cout<<"Quadratic Formula: Integer\n";
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


}
