//
//  GlobalFunctions.swift
//  RandBW
//
//  Created by Wesley Van der Klomp on 12/29/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation

/// Produces a random Bool.
func flipACoin() -> Bool {
    return arc4random_uniform(2) > 0
}
