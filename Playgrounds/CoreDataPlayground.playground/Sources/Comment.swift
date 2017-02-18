import Foundation
import CoreData

public class Comment: NSManagedObject {
    @NSManaged public var comment: String
    @NSManaged public var id: NSNumber
}
