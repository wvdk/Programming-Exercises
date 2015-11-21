//
//  pipeline.swift
//  
//
//  Created by Wesley Van der Klomp on 11/14/15.
//
//

import Foundation

//let path = Process.arguments[1]
//let fileContent = try? NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
//
//print("Path sent: \(path)")
//print("Contents of file: \(fileContent)")


///////////////////
// The functions //
///////////////////

// Take a path and return the entire contents of the file as a string.
func readFile(path: String) -> String {
    if let fileContent = try? String(contentsOfFile: path, encoding: NSUTF8StringEncoding) {
        return fileContent
    } else {
        return "there has been an error"
    }
}

// Take a string and return a copy with all nonalphanumeric chars replaced by white space
func filterCharsAndNormalize(s: NSString) -> String {
    let replaced = s.stringByReplacingOccurrencesOfString("[^a-zA-Z_0-9]+", withString: " ", options: NSStringCompareOptions.RegularExpressionSearch, range: NSMakeRange(0, s.length))
    return replaced.lowercaseString
}

// Takes a string and scans for words, returning an array of words.
func scan(s: String) -> Array<String> {
    let a = s.componentsSeparatedByString(" ")
    return a
}

// Takes an array of words and returns a copy with all stop words removed
func removeStopWords(allWords: Array<String>) -> Array<String> {
    if let stopWordsString = try? String(contentsOfFile: "./stop_words.txt", encoding: NSUTF8StringEncoding) {
        
        let stopWordsArray = stopWordsString.componentsSeparatedByString(",")
        
        var filteredWords: Array<String> = []
        
        for w in allWords {
            if !stopWordsArray.contains(w) {
                filteredWords.append(w)
            }
        }
        
        return filteredWords
        
    } else {
        return ["there has been an error"]
    }
    
}

// Takes an array of words and returns a dictionary associating words with frequencies of occurrence
func frequencies(arrayOfWords: [String]) -> [String: Int] {
    var wordFrequencies: [String: Int] = ["":0]
    
    for w in arrayOfWords {
        if wordFrequencies[w] > 0 {
            wordFrequencies[w]! += 1
        } else {
            wordFrequencies[w] = 1
        }
    }
    
    return wordFrequencies
}

// Takes a dictionary of words and their frequencies and returns a list of pairs where the entries are sorted by frequency
func sort(unsortedDictionary: [String: Int]) -> [(String, Int)] {
    var unsortedArray: [(String, Int)] = []
    
    for (key, value) in unsortedDictionary {
        unsortedArray.append(key, value)
    }
    
    return unsortedArray.sort{$0.1 > $1.1}
}

// Takes an array of tuple pairs and prints them.
func printAll(toPrint: [(String, Int)]) {
    
    let shortenedArray = toPrint[0..<25]
    
    for (word, frequency) in shortenedArray {
        print("\(word) - \(frequency)")
    }
}

///////////////////////
// The main function //
///////////////////////

// For experimentation
//print(readFile(Process.arguments[1]))
//print(filterCharsAndNormalize(readFile(Process.arguments[1])))
//print(scan(filterCharsAndNormalize(readFile(Process.arguments[1]))))
//print(removeStopWords(scan(filterCharsAndNormalize(readFile(Process.arguments[1])))))
//print(frequencies(removeStopWords(scan(filterCharsAndNormalize(readFile(Process.arguments[1]))))))
//print(sort(frequencies(removeStopWords(scan(filterCharsAndNormalize(readFile(Process.arguments[1])))))))
printAll(sort(frequencies(removeStopWords(scan(filterCharsAndNormalize(readFile(Process.arguments[1])))))))



//printAll(sort(frequencies(removeStopWords(scan(filterCharsAndNormalize(readFile(Process.arguments[1])))))))
//print_all(sort(frequencies(remove_stop_words(scan(filter_chars_and_normalize(read_file(sys.argv[1]))))))[0:25])
