//
//  LDCMyScene.m
//  VolumeVsEdge
//
//  Created by Simon Allardice on 2/10/14.
//  Copyright (c) 2014 Simon Allardice. All rights reserved.
//

#import "LDCMyScene.h"

@implementation LDCMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor whiteColor];
        
        // add left wall sprite
        SKSpriteNode *leftWall = [SKSpriteNode spriteNodeWithImageNamed:@"wall"];
        leftWall.position = CGPointMake(50, 300);
        [self addChild:leftWall];
        
        // add right wall sprite
        SKSpriteNode *rightWall = [SKSpriteNode spriteNodeWithImageNamed:@"wall"];
        rightWall.position = CGPointMake(270, 300);
        [self addChild:rightWall];
        
        // ADDING PHYSICS BODIES
        
        // VOLUME-based body, dynamic
        // leftWall.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:leftWall.frame.size];
        
        // VOLUME-based body - made static
        // rightWall.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:rightWall.frame.size];
        // rightWall.physicsBody.dynamic = NO;
        
        // EDGE-based physics body on the scene, for invisible boundaries
        // self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
    
        SKSpriteNode *ball = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
        ball.position = CGPointMake(50.0f, 380.0f);
        
        // Add a VOLUME based physics body to the ball
        ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.frame.size.width/2];
        // make it more bouncy than normal
        ball.physicsBody.restitution = 0.5f;

        [self addChild:ball];
        
        // now give it a push
        [ball.physicsBody applyImpulse:CGVectorMake(25,0)];
       
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
