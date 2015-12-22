//
//  ViewController.swift
//  Figuring out contacts framework
//
//  Created by Wesley Van der Klomp on 12/20/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import UIKit
import ContactsUI

class ViewController: UIViewController, CNContactPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        self.presentViewController(contactPicker, animated: true, completion: {})
    }
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
        
        if contact.emailAddresses.first != nil {
            print(contact.emailAddresses.first!.value)
        }
        
        picker.dismissViewControllerAnimated(false, completion: {})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

