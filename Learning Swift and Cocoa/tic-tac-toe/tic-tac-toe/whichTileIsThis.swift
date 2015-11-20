//
//  whichTileIsThis.swift
//  tic-tac-toe
//
//  Created by Wesley Van der Klomp on 1/17/15.
//  Copyright (c) 2015 wvdk. All rights reserved.
//

import UIKit

func whichTileIsThis(#buttonTag: Int) -> BoardPosition {
    var tile = BoardPosition(x: 0, y: 0)
    
    // x1, y1 | x2, y1 | x3, y1
    // ------------------------
    // x1, y2 | x2, y2 | x3, y2
    // ------------------------
    // x1, y3 | x2, y3 | x3, y3
    
    switch buttonTag {
    case 1:
        tile.x = 1
        tile.y = 1
    case 2:
        tile.x = 2
        tile.y = 1
    case 3:
        tile.x = 3
        tile.y = 1
    case 4:
        tile.x = 1
        tile.y = 2
    case 5:
        tile.x = 2
        tile.y = 2
    case 6:
        tile.x = 3
        tile.y = 2
    case 7:
        tile.x = 1
        tile.y = 3
    case 8:
        tile.x = 2
        tile.y = 3
    case 9:
        tile.x = 3
        tile.y = 3
    default:
        println("asdasdfasdfasdf")
    }

    return tile
}