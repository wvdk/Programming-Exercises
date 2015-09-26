//
//  MyScene.m
//  BreakingBricks
//
//  Created by Simon Allardice on 2/15/14.
//  Copyright (c) 2014 Simon Allardice. All rights reserved.
//

#import "MyScene.h"

@interface MyScene ()

@property (nonatomic) SKSpriteNode *paddle;

@end

@implementation MyScene

- (void)addBall:(CGSize)size {
    // create a new sprite node from an image
    SKSpriteNode *ball = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
    
    // create a CGPoint for position
    CGPoint myPoint = CGPointMake(size.width/2,size.height/2);
    ball.position = myPoint;
    
    // add a physics body
    ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.frame.size.width/2];
    ball.physicsBody.friction = 0;
    ball.physicsBody.linearDamping = 0;
    ball.physicsBody.restitution = 1.0f;
    
    // add the sprite node to the scene
    [self addChild:ball];
    
    // create the vector
    CGVector myVector = CGVectorMake(10, 10);
    // apply the vector
    [ball.physicsBody applyImpulse:myVector];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        CGPoint newPosition = CGPointMake(location.x, 100);

        // stop the paddle from going too far
        if (newPosition.x < self.paddle.size.width / 2) {
            newPosition.x = self.paddle.size.width / 2;
            
        }
        if (newPosition.x > self.size.width - (self.paddle.size.width/2)) {
            newPosition.x = self.size.width - (self.paddle.size.width/2);
            
        }
        
        self.paddle.position = newPosition;
    }
}


-(void) addPlayer:(CGSize)size  {
    
    // create paddle sprite
    self.paddle = [SKSpriteNode spriteNodeWithImageNamed:@"paddle"];
    // position it
    self.paddle.position = CGPointMake(size.width/2,100);
    // add a physics body
    self.paddle.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.paddle.frame.size];
    // make it static
    self.paddle.physicsBody.dynamic = NO;

    // add to scene
    [self addChild:self.paddle];
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor whiteColor];
        
        // add a physics body to the scene
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        
        // change gravity settings of the physics world
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        
        [self addBall:size];
        [self addPlayer:size];
        
    
    }
    return self;
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
