//
//  ColorSelectionInterface.swift
//  LittleShapesGame
//
//  Created by Wesley Van der Klomp on 7/4/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Cocoa
import SpriteKit

class ColorSelectionInterface: SKNode {
    
    private var buttons: [ColorSelectionButton] = []
    private var currentlySelectedButton: ColorSelectionButton!
    
    override init() {
        super.init()
        
        let blueButton = ColorSelectionButton()
        blueButton.fillColor = SKColor.blue
        blueButton.position = CGPoint(x: 0, y: 45)
        buttons.append(blueButton)
        
        let redButton = ColorSelectionButton()
        redButton.fillColor = SKColor.red
        redButton.position = CGPoint(x: 0, y: 0)
        buttons.append(redButton)
        
        let yellowButton = ColorSelectionButton()
        yellowButton.fillColor = SKColor.yellow
        yellowButton.position = CGPoint(x: 0, y: -45)
        buttons.append(yellowButton)
        
        for button in buttons {
            button.delegate = self
            
            addChild(button)
        }
        
        currentlySelectedButton = blueButton
        
        isUserInteractionEnabled = true
        
        zPosition = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ColorSelectionInterface: ButtonSelectionDelegate {
    func attemptingSelection(of button: ColorSelectionButton) {
        button.selected = true
        currentlySelectedButton = button
    }
}
