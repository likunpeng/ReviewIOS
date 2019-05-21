//
//  SingleInstanceObject.m
//  runLoop
//
//  Created by lkp on 2018/11/14.
//  Copyright © 2018 CFS. All rights reserved.
//

#import "SingleInstanceObject.h"

@implementation SingleInstanceObject

static SingleInstanceObject *instance = nil;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}


@end
