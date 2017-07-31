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

let v = readLine()!
let n = readLine()!
let ar = readLine()!
v
let vAsInt = Int(v)!
let arAsArray = ar.characters.split(separator: " ").map { Int(String($0))! }

let indexOfV = arAsArray.index(of: vAsInt)?.description

print(indexOfV)

//print(arAsArray.index(of: Int(v)!))

