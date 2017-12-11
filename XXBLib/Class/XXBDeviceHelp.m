//
//  XXBDeviceHelp.m
//  PIX72
//
//  Created by xiaoxiaobing on 14-12-24.
//  Copyright (c) 2014年 xiaoxiaobing. All rights reserved.
//

#import "XXBDeviceHelp.h"
#import <UIKit/UIKit.h>
#import <AdSupport/ASIdentifierManager.h>
#import <CommonCrypto/CommonDigest.h>
#import "sys/utsname.h"
@implementation XXBDeviceHelp

/**
 *  判断是否是iphone
 *
 *  @return YES 是
 */
+ (BOOL)isIphone {
    NSString* deviceType = [UIDevice currentDevice].model;
    return [deviceType rangeOfString:@"iPhone"].length > 0;
}

/**
 *  判断是否是ipod
 *
 *  @return YES 是
 */
+ (BOOL)isIpod {
    NSString* deviceType = [UIDevice currentDevice].model;
    return [deviceType rangeOfString:@"iPod"].length > 0;
}

/**
 *  判断是否是ipad
 *
 *  @return YES 是
 */
+ (BOOL)isIpad {
    
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
+ (BOOL)isRETINA {
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
+ (CGRect)screenBounds {
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
+ (BOOL)isIphone5 {
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
+ (BOOL)isIphone6 {
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
+ (BOOL)isIphone6Plus {
    static BOOL isIphone6Plus;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIphone6Plus = [self isIphone] && ([self screenBounds].size.height == 736.0f? YES:NO);
    });
    return isIphone6Plus;
}

+ (NSString *)getUniqueStrByUUID {
    
    NSUUID *adId = [[ASIdentifierManager sharedManager] advertisingIdentifier];
    return [adId UUIDString];
}

+ (NSString *)getUniqueStrByOpenUDID {
    return nil;
//    NSString* openUDID = [OpenUDID value];
//    return openUDID;
}

+ (NSString *)md5:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (BOOL)CanUseOpenUDID {
    return ([UIDevice currentDevice].systemVersion.intValue <= 6);
}

+ (NSString *)Did {
    NSString *device = nil;
    if ([self CanUseOpenUDID])
    {
//        device = [self getUniqueStrByOpenUDID];
    } else {
        device = [self getUniqueStrByUUID];
    }
    return [self md5:device];
}

+ (NSString *)Checkid {
    return nil;
//    return [self md5:[[self Did] stringByAppendingString:[[self getTime] stringByAppendingString:@"hongtaok"]]];
}

/*
 获取open udid 或 adid 然后md5生成 32字符串（暂叫：did）。
 
 对这32位字符（did）做校验。
 
 校验方式： （did + 日期 + 密码）做md5生成32位字符串（暂叫：checkid）
 
 最终的deviceid = did + checkid的后8位（共40位的字符串）
 
 */
+ (NSString *)DeviceId {
    return [[self Did] stringByAppendingString: [[self Checkid] substringFromIndex:24]];
}

+ (NSString *)oldDeviceId {
    NSString *device = nil;
    if ([self CanUseOpenUDID]) {
        device = [self getUniqueStrByOpenUDID];
    } else {
        device = [self DeviceId];
    }
    return device;
}

+ (XXBDeviceType)getDeviceType {
    static XXBDeviceType deviceType;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
        //iPhone
        if ([deviceString isEqualToString:@"iPhone10,6"]){
            deviceType = XXBDeviceTypeiPhoneX;
        } else if ([deviceString isEqualToString:@"iPhone10,5"]){
            deviceType = XXBDeviceTypeiPhone8P;
        } else if ([deviceString isEqualToString:@"iPhone10,4"]){
            deviceType = XXBDeviceTypeiPhone8;
        } else if ([deviceString isEqualToString:@"iPhone10,3"]){
            deviceType = XXBDeviceTypeiPhoneX;
        } else if ([deviceString isEqualToString:@"iPhone10,2"]){
            deviceType = XXBDeviceTypeiPhone8P;
        } else if ([deviceString isEqualToString:@"iPhone10,1"]){
            deviceType = XXBDeviceTypeiPhone8;
        } else if ([deviceString isEqualToString:@"iPhone9,4"]){
            deviceType = XXBDeviceTypeiPhone7P;
        } else if ([deviceString isEqualToString:@"iPhone9,3"]){
            deviceType = XXBDeviceTypeiPhone7;
        } else if ([deviceString isEqualToString:@"iPhone9,2"]){
            deviceType = XXBDeviceTypeiPhone7P;
        } else if ([deviceString isEqualToString:@"iPhone9,1"]){
            deviceType = XXBDeviceTypeiPhone7;
        } else if ([deviceString isEqualToString:@"iPhone8,4"]){
            deviceType = XXBDeviceTypeiPhoneSE;
        } else if ([deviceString isEqualToString:@"iPhone8,2"]){
            deviceType = XXBDeviceTypeiPhone6SP;
        } else if ([deviceString isEqualToString:@"iPhone8,1"]){
            deviceType = XXBDeviceTypeiPhone6S;
        } else if ([deviceString isEqualToString:@"iPhone7,2"]){
            deviceType = XXBDeviceTypeiPhone6;
        } else if ([deviceString isEqualToString:@"iPhone7,1"]){
            deviceType = XXBDeviceTypeiPhone6P;
        } else if ([deviceString isEqualToString:@"iPhone6,2"]){
            deviceType = XXBDeviceTypeiPhone5S;
        } else if ([deviceString isEqualToString:@"iPhone6,1"]){
            deviceType = XXBDeviceTypeiPhone5S;
        } else if ([deviceString isEqualToString:@"iPhone5,4"]){
            deviceType = XXBDeviceTypeiPhone5C;
        } else if ([deviceString isEqualToString:@"iPhone5,3"]){
            deviceType = XXBDeviceTypeiPhone5C;
        } else if ([deviceString isEqualToString:@"iPhone5,2"]){
            deviceType = XXBDeviceTypeiPhone5;
        } else if ([deviceString isEqualToString:@"iPhone5,1"]){
            deviceType = XXBDeviceTypeiPhone5;
        } else if ([deviceString isEqualToString:@"iPhone4,1"]){
            deviceType = XXBDeviceTypeiPhone4S;
        } else if ([deviceString isEqualToString:@"iPhone3,3"]){
            deviceType = XXBDeviceTypeiPhone4;
        } else if ([deviceString isEqualToString:@"iPhone3,2"]){
            deviceType = XXBDeviceTypeiPhone4;
        } else if ([deviceString isEqualToString:@"iPhone3,1"]){
            deviceType = XXBDeviceTypeiPhone3GS;
        } else if ([deviceString isEqualToString:@"iPhone2,1"]){
            deviceType = XXBDeviceTypeiPhone3G;
        } else if ([deviceString isEqualToString:@"iPhone1,1"]){
            deviceType = XXBDeviceTypeiPhone;
        } else if ([deviceString isEqualToString:@"iPod7,1"]){
            //iPod
            deviceType = XXBDeviceTypeiPodTouch6;
        } else if ([deviceString isEqualToString:@"iPod5,1"]){
            deviceType = XXBDeviceTypeiPodTouch5;
        } else if ([deviceString isEqualToString:@"iPod4,1"]){
            deviceType = XXBDeviceTypeiPodTouch4;
        } else if ([deviceString isEqualToString:@"iPod3,1"]){
            deviceType = XXBDeviceTypeiPodTouch3;
        } else if ([deviceString isEqualToString:@"iPod2,1"]){
            deviceType = XXBDeviceTypeiPodTouch2;
        } else if ([deviceString isEqualToString:@"iPod1,1"]){
            deviceType = XXBDeviceTypeiPodTouch;
        } else if ([deviceString isEqualToString:@"iPad7,4"]){
            //iPad
            deviceType = XXBDeviceTypeiPadPro10_5;
        } else if ([deviceString isEqualToString:@"iPad7,3"]){
            deviceType = XXBDeviceTypeiPadPro10_5;
        } else if ([deviceString isEqualToString:@"iPad7,2"]){
            deviceType = XXBDeviceTypeiPadPro12_9_2;
        } else if ([deviceString isEqualToString:@"iPad7,1"]){
            deviceType = XXBDeviceTypeiPadPro12_9_2;
        } else if ([deviceString isEqualToString:@"iPad6,12"]){
            deviceType = XXBDeviceTypeiPad5;
        } else if ([deviceString isEqualToString:@"iPad6,11"]){
            deviceType = XXBDeviceTypeiPad5;
        } else if ([deviceString isEqualToString:@"iPad6,8"]){
            deviceType = XXBDeviceTypeiPadPro12_9;
        } else if ([deviceString isEqualToString:@"iPad6,7"]){
            deviceType = XXBDeviceTypeiPadPro12_9;
        } else if ([deviceString isEqualToString:@"iPad6,4"]){
            deviceType = XXBDeviceTypeiPadPro9_7;
        } else if ([deviceString isEqualToString:@"iPad6,3"]){
            deviceType = XXBDeviceTypeiPadPro9_7;
        } else if ([deviceString isEqualToString:@"iPad5,4"]){
            deviceType = XXBDeviceTypeiPadAir2;
        } else if ([deviceString isEqualToString:@"iPad5,3"]){
            deviceType = XXBDeviceTypeiPadAir2;
        } else if ([deviceString isEqualToString:@"iPad5,2"]){
            deviceType = XXBDeviceTypeiPadMini4;
        } else if ([deviceString isEqualToString:@"iPad5,1"]){
            deviceType = XXBDeviceTypeiPadMini4;
        } else if ([deviceString isEqualToString:@"iPad4,9"]){
            deviceType = XXBDeviceTypeiPadMini3;
        } else if ([deviceString isEqualToString:@"iPad4,8"]){
            deviceType = XXBDeviceTypeiPadMini3;
        } else if ([deviceString isEqualToString:@"iPad4,7"]){
            deviceType = XXBDeviceTypeiPadMini3;
        } else if ([deviceString isEqualToString:@"iPad4,6"]){
            deviceType = XXBDeviceTypeiPadMini2;
        } else if ([deviceString isEqualToString:@"iPad4,5"]){
            deviceType = XXBDeviceTypeiPadMini2;
        } else if ([deviceString isEqualToString:@"iPad4,4"]){
            deviceType = XXBDeviceTypeiPadMini2;
        } else if ([deviceString isEqualToString:@"iPad4,2"]){
            deviceType = XXBDeviceTypeiPadAir;
        } else if ([deviceString isEqualToString:@"iPad4,1"]){
            deviceType = XXBDeviceTypeiPadAir;
        } else if ([deviceString isEqualToString:@"iPad3,6"]){
            deviceType = XXBDeviceTypeiPad4;
        } else if ([deviceString isEqualToString:@"iPad3,5"]){
            deviceType = XXBDeviceTypeiPad4;
        } else if ([deviceString isEqualToString:@"iPad3,4"]){
            deviceType = XXBDeviceTypeiPad4;
        } else if ([deviceString isEqualToString:@"iPad3,3"]){
            deviceType = XXBDeviceTypeiPad3;
        } else if ([deviceString isEqualToString:@"iPad3,2"]){
            deviceType = XXBDeviceTypeiPad3;
        } else if ([deviceString isEqualToString:@"iPad3,1"]){
            deviceType = XXBDeviceTypeiPad3;
        } else if ([deviceString isEqualToString:@"iPad2,7"]){
            deviceType = XXBDeviceTypeiPadMini;
        } else if ([deviceString isEqualToString:@"iPad2,6"]){
            deviceType = XXBDeviceTypeiPadMini;
        } else if ([deviceString isEqualToString:@"iPad2,5"]){
            deviceType = XXBDeviceTypeiPadMini;
        } else if ([deviceString isEqualToString:@"iPad2,4"]){
            deviceType = XXBDeviceTypeiPad2;
        } else if ([deviceString isEqualToString:@"iPad2,3"]){
            deviceType = XXBDeviceTypeiPad2;
        } else if ([deviceString isEqualToString:@"iPad2,3"]){
            deviceType = XXBDeviceTypeiPad2;
        } else if ([deviceString isEqualToString:@"iPad2,1"]){
            deviceType = XXBDeviceTypeiPad2;
        } else if ([deviceString isEqualToString:@"iPad1,2"]){
            deviceType = XXBDeviceTypeiPad3G;
        } else if ([deviceString isEqualToString:@"iPad1,1"]){
            deviceType = XXBDeviceTypeiPad;
        } else if ([deviceString isEqualToString:@"i386"]){
            deviceType = XXBDeviceTypeSimulator_i386;
        } else if ([deviceString isEqualToString:@"x86_64"]){
            deviceType = XXBDeviceTypeSimulator_X86_64;
        } else {
            deviceType = XXBDeviceTypeUnKnown;
        }
    });
    return deviceType;
}
@end
