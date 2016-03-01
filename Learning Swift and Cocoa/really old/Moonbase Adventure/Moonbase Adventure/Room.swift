//
//  Room.swift
//  Moonbase Adventure
//
//  Created by Wes Van der Klomp on 6/28/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import Foundation

public class Room {
    let roomNumber: Int
    let description: String
    var items: [Item]
    
    public init (roomNumber: Int, description: String, items: [Item]) {
        self.roomNumber = roomNumber
        self.description = description
        self.items = items
    }
}