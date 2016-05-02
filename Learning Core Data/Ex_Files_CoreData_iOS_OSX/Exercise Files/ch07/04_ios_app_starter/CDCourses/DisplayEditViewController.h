//
//  DisplayEditViewController.h
//  CDCourses
//
//  Created by Simon Allardice on 9/9/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"

@interface DisplayEditViewController : UIViewController

@property (nonatomic, strong) Course *currentCourse;

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *authorField;
@property (weak, nonatomic) IBOutlet UITextField *dateField;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

- (IBAction)startEditing:(id)sender;
- (IBAction)doneEditing:(id)sender;

@end
