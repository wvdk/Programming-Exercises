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
        
        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
        
        [self addSubview:self.view];
        
        self.label.text = @"Sup?!";
        
    }
    return self;
}

@end
