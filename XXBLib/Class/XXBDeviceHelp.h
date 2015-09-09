//
//  XXBDeviceHelp.h
//  PIX72
//
//  Created by xiaoxiaobing on 14-12-24.
//  Copyright (c) 2014年 xiaoxiaobing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XXBDeviceHelp : NSObject
/**
 *  判断是否是iphone
 *
 *  @return YES 是
 */
+ (BOOL)isIphone;
/**
 *  判断是否是ipod
 *
 *  @return YES 是
 */
+ (BOOL)isIpod;
/**
 *  判断是否是ipad
 *
 *  @return YES 是
 */
+ (BOOL)isIpad;
/**
 *  是否是Retina屏
 *
 *  @return 是否
 */
+ (BOOL)isRETINA;
/**
 *  获取屏幕的尺寸
 *
 *  @return 屏幕的尺寸
 */
+ (CGRect)screenBounds;
/**
 *  是否是iPhone5
 *
 *  @return 是否
 */
+ (BOOL)isIphone5;
/**
 *  是否是iPhone6
 *
 *  @return 是否
 */
+ (BOOL)isIphone6;
/**
 *  是否是iPhone6Plus
 *
 *  @return 是否
 */
+ (BOOL)isIphone6Plus;
@end
