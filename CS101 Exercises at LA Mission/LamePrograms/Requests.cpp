#include <iostream>

using namespace std;

char grade = 0;
int age = 0;
char fname[10];
char lname[20];

int main()
{

cout << "What is your first name? ";
cin.getline(fname, 10);
cout << endl;
cout << "What is your last name? ";
cin.getline(lname, 20);
cout << endl;
cout << "What letter grade do you deserve? ";
cin >> grade;
cout << endl;
cout << "What is your age? ";
cin >> age;
cout << endl;
cout << "Name: " << fname << " " << lname;
cout << endl;
cout << "Grade: " << ++grade;
cout << endl;
cout << "Age: " << age;
cout << endl;
system("pause");
return 0;

}