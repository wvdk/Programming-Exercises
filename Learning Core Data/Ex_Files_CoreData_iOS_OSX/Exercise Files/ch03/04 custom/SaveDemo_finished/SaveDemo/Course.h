//
//  Course.h
//  SaveDemo
//
//  Created by Simon Allardice on 9/7/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Course : NSManagedObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSDate * releaseDate;
@property (nonatomic, retain) NSString * title;

-(void) simpleMethod;

@end
