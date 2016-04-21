//
//  Course.h
//  CDCourses
//
//  Created by Simon Allardice on 9/9/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Course : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * releaseDate;
@property (nonatomic, retain) NSString * author;

@end
