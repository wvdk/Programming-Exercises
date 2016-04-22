//
//  ViewController.m
//  SaveDemo
//
//  Created by Wes Van der Klomp on 4/21/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@implementation ViewController {
     NSManagedObjectContext *moc;
}

- (IBAction)createObject:(id)sender {
    
    
    NSManagedObject *myMO = [NSEntityDescription insertNewObjectForEntityForName:@"Course" inManagedObjectContext:moc];
    
    [myMO setValue:@"Core Data 101" forKey:@"Title"];
    [myMO setValue:@"Wes" forKey:@"Author"];
    [myMO setValue:[NSDate date] forKey:@"releaseDate"];
    
//    NSError *error = nil;
    
//    if () {
//        NSLog(@"Ahhh! %@", error);
//    }

//    [moc save];
    
    NSError *error = nil;
    if (![moc save:&error])
    {
                NSLog(@"Ahhh! %@", error);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    moc = [(AppDelegate *)[[NSApplication sharedApplication] delegate] managedObjectContext];
    

    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
