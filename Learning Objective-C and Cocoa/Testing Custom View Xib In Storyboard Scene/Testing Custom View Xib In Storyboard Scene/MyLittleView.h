//
//  MyLittleView.h
//  Testing Custom View Xib In Storyboard Scene
//
//  Created by Wes Van der Klomp on 5/18/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyLittleView : UIView

@property (strong, nonatomic) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
