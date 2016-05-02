//
//  CoursesTableViewController.h
//  CDCourses
//
//  Created by Simon Allardice on 9/9/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoursesTableViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
