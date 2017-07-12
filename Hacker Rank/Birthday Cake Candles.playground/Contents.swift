/*
 https://www.hackerrank.com/challenges/birthday-cake-candles
 
 Colleen is turning  years old! Therefore, she has  candles of various heights on her cake, and candle  has height . Because the taller candles tower over the shorter ones, Colleen can only blow out the tallest candles.
 
 Given the  for each individual candle, find and print the number of candles she can successfully blow out.
 */

import Cocoa

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

numberOfTallestCandles([3, 2, 1, 3])
numberOfTallestCandles([3, 52, 1, 3])
numberOfTallestCandles([42, 42, 42])
numberOfTallestCandles([0, 0])
