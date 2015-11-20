/************************
Program: time.cpp
Date: May18th 09
Made By 
 - Wesley van der Klomp
************************/
                                                         
#include <iostream> // adds the contents from the iostream.h
#include "Time1.h" // adds the contents Time1.h

using namespace std;

int main() // main function
{ // Start of function body
    int hrs = 0;
    int min = 0;
    int sec = 0;
    char ap = 'x';
    Time newtime(20, 0, 0);
    cout << "\nMilitary time is ";
    newtime.showtime();
    cout << "\nStanderd time is ";
    newtime.showtime('s');
    cout << endl;
    cout << "\nPlease enter your time in standerd below:\n\n";
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
    newtime = Time(hrs, min, sec);
    cout << "\nMilitary: ";
    newtime.showtime();
    cout << "\nStanderd: ";
    newtime.showtime('s');
    cout << "\n\n";
    system("pause");
    return 0;                                            
} // End of funtion body
