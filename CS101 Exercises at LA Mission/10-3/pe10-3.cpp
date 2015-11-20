/************************
Program: pe10-3.cpp

Date: 04/20/09

Made By 
 - Wesley van der Klomp
************************/
                                                         
#include <iostream> // adds the contents from the iostream.h
#include "golf.h"

using namespace std;

int main() // main function
{ // Start of function body
golf player("42", 42);
player.showgolf();
    golf players[5];
    int t = 0;
    int i = 0;
    for(i = 0; i < 5; i++)
    {
        players[i].showgolf();
    }
    system("pause");
    return 0;                                            
} // End of funtion body
