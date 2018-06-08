//
//  XXBClassUtil.h
//  Pods-XXBLibDemo
//
//  Created by xiaobing5 on 2018/6/8.
//

#import <Foundation/Foundation.h>
@class XXBFunction;

/**
 获取一个 class 的所有的方法

 @param aClass 要获取的方法名
 @return 要获取的方法
 */
extern NSArray<XXBFunction *>* getAllFunction_XXB(Class aClass);

/**
 输出一个class的所有的function

 @param aClass 要输出function的class
 */
extern void logAllFunction_XXB(Class aClass);

@interface XXBFunction : NSObject
@property(nonatomic, assign) SEL        aSEL;

/**
 aSELName 名字
 */
@property(nonatomic, copy) NSString     *aSELName;

/**
 输入参数的个数
 */
@property(nonatomic, assign) NSInteger  inputCount;

/**
 输入参数的编码方式 v16@0:8@<**> 以 @为分割符 前两个为固定参数，其实第一个和第二个参数是固定的，第一个是接收消息的对象，而第二个是方法选择器SEL，第三个开始才是真正的参数
 */
@property(nonatomic, copy) NSString     *encodeType;


@end

@interface XXBClassUtil : NSObject

@end
