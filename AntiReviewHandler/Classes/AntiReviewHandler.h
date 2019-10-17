//
//  AntiReviewHandler.h
//  AntiReviewHandler
//
//  Created by linus on 2019/10/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *const kARHAppStoreInReviewSwitchNotification;
FOUNDATION_EXPORT NSString *const kARHAppStoreInReviewConfigFromServer;

typedef void(^ARHInReviewBlock)(void);
typedef void(^ARHNotInReviewBlock)(void);

@interface AntiReviewHandler : NSObject

/**
 配置默认的审核开关，后续以 `saveInReviewSwitchFromServer:` 设置的开关为准

 @param inReviewSwitch 默认审核开关
 */
+ (void)configureDefaultInReviewSwitch:(BOOL)inReviewSwitch;

/**
 针对审核开关的相关处理

 @param inReviewBlock 审核状态执行的 Block
 @param notInReviewBlock 非审核状态执行的 Block
 */
+ (void)dealInReviewWithSwitchOnBlock:(ARHInReviewBlock)inReviewBlock SwitchOffBlock:(ARHNotInReviewBlock)notInReviewBlock;

/**
 保存服务端返回的审核开关标志

 @param inReviewSwitch 审核开关 Yes Or No
 */
+ (void)saveInReviewSwitchFromServer:(BOOL)inReviewSwitch;


@end

NS_ASSUME_NONNULL_END
