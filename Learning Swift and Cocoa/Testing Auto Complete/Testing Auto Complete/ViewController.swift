//
//  ViewController.swift
//  Testing Auto Complete
//
//  Created by Wes Van der Klomp on 7/4/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: AutoCompleteTextField!
    let masterList = ["test", "food", "stuff", "word", "test 2", "test 3", "Goodbye", "Go", "Hello"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.maximumAutoCompleteCount = 20
        textField.autoCompleteTableHeight = 300
        
        textField.onTextChange = {[weak self] text in
            self?.fetchAutocompletePlaces(text)
        }
    }
    
    private func fetchAutocompletePlaces(keyword:String) {
        textField.autoCompleteStrings = masterList.filter() {item -> Bool in
            let stringMatch = item.lowercaseString.rangeOfString(keyword.lowercaseString)
            return stringMatch != nil ? true : false
        }

    }
}

