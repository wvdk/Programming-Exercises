/*******************************************************************************************
Program: BMI.cpp

This program takes your hight and weight in feet-inches-pounds and tells you your BMI.

Date: 03/09/09

Made By 
 - Wesley van der Klomp
********************************************************************************************/
                                                         
#include <iostream>                                      // adds the contents from the iostream.h
#include <cmath>                                         // adds cmath.h
                                                         
using namespace std;                                     
                                                         //Declarations below
double bmi = 0;                                          
double feet = 0;                                         
double inches = 0;                                       
double Tinches = 0;                                      
double pounds = 0;                                       
double kilograms = 0;                                    
double meters = 0;                                       
const int twelve = 12;                                   
const double pointZeroTwo = 0.0254;                      
const double twoPointTwo = 2.2;                          
                                                         
int main()                                               // main function
{                                                        // Start of funtion body
	cout << "Please enter your hight and press enter:\n";// display request
    cout << "Feet:_\b";                                  
    cin  >> feet;                                        //save to feet
    cout << "Inches:_\b";                                
    cin  >> inches;                                      //save to inches
    Tinches = feet * twelve + inches;                    //solve for total inches
    meters = Tinches * pointZeroTwo;                     //solve for meters
    cout << "Please enter your weight in pounds:_\b";    //display reqeust
    cin  >> pounds;                                      //save to pounds
    kilograms = pounds / twoPointTwo;                    //solve for kilograms
    bmi = kilograms / ( meters * meters );               // solve for BMI
    cout << "Your BMI is: " << bmi;                      // display BMI
    cin.get();                                           
    cin.get();                                           
    return 0;                                            
}                                                        // End of funtion body
