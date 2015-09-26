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
        
        // create the two move actions
        SKAction *move = [SKAction moveByX:(size.width-platform.size.width) y:0 duration:2];
        SKAction *moveBack = [move reversedAction];
        
        // now sequence them
        SKAction *backAndForth = [SKAction sequence:@[move,moveBack]];
        
        // run the sequence
        [platform runAction:backAndForth];
        

    }
    return self;
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
