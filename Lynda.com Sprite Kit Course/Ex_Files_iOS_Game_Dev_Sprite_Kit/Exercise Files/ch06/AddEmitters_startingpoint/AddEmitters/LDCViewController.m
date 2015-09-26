//
//  LDCViewController.m
//  AddEmitters
//
//  Created by Simon Allardice on 2/19/14.
//  Copyright (c) 2014 Simon Allardice. All rights reserved.
//

#import "LDCViewController.h"
#import "LDCMyScene.h"

@implementation LDCViewController

-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [LDCMyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{

        return UIInterfaceOrientationMaskPortrait;
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
