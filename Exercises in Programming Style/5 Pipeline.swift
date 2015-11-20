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
func filterCharsAndNormalize(s: String) -> String {
    let re = try? NSRegularExpression(pattern: "\\W_]+", options: NSRegularExpressionOptions.CaseInsensitive)
    let s2 = re!.stringByReplacingMatchesInString(s, options: nil, range: NSMakeRange(0, s.count), withTemplate: " ")
    print("\(s2)")
    return ""
}

// Takes a string and scans for words, returning a list of words.
func scan(_: String) {
    
}

// Takes a list of words and returns a copy with all stop words removed
func removeStopWords(_: Array<String>) {
    
}

// Takes a list of words and returns a dictionary associating words with frequencies of occurrence
func frequencies(_: Array<String>) {
    
}

// Takes a dictionary of words and their frequencies and returns a list of pairs where the entries are sorted by frequency
func sort(_: String) {
    
}

// Takes a list of pairs where the entries are sorted by frequency and print them recursively.
func printAll(_: String) {
    
}

///////////////////////
// The main function //
///////////////////////

//printAll(sort(frequencies(removeStopWords(scan(filterCharsAndNormalize(readFile(Process.arguments[1])))))))
//print_all(sort(frequencies(remove_stop_words(scan(filter_chars_and_normalize(read_file(sys.argv[1]))))))[0:25])
