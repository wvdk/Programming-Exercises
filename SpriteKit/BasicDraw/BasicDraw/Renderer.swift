//
//  Renderer.swift
//  BasicDraw
//
//  Created by Wesley Van der Klomp on 8/12/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

import Foundation

/// This approach, of seperating the rendering stuff from the data structure stuff, will hopefully enable future renderers such as CoreGraphics or SVG. But more importantly it will also seperate the "how do we render this infinite recursion without crashing the computer" problem out of the data model stuff.
protocol Renderer {
    
    associatedtype Render
    
    func render(shape: Shape) -> Render
    
}
