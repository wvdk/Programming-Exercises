#include <stdio.h>
#define MAX_FILE_LENGTH  9999

int main()
{
    char file[MAX_FILE_LENGTH];

    char c;
    while ((c = getchar()) != EOF && c != 'q' ) {
        
	putchar(c);
    }
}
