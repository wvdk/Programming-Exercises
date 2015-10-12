//
//  ViewController.swift
//  Testing NSUserDefaults
//
//  Created by Wesley Van der Klomp on 10/11/15.
//  Copyright © 2015 wvdk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(100, forKey: "Health")
        defaults.setBool(false, forKey: "IsReady")
        defaults.setDouble(M_1_PI, forKey: "Pi")
        
        defaults.setObject("This is some text", forKey: "Description")
//        defaults.setObject(NSDate(), forKey: "Description")

        defaults.setObject(NSDate(), forKey: "DateCreated")
        
        defaults.setObject(["Thing 1", "Thing 2"], forKey: "Things")
        defaults.setObject(["age": 38, "weight": 150], forKey: "PersonInfo")
        
        print(defaults.objectForKey("Description") as? String ?? "Nope...")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

