//
//  EndScene.m
//  BreakingBricks
//
//  Created by Simon Allardice on 2/19/14.
//  Copyright (c) 2014 Simon Allardice. All rights reserved.
//

#import "EndScene.h"

@implementation EndScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor blackColor];
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        label.text = @"GAME OVER";
        label.fontColor = [SKColor whiteColor];
        label.fontSize = 44;
        label.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
        [self addChild:label];
    
    }
    return self;
}

@end
