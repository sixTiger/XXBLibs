//
//  XXBBlockHelp.h
//  XXBLibDemo
//
//  Created by baidu on 17/4/17.
//  Copyright © 2017年 杨小兵. All rights reserved.
//

#import <Foundation/Foundation.h>
#define XXB_BLOCK(block, ...) ((block == nil) ?  : block(__VA_ARGS__));

#define XXB_SAFE_BLOCK(block, ...)\
    if ([[NSThread currentThread] isMainThread]) {\
        XXB_BLOCK(block,__VA_ARGS__);\
    } else {\
        dispatch_async(dispatch_get_main_queue(), ^{\
            XXB_BLOCK(block,__VA_ARGS__);\
        });\
    }

@interface XXBBlockHelp : NSObject

@end
