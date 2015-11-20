/*****************************
Program: Time1ClassFile.cpp
Date: May 18th 2009
Made By 
 - Wesley van der Klomp
*****************************/
                                                         
#include <iostream> // adds the contents from the iostream.h
#include "Time1.h"

using namespace std;

Time::Time()
{
    hour = 0;
    minute = 0;
    second = 0;

}

Time::Time(int h, int m, int s)
{
    hour = h;
    minute = m;
    second = s;
}

void Time::showtime()
{
    using std::cout;
    cout << hour << ":";
    if(minute <= 9)
    {
        cout << "0";
    }
    cout << minute << ":";
    if(second <= 9)
    {
        cout << "0";
    }
    cout << second;
    cout << endl;
}

void Time::showtime(char c)
{
    using std::cout;
    char ap = 'A';
    if(hour > 12)
        ap = 'P';
    if(c == 'm')
    {
        showtime();
    }
    else
    {
        char ap = 'A';
        if(hour >= 12)
            ap = 'P';
        if(hour > 12)
            cout << (hour - 12);
        else
            cout << hour;
        cout << ":";
        if(minute <= 9)
        {
            cout << "0";
        }
        cout << minute << ":";
        if(second <= 9)
        {
            cout << "0";
        }
        cout << second << " " << ap << "M";
        cout << endl;
    }
}
