//
//  SystemUtil.m
//  subway
//
//  Created by zhouchen on 14-8-6.
//  Copyright (c) 2014年 sina. All rights reserved.
//

#import "XXBSystemHelp.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation XXBSystemHelp
/**
 *  获取app的版本号
 *
 *  @return 版本号
 */
+ (NSString *)appBundleVersion
{
    static NSString *appVersion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appVersion = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]copy];
    });
    return appVersion;
}

/**
 *  获取app的构建版本号
 *
 *  @return 构建版本号
 */
+ (NSString *)appBuildVersion
{
    static NSString *appVersion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appVersion = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] copy];
    });
    return appVersion;
}

/**
 *  app的版本号 + 构架版本号
 *
 *  @return app的版本号 + 构建版本号
 */
+ (NSString *)appBundleVersion_BuildVersion
{
    static NSString *appVersion_Build;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appVersion_Build = [[NSString stringWithFormat:@"%@.%@", [self appBundleVersion], [self appBuildVersion]] copy];
    });
    return appVersion_Build;
}

/**
 *  documentPath路径
 *
 *  @return documentPath
 */
+ (NSString *)documentPath
{
    static NSString *documentPath;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        documentPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] copy];
    });
    return documentPath;
}

/**
 *  libraryPath路径
 *
 *  @return libraryPath
 */
+ (NSString *)libraryPath
{
    static NSString *libraryPath;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        libraryPath = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] copy];
    });
    return libraryPath;
}

/**
 *  temporaryPath 路径
 *
 *  @return temporaryPath
 */
+ (NSString *)temporaryPath
{
    static NSString *temporaryPath;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        temporaryPath = [NSTemporaryDirectory() copy];
    });
    return temporaryPath;
}

/**
 *  cachePath 路径
 *
 *  @return cachePath
 */
+ (NSString *)cachePath
{
    static NSString *cachePath;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cachePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] copy];
    });
    return cachePath;
}

/**
 *  获取系统的版本号
 *
 *  @return 系统的版本号
 */
+ (NSString *)systemVersion
{
    static NSString *systemVersion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        systemVersion = [[[UIDevice currentDevice] systemVersion] copy];
    });
    return systemVersion;
}

/**
 *  是否是iOS6
 *
 *  @return 是否
 */
+ (BOOL)isIOS6
{
    static BOOL isIOS6;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIOS6 = [[self systemVersion] floatValue] >= 6.0 && [[self systemVersion] floatValue] < 7.0;
    });
    return isIOS6;
}

/**
 *  是否是iOS7
 *
 *  @return 是否
 */
+ (BOOL)isIOS7
{
    static BOOL isIOS7;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIOS7 = [[self systemVersion] floatValue] >= 7.0 && [[self systemVersion] floatValue] < 8.0;
    });
    return isIOS7;
}

/**
 *  是否是iOS8
 *
 *  @return 是否
 */
+ (BOOL)isIOS8
{
    static BOOL isIOS8;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIOS8 = [[self systemVersion] floatValue] >= 8.0 &&[[self systemVersion] floatValue] < 8.0;
    });
    return isIOS8;
}

/**
 *  是否是iOS9
 *
 *  @return 是否
 */
+ (BOOL)isIOS9
{
    
    static BOOL isIOS9;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIOS9 = [[self systemVersion] floatValue] >= 9.0 &&[[self systemVersion] floatValue] < 10.0;
    });
    return isIOS9;
}
@end
