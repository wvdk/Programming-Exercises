/***********************
Program: 10-2.cpp
Date: 04/27/09
Made By
 - Wesley van der Klomp
************************/
#include <iostream>    // adds the contents from the iostream.h
using namespace std;

class Person
{
    Private:
        static const LIMIT = 25;
        string lname;
        char fname[LIMIT];
    Public:
        Person() {lname = ""; fname[0] - '\0'; } //#1
        Person(const string & ln, const char * fn = "Heyyou"); //#2
        // the following methods display lname and fname
        void Show() const; //firstname lastname format
        void FormalShow() const; // lastname, firstname format
};

int main()             // main function
{                      // Start of funtion body

	system("pause");
    return 0;
}                      // End of funtion body
