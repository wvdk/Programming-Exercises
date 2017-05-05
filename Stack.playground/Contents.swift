//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let numberOfItems = 10
let heightOfContainer = 600
let widthOfContainer = 400
let heightOfItem = heightOfContainer / numberOfItems

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: widthOfContainer, height: heightOfContainer))
containerView.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)

var items: [UIView] = []

for i in 0...numberOfItems {
    let newView = UIView(frame: CGRect(x: 0, y: heightOfItem * i, width: widthOfContainer, height: heightOfItem))
    
    newView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).withAlphaComponent(CGFloat(Double(i) * 0.1))
    
    containerView.addSubview(newView)
    
}