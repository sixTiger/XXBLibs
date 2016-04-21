//
//  XXBNetWorkExtion.h
//  netWorkConnectTest
//
//  Created by xiaoxiaobing on 15/1/28.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//  网络判断工具类
//  不建议使用该方法，该方法可能会不准确

#import <Foundation/Foundation.h>

@interface XXBNetWorkExtion : NSObject

////  网络类型
typedef enum {
    NETWORK_TYPE_NONE,		//	没有联网
    NETWORK_TYPE_TWW,
    NETWORK_TYPE_2G ,		//	2G
    NETWORK_TYPE_3G ,		//	3G
    NETWORK_TYPE_4G ,		//	4G
    NETWORK_TYPE_LET ,		//  LTE
    NETWORK_TYPE_WIFI,
}NETWORK_TYPE;

/**
 *  获取网络类型
 *
 *  @return 网络的类型
 */
+ (NETWORK_TYPE)getNetworkTypeFromStatusBar;

/**
 *  获取运营商的信息
 *
 *  @return 移动运营商的名字
 */
+ (NSString*)getMobileOperatorsName;

/**
 *  判断网络是否连接
 *
 *  @return 是否连接
 */
+ (BOOL)isConnectedToNetwork;
@end
