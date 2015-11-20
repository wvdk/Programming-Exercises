/*************************************************************************
Wesley van der Klomp
March 23, 2009
Program 5-3

This program finds how many years it would take for a 5% compound yearly
interest rate to pass a 10% simple yearly interest rate.
*************************************************************************/
#include <iostream>                            // adds the iostream.h file
#include <cmath>                                      // adds cmath.h file
using namespace std;
                                                      //Declarations below
const double sint = 0.10;//10.0;
const double cint = 0.05; //.0;
double dbal = 100;
double cbal = 100;
int year = 0;
    
int main()                                                // main function
{                                                 // Start of funtion body
     cout << "Daphne's simple interest: 5% a year" << endl;
     cout << "Cleo's compound interest: 10% a year " << endl << endl;
     while (cbal <= dbal)
      {
        year++;
        cout << "Year: " << year << ".   Cleo's balance:  " << cbal; 
        cout << ".    Daphne's balance:  " << dbal << endl;
        dbal += sint * 100;
        cbal += cint * cbal;
      }
     cout << endl << endl << "It would take " << year; 
     cout << " years for Cleo to pass Daphne." << endl;
     cout << "Cleo's balance:  $" << cbal << endl;
     cout << "Daphne's balance:  $" << dbal << endl;
     system("pause");
}                                                    // End of funtion body
