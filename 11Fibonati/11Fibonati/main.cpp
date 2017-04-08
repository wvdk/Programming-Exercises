//Rekursines funkcijos
//  main.cpp
//  11Fibonati
//
//  Created by Kristina Gelzinyte on 4/5/17.
//  Copyright © 2017 Kristina Gelzinyte. All rights reserved.
//

#include <iostream>
#include <vector>
using namespace std;

int main () {
    int stopAtNumber = 0;
    int lastNumber = 0;
    int lastLastNumber = 0;
    int nextNumber = 1;

    cout << "How many Fibonacci numbers do you want?\n";
    cin >> stopAtNumber;
    cout << "Your sequence:\n";

    
    vector<int> results(stopAtNumber, 0);
    
    for (int n = 0; n < stopAtNumber; n++) {
        nextNumber = lastNumber + lastLastNumber;
                
        // Save this number to my results.
        results[n] = nextNumber;
        
        if (lastLastNumber == 0) {
            lastLastNumber = 1;
        } else {
            lastLastNumber = lastNumber;
            lastNumber = nextNumber;
        }
    }
    
    for (int i = 0; i < stopAtNumber; i++) {
        cout << results[i] << "\n";
    }
    
    return 0;
}


