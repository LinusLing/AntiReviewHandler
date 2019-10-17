# AntiReviewHandler

根据动态的标记，做相应的动态处理。

## How to use

0. `#import <AntiReviewHandler/AntiReviewHandler.h>`

1. 配置默认的审核开关，后续以 `saveInReviewSwitchFromServer:` 设置的开关为准

   `[AntiReviewHandler configureDefaultInReviewSwitch:yesOrNo];`

2. 保存服务端返回的审核开关标志

   `[AntiReviewHandler saveInReviewSwitchFromServer:yesOrNo];`

3. 针对审核开关的相关处理

   ```objective-c
   [AntiReviewHandler dealInReviewWithSwitchOnBlock:^{
       NSLog(@"inReview");
   } SwitchOffBlock:^{
       NSLog(@"notInReview");
   }];
   ```

## Installation

```ruby
pod 'AntiReviewHandler'
```

## License

AntiReviewHandler is available under the MIT license. See the LICENSE file for more info.
