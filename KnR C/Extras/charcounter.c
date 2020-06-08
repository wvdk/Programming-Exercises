#include <stdio.h>

int main() {

    int n;
    char c;

    while ((c = getchar()) != EOF) {
        n = n + 1;
    }

    printf("%d\n", n);
}
