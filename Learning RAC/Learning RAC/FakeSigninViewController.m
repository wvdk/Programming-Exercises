//
//  FakeSigninViewController.m
//  Learning RAC
//
//  Created by Wesley Van der Klomp on 7/26/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

#import "FakeSigninViewController.h"

@interface FakeSigninViewController ()

@property (weak, nonatomic) IBOutlet UIButton *attemptLoginButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *miscLabel;

@end

@implementation FakeSigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
