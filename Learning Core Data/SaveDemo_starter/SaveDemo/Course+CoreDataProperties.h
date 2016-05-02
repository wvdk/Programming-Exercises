//
//  Course+CoreDataProperties.h
//  SaveDemo
//
//  Created by Wes Van der Klomp on 4/24/16.
//  Copyright © 2016 Simon Allardice. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Course.h"

NS_ASSUME_NONNULL_BEGIN

@interface Course (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *author;
@property (nullable, nonatomic, retain) NSDate *releaseDate;
@property (nullable, nonatomic, retain) NSString *title;

@end

NS_ASSUME_NONNULL_END
