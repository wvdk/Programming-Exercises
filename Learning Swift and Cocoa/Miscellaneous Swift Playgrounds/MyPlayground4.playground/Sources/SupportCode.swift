//
// This file (and all other Swift source files in the Sources directory of this playground) will be precompiled into a framework which is automatically made available to MyPlayground4.playground.
//

enum Direction {
    case w, nw, n, ne, e, se, s, sw
}

struct Point {
    var x = 0
    var y = 0
}

class RoomManager {
    var currentMap: [[Int]]
    var currentRoom: Int
    var currentLocation: Point {
        get {
            return getLocationOfRoomInMap(currentRoom, map: currentMap)
        }
    }
    
    init (map: [[Int]], room: Int) {
        self.currentMap = map
        self.currentRoom = room
    }
    
    func getLocationOfRoomInMap(roomNumber: Int, map: [[Int]]) -> Point {
        var location = Point()
        
        // Iterate through each "row" of the map array.
        for row in 0...map.count {
            
            // Iterate through each "column" of the "row" array.
            for columnItem in 0...map[row].count {
                if roomNumber == columnItem {
                    location = Point(x: columnItem, y: row)
                } else {
                    print("This is not the room number.")
                }
            }
        }
        
        return location
    }
}

