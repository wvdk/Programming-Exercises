//
//  main.swift
//  Index of Value
//
//  Created by Wesley Van der Klomp on 7/31/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//
//  https://www.hackerrank.com/challenges/tutorial-intro
//

/*
 
 Sample Input:
 
 4
 6
 1 4 5 7 9 12
 
 Sample Output:
 
 1
 
 */


import Foundation

let v = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!
let n = Int(readLine()!.trimmingCharacters(in: .whitespacesAndNewlines))!
let arString = readLine()!
let ar = arString.characters.split(separator: " ").map { Int(String($0))! }

print(ar.index(of: v)!)


