//
//  TestModelWithKVC.h
//  runLoop
//
//  Created by lkp on 2019/4/18.
//  Copyright © 2019 CFS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestModelWithKVC : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;
//在模型中提供这个方法即可，每个模型都要实现这个方法
+ (__kindof TestModelWithKVC *)statusModelWithDic:(NSDictionary *)dic;
@end

NS_ASSUME_NONNULL_END
