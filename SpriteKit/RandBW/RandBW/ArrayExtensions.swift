//
//  ArrayExtensions.swift
//  RandBW
//
//  Created by Wesley Van der Klomp on 12/29/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation

extension Array {
    
    func randomItem() -> Element {
        let randomIndex = Int(arc4random_uniform(UInt32(self.count)))
        return self[randomIndex]
    }
    
}
