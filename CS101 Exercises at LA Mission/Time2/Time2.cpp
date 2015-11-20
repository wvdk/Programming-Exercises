/*****************************
Program: Time2.cpp
Date: May 18th 2009
Made By 
 - Wesley van der Klomp
*****************************/
                                                         
#include <iostream> // adds the contents from the iostream.h
#include "Time2.h"

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

void Time::showstanderdtime()
{
    using std::cout;
    char ap = 'A';
    if(hour > 12)
        ap = 'P';
    ap = 'A';
    if(hour >= 12)
        ap = 'P';
    if(hour > 12)
        cout << (hour - 12);
    else
        cout << hour;
    cout << ":";
    if(minute <= 9)
        cout << "0";
    cout << minute << ":";
    if(second <= 9)
    {
        cout << "0";
    }
    cout << second << " " << ap << "M";
    cout << endl;
}

Time Time::operator-(const Time & t) const
{
    Time diff;
    int tot1, tot2;
    tot1 = ((t.hour * 60) * 60) + (t.minute * 60) + t.second;
    tot2 = ((hour * 60) * 60) + (minute * 60) + second;
    diff.second = (tot2 - tot1) % 60;
    diff.minute = ((tot2 - tot1) / 60) % 60;
    diff.hour = ((tot2 - tot1) / 60) / 60;
    return diff;
}



int Time::timetoseconds()
{
    return ((hour * 60) * 60) + (minute * 60) + second;
}

void Time::addhr(int h)
{
    hour +=h;
}

std::ostream & operator<<(std::ostream & os, const Time & t)
{
    os << t.hour << ":";
    if(t.minute <= 9)
    {
        os << "0";
    }
    os << t.minute << ":";
    if(t.second <= 9)
    {
        os << "0";
    }
    os << t.second;
    os << "\n";
    return os;
}
