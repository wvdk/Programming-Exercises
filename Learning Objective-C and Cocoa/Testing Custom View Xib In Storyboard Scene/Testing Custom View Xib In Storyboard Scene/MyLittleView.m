//
//  MyLittleView.m
//  Testing Custom View Xib In Storyboard Scene
//
//  Created by Wes Van der Klomp on 5/18/16.
//  Copyright © 2016 wvdk. All rights reserved.
//

#import "MyLittleView.h"

@implementation MyLittleView

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        // 1. load the interface
        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
        // 2. add as subview
        [self addSubview:self.view];
        // 3. allow for autolayout
        [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
        // 4. add constraints to span entire view
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view":self.view}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view":self.view}]];
     
        
        self.label.text = @"Sup?!";
        
    }
    return self;
}

@end
