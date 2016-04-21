//
//  Course.m
//  DrillDownDemo
//
//  Created by Simon Allardice on 9/10/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import "Course.h"
#import "Author.h"


@implementation Course

@dynamic releaseDate;
@dynamic title;
@dynamic author;

-(BOOL) validateReleaseDate:(id *)value error:(NSError **)error {
    
    if (*value == nil) {
        return YES;
    }
    
    NSDate *dateToValidate = *value;
    
    if( [dateToValidate timeIntervalSinceDate:[NSDate date]] > (60 * 24 * 60 * 60) ) {
        NSString *errorStr = @"Date cannot be more than 60 days in the future.";
        NSDictionary *errorDict =
        [NSDictionary dictionaryWithObject:errorStr forKey:NSLocalizedDescriptionKey];
        NSError *newerror = [[NSError alloc]initWithDomain:@"DrillDown" code:100 userInfo:errorDict];
        *error = newerror;
        return NO;
    }
    
    return YES;
    
}

@end
