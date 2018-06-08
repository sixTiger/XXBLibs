//
//  XXBClassUtil.m
//  Pods-XXBLibDemo
//
//  Created by xiaobing5 on 2018/6/8.
//

#import "XXBClassUtil.h"
#import <objc/runtime.h>

/**
 获取一个累的所有的方法
 
 @param aClass 要获取的方法名
 @return 要获取的方法
 */
extern NSArray* getAllFunction_XXB(Class aClass) {
    unsigned int methodCount =0;
    Method* methodList = class_copyMethodList(aClass,&methodCount);
    NSMutableArray *methodsArray = [NSMutableArray arrayWithCapacity:methodCount];
    
    for(int i=0; i< methodCount;i++)
    {
        Method temp = methodList[i];
        SEL name_f = method_getName(temp);
        //        NSString *name_f_string = NSStringFromSelector(name_f);
        const char* name_chars =sel_getName(name_f);
        int arguments = method_getNumberOfArguments(temp);
        const char* encodingChars =method_getTypeEncoding(temp);
        XXBFunction *function = [[XXBFunction alloc] init];
        function.aSEL = name_f;
        function.aSELName = [NSString stringWithUTF8String:name_chars];
        function.inputCount = arguments;
        function.encodeType = [NSString stringWithUTF8String:encodingChars];
        [methodsArray addObject:function];
    }
    free(methodList);
    return methodsArray;
}

/**
 输出一个class的所有的function
 
 @param aClass 要输出function的class
 */
extern void logAllFunction_XXB(Class aClass) {
    NSArray *allFunctionsArray= getAllFunction_XXB(aClass);
    for (XXBFunction *function in allFunctionsArray) {
        NSLog(@"%@",function);
    }
}
@implementation XXBFunction
- (NSString *)description {
    NSDictionary *dictionary = @{
                                 @"Class" : [self class],
                                 @"方法名字" : self.aSELName,
                                 @"参数个数" : @(self.inputCount),
                                 @"编码方式" : self.encodeType,
                                 };
    return [[NSString alloc] initWithFormat:@"%@",dictionary];
}
@end

@implementation XXBClassUtil

@end
