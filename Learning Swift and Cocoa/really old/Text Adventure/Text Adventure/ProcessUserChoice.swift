//
//  ProcessUserChoice.swift
//  Text Adventure
//
//  Created by Wesley Van der Klomp on 12/8/14.
//  Copyright (c) 2014 wvdk. All rights reserved.
//

import UIKit

class ProcessUserChoice: NSObject {

    var scene: Int = 0
    var choice: Int = 0
    var buttonText: String = "asdasdasdasd"
    var displayText: String = "asadaljlajklkasjdvl"

    init(scene: Int, choice: Int) {
        println("init")
        println("scene: \(scene)")
        println("choice: \(choice)")
    }

    func buttonPressed(#scene: Int, choice: Int) {
        self.scene = scene + 1
        buttonText = "You pressed option \(choice)"
        displayText = "Good choice. You're all dead. Scene: \(scene), Choice: \(choice)"
    }
}