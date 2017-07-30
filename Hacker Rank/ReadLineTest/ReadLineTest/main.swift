//
//  main.swift
//  ReadLineTest
//
//  Created by Wesley Van der Klomp on 7/30/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation

print("Hello! Input something...")

//1
//2
//3
//4

var input = ""
while let inputLine = readLine() {
    input += inputLine
    print(input)

}

print(input)
