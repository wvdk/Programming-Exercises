#include <iostream>
#include <cmath>

using namespace std;

const int FEET = 12;
int inches = 0;
int hight = 0;
int hightinch = 0;

int main()
{
	cout << "Please enter your hight in inches: _\b";
	cin  >> inches;
	hight = inches/FEET;
	hightinch = inches%FEET;
	cout << endl;
	cout << "Your hight is " << hight;
	cout << " and " << hightinch << " inches.\n";
	return 0;
}