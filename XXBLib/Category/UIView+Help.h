//
//  UIView+Help.h
//  2014_11_20_PIX72
//
//  Created by Mac10.9 on 14-11-21.
//  Copyright (c) 2014年 xiaoxiaobing. All rights reserved.
//  方便进行各种各样的布局

#import <UIKit/UIKit.h>

typedef enum  {
    aniMationOpen,
    aniMationClose
} animationType;

@interface UIView (Help)

// @property如果写在分类里面就不会生成成员属性,只会生成get,set方法

// 快速设置控件的frame
@property (nonatomic, assign) CGFloat xxb_width;
@property (nonatomic, assign) CGFloat xxb_height;
@property (nonatomic, assign) CGFloat xxb_x;
@property (nonatomic, assign) CGFloat xxb_y;
@property (nonatomic, assign) CGFloat xxb_centerX;
@property (nonatomic, assign) CGFloat xxb_centerY;
@property (nonatomic, assign) CGSize xxb_size;
@property (nonatomic, assign) CGPoint xxb_origin;

#pragma mark - 动画相关
/**
 *  在某个点添加动画
 *
 *  @param point 动画开始的点
 */
- (void)addAnimationAtPoint:(CGPoint)point;
/**
 *  在某个点添加动画
 *
 *  @param point 动画开始的点
 *  @param type  动画的类型
 *  @param animationColor 动画的颜色
 */
- (void)addAnimationAtPoint:(CGPoint)point WithType:(animationType) type withColor:(UIColor *)animationColor;
/**
 *  在某个点添加动画
 *
 *  @param point 动画开始的点
 *  @param type  动画的类型
 *  @param animationColor 动画的颜色
 *  @param completion 动画结束后的代码快
 */
- (void)addAnimationAtPoint:(CGPoint)point WithType:(animationType) type withColor:(UIColor *)animationColor completion:(void (^)(BOOL finished))completion;
/**
 *  在某个点添加动画
 *
 *  @param point      动画开始的点
 *  @param duration   动画时间
 *  @param type       动画的类型
 *  @param animationColor 动画的颜色
 *  @param completion 动画结束后的代码快
 */
- (void)addAnimationAtPoint:(CGPoint)point WithDuration:(NSTimeInterval)duration WithType:(animationType) type withColor:(UIColor *)animationColor completion:(void (^)(BOOL finished))completion;
@end
