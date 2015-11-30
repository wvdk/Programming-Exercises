//
//  Album.swift
//  BlueLibrarySwift
//
//  Created by Wesley Van der Klomp on 11/29/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

class Album: NSObject {
    var title: String!
    var artist: String!
    var genre: String!
    var coverUrl: String!
    var year: String!
    
    init(title: String, artist: String, genre: String, coverUrl: String, year: String) {
        super.init()
        self.title = title
        self.artist = artist
        self.genre = genre
        self.coverUrl = coverUrl
        self.year = year
    }
    
    override var description: String {
        return "title: \(title)\n" +
               "artist: \(artist)\n" +
               "genre: \(genre)\n" +
               "coverUrl: \(coverUrl)\n" +
               "year: \(year)\n"
    }

}
