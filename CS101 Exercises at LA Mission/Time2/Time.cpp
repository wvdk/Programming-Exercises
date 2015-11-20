/************************
Program: time.cpp
Date: May18th 09
Made By 
 - Wesley van der Klomp
************************/
                                                         
#include <iostream> // adds the contents from the iostream.h
#include "Time2.h" // adds the contents Time1.h

using namespace std;

void showmenu();
void menu();
void showtimes(Time & stime, Time & etime);
void usertime(Time & t);
void calculate(Time & st, Time & et);

int main() // main function
{
          //Create time objects
    Time starttime(20, 0, 0);
    Time endtime(20, 0, 0);
    char answer;
    showmenu(); //requests answer
    cin >> answer;
    while(answer != 'E' && answer != 'e')
    {
        switch(answer)
        {
            case 'A' :
                cout << "\nYou chose to edit start time.";
                showtimes(starttime, endtime);
                cout << "\nPlease enter a new start time in standerd format:\n\n";
                usertime(starttime);
                system("cls");
                showtimes(starttime, endtime);
                break;
            case 'B' :
                cout << "\nYou chose to edit end time.";
                showtimes(starttime, endtime);
                cout << "\nPlease enter a new end time in standerd format:\n\n";
                usertime(endtime);
                system("cls");
                showtimes(starttime, endtime);
                break;
            case 'C' :
                calculate(starttime, endtime);
                break;
		}
		cout << endl;
		showmenu();
		cin >> answer;
    }
    cout << "\nExit: ";

    system("pause");
    return 0;                                            
} // End of funtion body

void showtimes(Time & stime, Time & etime)
{
    cout << "\n\n----------------------------------";
    cout << "\nThe start and end times are now:";
    cout << "\n\n    -Military Time-";
    cout << "\n\n   Start Time: ";
    cout << stime;
    cout << "   End   Time: ";
    cout << etime;
    
    cout << "\n    -Standerd Time-";
    cout << "\n\n   Start Time: ";
    stime.showstanderdtime();
    cout << "   End   Time: ";
    etime.showstanderdtime();
    cout << "\n\n    ******DIFFERENCE******\n";
    cout << "            ";
    calculate(stime, etime);//shows the diff
    cout << "    **********************\n";
    cout << "----------------------------------\n";

}

void showmenu()
{
	cout << "\nPlease pick your letter (Must be capital letter):\n"
		"A) Enter a start time\n"
        "B) Enter a end time\n"
		"C) Calculate\n"
		"E) Exit\n\n" ;
}



void usertime(Time & t)
{
       int hrs = 0;
    int min = 0;
    int sec = 0;
    char ap = 'x';

    cout << endl;
    cout << "Hours: ";
    cin >> hrs;
    while(hrs < 1 || hrs > 12)
    {
        cout << "\nNot a vailed starderd time, please try again.\n";
        cout << "\nPlease enter your time in standerd below:\n\n";
        cout << "Hours: ";
        cin >> hrs;
    }
    cout << "\nMinutes: ";
    cin >> min;
    while(min < 0 || min > 59)
    {
        cout << "\nNot a vailed starderd time, please try again.\n";
        cout << "\nMinutes: ";
        cin >> min;
    }
    cout << "\nSeconds: ";
    cin >> sec;
    while(sec < 0 || sec > 59)
    {
        cout << "\nNot a vailed starderd time, please try again.\n";
        cout << "\nSeconds: ";
        cin >> sec;
    }
    cout << "\nEnter A for AM or P for PM:_\b";
    cin >> ap;
    if(ap == 'p' || ap == 'P')    
    {
        if(hrs != 12)
            hrs = hrs + 12;
    }
    else
    {
        if(hrs == 12)
            hrs = 0;
    }
    t = Time(hrs, min, sec);
}

void calculate(Time & st, Time & et)
{
    Time diff;
    int sst = st.timetoseconds();
    int est = et.timetoseconds();
    if(sst > est)
    {
        Time newtime = et;
        newtime.addhr(24);
        diff = newtime - st;
    }
    else
    {
    diff = et - st;
    }
    diff.showtime();
}
