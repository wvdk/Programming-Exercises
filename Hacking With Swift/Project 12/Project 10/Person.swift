//
//  Person.swift
//  Project 10
//
//  Created by Wesley Van der Klomp on 9/29/15.
//  Copyright © 2015 wvdk. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {

    var name: String
    var image: String
    
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String
        image = aDecoder.decodeObjectForKey("image") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(image, forKey: "image")
    }
}
