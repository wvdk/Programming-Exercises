#!/usr/bin/env swift

import Foundation


///////////////////////
// CLASSES
///////////////////////

class DataStorageManager {
    var data: String?
    var fm = NSFileManager.defaultManager()
    
    init(pathToFile: String) {
        let fileData = fm.contentsAtPath(pathToFile)
	if let contentsOfFile = NSString(data: fileData!, encoding: NSUTF8StringEncoding) as String? {
	   print(contentsOfFile)
	}
    }
    
    func words() -> [String] {
        var arrayOfWords: [String]
        
        arrayOfWords = ["Test", "Stuff", "foo", "bar"]
        
        return arrayOfWords
    }
}

class StopWordManager {
    
}

class WordFrequencyManager {
    
}

class WordFrequencyController {
    
}


/////////////////////////
// MAIN FUNCTION
/////////////////////////

//WordFrequencyController(Process.arguments[1]).run()


////////////////////////
// TESTS
////////////////////////

let t = DataStorageManager(pathToFile: Process.arguments[1])