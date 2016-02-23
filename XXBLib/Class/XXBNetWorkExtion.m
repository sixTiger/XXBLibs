//
//  XXBNetWorkExtion.m
//  netWorkConnectTest
//
//  Created by xiaoxiaobing on 15/1/28.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netdb.h>
#import "XXBNetWorkExtion.h"
@implementation XXBNetWorkExtion

+ (NETWORK_TYPE)getNetworkTypeFromStatusBar
{
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *subviews = [[[app valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
    NSNumber *dataNetworkItemView = nil;
    for (id subview in subviews)
    {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]])
        {
            dataNetworkItemView = subview;
            break;
        }
    }
    NETWORK_TYPE nettype = NETWORK_TYPE_NONE;
    NSNumber * num = [dataNetworkItemView valueForKey:@"dataNetworkType"];
    nettype = [num intValue];
    return nettype;
}

/*关于获取运营商信息，需通过CoreTelephony Framework中的CTTelephonyNetworkInfo和CTCarrier类型。这些都在iOS 4.0后就有了。
 
 import必要的header：
 
 #import <CoreTelephony/CTCarrier.h>
 
 #import <CoreTelephony/CTTelephonyNetworkInfo.h>
 
 何判断当前网络的运营商
 
 */
//用来辨别设备所使用网络的运营商
+ (NSString*)getMobileOperatorsName

{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    if (carrier == nil)
    {
        return @"0";
    }
    NSString *code = [carrier mobileNetworkCode];
    NSLog(@"%@",code);
    switch (code.intValue) {
        case 00:
        case 02:
        case 07:
            return @"China Mobile 移动";
            break;
        case 01:
        case 06:
            return @"China Unicom 联通";
            break;
        case 03:
        case 05:
            return @"China Telecom d电信";
            break;
        case 20:
            return @"China Tietong 铁通";
            break;
        default:
            break;
    }
    return @"not in china";
}

/**
 *  判断网络是否连接
 *
 *  @return 是否连接
 */
+ (BOOL)isConnectedToNetwork
{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags)
    {
        printf("Error. Could not recover network reachability flags\n");
        return NO;
    }
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}
@end
