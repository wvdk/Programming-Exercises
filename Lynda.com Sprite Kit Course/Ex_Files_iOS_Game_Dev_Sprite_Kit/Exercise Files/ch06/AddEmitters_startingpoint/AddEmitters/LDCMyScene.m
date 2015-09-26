//
//  LDCMyScene.m
//  AddEmitters
//
//  Created by Simon Allardice on 2/19/14.
//  Copyright (c) 2014 Simon Allardice. All rights reserved.
//

#import "LDCMyScene.h"

@implementation LDCMyScene {
    //
    SKSpriteNode *ship;
    BOOL touching;
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        touching = NO;
        
        // add bg
        SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"nightsky"];
        bg.position = CGPointMake(size.width/2, size.height/2);
        [self addChild:bg];
        
        // add spaceship
        ship = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        ship.position = CGPointMake(size.width/2, size.height/2);
        ship.scale = 0.3;
        ship.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ship.size];
        [self addChild:ship];
        
        // edges of scene
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        // reduce gravity
        self.physicsWorld.gravity = CGVectorMake(0, -1);
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    touching = YES;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    touching = NO;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    // apply upwards force
    if (touching) {
        [ship.physicsBody applyForce:CGVectorMake(0, 150)];
        // TODO: show engines.
    }
    
}

@end
