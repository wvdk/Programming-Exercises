import Cocoa

print("Hi")


class ActionTrampoline: NSObject {
    var action: (NSControl) -> Void
    
    init(action: @escaping (NSControl) -> Void) {
        self.action = action
    }
    
    @objc func action(sender: NSControl) {
        action(sender)
    }
}

