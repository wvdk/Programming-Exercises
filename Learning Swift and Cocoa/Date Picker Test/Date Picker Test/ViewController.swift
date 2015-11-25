//
//  ViewController.swift
//  Date Picker Test
//
//  Created by Wesley Van der Klomp on 11/25/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.addTarget(self, action: "handleDateChange:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func handleDateChange(datePicker: UIDatePicker) {
        let formater = NSDateFormatter()
        formater.dateStyle = .MediumStyle
        formater.timeStyle = .ShortStyle
        
        let dateString = formater.stringFromDate(datePicker.date)
        label.text = dateString
    }

}

