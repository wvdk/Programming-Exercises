import CoreData

public class CoreDataStack {
    public let model: NSManagedObjectModel
    public let persistentStoreCordinator: NSPersistentStoreCoordinator
    public let context: NSManagedObjectContext
    
    public init() {
        
        
       // Initialize comment entity
        let commentEntity = NSEntityDescription()
        commentEntity.name = "Comment"
        commentEntity.managedObjectClassName = NSStringFromClass(Comment.self)
        
        let idAttribute = NSAttributeDescription()
        idAttribute.name = "id"
        idAttribute.attributeType = .integer64AttributeType
        idAttribute.isOptional = false
        idAttribute.isIndexed = true
        
        let commentAttribute = NSAttributeDescription()
        commentAttribute.name = "comment"
        commentAttribute.attributeType = .stringAttributeType
        commentAttribute.isOptional = false
        commentAttribute.isIndexed = false
        
        commentEntity.properties = [idAttribute, commentAttribute]
        
        model = NSManagedObjectModel()
        model.entities = [commentEntity]
        
        persistentStoreCordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        do {
            try persistentStoreCordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
        } catch {
            print("error creating persistant store cordinator: \(error)")
        }
        
        context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = persistentStoreCordinator
    }
    
    public func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    
}
