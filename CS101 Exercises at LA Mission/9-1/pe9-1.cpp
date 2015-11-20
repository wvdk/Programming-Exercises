/************************
Program: pe9-1.cpp

Date: 04/20/09

Made By 
 - Wesley van der Klomp
************************/
                                                         
#include <iostream> // adds the contents from the iostream.h
#include "golf.h"

using namespace std;

int main() // main function
{ // Start of funtion body
    golf player[5];
    setgolf(player[0]);
    showgolf(player[0]);
    int t = 0;
    int i = 0;
    while(t < 3)
    {
        t = t + 1;
        if( setgolf(player[i]) == 1 )
        {
            break;
        }
        showgolf(player[i]);
        i++;
    }
    system("pause");
    return 0;                                            
}                                                        // End of funtion body
