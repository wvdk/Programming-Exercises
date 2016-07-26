import Foundation

public class StepsEntry {
    public let numberOfSteps: Int
    let time: NSDate
    
    public init() {
        self.numberOfSteps = 0
        self.time = NSDate()
    }
}

//func createLotsOfRandomStepsEntries() -> [StepsEntry] {
//    let numberOfEntries = 1000
//    
//    var entries: Array<StepsEntry> = []
//    
//    for i in 0..<numberOfEntries {
//        let entry = StepsEntry(numberOfSteps: i, time: NSDate())
//        
//        entries.append(entry)
//    }
//    
//    return entries
//}