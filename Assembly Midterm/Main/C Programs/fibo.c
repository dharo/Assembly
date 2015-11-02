/*
	Generate the Fibonacci sequence.  The input will be the
	term in the sequence to output.  The output will be that term
	in the sequence.  Assume that the sequence starts at 1 for the
	first term {1,1,2,3,5,8,13, etc....}
	For instance, Input -> 6, Output -> 8
	The generating equation is Fi=Fi-1+Fi-2
*/

#include <stdio.h>

int main(){
   //declare variables
     int n, c, first = 0, second = 1, next;
   //PROMPT FOR INPUT
   printf("Enter the nth term you want form the Fibonacci series: ");
   scanf("%d", &n);
   //Generate sequence, print once we reach the end.
   for (c=1;c<=n;c++){
      if (c == 1)
         next = c;
      else{
         next = first + second;
         first = second;
         second = next;
      }
      if(c == n)
      	printf("The %dth number in the Fibonacci series is %d \n",n,next);
   }

   return(0);
}
/*
r1 = counter
r2 = input
r3 = next
r4 = first
r5 = second
45 -> 66
*/
