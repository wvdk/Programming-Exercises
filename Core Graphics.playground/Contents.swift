import UIKit
//import CoreGraphics
import PlaygroundSupport

///// CLASS WIP

public class MyCustomView: UIView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.addSublayer(backgroundLayer)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var relativeCenter: CGPoint {
        get {
            return CGPoint(x: bounds.width / 2, y: bounds.height /  2)
        }
    }
    
    lazy var backgroundLayer: CAShapeLayer = {
        
        let angle_360 = CGFloat(M_PI * 2)
        
        let path = UIBezierPath(arcCenter: self.relativeCenter, radius: 100, startAngle: 0, endAngle: 3.14, clockwise: true).cgPath
        
        
        
        
        let backgroundLayer = CAShapeLayer()
        
        backgroundLayer.path = path
        
        backgroundLayer.fillColor = UIColor.blue.cgColor
        return backgroundLayer
        
    }()
}




////////////////////////
////// PLAYGROUND

let frameForView = CGRect(x: 0, y: 0, width: 300, height: 300)

let myCustomView = MyCustomView(frame: frameForView)

myCustomView.backgroundColor = UIColor.red

PlaygroundPage.current.liveView = myCustomView

let angle_360 = CGFloat(M_PI * 2)

