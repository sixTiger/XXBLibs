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

/**
 *  获取open udid 或 adid 然后md5生成 32字符串（暂叫：did）。
 *  对这32位字符（did）做校验。
 *  校验方式： （did + 日期 + 密码）做md5生成32位字符串（暂叫：checkid）
 *  最终的deviceid = did + checkid的后8位（共40位的字符串）
 *
 * @return 设备标示
 */
+ (NSString *)Did;

/**
 *  设备标示+check码
 *
 *  @return 设备标示+8为校验码
 */
+ (NSString *)DeviceId;

/**
 *  老的方式获取唯一标示
 *
 *  @return 老方式的唯一标示
 */
+ (NSString *)oldDeviceId;
@end
