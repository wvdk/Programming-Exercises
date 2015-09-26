//
//  EndScene.m
//  BreakingBricks
//
//  Created by Simon Allardice on 2/19/14.
//  Copyright (c) 2014 Simon Allardice. All rights reserved.
//

#import "EndScene.h"
#import "MyScene.h"

@implementation EndScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor blackColor];
        
        SKAction *play = [SKAction playSoundFileNamed:@"gameover.caf" waitForCompletion:NO];
        [self runAction:play];
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        label.text = @"GAME OVER";
        label.fontColor = [SKColor whiteColor];
        label.fontSize = 44;
        label.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
        [self addChild:label];
        
        // second label
        SKLabelNode *tryAgain = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        tryAgain.text = @"tap to play again";
        tryAgain.fontColor = [SKColor whiteColor];
        tryAgain.fontSize = 24;
        tryAgain.position = CGPointMake(size.width/2, -50);
        
        SKAction *moveLabel = [SKAction moveToY:(size.height/2 - 40) duration:2.0];
        [tryAgain runAction:moveLabel];
        
        
        [self addChild:tryAgain];
        
    
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    MyScene *firstScene = [MyScene sceneWithSize:self.size];
    [self.view presentScene:firstScene transition:[SKTransition doorsOpenHorizontalWithDuration:1.5]];
}

@end
