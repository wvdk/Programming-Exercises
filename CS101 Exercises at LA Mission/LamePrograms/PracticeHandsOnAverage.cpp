/*************************************************************************
Wesley van der Klomp
March 30th, 2009
Program: PracticeHandsOn.cpp
*************************************************************************/
#include <iostream>
#include <cmath>
using namespace std;

int main()
{
	double num1 = 0;
	double num2 = 0;
	double num3 = 0;
	double num4 = 0;
	double sum = 0;
	double product = 0;
	cout << "Please enter your 1st of 4 numbers:_\b";
	cin >> num1;
	cout << endl;
	cout << "Please enter your 2nd of 4 numbers:_\b";
	cin >> num2;
	cout << endl;
	cout << "Please enter your 3rd of 4 numbers:_\b";
	cin >> num3;
	cout << endl;
	cout << "Please enter your 4th of 4 numbers:_\b";
	cin >> num4;
	cout << endl;
	cout << endl;
	sum =  num1 + num2 + num3 + num4;
	product = num1 * num2 * num3 * num4;
	cout << "Numbers entered" << "\t" << num1 << "\t" << num2;
	cout << "\t" << num3 << "\t" << num4 << "\t\n\n";
	cout << " Sum\tAverage\tProduct\n";
	cout << "-----\t-------\t-------\n";
	cout << " " << sum << "\t " << sum / 4 << "\t  " << product;
	cout << endl;
	cout << endl;
	return 0;
}