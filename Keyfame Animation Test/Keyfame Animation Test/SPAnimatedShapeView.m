//
//  SPAnimatedShapeView.m
//  Keyfame Animation Test
//
//  Created by Wesley Van der Klomp on 2/4/17.
//  Copyright © 2017 Wesley Van der Klomp. All rights reserved.
//

#import "SPAnimatedShapeView.h"
#import <QuartzCore/QuartzCore.h>

// Credit: http://stackoverflow.com/questions/9762236/how-to-animate-coregraphics-drawing-of-shape-using-cakeyframeanimation

@interface SPAnimatedShapeView ()
@property (nonatomic, retain)   CAShapeLayer*   shapeLayer;
@end

@implementation SPAnimatedShapeView

@synthesize shapeLayer = _shapeLayer;

- (void)layoutSubviews
{
    if (!self.shapeLayer)
    {
        self.shapeLayer = [[CAShapeLayer alloc] init];
        self.shapeLayer.bounds = CGRectMake(0, 0, 100, 100);
        self.shapeLayer.anchorPoint = CGPointMake(0.0f, 0.0f);
        self.shapeLayer.position = CGPointMake(0, 0);
        self.shapeLayer.strokeColor = [UIColor blueColor].CGColor;
        self.shapeLayer.fillColor = [UIColor redColor].CGColor;
        self.shapeLayer.lineWidth = 3.f;
        self.shapeLayer.backgroundColor = [UIColor greenColor].CGColor;
        
        [self.layer addSublayer:self.shapeLayer];
    }
}

- (IBAction)animate:(id)sender
{
    UIBezierPath* path0 = [UIBezierPath bezierPath];
    [path0 moveToPoint:CGPointZero];
    [path0 addLineToPoint:CGPointZero];
    [path0 addLineToPoint:CGPointZero];
    [path0 addLineToPoint:CGPointZero];
    
    UIBezierPath* path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointZero];
    [path1 addLineToPoint:CGPointMake(50,100)];
    [path1 addLineToPoint:CGPointMake(50,100)];
    [path1 addLineToPoint:CGPointMake(50,100)];
    
    UIBezierPath* path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointZero];
    [path2 addLineToPoint:CGPointMake(50,100)];
    [path2 addLineToPoint:CGPointMake(100,0)];
    [path2 addLineToPoint:CGPointMake(100,0)];
    
    UIBezierPath* path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint:CGPointZero];
    [path3 addLineToPoint:CGPointMake(50,100)];
    [path3 addLineToPoint:CGPointMake(100,0)];
    [path3 addLineToPoint:CGPointZero];
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    animation.duration = 4.0f;
    animation.values = [NSArray arrayWithObjects:(id)path0.CGPath, (id)path1.CGPath, (id)path2.CGPath, (id)path3.CGPath, nil];
    [self.shapeLayer addAnimation:animation forKey:nil];
}

@end
