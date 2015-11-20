#include <iostream>
using namespace std;

int num1 = 0;
int num2 = 0;
int total = 0;


int main()
{
	cout << "please enter a number then press enter:_\b";
	cin >> num1;
	cout << "please enter one more number then press enter:_\b";
	cin >> num2;
	for (int num3 = num1; num3 <= num2; num3++)
		{
		total = total + num3;
		}

	cout << total;
	cout << endl;

}