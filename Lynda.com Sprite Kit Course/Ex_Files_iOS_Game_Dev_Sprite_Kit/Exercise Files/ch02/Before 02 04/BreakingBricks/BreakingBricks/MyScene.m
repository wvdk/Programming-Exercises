//
//  MyScene.m
//  BreakingBricks
//
//  Created by Simon Allardice on 2/15/14.
//  Copyright (c) 2014 Simon Allardice. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor whiteColor];
        
        // create a new sprite node from an image
        SKSpriteNode *ball = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
        
        // create a CGPoint for position
        CGPoint myPoint = CGPointMake(size.width/2,size.height/2);
        ball.position = myPoint;
        
        // add the sprite node to the scene
        [self addChild:ball];
                
        
   
    }
    return self;
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
