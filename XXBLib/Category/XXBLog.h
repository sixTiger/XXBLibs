//
//  XXBLog.h
//  XXBLibDemo
//
//  Created by 杨小兵 on 15/8/24.
//  Copyright (c) 2015年 杨小兵. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  编译优化
 */
#ifdef  DEBUG // 调试阶段
#define XXBLog(...) NSLog(__VA_ARGS__)
#else //发布阶段
#define XXBLog(...)
#endif
@interface XXBLog : NSObject

@end
