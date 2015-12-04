/* 
 * File:   main.cpp
 * Author: Dr. Mark E. Lehr
 * Created on October 19, 2015, 11:23 AM
 * Purpose:  Example Menu
 *           Convert all cout/cin -> printf/scanf
 *           Convert constructs to labels/goto's
 *           Convert all variables -> registers
 *           Put functions in other files to compile
 *           Make sure to convert 5/9 and 9/5 to binary pointsexit
 */

//System Libraries
#include <iostream>
#include <iomanip>
using namespace std;

//Function Prototypes
void menu(void);
void problem1(int,int);
void problem2(int,int);

//Execution Begins Here!
int main(int argc, char** argv) {
    //Declare variables
    int beg,end,choice;
    //Loop until exit
    do{
        cout<<"Input beginning and end of temperature range"<<endl;
        cin>>beg>>end;
        cout<<"If range is degree Centigrade input 1"<<endl;
        cout<<"If range is degree Fahrenheit input 2"<<endl;
        cin>>choice;
        switch(choice){
            case 1: problem1(beg,end);break;
            case 2: problem2(beg,end);
        }
    }while(choice>0&&choice<3);
    //Exit stage right
    return 0;
}

void problem1(int beg,int end){
    cout<<"Display Degree Centigrade to Degree Fahrenheit"<<endl;
    cout<<"Fahrenheit  Centigrade"<<endl;
    for(int c=beg;c<=end;c++){
        int f=9.0/5.0*c+32;
        cout<<setw(6)<<f<<setw(12)<<c<<endl;
    }
}

void problem2(int beg,int end){
    cout<<"Display Degree Centigrade to Degree Fahrenheit"<<endl;
    cout<<"Fahrenheit  Centigrade"<<endl;
    for(int f=beg;f<=end;f++){
        int c=5.0/9.0*(f-32);
        cout<<setw(6)<<f<<setw(12)<<c<<endl;
    }
}
