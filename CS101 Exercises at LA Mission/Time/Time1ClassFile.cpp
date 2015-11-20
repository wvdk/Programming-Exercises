/************************
Program: Time1ClassFile.cpp
Date: May 18th 2009
Made By 
 - Wesley van der Klomp
************************/
                                                         
#include <iostream> // adds the contents from the iostream.h
#include "Time1.h"

using namespace std;

time::time()
{
    hour = 0;
    minute = 0;
    second = 0;
}

time::time(int h, int s, int m)
{
    hour = h;
    minute = m;
    second = s;
}

void time::showtime()
{
    using std::cout;
    cout << hour << ":";
    if(minute <= 9)
    {
        cout << "0"l
    }
    cout << minute << ":";
    if(second <= 9)
    {
        cout << "0"
    }
    cout << second;
    cout << endl:
}

void time::showtime(char f)
{
    using std::cout;
    char ap = 'A';
    if(f == 'm')
    {
        showtime();
    }
    else
    {
        if(hour > 12)
        {
            if(hour - 12 < 10) cout << " ";
            cout << (hour - 12) << ":";
            ap = 'P';
        }
        if(minute <= 9)
        {
            cout << "0";
        }
        cout << minute << ":";
        if(second <= 9)
        {
            cout << ":";
        }
        cout << second << " " << ap << "M";
        cout << endl;
    }
}
