import Foundation

enum TaskPriority {
    case level1
    case level2
    case level3
}

struct Task {
    
    var isDone: Bool
    var title: String
    var priority: TaskPriority
    var created: Date
    
    init(title: String) {
        self.isDone = false
        self.title = title
        self.priority = .level2
        self.created = Date()
    }
    
    init(title: String, priority: TaskPriority) {
        self.init(title: title)
        
        self.priority = priority
    }
    
}

var myTask = Task(title: "Wash dishes")

myTask.priority = .level1
myTask.isDone = true


