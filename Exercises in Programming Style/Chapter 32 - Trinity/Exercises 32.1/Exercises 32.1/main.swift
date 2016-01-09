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
        
        // First lets get contents of file and strip out the single characters, numbers, slashes, and new lines.
        let contentOfFile = try? NSString(contentsOfFile: pathToFile, encoding: NSUTF8StringEncoding).lowercaseString
        let stripped = contentOfFile?.stringByReplacingOccurrencesOfString("[^a-zA-Z_0-9]+", withString: " ")

        // Lets filter the stop words out.
        let allWords: [String] = (stripped?.componentsSeparatedByString(" "))!
        let stopWordsArray: [String]? = self.stopWords?.componentsSeparatedByString(",")
        var filteredWords: [String] = []
        
        for w in allWords {
            if !stopWordsArray!.contains(w) {
                filteredWords.append(w)
            }
        }
        
        // Now lets count the occurrences of each word.
        for w in filteredWords {
            frequencies[w] = (frequencies[w] ?? 0) + 1
        }
        
        print(frequencies)
        
    }
    
}

class View {
    
}

class Controller {
    
}

let model = Model(pathToFile: Process.arguments[1])
//let view = View(model: model)
//let controller = Controller(model: model, view: view)
//controller.run()

print(readLine())