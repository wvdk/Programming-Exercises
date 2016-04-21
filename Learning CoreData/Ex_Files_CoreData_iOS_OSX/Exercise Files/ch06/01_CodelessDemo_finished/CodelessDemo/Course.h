//
//  Course.h
//  CodelessDemo
//
//  Created by Simon Allardice on 9/10/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Course : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSDate * releaseDate;

@end
