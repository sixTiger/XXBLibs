//
//  XXBLog.m
//  XXBLibDemo
//
//  Created by 杨小兵 on 15/8/24.
//  Copyright (c) 2015年 杨小兵. All rights reserved.
//

#import "XXBLog.h"

@implementation XXBLog

@end
@implementation NSDictionary (Log)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *str = [NSMutableString string];
    [str appendString:@"{\n"];
    // 遍历字典的所有键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [str appendFormat:@"\t%@ = %@,\n", key, obj];
    }];
    [str appendString:@"}"];
    // 查出最后一个,的范围
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length)
    {
        // 删掉最后一个,
        [str deleteCharactersInRange:range];
    }
    return str;
}
@end

@implementation NSArray (Log)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *str = [NSMutableString string];
    [str appendString:@"[\n"];
    // 遍历数组的所有元素
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [str appendFormat:@"%@,\n", obj];
    }];
    [str appendString:@"]"];
    // 查出最后一个,的范围
    NSRange range = [str rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length)
    {
        // 删掉最后一个,
        [str deleteCharactersInRange:range];
    }
    return str;
}
@end