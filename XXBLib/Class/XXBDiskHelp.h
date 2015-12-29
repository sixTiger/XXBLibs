//
//  temp.h
//  netWorkConnectTest
//
//  Created by Jinhong on 15/1/28.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXBDiskHelp : NSObject

/**
 *  获取硬盘的容量
 *
 *  @return 硬盘的容量
 */
- (float)getTotalDiskSpace;

/**
 *  获取设备的总容量
 *
 *  @return 总容量
 */
- (NSNumber *)totalDiskSpace;

/**
 *  获取设备的可用容量
 *
 *  @return 可用容量
 */
- (NSNumber *)freeDiskSpace;
@end
