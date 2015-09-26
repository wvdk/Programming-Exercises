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

static const uint32_t ballCategory   = 1; // 00000000000000000000000000000001
static const uint32_t brickCategory  = 2; // 00000000000000000000000000000010
static const uint32_t paddleCategory = 4; // 00000000000000000000000000000100
static const uint32_t edgeCategory   = 8; // 00000000000000000000000000001000

// be careful when providing direct integer values - this would cause problems.
// static const uint32_t WHOOPSCategory = 15; // 00000000000000000000000000001111

/* alternatively, using bitwise operators
 static const uint32_t ballCategory   = 0x1;      // 00000000000000000000000000000001
 static const uint32_t brickCategory  = 0x1 << 1; // 00000000000000000000000000000010
 static const uint32_t paddleCategory = 0x1 << 2; // 00000000000000000000000000000100
 static const uint32_t edgeCategory   = 0x1 << 3; // 00000000000000000000000000001000
 */


@implementation MyScene

-(void)didBeginContact:(SKPhysicsContact *)contact {
    // create placeholder reference for the "non ball" object
    SKPhysicsBody *notTheBall;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) {
        notTheBall = contact.bodyB;
    } else {
        notTheBall = contact.bodyA;
    }
    
    if (notTheBall.categoryBitMask == brickCategory) {
        SKAction *playSFX = [SKAction playSoundFileNamed:@"brickhit.caf" waitForCompletion:NO];
        [self runAction:playSFX];
        [notTheBall.node removeFromParent];
    }
    
    if (notTheBall.categoryBitMask == paddleCategory) {
        SKAction *playSFX = [SKAction playSoundFileNamed:@"blip.caf" waitForCompletion:NO];
        [self runAction:playSFX];
        
    }
    
}

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
    ball.physicsBody.categoryBitMask = ballCategory;
    ball.physicsBody.contactTestBitMask = brickCategory | paddleCategory;
   // ball.physicsBody.collisionBitMask = edgeCategory | brickCategory;

    
    // add the sprite node to the scene
    [self addChild:ball];
    
    // create the vector
    CGVector myVector = CGVectorMake(10, 10);
    // apply the vector
    [ball.physicsBody applyImpulse:myVector];
}

-(void) addBricks:(CGSize) size {
    for (int i = 0; i < 4; i++) {
        SKSpriteNode *brick = [SKSpriteNode spriteNodeWithImageNamed:@"brick"];
        
        // add a static physics body
        brick.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:brick.frame.size];
        brick.physicsBody.dynamic =  NO;
        brick.physicsBody.categoryBitMask = brickCategory;
        
        
        int xPos = size.width/5 * (i+1);
        int yPos = size.height - 50;
        brick.position = CGPointMake(xPos, yPos);
        
        [self addChild:brick];
        
    }
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
    self.paddle.physicsBody.categoryBitMask = paddleCategory;
    

    // add to scene
    [self addChild:self.paddle];
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor whiteColor];
        
        // add a physics body to the scene
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        self.physicsBody.categoryBitMask = edgeCategory;
        
        
        // change gravity settings of the physics world
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        self.physicsWorld.contactDelegate = self;
        
        
        
        [self addBall:size];
        [self addPlayer:size];
        [self addBricks:size];
        
    
    }
    return self;
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
