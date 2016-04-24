//
//  Course.h
//  SaveDemo
//
//  Created by Wes Van der Klomp on 4/24/16.
//  Copyright © 2016 Simon Allardice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Course : NSManagedObject

- (void) printMessage;

@end

NS_ASSUME_NONNULL_END

#import "Course+CoreDataProperties.h"
