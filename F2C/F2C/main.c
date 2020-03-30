//
//  main.c
//  F2C
//
//  Created by Wesley Van der Klomp on 3/28/20.
//  Copyright © 2020 wes. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    // insert code here...
 
    
    float fahr, celsius;
    int lower, upper, step;
    
    lower = 0;
    upper = 300;
    step = 20;
    
    printf("  F      C\n");
    printf("----------\n");
    
    fahr = lower;
    while (fahr <= upper) {
        celsius = (5.0/9.0) * (fahr - 32.0);
        printf("%3.0f\t%6.2f\n", fahr, celsius);
        fahr = fahr + step;
    }
    
    return 0;
}
