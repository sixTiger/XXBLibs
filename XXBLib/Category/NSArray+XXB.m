//
//  NSMutableArray+XXB.m
//  Pods
//
//  Created by xiaobing on 16/4/14.
//
//

#import "NSArray+XXB.h"

@implementation NSArray (XXB)
- (id)objectOrNilAtIndex:(NSUInteger)index {
    return [self containsIndex:index] ? [self objectAtIndex:index] : nil;
}

- (BOOL)containsIndex:(NSUInteger)index {
    return index < [self count];
}

@end

@implementation NSMutableArray (XXB)

- (BOOL)addObjectOrNil:(id)anObject {
    if (!anObject) {
        return NO;
    }
    [self addObject:anObject];
    return YES;
}

- (BOOL)insertObjectOrNil:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject || index > [self count]) {
        return NO;
    }
    [self insertObject:anObject atIndex:index];
    return YES;
}

- (BOOL)removeObjectOrNilAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return NO;
    }
    [self removeObjectAtIndex:index];
    return YES;
}

- (BOOL)replaceObjectAtIndex:(NSUInteger)index withObjectOrNil:(id)anObject {
    if (!anObject || index >= [self count]) {
        return NO;
    }
    [self replaceObjectAtIndex:index withObject:anObject];
    return YES;
}

@end
