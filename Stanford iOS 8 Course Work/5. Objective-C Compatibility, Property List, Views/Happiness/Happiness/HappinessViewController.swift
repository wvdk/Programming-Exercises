//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Wesley Van der Klomp on 2/21/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController {

    // Model
    var happiness: Int = 50 { // 0 is very sad, 100 is super happy
        didSet {
            happiness = min(max(happiness, 0), 100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    
    func updateUI() {
        
    }

}
