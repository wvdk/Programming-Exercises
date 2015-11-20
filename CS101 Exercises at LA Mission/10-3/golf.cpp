#include <iostream> // adds the contents from the iostream.h
#include "golf.h"

using namespace std;

// interactive version:
// functioin solicits name and handicap from user
// returns 1 if name is entered. returns 0 if name is empty string
golf::golf()
{
    for(int i = 0; i <= 40; i++) fullname[i] = ' ';
    cout << endl << endl;
	cout << "\n-\tinteractive\t-\n";
	cout << "\nPlease enter your full name: ";
	cin.getline(fullname, 40);
	cout << "\nPlease enter your handicap: \b";
	cin >> handicap;

    cin.get();
}

// non-interactive version:
// functioin sets golf structure to provided name, handicap
// using values passed as arguments to the function
golf::golf(char * name, int hc)
{
    handicap = 0;
    handicap = hc;
    for (int i = 0; i < strlen(name) + 1; i++)
        fullname[i ]= name[i];
	cout << "\n- non-interactive -\n";
}

//function resets handicap to new value
void golf::handicap2(int hc)
{

	std::cout << "\n-\thandicap resets\t-\n";
}

//funtion displays contents of golf structure
void golf::showgolf()
{
    using std::cout;
    using std::endl;
    cout << "\n- displays -\n";
    cout << "\nName: " << fullname;
    cout << "\nHandicap: " << handicap;
    cout << endl;
}
