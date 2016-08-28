//
//  FakeSigninViewController.m
//  Learning RAC
//
//  Created by Wesley Van der Klomp on 7/26/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

#import "FakeSigninViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface FakeSigninViewController ()

@property (weak, nonatomic) IBOutlet UIButton *attemptLoginButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *miscLabel;

@end

@implementation FakeSigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RACSignal *forms = [RACSignal combineLatest:@[
        self.usernameTextField.rac_textSignal,
        self.passwordTextField.rac_textSignal
    ]];
    
    RACSignal *valid = [forms reduceEach:^(NSString *firstName, NSString *lastName, NSString *email, NSString *reEmail) {
        NSLog(@"fasdfkjasldfkjasldfkjasd");
        return @(firstName.length > 0 && lastName.length > 0 && email.length > 0 && reEmail.length > 0 && [email isEqual:reEmail]);
    }];
    
//    RACSignal *valid = [forms reduce:^(NSString *firstName, NSString *lastName, NSString *email, NSString *reEmail) {
//        return @(firstName.length > 0 && lastName.length > 0 && email.length > 0 && reEmail.length > 0 && [email isEqual:reEmail]);
//    }];
    
//    self.attemptLoginButton.enabled = valid.va;

//    RACSignal *validCredentialsEntered = [RACSignal combineLatest:@[
//        self.attemptLoginButton.rac_command.executionSignals
//    ]];
    
}

@end
