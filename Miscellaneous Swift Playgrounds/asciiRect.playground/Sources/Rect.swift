import Foundation

public class Rect {
    public var position: Point
    public var size: Size
    public var fillChar: String
    
    public init (position: Point, size: Size, fillChar: String) {
        self.position = position
        self.size = size
        self.fillChar = fillChar
    }
    
    public func draw() -> String {
        var str = ""
        
        for _ in 1...size.height {
            for _ in 1...size.width {
                str += fillChar
            }
            str += "\n"
        }
        
        return str
    }
}