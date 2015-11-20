//
//  Note.swift
//  Dumb Notes
//
//  Created by Wesley Van der Klomp on 1/3/15.
//  Copyright (c) 2015 wvdk. All rights reserved.
//

import UIKit

var allNotes: [Note] = [] // A place to keep all my Note objects

class Note: NSObject {
    var content: String
    var date: String
    
    override init() {
        content = ""
        date = NSDate().description
    }
    
    func dictionaryOfContentAndDate() -> [String: String] {
        return ["content": content, "date": date]
    }
    
    class func saveNotes() {
        var allNotesAsDictionaries: [[String: String]] = [[:]]
        for var i = 0; i < allNotes.count; i++ {
            allNotesAsDictionaries.append(allNotes[i].dictionaryOfContentAndDate())
        }
        NSUserDefaults.standardUserDefaults().setObject(allNotesAsDictionaries, forKey: "content")
    }
    
    class func loadNotes() {
        
    }
    
}
