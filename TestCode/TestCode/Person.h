//
//  Person.h
//  TestCode
//
//  Created by lkp on 2017/12/14.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int(^blockl)(void);
typedef void(^SayHello)(void);

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, copy) SayHello block111;
@end
