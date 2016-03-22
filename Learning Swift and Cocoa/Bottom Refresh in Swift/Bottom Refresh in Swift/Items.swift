//
//  Items.swift
//  Bottom Refresh in Swift
//
//  Created by Wesley Van der Klomp on 3/22/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//

import Foundation

struct Items {
    
    var allItems: [String] = []
    
    private var fetchInProgress = false
    
    init() { generateSomeItems() }
    
    mutating func fetchMoreData(completionHandler: ()->()) {
        if fetchInProgress {
            return
        } else {
            self.fetchInProgress = true
            
            // This simulates a background fetch by delaying for a second
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10), dispatch_get_main_queue(), {
                self.generateSomeItems()
                
                self.fetchInProgress = false

                completionHandler()                
            })
        }
    }
    
    mutating private func generateSomeItems() {
        let formatter = NSNumberFormatter()
        
        formatter.numberStyle = .SpellOutStyle
        
        for _ in 0...20 {
            allItems.append(formatter.stringFromNumber(allItems.count + 1)!)
            print(formatter.stringFromNumber(allItems.count + 1))
        }
    }
}