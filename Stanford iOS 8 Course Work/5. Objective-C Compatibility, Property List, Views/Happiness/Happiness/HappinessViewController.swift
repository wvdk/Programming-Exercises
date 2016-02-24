//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Wesley Van der Klomp on 2/21/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, FaceViewDataSource {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
        }
    }
    
    // Model
    var happiness: Int = 60 { // 0 is very sad, 100 is super happy
        didSet {
            happiness = min(max(happiness, 0), 100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    
    func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }

}
