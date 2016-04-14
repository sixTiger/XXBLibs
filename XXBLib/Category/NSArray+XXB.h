//
//  NSMutableArray+XXB.h
//  Pods
//
//  Created by xiaobing on 16/4/14.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (XXB)

/**
 *  获取index的元素
 *
 *  @param index 需要获取元素的下标
 *
 *  @return index下标的元素
 */
- (id)objectOrNilAtIndex:(NSUInteger)index;

/**
 *  判断数组是都越界
 *
 *  @param index 要判断的下标
 *
 *  @return 是否越界
 */
- (BOOL)containsIndex:(NSUInteger)index;
@end

@interface NSMutableArray (XXB)

/**
 *  添加一个元素
 *
 *  @return 是否添加成功
 */
- (BOOL)addObjectOrNil:(id)anObject;

/**
 *  在对应的下标插入一个元素
 *
 *  @param anObject 插入的元素
 *  @param index    需要插入的小标
 *
 *  @return 是否插入成功
 */
- (BOOL)insertObjectOrNil:(id)anObject atIndex:(NSUInteger)index;

/**
 *  移除对应下标的元素
 *
 *  @param index 需要移除的元素的下标
 *
 *  @return 是否移除成功
 */
- (BOOL)removeObjectOrNilAtIndex:(NSUInteger)index;

/**
 *  替换相应下标的元素
 *
 *  @param index    要替换元素的下标
 *  @param anObject 需啊哟替换的元素
 *
 *  @return 是否替换成功
 */
- (BOOL)replaceObjectAtIndex:(NSUInteger)index withObjectOrNil:(id)anObject;
@end
