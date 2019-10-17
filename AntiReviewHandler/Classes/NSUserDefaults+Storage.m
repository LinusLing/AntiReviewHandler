//
//  NSUserDefaults+Storage.m
//  AntiReviewHandler
//
//  Created by linus on 2019/10/17.
//

#import "NSUserDefaults+Storage.h"

@implementation NSObject (Util)

+ (BOOL)arh_isNotEmpty:(id)object {
    return !ARHIsObjectEmpty(object);
}

+ (BOOL)arh_isEmpty:(id)object {
    return ARHIsObjectEmpty(object);
}

BOOL ARHIsObjectNone(id object) {
    return object == nil || [object isKindOfClass:[NSNull class]];
}

BOOL ARHIsObjectEmpty(id object) {
    BOOL isEmpty = ARHIsObjectNone(object);
    if (!isEmpty) {
        if ([object respondsToSelector:@selector(length)]) {
            isEmpty = [object length] == 0;
        } else if ([object respondsToSelector:@selector(count)]) {
            isEmpty = [object count] == 0;
        }
    }
    return isEmpty;
}
@end

@implementation NSUserDefaults (Storage)

- (id)arh_objectForKey:(NSString *)defaultName {
    return [self objectForKey:defaultName];
}

- (void)arh_setObject:(id)value forKey:(NSString *)defaultName {
    if ([NSObject arh_isNotEmpty:value]) {
        [self setObject:value forKey:defaultName];
    } else {
        [self removeObjectForKey:defaultName];
    }
}

- (void)arh_removeObjectForKey:(NSString *)defaultName {
    [self removeObjectForKey:defaultName];
}

- (void)arh_removeAllObjects {
    [self removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];
}

@end


