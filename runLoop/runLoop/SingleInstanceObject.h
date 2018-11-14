//
//  SingleInstanceObject.h
//  runLoop
//
//  Created by lkp on 2018/11/14.
//  Copyright © 2018 CFS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleInstanceObject : NSObject
+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
