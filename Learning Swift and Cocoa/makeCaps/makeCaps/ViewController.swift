//
//  ViewController.swift
//  makeCaps
//
//  Created by Wesley Van der Klomp on 1/9/15.
//  Copyright (c) 2015 wvdk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputTextField: UITextField!
    
    func makeAllUpper(text: String) -> String {
        var upperText = ""
        
        for c in text {
            var lttr = "\(c)"
            upperText = upperText + lttr.uppercaseString
        }
        
        return upperText
    }
    
    func makeAllLower(text: String) -> String {
        var foo = ""
        
        for c in text {
            var ch = "\(c)"
            foo = foo + ch.lowercaseString
        }
        
        return foo
    }

    func makeVowelsUpper(text: String) -> String {
        var returnText = ""
        
        for c in text {
            var str = "\(c)"
            switch str.lowercaseString {
            case "a", "e", "i", "o", "u":
                str = str.uppercaseString
            case "q", "w", "r", "t", "y", "p", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m":
                str = str.lowercaseString
            default:
                break
            }
            returnText = returnText + str
        }
        
        return returnText
    }
    
    func makeConsonantsUpper(t: String) -> String {
        var r = ""
        
        for c in t {
            var s = "\(c)"
            switch s.lowercaseString {
            case "a", "e", "i", "o", "u":
                s = s.lowercaseString
            case "q", "w", "r", "t", "y", "p", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m":
                s = s.uppercaseString
            default:
                break
            }
            r = r + s
        }
        
        return r
    }
    
    func reverseText(text: String) -> String {
        var reversed = ""
        
        for c in text {
            reversed = "\(c)" + reversed
        }
        
        return reversed
    }
    
    
    
    // BUTTONS

    @IBAction func allUpper(sender: UIButton) {
        inputTextField.text = makeAllUpper(inputTextField.text)
    }
    
    @IBAction func allLower(sender: UIButton) {
        inputTextField.text = makeAllLower(inputTextField.text)
    }
    
    @IBAction func makeVowelsCapsButton(sender: UIButton) {
        inputTextField.text = makeVowelsUpper(inputTextField.text)
    }
    
    @IBAction func makeConsonantsUpperButton(sender: UIButton) {
        inputTextField.text = makeConsonantsUpper(inputTextField.text)

    }

    @IBAction func reverseButton(sender: UIButton) {
        inputTextField.text = reverseText(inputTextField.text)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.becomeFirstResponder()
        
        self.inputTextField.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

