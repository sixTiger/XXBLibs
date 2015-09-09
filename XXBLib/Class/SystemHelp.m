//
//  SystemUtil.m
//  subway
//
//  Created by zhouchen on 14-8-6.
//  Copyright (c) 2014年 sina. All rights reserved.
//

#import "SystemHelp.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation SystemHelp
XXBSingletonM(SystemHelp);

- (NSString *)appBundleVersion
{
    static NSString *appVersion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appVersion = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]copy];
    });
    return appVersion;
}

- (NSString *)appBuildVersion
{
    static NSString *appVersion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appVersion = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"] copy];
    });
    return appVersion;
}

- (NSString *)appBundleVersion_BuildVersion
{
    static NSString *appVersion_Build;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        appVersion_Build = [[NSString stringWithFormat:@"%@.%@", [self appBundleVersion], [self appBuildVersion]] copy];
    });
    return appVersion_Build;
}

- (NSString *)systemVersion
{
    static NSString *systemVersion;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        systemVersion = [[[UIDevice currentDevice] systemVersion] copy];
    });
    return systemVersion;
}

- (NSString *)platform
{
    static NSString *platform;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        platform = [[self platform] copy];
    });
    return platform;
}

- (CGRect)screenBounds
{
    static CGRect screenBounds;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        screenBounds = [[UIScreen mainScreen ] bounds];
    });
    return screenBounds;
}

- (BOOL)isRETINA
{
    static BOOL isRETINA;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isRETINA = [[UIScreen mainScreen] scale] == 2.0f;
    });
    return isRETINA;
}

- (BOOL)isIphone5
{
    static BOOL isIphone5;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIphone5 = [self isIphone] && ([self screenBounds].size.height == 568.0f? YES:NO);
    });
    return isIphone5;
}

- (BOOL)isIphone6
{
    static BOOL isIphone6;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIphone6 = [self isIphone] && ([self screenBounds].size.height == 667.0f? YES:NO);
    });
    return isIphone6;
}

- (BOOL)isIphone6Plus
{
    static BOOL isIphone6Plus;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIphone6Plus = [self isIphone] && ([self screenBounds].size.height == 736.0f? YES:NO);
    });
    return isIphone6Plus;
}

- (BOOL)isIOS6
{
    static BOOL isIOS6;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIOS6 = [[self systemVersion] floatValue] >= 6.0;
    });
    return isIOS6;
}

- (BOOL)isIOS7
{
    static BOOL isIOS7;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIOS7 = [[self systemVersion] floatValue] >= 7.0;
    });
    return isIOS7;
}

- (BOOL)isIOS8
{
    static BOOL isIOS8;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isIOS8 = [[self systemVersion] floatValue] >= 8.0;
    });
    return isIOS8;
}

- (NSString *)documentPath
{
    static NSString *documentPath;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        documentPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] copy];
    });
    return documentPath;
}

- (NSString *)libraryPath
{
    static NSString *libraryPath;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        libraryPath = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] copy];
    });
    return libraryPath;
}

- (NSString *)temporaryPath
{
    static NSString *temporaryPath;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        temporaryPath = [NSTemporaryDirectory() copy];
    });
    return temporaryPath;
}

- (NSString *)cachePath
{
    static NSString *cachePath;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cachePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] copy];
    });
    return cachePath;
}
@end
