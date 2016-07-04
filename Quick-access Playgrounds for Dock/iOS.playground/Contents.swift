//: This is a general purpose iOS playground for testing / messing around in Swift

import UIKit
import XCPlayground

let myView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
myView.backgroundColor = UIColor.redColor()




class CustomView: UIView {
    override func drawRect(rect: CGRect) {
        StyleKitName.drawMyFirstCanvas(hVal: 10.0)
    }
}

let myView2 = CustomView(frame: CGRect(x: 0, y: 0, width: 75, height: 75))

myView2.backgroundColor = UIColor.blueColor()









