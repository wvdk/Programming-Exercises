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

let n = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!

var unsorted: [String] = []

for _ in 1...n {
    let i = readLine(strippingNewline: true)!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    unsorted.append(i)
}

let sorted = unsorted.sorted { (a, b) -> Bool in
    
    if a.characters.count > b.characters.count {
        return false
    } else if a.characters.count < b.characters.count {
        return true
    } else { // they have same number of characters
        
        let numberOfChars = a.characters.count
        
        for i in 0..<numberOfChars {
            let aIndex = a.index(a.startIndex, offsetBy: i)
            let aChar = a[aIndex]
            let aInt = Int(String(aChar))!
            
            let bIndex = b.index(b.startIndex, offsetBy: i)
            let bChar = b[bIndex]
            let bInt = Int(String(bChar))!

            if aInt > bInt {
                return false
            } else if aInt < bInt {
                return true
            }
        }
        
        
        return false // only happens if numbers are exactly the same
    }
    
}

for a in sorted {
    print(a)
}









