/*************************************************************************
Wesley van der Klomp
March 23, 2009
Program 6-3
*************************************************************************/

#include <iostream>
using namespace std;

void showmenu();

int main()
{
	showmenu();
	char answer;
	cin >> answer;
	while ( answer != 'E')
	{
		switch(answer)
		{
		case 'A' : cout << "\n42\n";
			      break;
		case 'B' : cout << "\nI told you not to! Pease go away.\n";
			      break;
		case 'C' : cout << "\nI told you to pick B. Try again.\n";
			      break;
		case 'D' : cout << "\n ... \n";
				  break;
		default : "\nFAIL! Pick a one of the letters... Maybe use... CAP LOCKS!\n";
		}
		cout << endl;
		showmenu();
		cin >> answer;
	}

	cout <<"Ok well that was boring. BYE!";
	return 0;
}


void showmenu()
{
	cout << "Please pick your letter:\n"
		"A) Answer to life the universe and everything.		B) DON'T pick this one!\n"
		"C) Go pick 'B'! Now! 									D) ...\n"
		"E) Exit.\n" ;
}