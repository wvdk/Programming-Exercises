import Foundation

///////////////////////
// CLASSES
///////////////////////

class TFExercise {
    var type = ""
    
    init() {
        type = String(self.dynamicType)
    }
    
    func info() -> String {
        return type
    }
}

// Models the content of file.
class DataStorageManager: TFExercise {
    var data: String?
    
    init(pathToFile: String) {
       super.init()
       
        if let stringOfFile = try? NSString(contentsOfFile: pathToFile, encoding: NSUTF8StringEncoding) {
            let replaced = stringOfFile.stringByReplacingOccurrencesOfString("[^a-zA-Z_0-9]+", withString: " ", options: NSStringCompareOptions.RegularExpressionSearch, range: NSMakeRange(0, stringOfFile.length))
            data = replaced.lowercaseString
        } else {
            data = nil
        }
        
    }
    
    func words() -> [String] {
        if let d = data {
             return d.componentsSeparatedByString(" ")
        } else {
            return ["ERROR"]
        }
    }
    
    override func info() -> String {
        return "\(super.info()): My major data structure is a \(String(self.data.dynamicType))"
    }
    
}

// Models the stop word filter.
class StopWordManager: TFExercise {
    var stopWords: [String]?
    
    override init() {
        super.init()
        
        if let stopWordsString = try? String(contentsOfFile: "./stop_words.txt", encoding: NSUTF8StringEncoding) {
            self.stopWords = stopWordsString.componentsSeparatedByString(",")
            
            // Add single letter words. (97...122 should give all lowercase ascii characters)
            for i in 97...122 {
                let charStr = String(UnicodeScalar(i))
                self.stopWords!.append(charStr)
            }
        } else {
            self.stopWords = nil
        }
    }
    
    func isStopWord(word: String) -> Bool {
        return self.stopWords!.contains(word)
    }
    
    override func info() -> String {
        return "\(super.info()): My major data structure is an \(String(self.stopWords.dynamicType))"
    }
}

// Keeps word frequency data.
class WordFrequencyManager: TFExercise {
    var wordFrequencies: [String:Int]?
    
    override init() {
        super.init()
        
        self.wordFrequencies = ["": 0]
    }
    
    func incrementCount(word: String) {
        if wordFrequencies![word] > 0 {
            wordFrequencies![word]! += 1
        } else {
            wordFrequencies![word] = 1
        }
    }
    
    func sorted() -> [(String, Int)] {
        var unsortedArray: [(String, Int)] = []
        
        for (key, value) in wordFrequencies! {
            unsortedArray.append(key, value)
        }
        
        return unsortedArray.sort{$0.1 > $1.1}
    }
    
    override func info() -> String {
        return "\(super.info()): My major data structure is an \(String(self.wordFrequencies.dynamicType))"
    }
}

class WordFrequencyController: TFExercise {
    var storageManager: DataStorageManager
    var stopWordManager: StopWordManager
    var wordFrequencyManager: WordFrequencyManager
    
    init(pathToFile: String) {
        self.storageManager = DataStorageManager(pathToFile: pathToFile)
        self.stopWordManager = StopWordManager()
        self.wordFrequencyManager = WordFrequencyManager()
    }
    
    func run() {
        for w in self.storageManager.words() {
            if !self.stopWordManager.isStopWord(w) {
                self.wordFrequencyManager.incrementCount(w)
            }
        }
        
        let wordFreqs = self.wordFrequencyManager.sorted()
        let wordFreqsShortened = wordFreqs[0..<25]
        for (w, c) in wordFreqsShortened {
            print("\(w) - \(c)")
        }
    }
    
}


/////////////////////////
// MAIN FUNCTION
/////////////////////////

WordFrequencyController(pathToFile: Process.arguments[1]).run()