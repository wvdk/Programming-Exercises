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
@property (weak, nonatomic) IBOutlet UIButton *killGreenButtonButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ///////////////////////////////////////////////
    //: ## Making my first signal
    
    RACSignal *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence.signal;
    
    [letters subscribeNext:^(NSString *x) {
        NSLog(@"Letters: %@", x);
    }];
    
    ///////////////////////////////////////////////
    //: ## Three ways to make a signal for a button
    
    //: ### Red button
    
    RACSignal *makeRed = [_redButton rac_signalForControlEvents:UIControlEventTouchUpInside];
    
    [makeRed subscribeNext:^(id sender) {
        NSLog(@"Red button was pressed!");
        _colorBox.backgroundColor = UIColor.redColor;
    }];
    
    //: ### Blue button
    
    [[_blueButton rac_signalForControlEvents:UIControlEventTouchDown] subscribeNext:^(id sender) {
        NSLog(@"Blue button was pressed!");
        _colorBox.backgroundColor = UIColor.blueColor;
    }];
    
    //: ### Green button

    void (^makeBoxGreen)(id) = ^void(id x) {
        NSLog(@"Green, man. Green.");
        _colorBox.backgroundColor = UIColor.greenColor;
    };
    
    [[_greenButton rac_signalForControlEvents:UIControlEventTouchDown] subscribeNext:makeBoxGreen completed:^(void){
        NSLog(@"That's all folks. No more green for you.");
    }];

    ///////////////////////////////////////////////
    //: ## Lets try breaking things and see what happens
    

    
//    [_killGreenButtonButton rac_signalForControlEvents:UIContProlEventTouchDown] subscribe:<#(id<RACSubscriber>)#>
    
    
    
    
    
    
}

@end
