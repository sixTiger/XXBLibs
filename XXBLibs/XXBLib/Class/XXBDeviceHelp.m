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

+ (NSString *)getUniqueStrByUUID
{
    
    NSUUID *adId = [[ASIdentifierManager sharedManager] advertisingIdentifier];
    
    return [adId UUIDString];
}

+ (NSString *)getUniqueStrByOpenUDID
{
    return nil;
//    NSString* openUDID = [OpenUDID value];
//    return openUDID;
}

+ (NSString *)md5:(NSString *)str
{
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

//+ (NSString *)getTime
//{
//    NSDate *  senddate=[NSDate date];
//    
//    if ( nil == openUDIDFormatter )
//    {
//        openUDIDFormatter = [[NSDateFormatter alloc] init];
//        [openUDIDFormatter setDateFormat:@"YYYYMMdd"];
//    }
//    
//    NSString *  locationString=[openUDIDFormatter stringFromDate:senddate];
//    
//    return locationString;
//}

+ (BOOL)CanUseOpenUDID
{
    return ([UIDevice currentDevice].systemVersion.intValue <= 6);
}

+ (NSString *)Did
{
    NSString *device = nil;
    if ([self CanUseOpenUDID])
    {
//        device = [self getUniqueStrByOpenUDID];
    }
    else
    {
        device = [self getUniqueStrByUUID];
    }
    return [self md5:device];
}

+ (NSString *)Checkid
{
    return nil;
//    return [self md5:[[self Did] stringByAppendingString:[[self getTime] stringByAppendingString:@"hongtaok"]]];
}

/*
 获取open udid 或 adid 然后md5生成 32字符串（暂叫：did）。
 
 对这32位字符（did）做校验。
 
 校验方式： （did + 日期 + 密码）做md5生成32位字符串（暂叫：checkid）
 
 最终的deviceid = did + checkid的后8位（共40位的字符串）
 
 */
+ (NSString *)DeviceId
{
    return [[self Did] stringByAppendingString: [[self Checkid] substringFromIndex:24]];
}

+ (NSString *)oldDeviceId
{
    NSString *device = nil;
    if ([self CanUseOpenUDID])
    {
        device = [self getUniqueStrByOpenUDID];
    }
    else
    {
        device = [self DeviceId];
    }
    return device;
}
@end
