//
//  main.swift
//  Index of Value
//
//  Created by Wesley Van der Klomp on 7/31/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//
//  https://www.hackerrank.com/challenges/tutorial-intro
//

import Foundation

let v = readLine()!
let n = readLine()!
let ar = readLine()!

let arAsArray = ar.characters.split(separator: " ").map { Int(String($0))! }

print(ar)
print(arAsArray)
print(arAsArray.index(of: Int(v)!))
