//
//  Course.h
//  FetchDemo
//
//  Created by Simon on 9/8/12.
//  Copyright (c) 2012 Simon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Course : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * releaseDate;
@property (nonatomic, retain) NSString * author;

@end
