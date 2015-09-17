
/*!
 @header   SystemUtil
 @abstract 这个类的目的就是提供系统一次创建的变量，所以遇到这样的变量，就直接在这找；
           如果没有的话，请加上（而不是放过） 此外SystemUtil这个名字是我的使用习惯，
           如果有好建议，欢迎提出
 @author   zhouchen3@staff.sina.com.cn
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XXBSingleton.h"

#define SYSTEM_UTIL(args)    [[SystemUtil sharedInstance] args]

@interface XXBSystemHelp : NSObject
/**
 *  获取app的版本号
 *
 *  @return 版本号
 */
+ (NSString *)appBundleVersion;

/**
 *  获取app的构建版本号
 *
 *  @return 构建版本号
 */
+ (NSString *)appBuildVersion;
/**
 *  app的版本号 + 构架版本号
 *
 *  @return app的版本号 + 构建版本号
 */
+ (NSString *)appBundleVersion_BuildVersion;
/**
 *  documentPath路径
 *
 *  @return documentPath
 */
+ (NSString *)documentPath;

/**
 *  libraryPath路径
 *
 *  @return libraryPath
 */
+ (NSString *)libraryPath;

/**
 *  temporaryPath 路径
 *
 *  @return temporaryPath
 */
+ (NSString *)temporaryPath;
/**
 *  cachePath 路径
 *
 *  @return cachePath
 */
+ (NSString *)cachePath;
/**
 *  获取系统的版本号
 *
 *  @return 系统的版本号
 */
+ (NSString *)systemVersion;
/**
 *  是否是iOS6
 *
 *  @return 是否
 */
+ (BOOL)isIOS6;
/**
 *  是否是iOS7
 *
 *  @return 是否
 */
+ (BOOL)isIOS7;
/**
 *  是否是iOS8
 *
 *  @return 是否
 */
+ (BOOL)isIOS8;

/**
 *  是否是iOS9
 *
 *  @return 是否
 */
+ (BOOL)isIOS9;
@end
