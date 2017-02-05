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
        planetLayer.position = CGPoint(x: 0, y: 0)
        planetLayer.backgroundColor = UIColor(red: 0.0, green: 180.0, blue: 100.0, alpha: 1.0).cgColor
        
        let heightOfContainingView = self.frame.size.height
        planetLayer.bounds = CGRect(x: 0, y: 0, width: heightOfContainingView, height: heightOfContainingView)
        
        planetLayer.cornerRadius = heightOfContainingView / 2
        planetLayer.anchorPoint = CGPoint(x: 0, y: 0)
    }

    override func draw(_ rect: CGRect) {
        setupPlanetLayer()
        self.layer.addSublayer(planetLayer)
    }

}
