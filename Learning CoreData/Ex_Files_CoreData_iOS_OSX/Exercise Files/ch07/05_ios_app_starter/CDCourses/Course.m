//
//  Course.m
//  CDCourses
//
//  Created by Simon Allardice on 9/9/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import "Course.h"


@implementation Course

@dynamic title;
@dynamic releaseDate;
@dynamic author;

-(void) awakeFromInsert {
    [super awakeFromInsert];
    self.releaseDate = [NSDate date];
}

@end
