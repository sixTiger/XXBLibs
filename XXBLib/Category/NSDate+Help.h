//
//  NSDate+MJ.h
//
//  Created by apple on 14-5-9.
//  Copyright (c) 2014年 xiaoxiaobing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Help)
/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;
@end
