#include <stdio.h>

/* 1-6. Verify that the expression getchar() != EOR is 0 or 1 */

int main()
{
    int c;

    while (((c = getchar()) != EOF) == 0)
        putchar(c);
}
