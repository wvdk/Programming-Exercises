/*************************************************************************
Program: Pizza.cpp

This program will ask for the companyn name, the diameter, and the weight. 
It will then display the same info back to you.

Date: 03/16/09

Made By 
 - Wesley van der Klomp
***************************************************************************/

#include <iostream>                  // adds the contents from the iostream.h

using namespace std;                // Uses standard name spacing
                                    //Declarations below
struct pizzaCo                      //structure start
{
       double diameter;
       double weight;
       char name[50];
};

pizzaCo retrieve();             //function prototype
int output(struct pizzaCo);     //function prototype

int main()                      //main function
{                               //start of funtion body
    pizzaCo p;                  //calls up a function
    p = retrieve();
    output(p);                  //calls up a funtion
    system("pause");
	return 0;
}                               //end of funtion body

pizzaCo retrieve()
{                               //start of funtion body
       pizzaCo pc;
       cout << "Please enter the name of the company:_\b";  //requests name
       cin.getline(pc.name, 50);
       cout << "Please enter the diameter(inches) of the pizza:_\b"; //request
       cin >> pc.diameter;
       cout << "Please enter the weight(pounds) of the pizza:_\b";  //request
       cin >>pc.weight;
       return pc;
}                               //end of funtion body

int output(struct pizzaCo o)
{                               //start of funtion body
    cout << endl;
    cout << "Weight = " << o.weight;        //outputs weight
    cout << endl;
    cout << "Diameter = " << o.diameter;    //outputs diameter
    cout << endl;
    cout << "Company name = " << o.name;    //outputs name
    cout << endl;
	return 0;
}                               //end of funtion body
