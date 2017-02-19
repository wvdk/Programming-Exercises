//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

var str = "Hello, playground"

class MyViewController: UIViewController, UITextFieldDelegate {
    
    var textField: UITextField!
    
    override func viewDidLoad() {
        
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        textField = UITextField()
        textField.borderStyle = .line
        textField.delegate = self
        
        view.addSubview(textField)
        
        self.view = view
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if range.location >= 1 {
            return false
        }
        
        
        return true
    }
}

PlaygroundPage.current.liveView = MyViewController()
