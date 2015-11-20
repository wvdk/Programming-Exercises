/*************************************************************************
Wesley van der Klomp
March 30th, 2009
Program: FootBall.cpp

Assignment:
    Write a program that stores the scores for the Mission College football
    team. They play 20 games at home this year, and we need to record the 
    score by quarter for each of the 20 games. Plan to have 4 quarters per 
    game. We only wish to keep the score for Mission. Initialize all games
    to zero.
*************************************************************************/
#include <iostream>                           // adds the iostream.h file
using namespace std;

int random();                                  //Declaration of a function
void showmenu();                               //Declaration of a function

int main()                                                // main function
{                                                 // Start of funtion body
    int game = 0;
	int scores [20][4];
	int totaltotal = 0;
	
    for(int g = 0; g < 20; g++)                        //initializing loop
       	for(int q = 0; q < 4; q++)
            scores[g][q] = 0;;
    int qtotal[4];
    
    showmenu();                                        // call to function
    cin >> game;                                        //input game
    
    while(game != 22)                             //while game less the 22
    {
        if(game > 0 && game < 21)    //if game more that 0 and less then 21
   	        {
// assignment
                for(int q = 0; q < 4; q++)                      //for loop
                    scores[game - 1][q] = random();
            }
         else if(game == 21)          //if not more that 0 and less then 21
            {
                for(int g = 0; g < 20; g++)                      //for loop
                    for(int q = 0; q < 4; q++)     //for loop in a for loop
                        scores[g][q] = random();;
            }
    
    
// display
        cout << "|GAME|   |QTR1|  |QTR2|   |QTR3|   |QTR4| |TOTAL|\n";
        for(int q = 0; q < 4; q++)qtotal[q] = 0;                //for loop
        for(int g = 0; g < 20; g++)                             //for loop
        {
            int total = 0;                            //initializing total

            cout.width(3);                        //used to line up nicely
            cout << right << 1 + g << "      ";
            for(int q = 0; q < 4; q++)                          //for loop
            {
                total += scores[g][q];
                totaltotal += scores[g][q];
                qtotal[q] += scores[g][q];
                cout.width(3);                    //used to line up nicely
                cout << right << scores[g][q] << "      ";

            }
            cout << total;                        //display right most row
            cout << endl;                                       //new line
        }
    cout << "Average:  ";
    for(int q = 0; q < 4; q++)
        cout << qtotal[q] / 20 << "       ";
    cout << totaltotal / 20 << endl;            //calculates then displays 
    showmenu();
    cin >> game;
    }
    system("pause");
}                                                   // End of funtion body

int random()
{                                                 // Start of funtion body
    int score = 0;                                          //initializing
    score = rand() % 33;                           //makes a random number
    if(score == 1)                                        //changes 1 to 0
        score = 0;
    return score;                                  //returns random number
}                                                   // End of funtion body

void showmenu()
{                                                 // Start of funtion body
	cout << "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n"
            "|| Choose a game 1 thru 20 by typing in the number and pressing enter. ||\n"
	        "|| If you would like to update all games then type 21. Type 22 to exit.||\n"
            "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||\n"
	        "Type and press enter here: ";
}                                                   // End of funtion body
