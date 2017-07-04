//
//  ButtonSelectionDelegate.swift
//  LittleShapesGame
//
//  Created by Wesley Van der Klomp on 7/4/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Cocoa
import SpriteKit

protocol ButtonSelectionDelegate {
    func attemptingSelection(of button: ColorSelectionButton)
}
