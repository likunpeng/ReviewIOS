//
//  PFTimer.m
//  reviewNSTimer
//
//  Created by 李坤鹏 on 2021/1/23.
//

#import "PFTimer.h"

@implementation PFTimer {
    NSTimer *timer;
}

- (void)startTimer {
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(work) userInfo:nil repeats:YES];
}

- (void)work {
    NSLog(@"timer is working");
}

- (void)destoryTimer {
    NSLog(@"%s", __func__);
    [timer invalidate];
    timer = nil;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
