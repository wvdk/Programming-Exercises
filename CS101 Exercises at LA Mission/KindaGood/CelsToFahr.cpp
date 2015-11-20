#include <cmath>
#include <iostream>

using namespace std;

double converter(double tempcels);

double cels = 0.0;
double fahr = 0.0;

int main()
{
    cout << "Please enter a Celsius value:";
    cin  >> cels;
    fahr = converter(cels);
    cout << endl;
    cout << cels;
    cout << " degrees Celsius is ";
    cout << fahr;
    cout << " degrees Fahrenheit.";
    cout << endl;
	cin.get();
	cin.get();
    return 0;
}

double converter(double tempcels)
{
       double f = 0.0;
       f = 32.0 + tempcels * 1.8;
       return f;
}
