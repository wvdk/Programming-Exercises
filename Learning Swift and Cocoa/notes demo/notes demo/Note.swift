//
//  Note.swift
//  notes demo
//
//  Created by Wesley Van der Klomp on 9/6/15.
//  Copyright (c) 2015 wvdk. All rights reserved.
//

import UIKit

struct Note {
    var content: String
    var title: String {
        get {
            let a = content.componentsSeparatedByString("\n")
            return a[0]
        }
    }
}
