//
//  BoardPosition.swift
//  tic-tac-toe
//
//  Created by Wesley Van der Klomp on 1/17/15.
//  Copyright (c) 2015 wvdk. All rights reserved.
//

import Foundation

class BoardPosition: NSObject {
    var x: Int
    var y: Int
    init (x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}