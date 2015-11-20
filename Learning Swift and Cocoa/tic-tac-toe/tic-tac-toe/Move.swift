//
//  Moves.swift
//  tic-tac-toe
//
//  Created by Wesley Van der Klomp on 1/17/15.
//  Copyright (c) 2015 wvdk. All rights reserved.
//

import UIKit

class Move: NSObject {
    var player: String!
    var position: BoardPosition
    init (thePlayer: String, thePosition: BoardPosition) {
        self.player = thePlayer
        self.position = thePosition
    }
}
