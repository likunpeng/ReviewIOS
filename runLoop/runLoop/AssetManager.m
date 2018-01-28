//
//  AssetManager.m
//  runLoop
//
//  Created by lkp on 2018/1/19.
//  Copyright © 2018年 CFS. All rights reserved.
//

#import "AssetManager.h"

@implementation AssetManager

static id obj = nil;

+(instancetype)shareInstance {
    @synchronized(self) {
        if (!obj) {
            obj = [[AssetManager alloc] init];
        }
    }
    return obj;
}

+(instancetype)shareInstance02 {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[AssetManager alloc] init];
    });
    return obj;
}

@end
