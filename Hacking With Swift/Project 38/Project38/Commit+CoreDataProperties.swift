//
//  Commit+CoreDataProperties.swift
//  Project38
//
//  Created by Wesley Van der Klomp on 2/15/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Commit {

    @NSManaged var date: NSDate
    @NSManaged var message: String
    @NSManaged var sha: String
    @NSManaged var url: String

}
