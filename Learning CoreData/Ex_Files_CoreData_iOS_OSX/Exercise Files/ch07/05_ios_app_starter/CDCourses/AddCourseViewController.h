//
//  AddCourseViewController.h
//  CDCourses
//
//  Created by Simon Allardice on 9/9/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@protocol AddCourseViewControllerDelegate;

@interface AddCourseViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *authorField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;

@property (nonatomic, weak) id <AddCourseViewControllerDelegate> delegate;

@property (nonatomic, strong) Course *currentCourse;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end

@protocol AddCourseViewControllerDelegate
-(void)addCourseViewControllerDidSave;
-(void)addCourseViewControllerDidCancel:(Course *)courseToDelete;
@end
