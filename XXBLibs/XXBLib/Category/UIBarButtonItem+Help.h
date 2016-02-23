//
//  UIBarButtonItem+Help.h
//  2014_11_20_PIX72
//
//  Created by Mac10.9 on 14-11-21.
//  Copyright (c) 2014年 xiaoxiaobing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Help)

/**
 *  快速创建一个包装了一个按钮的item
 */
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage;

/**
 *  快速创建一个包装了一个按钮的item 同时添加一个事件
 *
 *  @param image     正常状态的图片
 *  @param highImage 高亮图片
 *  @param target    target
 *  @param action    action
 *
 *  @return 返回包装好的item
 */
+ (UIBarButtonItem *)itemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action;
@end
