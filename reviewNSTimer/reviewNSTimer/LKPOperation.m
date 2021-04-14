//
//  LKPOperation.m
//  reviewNSTimer
//
//  Created by 李坤鹏 on 2021/4/13.
//

#import "LKPOperation.h"

@implementation LKPOperation

- (void)main {
    if (!self.isCancelled) {
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"custom --- %@", [NSThread currentThread]);
        }
    }
}

@end
