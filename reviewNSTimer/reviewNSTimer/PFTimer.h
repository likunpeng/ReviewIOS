//
//  PFTimer.h
//  reviewNSTimer
//
//  Created by 李坤鹏 on 2021/1/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PFTimer : NSObject

/// 开启定时器
- (void)startTimer;

/// 销毁定时器
- (void)destoryTimer;

@end

NS_ASSUME_NONNULL_END
