//
//  NSString+Help.h
//
//  Created by Mac10.9.4 on 14-9-21.
//  Copyright (c) 2014年 xiaoxiaobing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Help)

/**
 * 命令行测试命令
 *
 *  MD5
 *  $ echo -n abc | openssl md5
 *  SHA1
 *  $ echo -n abc | openssl sha1
 *  SHA256
 *  $ echo -n abc | openssl sha -sha256
 *  SHA512
 *  $ echo -n abc | openssl sha -sha512
 *  BASE64编码(abc)
 *  $ echo -n abc | base64
 *
 *  BASE64解码(YWJj，abc的编码)
 *  $ echo -n YWJj | base64 -D
 */

/**
 *  返回md5加密后的字符串
 */
@property (nonatomic, readonly) NSString *md5String;
/**
 *  返回sha1遍吗后的字符串
 */
@property (nonatomic, readonly) NSString *sha1String;
/**
 *  返回sha256遍吗后的字符串
 */
@property (nonatomic, readonly) NSString *sha256String;
/**
 *  返回sha512遍吗后的字符串
 */
@property (nonatomic, readonly) NSString *sha512String;

/**
 *  返回Base64遍吗后的字符串
 */
@property (nonatomic, readonly) NSString *base64Encode;

/**
 *  返回Base64解码后的字符串
 */
@property (nonatomic, readonly) NSString *base64Decode;

/**
 *  计算一行字的size
 *
 *  @param fount fount
 *
 *  @return 计算好的 size
 */
- (CGSize)sizeWithStingFount:(UIFont *)fount;

/**
 *  计算字符串的size
 *
 *  @param fount   fount
 *  @param maxSize 字符串可以占据的最大的size
 *
 *  @return size
 *
 *  @exception 计算好的 size
 */
- (CGSize)sizeWithStingFount:(UIFont *)fount withMaxSize:(CGSize)maxSize;
/**
 *  判断是否是电话号码
 */
- (BOOL)isValidPhoneNum;
/**
 *  判断是否是邮箱
 */
- (BOOL)isValidEmail;
@end
