//limits.cpp - - some interger limits

#include <iostream>
#include <climits>
using namespace std;

int main()
{
	int n_int = INT_MAX;
	short n_short = SHRT_MAX;
	long n_long = LONG_MAX;

	// size of operator yelds size of type or of varible
	cout << "int is " << sizeof (int) << " bytes." << endl;
	cout << "short is " << sizeof n_short << " bytes." << endl;
	cout << "long is " << sizeof n_long << " bytes." << endl <<endl;

	cout << "Maximun values:" << endl;
	cout << "int: " << n_int << endl;
	cout << "short: " << n_short << endl;
	cout << "long: " << n_long << endl << endl;

	cout << "Minimun int value = " << INT_MIN << endl;
	cout <<"Bits per byte = " << CHAR_BIT << endl;
	cin.get();
    cin.get();
    return 0;
}
