//
//  Person.h
//  runLoop
//
//  Created by lkp on 2018/1/9.
//  Copyright © 2018年 CFS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonProtocol
@required
- (void)eat;

@optional
- (void)play;

@end

@interface Person : NSObject
- (void)test;
+ (void)testStaticMethod;
@end
