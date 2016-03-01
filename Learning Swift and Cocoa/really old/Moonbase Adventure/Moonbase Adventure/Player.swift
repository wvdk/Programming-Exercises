import Foundation

public class Player {
    public var currentMap: Map
    public var currentRoom: Int
    public var currentLocation: Point {
        get {
            return currentMap.getLocationOfRoom(currentRoom)!
        }
    }
    
    public init (startingMap: Map, startingRoom: Int) {
        self.currentMap = startingMap
        self.currentRoom = startingRoom
    }
    
    public func move(direction: Direction) {
        if let roomToMoveTo = adjacentRoom(direction) {
            currentRoom = roomToMoveTo
            print(rooms[currentRoom].description)
        } else {
            print("Cannot move in that direction.")
        }
    }
    
    func adjacentRoom(direction: Direction) -> Int? {
        var room: Int
        
        switch direction {
        case .n:
            room = currentMap.layout[currentLocation.y - 1][currentLocation.x]
        case .ne:
            room = currentMap.layout[currentLocation.y - 1][currentLocation.x + 1]
        case .e:
            room = currentMap.layout[currentLocation.y][currentLocation.x + 1]
        case .se:
            room = currentMap.layout[currentLocation.y + 1][currentLocation.x + 1]
        case .s:
            room = currentMap.layout[currentLocation.y + 1][currentLocation.x]
        case .sw:
            room = currentMap.layout[currentLocation.y + 1][currentLocation.x - 1]
        case .w:
            room = currentMap.layout[currentLocation.y][currentLocation.x - 1]
        case .nw:
            room = currentMap.layout[currentLocation.y - 1][currentLocation.x - 1]
        }
        
        if room != 0 {
            return room
        } else {
            return nil
        }
    }
}
