//
//  MyScene.m
//  LandscapeExample
//
//  Created by Simon Allardice on 2/20/14.
//  Copyright (c) 2014 Simon Allardice. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        // Add background image
        SKSpriteNode *bg = [SKSpriteNode spriteNodeWithImageNamed:@"icelevel"];
        bg.position = CGPointMake(size.width/2, size.height/2); // center in scene
        [self addChild:bg];
        
        // add sprite at bottom left corner
        SKSpriteNode *redbox = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:CGSizeMake(10, 10)];
        redbox.position = CGPointMake(20,20);
        [self addChild:redbox];
        
    }
    return self;
}


@end
