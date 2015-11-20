//
//  GLOBALS.swift
//  notes demo
//
//  Created by Wesley Van der Klomp on 9/6/15.
//  Copyright (c) 2015 wvdk. All rights reserved.
//

import Foundation


// Global array of all notes
var NOTES = [Note]()

// Lets create a few starting notes
func initSomeStuff() {
    let myNote = Note(content: "This is the body of the first note. asdasd")
    NOTES.append(myNote)

    let myNote2 = Note(content: "Hmmmm.......")
    NOTES.append(myNote2)

    let myNote3 = Note(content: "Ah yes, good to know")
    NOTES.append(myNote3)
}

// ^^^ Called in AppDelegate.application()

