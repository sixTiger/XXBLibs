//
//  XXBNetworkServers.h
//  XXBLibDemo
//
//  Created by xiaobing on 16/1/6.
//  Copyright © 2016年 杨小兵. All rights reserved.
//  动态检测网络状态的变化

#import <Foundation/Foundation.h>
#import "XXBSingleton.h"

typedef enum : NSUInteger {
    XXBNetworkUnknow = -1,
    XXBNetworkNone = 0,
    XXBNetworkWiFi,
    XXBNetworkWWAN
} XXBNetworkState;

/**
 *  网络状态变化通知字段
 */
extern NSString * const XXBNetWorkStateChange;
extern NSString * const XXBNetWorkState;

@interface XXBNetworkServers : NSObject
XXBSingletonH(XXBNetworkServers);
@property(nonatomic , assign , readonly)XXBNetworkState    netWorkState;
/**
 *  启动服务
 */
- (void) startServers;

/**
 *  停止服务
 */
- (void) stopServers;

/**
 *  查看服务是否在运行
 *
 *  @return 是否运行
 */
- (BOOL) isServersRun;

@end
