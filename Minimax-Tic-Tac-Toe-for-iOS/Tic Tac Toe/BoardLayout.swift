//
//  BoardLayout.swift
//  Tic Tac Toe
//
//  Created by Wes Van der Klomp on 5/5/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

import Foundation

extension BoardLayout: Equatable {}

func ==(lhs: BoardLayout, rhs: BoardLayout) -> Bool {
    if lhs.tiles == rhs.tiles {
        return true
    } else {
        return false
    }
}

struct BoardLayout {
    var tiles: [Tile] // Should only be 9 of them, but not currently enforcing that in any way...
    
    init () {
        var newtiles: [Tile] = []
        
        for _ in 0...8 {
            let tile = Tile.Blank
            
            newtiles.append(tile)
        }
        
        tiles = newtiles
    }
}