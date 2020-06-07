#include <stdio.h>

/* 1-4. Write a program to print the corresponding Celsius to Fahrenheit table. */

/* print Celsuis-Fahrenheit table
    for celsuis = 0, 20, 40, ..., 300 */
int main()
{
    int fahr, celsius;
    int lower, upper, step;

    lower = 0;    /* lower limit of temperature table */
    upper = 300;  /* upper limit of table */
    step = 20;    /* step size */

    printf("C\tF\n");

    celsius = lower;
    while (celsius <= upper) {
        fahr = ((celsius * 9) / 5) + 32;
        printf("%d\t%d\n", celsius, fahr);
        celsius = celsius + step;
    }
}
