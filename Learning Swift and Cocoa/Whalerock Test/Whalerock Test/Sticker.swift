//
//  Sticker.swift
//  Whalerock Test
//
//  Created by Wesley Van der Klomp on 10/14/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//

import Foundation

struct Sticker {
    
    init(jsonAsset: [String: Any]) {
        let urlString = jsonAsset["asset_url"] as! String
    
        self.url = URL(string: urlString)!
        
        self.title = jsonAsset["title"] as! String
    }
    
    let title: String
    let url: URL
}
