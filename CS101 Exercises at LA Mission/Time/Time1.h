// Time1.h -- for time.cpp
#ifndef Time1_H_
#define Time1_H_

class Time
{
    private:
		int hour;
		int minute;
		int second;
		char ampm;
    public:
		Time();
		Time(int h, int m, int s);
        void output(int h, int m, int s);
		void showtime();
		void showtime(char f);
};
#endif
