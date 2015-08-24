//
//  UIView+MotionEffect.h
//  testView
//
//  Created by xiaoxiaobing on 15/2/27.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MotionEffect)

@property (nonatomic, strong) UIMotionEffectGroup  *effectGroup;
/**
 *  添加重力感应效果
 *
 *  调用示例
 *
 *  view.effectGroup = [UIMotionEffectGroup new];
 *  [view addXAxisWithValue:xMove YAxisWithValue:yMove];
 *
 *  @param xValue x方向的偏移
 *  @param yValue y方向的偏移
 */
- (void)addXAxisWithValue:(CGFloat)xValue YAxisWithValue:(CGFloat)yValue;

- (void)removeSelfMotionEffect;
@end
