//
//  NSUserDefaults+Storage.h
//  AntiReviewHandler
//
//  Created by linus on 2019/10/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define ARHStandardUserDefaults [NSUserDefaults standardUserDefaults]

@interface NSObject (Util)
+ (BOOL)arh_isNotEmpty:(id)object;
+ (BOOL)arh_isEmpty:(id)object;
@end

@interface NSUserDefaults (Storage)

- (id)arh_objectForKey:(NSString *)defaultName;

- (void)arh_setObject:(id)value forKey:(NSString *)defaultName;

- (void)arh_removeObjectForKey:(NSString *)defaultName;

/**
 * 清除当前bundle下的所有存储
 */
- (void)arh_removeAllObjects;

@end

NS_ASSUME_NONNULL_END
