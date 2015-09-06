//
//  UIView+Help.m
//  2014_11_20_PIX72
//
//  Created by Mac10.9 on 14-11-21.
//  Copyright (c) 2014年 xiaoxiaobing. All rights reserved.
//

#import "UIView+Help.h"

@implementation UIView (Help)

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)y
{
    return self.frame.origin.y;
}
#pragma mark - 扩散动画
- (void)addAnimationAtPoint:(CGPoint)point;
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    CGFloat diameter = [self mdShapeDiameterForPoint:point];
    shapeLayer.frame = CGRectMake(floor(point.x - diameter * 0.5), floor(point.y - diameter * 0.5), diameter, diameter);
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0.0, 0.0, diameter, diameter)].CGPath;
    [self.layer addSublayer:shapeLayer];
    shapeLayer.fillColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0].CGColor;
    // animate
    CGFloat scale = 100.0 / shapeLayer.frame.size.width;
    NSString *timingFunctionName = kCAMediaTimingFunctionDefault; //inflating ? kCAMediaTimingFunctionDefault : kCAMediaTimingFunctionDefault;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1.0)];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:timingFunctionName];
    animation.removedOnCompletion = YES;
    animation.duration = 3.0;
    shapeLayer.transform = [animation.toValue CATransform3DValue];
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        [shapeLayer removeFromSuperlayer];
    }];
    [shapeLayer addAnimation:animation forKey:@"shapeBackgroundAnimation"];
    [CATransaction commit];
}
- (void)addAnimationAtPoint:(CGPoint)point WithType:(animationType) type withColor:(UIColor *)animationColor completion:(void (^)(BOOL))completion
{
    [self addAnimationAtPoint:point WithDuration:1.0 WithType:type withColor:animationColor  completion:completion];
}
- (void)addAnimationAtPoint:(CGPoint)point WithDuration:(NSTimeInterval)duration WithType:(animationType) type withColor:(UIColor *)animationColor completion:(void (^)(BOOL finished))completion
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    CGFloat diameter = [self mdShapeDiameterForPoint:point];
    shapeLayer.frame = CGRectMake(floor(point.x - diameter * 0.5), floor(point.y - diameter * 0.5), diameter, diameter);
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0.0, 0.0, diameter, diameter)].CGPath;
    
    shapeLayer.fillColor = animationColor.CGColor;
    // animate
    CGFloat scale = 1.0 / shapeLayer.frame.size.width;
    NSString *timingFunctionName = kCAMediaTimingFunctionDefault; //inflating ? kCAMediaTimingFunctionDefault : kCAMediaTimingFunctionDefault;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    switch (type) {
        case aniMationOpen:
        {
            [self.layer addSublayer:shapeLayer];
            animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
            animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1.0)];
            break;
        }
        case aniMationClose:
        {
            [self.layer insertSublayer:shapeLayer atIndex:0];
            animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1.0)];
            animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
            break;
        }
        default:
            break;
    }
    animation.timingFunction = [CAMediaTimingFunction functionWithName:timingFunctionName];
    animation.removedOnCompletion = YES;
    animation.duration = duration;
    shapeLayer.transform = [animation.toValue CATransform3DValue];
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        [shapeLayer removeFromSuperlayer];
        if (completion)
        {
            completion(true);
        }
    }];
    [shapeLayer addAnimation:animation forKey:@"shapeBackgroundAnimation"];
    [CATransaction commit];
    
}
- (void)addAnimationAtPoint:(CGPoint)point WithType:(animationType) type withColor:(UIColor *)animationColor;
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    CGFloat diameter = [self mdShapeDiameterForPoint:point];
    shapeLayer.frame = CGRectMake(floor(point.x - diameter * 0.5), floor(point.y - diameter * 0.5), diameter, diameter);
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0.0, 0.0, diameter, diameter)].CGPath;
    
    shapeLayer.fillColor = animationColor.CGColor;
    // animate
    CGFloat scale = 100.0 / shapeLayer.frame.size.width;
    NSString *timingFunctionName = kCAMediaTimingFunctionDefault; //inflating ? kCAMediaTimingFunctionDefault : kCAMediaTimingFunctionDefault;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    switch (type) {
        case aniMationOpen:
        {
            [self.layer addSublayer:shapeLayer];
            animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
            animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1.0)];
            break;
        }
        case aniMationClose:
        {
            [self.layer insertSublayer:shapeLayer atIndex:0];
            animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1.0)];
            animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
            break;
        }
        default:
            break;
    }
    animation.timingFunction = [CAMediaTimingFunction functionWithName:timingFunctionName];
    animation.removedOnCompletion = YES;
    animation.duration = 3.0;
    shapeLayer.transform = [animation.toValue CATransform3DValue];
    
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        [shapeLayer removeFromSuperlayer];
    }];
    [shapeLayer addAnimation:animation forKey:@"shapeBackgroundAnimation"];
    [CATransaction commit];
}
//计算离屏幕的边框最大的距离
- (CGFloat)mdShapeDiameterForPoint:(CGPoint)point
{
    CGPoint cornerPoints[] = {
        {0.0, 0.0},
        {0.0, self.bounds.size.height},
        {self.bounds.size.width, self.bounds.size.height},
        {self.bounds.size.width, 0.0}
    };
    CGFloat radius = 0.0;
    for (int i = 0; i < 4; i++)
    {
        CGPoint p = cornerPoints[i];
        CGFloat d = sqrt( pow(p.x - point.x, 2.0) + pow(p.y - point.y, 2.0) );
        if (d > radius)
        {
            radius = d;
        }
    }
    return radius * 2.0;
}
@end
