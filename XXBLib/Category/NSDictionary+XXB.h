//
//  NSDictionary+XXB.h
//  Pods
//
//  Created by xiaobing on 16/4/14.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (XXB)
/* OC */
- (BOOL)boolForKey:(id)aKey;
- (BOOL)boolForKey:(id)aKey defaultValue:(BOOL)defaultValue;
- (NSInteger)integerForKey:(id)aKey;
- (NSInteger)integerOrNotFoundForKey:(id)aKey;
- (NSInteger)integerForKey:(id)aKey defaultValue:(NSInteger)defaultValue;

/* OC Object */
- (NSNumber *)numberForKey:(id)aKey;
- (NSNumber *)numberForKey:(id)aKey defaultValue:(NSNumber *)defaultValue;
- (NSString *)stringForKey:(id)aKey;
- (NSString *)stringOrEmptyStringForKey:(id)akey;
- (NSString *)stringForKey:(id)akey defaultValue:(NSString *)defaultValue;
- (NSArray *)arrayForKey:(id)aKey;
- (NSArray *)arrayForKey:(id)aKey defaultValue:(NSArray *)defaultValue;
- (NSDictionary *)dictionaryForKey:(id)aKey;
- (NSDictionary *)dictionaryForKey:(id)aKey defaultValue:(NSDictionary *)defaultValue;
- (NSData *)dataForKey:(id)aKey;
- (NSData *)dataForKey:(id)aKey defaultValue:(NSData *)defaultValue;
- (NSDate *)dateForKey:(id)aKey;
- (NSDate *)dateForKey:(id)aKey defaultValue:(NSDate *)defaultValue;
- (NSURL *)URLForKey:(id)aKey;
- (NSURL *)URLForKey:(id)aKey defaultValue:(NSURL *)defaultValue;

/* OC Object More */

- (id)objectForKey:(id)aKey class:(Class)clazz;
- (id)objectForKey:(id)aKey class:(Class)clazz defaultValue:(id)defaultValue;
@end

@interface NSMutableDictionary (XXB)

/* OC */

- (void)setBool:(BOOL)value forKey:(id<NSCopying>)aKey;
- (void)setInteger:(NSInteger)value forKey:(id<NSCopying>)aKey;

/* OC More */

- (void)setUnsignedInteger:(NSUInteger)value forKey:(id<NSCopying>)aKey;

/* OC Object */

- (void)setObjectOrNil:(id)anObject forKey:(id<NSCopying>)aKey;
- (void)removeObjectForKeyOrNil:(id<NSCopying>)aKey;
@end

