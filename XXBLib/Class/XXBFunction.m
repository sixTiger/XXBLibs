//
//  XXBFunction.m
//  XXBLibDemo
//
//  Created by baidu on 17/1/9.
//  Copyright © 2017年 杨小兵. All rights reserved.
//

#import "XXBFunction.h"

extern BOOL isNull(id value)
{
    if (!value) return YES;
    if ([value isKindOfClass:[NSNull class]]) return YES;
    return NO;
}

extern BOOL isEmpty(id value) {
    if (!value) return YES;
    if ([value isKindOfClass:[NSNull class]]) return YES;
    if ([value isKindOfClass:[NSString class]]) return [value length] == 0;
    return NO;
}
