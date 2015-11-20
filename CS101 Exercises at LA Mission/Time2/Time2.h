// Time2.h -- for time.cpp
#ifndef Time2_H_
#define Time2_H_

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
		void showstanderdtime();
		void addhr(int h);
		int timetoseconds();
		Time operator-(const Time & t) const;
		friend std::ostream & operator<<(std::ostream & os, const Time & t);
};
#endif
