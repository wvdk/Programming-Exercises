#include <stdio.h>

/* 1-3. Modify the temprature conversion program to print a heading above the table. */

/* print Fahrenheit-Celsuis table 
    for fahr = 0, 20, ..., 300 */
int main()
{
    int fahr, celsius;
    int lower, upper, step;

    lower = 0;    /* lower limit of temperature table */
    upper = 300;  /* upper limit of table */
    step = 20;    /* step size */

    printf("F\tC\n");

    fahr = lower;
    while (fahr <= upper) {
        celsius = 5 * (fahr-32) / 9;
        printf("%d\t%d\n", fahr, celsius);
        fahr = fahr + step;
    }
}
