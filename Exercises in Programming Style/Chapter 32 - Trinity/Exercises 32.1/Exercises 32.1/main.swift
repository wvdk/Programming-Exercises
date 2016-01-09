//
//  main.swift
//  Exercises 32.1
//
//  Created by Wesley Van der Klomp on 11/23/15.
//  Copyright © 2015 Wes Van der Klomp. All rights reserved.
//

import Foundation

// Models the data. In this case, we're only interested in words and their frequencies as an end result.
class Model {
    var frequencies: [String: Int] = [:]
    let stopWords = try? String(contentsOfFile: "/Users/wvdk/Desktop/Programming-Exercises/Exercises in Programming Style/stop_words.txt")
    
    init(pathToFile: String) {
        update(pathToFile)
    }
    
    func update(pathToFile: String) {
        let contentOfFile = try? NSString(contentsOfFile: pathToFile, encoding: NSUTF8StringEncoding).lowercaseString
        let stripped = contentOfFile?.stringByReplacingOccurrencesOfString("[^a-zA-Z_0-9]+", withString: " ")
        let words: [String] = (stripped?.componentsSeparatedByString(" "))!
        
        
        let stopWordsArray: [String] = (self.stopWords?.componentsSeparatedByString(" "))!
        var filteredWords: [String] = []
        
        for w in words {
            if !stopWordsArray.contains(w) {
                filteredWords.append(w)
            } else {
                print("Removed word: \(w)")
            }
        }
        
        
        print(stopWordsArray)
    }
    
}

class View {
    
}

class Controller {
    
}

//let model = Model(pathToFile: Process.arguments[1])
//let view = View(model: model)
//let controller = Controller(model: model, view: view)
//controller.run()

print(readLine())