//
//  Person.swift
//  Project 10
//
//  Created by Wesley Van der Klomp on 9/29/15.
//  Copyright © 2015 wvdk. All rights reserved.
//

import UIKit

class Person: NSObject {

    var name: String
    var image: String
    
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
