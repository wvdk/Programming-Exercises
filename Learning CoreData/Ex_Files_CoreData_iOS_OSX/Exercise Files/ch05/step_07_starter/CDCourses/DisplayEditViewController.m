//
//  DisplayEditViewController.m
//  CDCourses
//
//  Created by Simon Allardice on 9/9/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import "DisplayEditViewController.h"

@interface DisplayEditViewController ()

@end

@implementation DisplayEditViewController
@synthesize titleField;
@synthesize authorField;
@synthesize dateField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    titleField.text = [self.currentCourse title];
    authorField.text = [self.currentCourse author];
    
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"yyyy-MM-dd"];
    dateField.text = [df stringFromDate:[self.currentCourse releaseDate]];
}

- (void)viewDidUnload
{
    [self setTitleField:nil];
    [self setAuthorField:nil];
    [self setDateField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
