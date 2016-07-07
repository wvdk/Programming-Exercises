//
//  ViewController.m
//  Learning RAC
//
//  Created by Wes Van der Klomp on 6/20/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *greenButton;
@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIView *colorBox;

@end

@implementation ViewController

//- (IBAction)makeGreen:(id)sender {
//    NSLog(@"Make the damn thing green.");
//    _colorBox.backgroundColor = UIColor.greenColor;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RACSignal *makeRed = [_redButton rac_signalForControlEvents:UIControlEventTouchUpInside];
    
    [makeRed subscribeNext:^(id sender) {
        NSLog(@"red button was pressed!");
        _colorBox.backgroundColor = UIColor.redColor;
    }];
    
    [[_blueButton rac_signalForControlEvents:UIControlEventTouchDown] subscribeNext:^(id sender) {
        NSLog(@"blue button was pressed!");
        _colorBox.backgroundColor = UIColor.blueColor;
    }];
    
    [[_greenButton rac_signalForControlEvents:UIControlEventTouchDown] subscribeNext:^(id sender) {
        NSLog(@"green!");
        _colorBox.backgroundColor = UIColor.greenColor;
    }];
}

@end
