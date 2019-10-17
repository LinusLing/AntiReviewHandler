//
//  AntiReviewHandler.m
//  AntiReviewHandler
//
//  Created by linus on 2019/10/17.
//

#import "AntiReviewHandler.h"
#import "NSUserDefaults+Storage.h"

NSString *const kARHAppStoreInReviewConfigFromServer = @"com.linusling.storage.key.appStoreInReviewConfig";
NSString *const kARHAppStoreInReviewSwitchNotification = @"kARHAppStoreInReviewSwitchNotification";


@implementation AntiReviewHandler

+ (void)dealInReviewWithSwitchOnBlock:(ARHInReviewBlock)inReviewBlock SwitchOffBlock:(ARHNotInReviewBlock)notInReviewBlock {
    id value = [ARHStandardUserDefaults arh_objectForKey:kARHAppStoreInReviewConfigFromServer];
    if (value && [value isKindOfClass:[NSNumber class]] && [value boolValue] == YES) {
        if (inReviewBlock != nil) {
            inReviewBlock();
        }
    } else {
        if (notInReviewBlock != nil) {
            notInReviewBlock();
        }
    }
}

+ (void)configureDefaultInReviewSwitch:(BOOL)inReviewSwitch {
    id value = [ARHStandardUserDefaults arh_objectForKey:kARHAppStoreInReviewConfigFromServer];
    if ([NSObject arh_isEmpty:value]) {
        [ARHStandardUserDefaults arh_setObject:@(inReviewSwitch) forKey:kARHAppStoreInReviewConfigFromServer];
    }
}

+ (void)saveInReviewSwitchFromServer:(BOOL)inReviewSwitch {
    id value = [ARHStandardUserDefaults arh_objectForKey:kARHAppStoreInReviewConfigFromServer];
    [ARHStandardUserDefaults arh_setObject:@(inReviewSwitch) forKey:kARHAppStoreInReviewConfigFromServer];
    if (value && [value isKindOfClass:[NSNumber class]] && [value boolValue] != inReviewSwitch) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kARHAppStoreInReviewSwitchNotification object:nil userInfo:@{kARHAppStoreInReviewSwitchNotification:@(inReviewSwitch)}];
    }
}

@end
