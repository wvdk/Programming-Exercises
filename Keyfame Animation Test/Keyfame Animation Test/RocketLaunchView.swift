//
//  RocketLaunchView.swift
//  Keyfame Animation Test
//
//  Created by Wesley Van der Klomp on 2/5/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import UIKit

class RocketLaunchView: UIView {
    
    let planetLayer = CALayer()
    
    private func setupPlanetLayer() {
        let heightOfContainingView = self.frame.size.height

        planetLayer.position = CGPoint(x: -heightOfContainingView / 1.5, y: 0)
        planetLayer.backgroundColor = UIColor(red: 0.2, green: 0.9, blue: 0.5, alpha: 0.8).cgColor
        
        planetLayer.bounds = CGRect(x: 0, y: 0, width: heightOfContainingView, height: heightOfContainingView)
        
        planetLayer.cornerRadius = heightOfContainingView / 2
        planetLayer.anchorPoint = CGPoint(x: 0, y: 0)
    }
    
    override func draw(_ rect: CGRect) {
        setupPlanetLayer()
        self.layer.addSublayer(planetLayer)
        
        self.clipsToBounds = true
    }

}
