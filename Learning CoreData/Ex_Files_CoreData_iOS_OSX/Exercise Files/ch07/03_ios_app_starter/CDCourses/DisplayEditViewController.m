//
//  DisplayEditViewController.m
//  CDCourses
//
//  Created by Simon Allardice on 9/9/12.
//  Copyright (c) 2012 Simon Allardice. All rights reserved.
//

#import "DisplayEditViewController.h"
#import "AppDelegate.h"

@interface DisplayEditViewController ()

@end

@implementation DisplayEditViewController
@synthesize titleField;
@synthesize authorField;
@synthesize dateField;
@synthesize doneButton;
@synthesize editButton;

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
    [self setEditButton:nil];
    [self setDoneButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)startEditing:(id)sender {
    titleField.enabled = YES;
    authorField.enabled = YES;
    dateField.enabled = YES;
    
    titleField.borderStyle = UITextBorderStyleRoundedRect;
    authorField.borderStyle = UITextBorderStyleRoundedRect;
    dateField.borderStyle = UITextBorderStyleRoundedRect;
    
    editButton.hidden = YES;
    doneButton.hidden = NO;
}
- (IBAction)doneEditing:(id)sender {
    titleField.enabled = NO;
    authorField.enabled = NO;
    dateField.enabled = NO;
    
    titleField.borderStyle = UITextBorderStyleNone;
    authorField.borderStyle = UITextBorderStyleNone;
    dateField.borderStyle = UITextBorderStyleNone;
    
    editButton.hidden = NO;
    doneButton.hidden = YES;
    
    _currentCourse.title = titleField.text;
    _currentCourse.author = authorField.text;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    _currentCourse.releaseDate = [df dateFromString:dateField.text];
    
    AppDelegate *myApp = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    [myApp saveContext];
    
}
@end
