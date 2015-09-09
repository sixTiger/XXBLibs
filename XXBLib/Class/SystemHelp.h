
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

@interface SystemHelp : NSObject
XXBSingletonH(SystemHelp);
/**
 *  获取app的版本号
 *
 *  @return 版本号
 */
- (NSString *)appBundleVersion;

/**
 *  获取app的构建版本号
 *
 *  @return 构建版本号
 */
- (NSString *)appBuildVersion;
/**
 *  app的版本号 + 构架版本号
 *
 *  @return app的版本号 + 构建版本号
 */
- (NSString *)appBundleVersion_BuildVersion;
/**
 *  获取系统的版本号
 *
 *  @return 系统的版本号
 */
- (NSString *)systemVersion;

/**
 *  获取屏幕的尺寸
 *
 *  @return 屏幕的尺寸
 */
- (CGRect)screenBounds;

/**
 *  是否是Retina屏
 *
 *  @return 是否
 */
- (BOOL)isRETINA;

/*!
 @method isIphone
 @brief 判断是否是iPhone
 @return isIphone
 */
- (BOOL)isIphone;

/*!
 @method isIphone5
 @brief 判断是否是isIphone5或以上
 @return isIphone5
 */
- (BOOL)isIphone5;
- (BOOL)isIphone6;
- (BOOL)isIphone6Plus;

/*!
 @method isIOS7
 @brief 判断是否是IOS7或以上
 @return isIOS7
 */
- (BOOL)isIOS6;
- (BOOL)isIOS7;
- (BOOL)isIOS8;

/*!
 @method documentPath
 @brief 获取document路径
 @return document路径
 */
- (NSString *)documentPath;

/*!
 @method libraryPath
 @brief 获取library路径
 @return library路径
 */
- (NSString *)libraryPath;

/*!
 @method temporaryPath
 @brief 获取temporaryPath路径
 @return temporaryPath路径
 */
- (NSString *)temporaryPath;

/*!
 @method cachePath
 @brief 获取cachePath路径
 @return cachePath路径
 */
- (NSString *)cachePath;

@end
