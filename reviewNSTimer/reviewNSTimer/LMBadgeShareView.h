//
//  LMBadgeShareView.h
//  limiVideo

//  Created by 李坤鹏 on 2021/2/3.
//  Copyright © 2021 LIMI Technology. All rights reserved.
//

/**
  徽章分享的UI 需要客户端自己生成
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMBadgeShareView : UIView

- (instancetype)initWithData:(NSDictionary *)data;

@end

NS_ASSUME_NONNULL_END
