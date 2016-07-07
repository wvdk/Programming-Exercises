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

- (IBAction)makeRed:(id)sender {
    NSLog(@"Make the damn thing red.");
    _colorBox.backgroundColor = UIColor.redColor;
}

- (IBAction)makeBlue:(id)sender {
    NSLog(@"Make the damn thing blue.");
    _colorBox.backgroundColor = UIColor.blueColor;
}

- (IBAction)makeGreen:(id)sender {
    NSLog(@"Make the damn thing green.");
    _colorBox.backgroundColor = UIColor.greenColor;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    RACSignal *redButtonPress = [_redButton rac_command];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
