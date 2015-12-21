//
//  ViewController.swift
//  Figuring out contacts framework
//
//  Created by Wesley Van der Klomp on 12/20/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let store = CNContactStore()
        store.requestAccessForEntityType(.Contacts, completionHandler: {success, error in
            print("Success: \(success)")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

