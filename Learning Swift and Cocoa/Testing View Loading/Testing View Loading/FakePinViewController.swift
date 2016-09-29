//
//  FakePinViewController.swift
//  Testing View Loading
//
//  Created by Wesley Van der Klomp on 9/28/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//

import UIKit

protocol FakePinViewControllerDelegate {
    func closePinVC()
}

class FakePinViewController: UIViewController {
    
    var delegate: FakePinViewControllerDelegate?
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        if delegate != nil {
            delegate?.closePinVC()
        }
    }

}
