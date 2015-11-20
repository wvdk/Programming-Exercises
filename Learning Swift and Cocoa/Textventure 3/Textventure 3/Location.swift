//
//  Location.swift
//  Textventure 3
//
//  Created by Wes Van der Klomp on 6/16/15.
//  Copyright (c) 2015 Wes Van der Klomp. All rights reserved.
//

import Foundation

class Location {
    let name: String
    let description: String
    let outs: [Direction: Location]
    
    init (name: String, description: String, outs: [Direction: Location]) {
        self.name = name
        self.description = description
        self.outs = outs
    }
}