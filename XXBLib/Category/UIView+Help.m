//
//  UIView+Help.m
//  2014_11_20_PIX72
//
//  Created by Mac10.9 on 14-11-21.
//  Copyright (c) 2014年 xiaoxiaobing. All rights reserved.
//

#import "UIView+Help.h"

@implementation UIView (Help)

- (void)setXxb_width:(CGFloat)xxb_width {
    CGRect frame = self.frame;
    frame.size.width = xxb_width;
    self.frame = frame;
}

- (CGFloat)xxb_width {
    return self.frame.size.width;
}

- (void)setXxb_height:(CGFloat)xxb_height {
    CGRect frame = self.frame;
    frame.size.height = xxb_height;
    self.frame = frame;
}

- (CGFloat)xxb_height {
    return self.frame.size.height;
}

- (void)setXxb_x:(CGFloat)xxb_x {
    CGRect frame = self.frame;
    frame.origin.x = xxb_x;
    self.frame = frame;
}
- (CGFloat)xxb_x {
    return self.frame.origin.x;
}

- (void)setXxb_y:(CGFloat)xxb_y {
    CGRect frame = self.frame;
    frame.origin.y = xxb_y;
    self.frame = frame;
}

- (CGFloat)xxb_y {
    return self.frame.origin.y;
}

- (void)setXxb_centerX:(CGFloat)xxb_centerX {
    CGPoint center = self.center;
    center.x = xxb_centerX;
    self.center = center;
}

- (CGFloat)xxb_centerX {
    return self.center.x;
}

- (void)setXxb_centerY:(CGFloat)xxb_centerY {
    CGPoint center = self.center;
    center.y = xxb_centerY;
    self.center = center;
}

- (CGFloat)xxb_centerY {
    return self.center.y;
}

- (void)setXxb_size:(CGSize)xxb_size {
    CGRect frame = self.frame;
    frame.size = xxb_size;
    self.frame = frame;
}

- (CGSize)xxb_size {
    return self.frame.size;
}

- (void)setXxb_origin:(CGPoint)xxb_origin {
    CGRect frame = self.frame;
    frame.origin = xxb_origin;
    self.frame = frame;
}

- (CGPoint)xxb_origin {
    return self.frame.origin;
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
