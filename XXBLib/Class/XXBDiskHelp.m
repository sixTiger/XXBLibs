//
//  temp.m
//  netWorkConnectTest
//
//  Created by Jinhong on 15/1/28.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//

#import "XXBDiskHelp.h"

@implementation XXBDiskHelp

/**
 *  获取硬盘的容量
 *
 *  @return 硬盘的容量
 */
- (float)getTotalDiskSpace
{
    float totalSpace;
    NSError * error;
    NSDictionary * infoDic = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error: &error];
    if (infoDic)
    {
        NSNumber * fileSystemSizeInBytes = [infoDic objectForKey: NSFileSystemSize];
        totalSpace = [fileSystemSizeInBytes floatValue]/1024.0f/1024.0f/1024.0f;
        return totalSpace;
    }
    else
    {
        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", [error domain], (long)[error code]);
        return 0;
    }
}

/**
 *  获取设备的总容量
 *
 *  @return 总容量
 */
- (NSNumber *)totalDiskSpace
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fattributes objectForKey:NSFileSystemSize];
}

/**
 *  获取设备的可用容量
 *
 *  @return 可用容量
 */
- (NSNumber *)freeDiskSpace
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [fattributes objectForKey:NSFileSystemFreeSize];
}

@end
