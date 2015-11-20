//
//  Locations.swift
//  Textventure 3
//
//  Created by Wes Van der Klomp on 6/17/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import Foundation

struct Locations {
    
//    var kitchen: Location
//    var tvRoom: Location
//    var livingRoom: Location
//    var bedRoom1: Location
//    var bedRoom2: Location

    init () {
        var livingRoom = Location(name: "Living Room", description: "This is a room for living.", outs: [:])
        var kitchen = Location(name: "Kitchen", description: "A clean, well lit place.", outs: [.East: livingRoom])
        var tvRoom = Location(name: "TV Room", description: "A room with a TV in it.", outs: [.South: livingRoom])
        var bedRoom1 = Location(name: "First Bed Room", description: "A boy's bedroom.", outs: [.West: livingRoom])
        var bedRoom2 = Location(name: "Second Bed Room", description: "A girl's bed room.", outs: [.North: livingRoom])
        
//        livingRoom.outs = [.West: kitchen, .North: tvRoom, .East: bedRoom1, .South: bedRoom2]
//        livingRoom.outs[.West] = kitchen
        print(livingRoom.outs.description)
    }
}