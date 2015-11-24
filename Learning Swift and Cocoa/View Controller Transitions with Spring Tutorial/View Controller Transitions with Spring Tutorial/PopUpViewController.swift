//
//  PopUpViewController.swift
//  View Controller Transitions with Spring Tutorial
//
//  Created by Wesley Van der Klomp on 11/23/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var backButton: SpringButton!
    @IBOutlet weak var popUpView: SpringView!
    
    
    @IBAction func backPressed(sender: AnyObject) {

        UIView.animateWithDuration(0.25, animations: {
        
            self.popUpView.transform = CGAffineTransformMakeTranslation(0, 300)
            self.backButton.alpha = 0
        
            }) { (completed: Bool) -> Void in
                self.dismissViewControllerAnimated(false, completion: nil)
            
            }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.transform = CGAffineTransformMakeTranslation(0, 300)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        backButton.animate()
        popUpView.animate()
    }
}
