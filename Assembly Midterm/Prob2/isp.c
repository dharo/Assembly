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

#include <stdio.h>


void optOne();
void optTwo();
void optThree();

int main( int argc, const char* argv[] ){
 //declare variables
	int choice;
	do{
		printf("Select a subscription package:\n\n");
		printf("1) $30 per month w/ 11 hrs access\n");
		printf("   Additional hours: $3 up to 22 hrs, $6 for additional hours\n\n");
		printf("2) $35 per month, 22 hours access.\n");
		printf("   Additional hours: $2 up to 44 hrs, $4 for additional hours\n\n");
		printf("3) $40 per month w/ 33 hours access\n");
		printf("   Additional hours: $1 up to 66 hrs, $2 for each additional hour\n\n");
		printf("Select the plan you have (1-3): ");
		printf("Press 4 to exit\n");
		scanf("%d", &choice);
	}while(choice > 4 || choice < 1);
	//jump to function
	if(choice == 1)
		 optOne();
	else if(choice == 2)
		optTwo();
	else if (choice == 3)
		optThree();
	else
		printf("Exiting Program\n");
return 0;
}

void optOne(){
	//declare variables
	int hours = 0;				//init to 0
	int bill = 0;
	printf("You selected option 1\n");
	printf("Enter the number of hours used: ");
	scanf("%d", &hours);
	int shours = hours;			//static hours
	printf("You entered %d hours.\n", shours);
	//calculate usage
	if(hours > 0 && hours <= 11){
		bill = 30;
	}
	else if(hours > 11 && hours <= 22){
		bill = 30;
		hours = hours - 11;
		//set bill to $30 + (excess hours * $3)
		bill += (hours*3);
	}
	else if(hours > 22){
		bill = 30;		//charge for first 11 hours
		bill += 33;		//charge for next 11 hours
		hours = hours - 22;	//get hours greater than 22
		bill += (hours*6);	//$6 per hour greater than 6
	}
	//display the bill
	printf("Your bill for the use of %d hours is $%d\n\n",shours, bill );
}

void optTwo(){
 //declare variables
        int hours = 0;                          //init to 0
        int bill = 0;
        printf("You selected option 2\n");
        printf("Enter the number of hours used: ");
        scanf("%d", &hours);
        int shours = hours;                     //static hours
        printf("You entered %d hours.\n", shours);
	 //calculate usage
        if(hours > 0 && hours <= 22){
                bill = 35;
        }
        else if(hours > 22 && hours <= 44){
                bill = 35;
                hours = hours - 22;
                //set bill to $35 + (excess hours * $2)
                bill += (hours*2);
        }
        else if(hours > 44){
                bill = 35;              //charge for first 22 hours
                bill += 44;             //charge for next 22 hours
                hours = hours - 44;     //get hours greater than 44
                bill += (hours*6);      //$4 per hour greater than 44
        }
        //display the bill
        printf("Your bill for the use of %d hours is $%d\n\n",shours, bill );

}

void optThree(){
	//declare variables
        int hours = 0;                          //init to 0
        int bill = 0;
        printf("You selected option 3\n");
        printf("Enter the number of hours used: ");
        scanf("%d", &hours);
        int shours = hours;                     //static hours
        printf("You entered %d hours.\n", shours);
        //calculate usage
        if(hours > 0 && hours <= 33){
                bill = 40;
        }
        else if(hours > 33 && hours <= 66){
                bill = 40;
                hours = hours - 33;
                //set bill to $40 + (excess hours * $1)
                bill += (hours);
        }
        else if(hours > 66){
                bill = 40;              //charge for first 33 hours
                bill += 33;             //charge for next 33 hours
                hours = hours - 66;     //get hours greater than 66
                bill += (hours*2);      //$2 per hour greater than 66
        }
        //display the bill
        printf("Your bill for the use of %d hours is $%d\n\n",shours, bill );

}

