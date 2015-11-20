// golf.h -- for pe9-1.cpp
#ifndef GOLF_H_
#define GOLF_H_

//const int LEN = 40;

class golf
{
    private:
        char fullname[40];
        int handicap;
    public:
        golf();
        golf(char name[40], int hc);
        void handicap2(int hc);
        void showgolf();
};

 #endif
