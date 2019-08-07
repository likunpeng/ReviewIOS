//
//  StudySynch.m
//  runLoop
//
//  Created by 李坤鹏 on 2019/8/1.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "StudySynch.h"

@implementation StudySynch

static id obj = nil;

+ (instancetype)shareInstance {
    @synchronized (self) {
        if (!obj) {
            obj = [[StudySynch alloc] init];
        }
    }
    return obj;
}


//使用dispatch_once

static id obj1 = nil;
+ (instancetype)shareOnceInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj1 = [[StudySynch alloc] init];
    });
    return obj1;
}

@end
