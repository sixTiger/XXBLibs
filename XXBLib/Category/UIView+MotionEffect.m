//
//  UIView+MotionEffect.m
//  testView
//
//  Created by xiaoxiaobing on 15/2/27.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "UIView+MotionEffect.h"
#import <objc/runtime.h>
static char motionEffectFlag;
@implementation UIView (MotionEffect)
-(void)setEffectGroup:(UIMotionEffectGroup *)effectGroup
{
    // 清除掉关联
    objc_setAssociatedObject(self, &motionEffectFlag,
                             nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 建立关联
    objc_setAssociatedObject(self, &motionEffectFlag,
                             effectGroup, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIMotionEffectGroup *)effectGroup
{
    // 返回关联
    return objc_getAssociatedObject(self, &motionEffectFlag);
}

- (void)addXAxisWithValue:(CGFloat)xValue YAxisWithValue:(CGFloat)yValue
{
    if ((xValue >= 0) && (yValue >= 0))
    {
        UIInterpolatingMotionEffect *xAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        xAxis.minimumRelativeValue = @(-xValue);
        xAxis.maximumRelativeValue = @(xValue);
        
        UIInterpolatingMotionEffect *yAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        yAxis.minimumRelativeValue = @(-yValue);
        yAxis.maximumRelativeValue = @(yValue);
        
        // 先移除效果再添加效果
        self.effectGroup.motionEffects = nil;
        [self removeMotionEffect:self.effectGroup];
        self.effectGroup.motionEffects = @[xAxis, yAxis];
        
        // 给view添加效果
        [self addMotionEffect:self.effectGroup];
    }
}

- (void)removeSelfMotionEffect
{
    [self removeMotionEffect:self.effectGroup];
}
@end
