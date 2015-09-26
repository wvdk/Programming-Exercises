//
//  MyScene.m
//  AnimationExamples
//
//  Created by Simon Allardice on 2/20/14.
//  Copyright (c) 2014 Simon Allardice. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.29 green:0.75 blue:.99 alpha:1];

         // create platform (just a colored sprite)
        SKSpriteNode *platform = [SKSpriteNode spriteNodeWithColor:[SKColor brownColor] size:CGSizeMake(100, 20)];
        platform.position = CGPointMake(50, 100);
        [self addChild:platform];
        
        // create the first action
        SKAction *move = [SKAction moveToX:size.width -(platform.size.width/2) duration:2];
        // run it
        [platform runAction:move];
        
    }
    return self;
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
