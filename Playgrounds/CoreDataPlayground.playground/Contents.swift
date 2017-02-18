//: http://www.learncoredata.com/core-data-and-playgrounds/

import UIKit
import CoreData

var str = "Hello, playground"

let entityName = "Comment"
let coreDataStack = CoreDataStack()

let commentEntity = NSEntityDescription.entity(forEntityName: entityName, in: coreDataStack.context)

let comment = Comment(entity: commentEntity!, insertInto: coreDataStack.context)

comment.id = 1
comment.comment = "blah blah blah"

let comment2 = Comment(entity: commentEntity!, insertInto: coreDataStack.context)

comment2.id = 2
comment2.comment = "Hello world"

coreDataStack.saveContext()

let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)

let sort = NSSortDescriptor(key: "id", ascending: true)

fetchRequest.sortDescriptors = [sort]

if let results = try? coreDataStack.context.fetch(fetchRequest) {
    results.count
    
    for result in results {
        if let commentResult = result as? Comment {
            print(commentResult.comment)
        }
    }
} else {
    print("There was an error getting results")
}