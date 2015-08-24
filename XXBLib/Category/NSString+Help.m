//  NSString+Help.m
//
//  Created by Mac10.9.4 on 14-9-21.
//  Copyright (c) 2014年 xiaoxiaobing. All rights reserved.
//

#import "NSString+Help.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (Help)

/**
 *  返回md5加密后的字符串
 */
- (NSString *)md5String
{
    const char *str = self.UTF8String;
    int length = (int)strlen(str);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, length, bytes);
    
    return [self stringFromBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}
/**
 *  返回sha1遍吗后的字符串
 */
- (NSString *)sha1String
{
    const char *str = self.UTF8String;
    int length = (int)strlen(str);
    unsigned char bytes[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(str, length, bytes);
    
    return [self stringFromBytes:bytes length:CC_SHA1_DIGEST_LENGTH];
}
/**
 *  返回sha256遍吗后的字符串
 */
- (NSString *)sha256String
{
    const char *str = self.UTF8String;
    int length = (int)strlen(str);
    unsigned char bytes[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, length, bytes);
    
    return [self stringFromBytes:bytes length:CC_SHA256_DIGEST_LENGTH];
}
/**
 *  返回sha512遍吗后的字符串
 */
- (NSString *)sha512String
{
    const char *str = self.UTF8String;
    int length = (int)strlen(str);
    unsigned char bytes[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(str, length, bytes);
    
    return [self stringFromBytes:bytes length:CC_SHA512_DIGEST_LENGTH];
}

- (NSString *)stringFromBytes:(unsigned char *)bytes length:(int)length
{
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02x", bytes[i]];
    }
    return [strM copy];
}
/**
  *  返回Base64遍吗后的字符串
  */
- (NSString *)base64Encode {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
}
/**
 *  返回Base64解码后的字符串
 */
- (NSString *)base64Decode {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

/**
 *  计算一行字的size
 *
 *  @param fount fount
 *
 *  @return 计算好的 size
 */
- (CGSize)sizeWithStingFount:(UIFont *)fount
{
    return [self sizeWithStingFount:fount withMaxSize:CGSizeMake(MAXFLOAT, 0)];
}

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
{
    NSDictionary *attrs = @{NSFontAttributeName : fount};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
/**
 *  判断是否是电话号码
 */
- (BOOL)isValidPhoneNum
{
    // 11位数字, 1开头
    NSString *phoneRegex =  @"^1(3[0-9]|4[57]|5[0-35-9]|8[025-9])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}
/**
 *  判断是否是邮箱
 */
- (BOOL)isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}
@end
