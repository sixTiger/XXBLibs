//
//  NSDate+MJ.h
//
//  Created by apple on 14-5-9.
//  Copyright (c) 2014年 xiaoxiaobing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Help)
/**
 *  返回当前时间 格式 2015-08-25  19:04:36
 *
 *  @return 当前时间的字符串 格式 2015-08-25  19:04:36
 */
+ (NSString *)localTime;
/**
 *  返回当前时间 格式 2015年08月25日
 *
 *  @return 当前时间的字符串 格式 2015年08月25日
 */
+ (NSString *)localTimeYMD;
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
