//
//  Birthday Cake Candles.swift
//  
//
//  Created by Wesley Van der Klomp on 7/12/17.
//

import Foundation

// number of elements
var n = Int(readLine()!)!

// read array and map the elements to integer
var arr = readLine()!.characters.split(separator: " ", maxSplits: 100000, omittingEmptySubsequences: false).map{Int(String($0))!}

////////////////////////

func numberOfTallestCandles(_ candles: [Int]) -> Int {
    var heighestFound = 0
    var numberOfHeighestsFound = 0
    
    for candleHeight in candles {
        if candleHeight > heighestFound {
            heighestFound = candleHeight
            numberOfHeighestsFound = 1
        } else if candleHeight == heighestFound {
            numberOfHeighestsFound += 1
        }
    }
    
    return numberOfHeighestsFound
}

print(numberOfTallestCandles(arr))
