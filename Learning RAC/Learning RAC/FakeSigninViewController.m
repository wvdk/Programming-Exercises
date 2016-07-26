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
    
    RACSignal *formValid = [RACSignal combineLatest:@[
        self.usernameTextField.rac_textSignal,
        self.passwordTextField.rac_textSignal
    ]
    reduce:^(NSString *firstName, NSString *lastName, NSString *email, NSString *reEmail) {
        return @(firstName.length > 0 && lastName.length > 0 && email.length > 0 && reEmail.length > 0 && [email isEqual:reEmail]);
    }];
    
    RAC(self.attemptLoginButton.enabled) = formValid;

//    RACSignal *validCredentialsEntered = [RACSignal combineLatest:@[
//        self.attemptLoginButton.rac_command.executionSignals
//    ]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
