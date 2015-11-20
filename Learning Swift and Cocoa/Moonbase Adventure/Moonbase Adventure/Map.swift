//
//  Map.swift
//  Moonbase Adventure
//
//  Created by Wes Van der Klomp on 6/28/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import Foundation

// Maps are like levels.

public class Map {
    public let layout: [[Int]]
    
    public init (layout: [[Int]]) {
        self.layout = layout
    }
    
    public func getLocationOfRoom(roomNumber: Int) -> Point? {
        var x = -1
        var y = -1
        
        for r in 0..<self.layout.count {
            for c in 0..<self.layout[r].count {
                if roomNumber == self.layout[r][c] {
                    x = c
                    y = r
                }
            }
        }
        
        if x == -1 && y == -1 {
            return nil
        } else {
            return Point(x: x, y: y)
        }
    }
}