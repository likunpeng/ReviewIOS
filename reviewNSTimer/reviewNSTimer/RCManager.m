//
//  RCManager.m
//  reviewNSTimer
//
//  Created by 李坤鹏 on 2021/2/19.
//

#import "RCManager.h"

@implementation RCManager

static RCManager *downManager;

+ (instancetype)downLoadManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        downManager = [[RCManager alloc] init];
    });
    return downManager;
}
@end
