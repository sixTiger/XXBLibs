//
//  XXBDeviceHelp.m
//  PIX72
//
//  Created by xiaoxiaobing on 14-12-24.
//  Copyright (c) 2014年 xiaoxiaobing. All rights reserved.
//

#import "XXBDeviceHelp.h"
#import <UIKit/UIKit.h>

@implementation XXBDeviceHelp

/**
 *  判断是否是iphone
 *
 *  @return YES 是
 */
+ (BOOL)isIphone
{
    NSString* deviceType = [UIDevice currentDevice].model;
    return [deviceType rangeOfString:@"iPhone"].length > 0;
}
/**
 *  判断是否是ipod
 *
 *  @return YES 是
 */
+ (BOOL)isIpod
{
    NSString* deviceType = [UIDevice currentDevice].model;
    return [deviceType rangeOfString:@"iPod"].length > 0;
}

/**
 *  判断是否是ipad
 *
 *  @return YES 是
 */
+ (BOOL)isIpad
{
    
    static BOOL isIphone;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIphone = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
    });
    return isIphone;
}

/**
 *  是否是Retina屏
 *
 *  @return 是否
 */
+ (BOOL)isRETINA
{
    static BOOL isRETINA;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isRETINA = [[UIScreen mainScreen] scale] == 2.0f;
    });
    return isRETINA;
}
/**
 *  获取屏幕的尺寸
 *
 *  @return 屏幕的尺寸
 */
+ (CGRect)screenBounds
{
    static CGRect screenBounds;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        screenBounds = [UIScreen mainScreen].bounds;
    });
    return screenBounds;
}
/**
 *  是否是iPhone5
 *
 *  @return 是否
 */
+ (BOOL)isIphone5
{
    static BOOL isIphone5;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIphone5 = [self isIphone] && ([self screenBounds].size.height == 568.0f? YES:NO);
    });
    return isIphone5;
}
/**
 *  是否是iPhone6
 *
 *  @return 是否
 */
+ (BOOL)isIphone6
{
    static BOOL isIphone6;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIphone6 = [self isIphone] && ([self screenBounds].size.height == 667.0f? YES:NO);
    });
    return isIphone6;
}
/**
 *  是否是iPhone6Plus
 *
 *  @return 是否
 */
+ (BOOL)isIphone6Plus
{
    static BOOL isIphone6Plus;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIphone6Plus = [self isIphone] && ([self screenBounds].size.height == 736.0f? YES:NO);
    });
    return isIphone6Plus;
}

@end
