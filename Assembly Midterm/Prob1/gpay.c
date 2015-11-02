#include <stdio.h>

int main (int argc, char *argv[]){
 //This program develops an application that will calculate Gross Pay
 //Straight time = 40 hours
 //Double-Time = hours > 40 && hours < 50
 //Triple time = hours > 50

  int payrate = 0;
  int hours = 0;
  int basePay = 0;
  int dtPay = 0;
  int tPay = 0;
  int gross = 0;
//prompt for user input
  printf("This program will determine the Gross Pay\n");
  do{
 	 printf("Enter your pay rate: ");
 	 scanf("%d", &payrate);
  }while(payrate < 1); //because you can't work for free
  printf("You entered %d per hour.\n", payrate);
  do{
	printf("Enter the number of hours worked: ");
	scanf("%d", &hours);
  }while(hours>60 || hours<1);
  printf("You entered %d work hours\n", hours);



//straight pay for hours less than or equal to 40
 if(hours <= 40){
	printf("Gross Pay: $%d\n", (payrate*hours));
 }
//double time pay = straight pay for 40 hours + ((2*payrate)*(hours - 40))
 else if(hours > 40 && hours <= 50){
	basePay = 40*payrate;
	hours = hours-40;
	gross = (hours*(2*payrate))+basePay;
	printf("You worked 40 hours of straight-pay\nand %d double-time hours\n", hours);
	printf("Your Gross Pay:$ %d\n",gross);
 }
//triple time pay = straight pay for 40 hours+doubletime for 10 hours
//			+ (hours-50)+(3*payrate)
 else if (hours > 50 && hours <= 60){
	basePay = 40*payrate;				//400
	dtPay = (2*payrate)*10;				//+200
	hours = hours - 50;
	gross = basePay + dtPay + ((3*payrate)*hours);	//+300
	printf("You worked 40 hours straight pay\n");
	printf("You also worked 10 hours Double-Time\n");
	printf("Your Gross pay with %d Triple-Time hours is $%d\n",hours,gross);
  }
	return 0;
}
