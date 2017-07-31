//
//  main.swift
//  Big Sort
//
//  Created by Wesley Van der Klomp on 7/31/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//
// https://www.hackerrank.com/challenges/big-sorting
//

/*
 Sample Input 0
 
 6
 31415926535897932384626433832795
 1
 3
 10
 3
 5
 
 Sample Output 0
 
 1
 3
 3
 5
 10
 31415926535897932384626433832795
 */

import Foundation

typealias pair = (String, Double)

let n = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!

var unsorted: [pair] = []

for _ in 1...n {
    let i = readLine(strippingNewline: true)!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    let newPair = (i, Double(i)!)
    
    unsorted.append(newPair)
}

let sorted = unsorted.sorted { (a, b) -> Bool in
    if a.1 < b.1 {
        return true
    } else {
        return false
    }
}

for pair in sorted {
    print(pair.0)
}









