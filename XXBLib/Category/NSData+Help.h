//
//  NSData+Help.h
//  XXBLibDemo
//
//  Created by 杨小兵 on 15/8/27.
//  Copyright (c) 2015年 杨小兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Help)
/**
 *  加密
 *
 *  @param key 私钥
 *
 *  @return 加密后的二进制流
 */
- (NSData *)AES256ParmEncryptWithKey:(NSString *)key;
/**
 *  解密
 *
 *  @param key 私钥
 *
 *  @return 解密后的字符串
 */
- (NSData *)AES256ParmDecryptWithKey:(NSString *)key;
@end
