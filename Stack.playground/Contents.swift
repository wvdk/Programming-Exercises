//: Playground - noun: a place where people can play

import UIKit

func progression(from: Double, to: Double, numberOfItems: Int) -> [Double] {
    
    let delta = (to - from) / Double(numberOfItems)
    
    var results: [Double] = []
    
    for _ in 0..<numberOfItems {
        let lastItem = results.last ?? from
        
        let numberToAppend = lastItem + delta
        
        results.append(numberToAppend)
    }
    
    return results
}

class Stack: UIView {
    
    var numberOfItems = 10 {
        didSet {
            createSubviews()
        }
    }
    
    var heightOfContainer = 10
    var widthOfContainer = 0
    var heightOfItem = 0
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        heightOfContainer = Int(frame.height)
        widthOfContainer = Int(frame.width)
        heightOfItem = heightOfContainer / numberOfItems
        
        createSubviews()
    }

    
    func createSubviews() {

        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: widthOfContainer, height: heightOfContainer))
        containerView.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        
        for i in 0..<numberOfItems {
            let newView = UIView(frame: CGRect(x: 0, y: heightOfItem * i, width: widthOfContainer, height: heightOfItem))
            
            let alphaProgression = progression(from: 0.0, to: 1.0, numberOfItems: numberOfItems)
            
            newView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).withAlphaComponent(CGFloat(alphaProgression[i]))
            
            containerView.addSubview(newView)
            
        }
        
        
        self.addSubview(containerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

let stack = Stack(frame: CGRect(x: 0, y: 0, width: 400, height: 200))

stack.numberOfItems = 5
stack.numberOfItems = 50

