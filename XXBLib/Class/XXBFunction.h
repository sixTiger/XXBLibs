//
//  XXBFunction.h
//  XXBLibDemo
//
//  Created by baidu on 17/1/9.
//  Copyright © 2017年 杨小兵. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * Boolean function to check for null values. Handy when you need to both check
 * for nil and [NSNUll null]
 */
extern BOOL isNull(id value);

/**
 * Boolean function to check for empty values. Handy when you need to both check
 * for nil and NSString
 */
extern BOOL isEmpty(id value);

