//
//  NSDictionary+XXB.m
//  Pods
//
//  Created by xiaobing on 16/4/14.
//
//

#import "NSDictionary+XXB.h"

@implementation NSDictionary (XXB)
//bool
- (BOOL)boolForKey:(id)aKey {
    return [self boolForKey:aKey defaultValue:NO];
}

- (BOOL)boolForKey:(id)aKey defaultValue:(BOOL)defaultValue {
    id object = [self objectForKey:aKey];
    if ([object respondsToSelector:@selector(boolValue)]) {
        return [object boolValue];
    }
    return defaultValue;
}

//integer
- (NSInteger)integerForKey:(id)aKey {
    return [self integerForKey:aKey defaultValue:0];
}
- (NSInteger)integerOrNotFoundForKey:(id)aKey {
    return [self integerForKey:aKey defaultValue:NSNotFound];
}
- (NSInteger)integerForKey:(id)aKey defaultValue:(NSInteger)defaultValue {
    id object = [self objectForKey:aKey];
    if ([object respondsToSelector:@selector(integerValue)]) {
        return [object integerValue];
    }
    return defaultValue;
}



- (NSNumber *)numberForKey:(id)aKey {
    return [self numberForKey:aKey defaultValue:nil];
}
- (NSNumber *)numberForKey:(id)aKey defaultValue:(NSNumber *)defaultValue {
    return (NSNumber *)[self objectForKey:aKey class:[NSNumber class] defaultValue:defaultValue];
}

- (NSString *)stringForKey:(id)aKey {
    return [self stringForKey:aKey defaultValue:nil];
}
- (NSString *)stringOrEmptyStringForKey:(id)akey {
    return [self stringForKey:akey defaultValue:@""];
}
- (NSString *)stringForKey:(id)aKey defaultValue:(NSString *)defaultValue {
    id object = [self objectForKey:aKey];
    if (!object || object == [NSNull null]) {
        return defaultValue;
    }
    if ([object isKindOfClass:[NSString class]]) {
        return (NSString *)object;
    }
    return [object description];
}

- (NSArray *)arrayForKey:(id)aKey {
    return [self arrayForKey:aKey defaultValue:nil];
}
- (NSArray *)arrayForKey:(id)aKey defaultValue:(NSArray *)defaultValue {
    return (NSArray *)[self objectForKey:aKey class:[NSArray class] defaultValue:defaultValue];
}

- (NSDictionary *)dictionaryForKey:(id)aKey {
    return [self dictionaryForKey:aKey defaultValue:nil];
}
- (NSDictionary *)dictionaryForKey:(id)aKey defaultValue:(NSDictionary *)defaultValue {
    return (NSDictionary *)[self objectForKey:aKey class:[NSDictionary class] defaultValue:defaultValue];
}

- (NSData *)dataForKey:(id)aKey {
    return [self dataForKey:aKey defaultValue:nil];
}
- (NSData *)dataForKey:(id)aKey defaultValue:(NSData *)defaultValue {
    return (NSData *)[self objectForKey:aKey class:[NSData class] defaultValue:defaultValue];
}

- (NSDate *)dateForKey:(id)aKey {
    return [self dateForKey:aKey defaultValue:nil];
}
- (NSDate *)dateForKey:(id)aKey defaultValue:(NSDate *)defaultValue {
    return (NSDate *)[self objectForKey:aKey class:[NSDate class] defaultValue:defaultValue];
}

- (NSURL *)URLForKey:(id)aKey {
    return [self URLForKey:aKey defaultValue:nil];
}
- (NSURL *)URLForKey:(id)aKey defaultValue:(NSURL *)defaultValue {
    return (NSURL *)[self objectForKey:aKey class:[NSURL class] defaultValue:defaultValue];
}

/* OC Object More */

- (id)objectForKey:(id)aKey class:(Class)clazz {
    return [self objectForKey:aKey class:clazz defaultValue:nil];
}

- (id)objectForKey:(id)aKey class:(Class)clazz defaultValue:(id)defaultValue {
    //    return [self objectForKey:aKey class:clazz defaultValue:defaultValue];
    id object = [self objectForKey:aKey];
    if (!clazz || [object isKindOfClass:clazz]) {
        return object;
    }
    return defaultValue;
    
}
@end

#pragma mark -

@implementation NSMutableDictionary (XXB)

//@see http://stackoverflow.com/questions/21473498/warning-sending-nsobject-to-parameter-of-incompatible-type-idnscopying

- (void)setBool:(BOOL)value forKey:(id<NSCopying>)aKey {
    [self setObject:@(value) forKey:aKey];
}

- (void)setInteger:(NSInteger)value forKey:(id<NSCopying>)aKey {
    [self setObject:@(value) forKey:aKey];
}

- (void)setUnsignedInteger:(NSUInteger)value forKey:(id<NSCopying>)aKey {
    [self setObject:@(value) forKey:aKey];
}

- (void)setObjectOrNil:(id)anObject forKey:(id<NSCopying>)aKey {
    if (!aKey) {
        return;
    }
    
    if (!anObject) {
        [self removeObjectForKey:aKey];
        return;
    }
    
    [self setObject:anObject forKey:aKey];
}

- (void)removeObjectForKeyOrNil:(id<NSCopying>)aKey {
    if (aKey) {
        [self removeObjectForKey:aKey];
    }
}

@end
