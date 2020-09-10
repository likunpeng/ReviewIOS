//
//  ViewController.m
//  TestLock
//
//  Created by 邹婉玉 on 2020/9/10.
//  Copyright © 2020 lkp. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self testSemaphore];
    
}

- (void)testPthreadMutex {
    static pthread_mutex_t plock;
    
}

- (void)testSemaphore {
    dispatch_semaphore_t signal = dispatch_semaphore_create(0);
    // 传入值必须 >=0, 若传入为0则阻塞线程并等待timeout,时间到后会执行其后的语句
    dispatch_time_t overTime = dispatch_time(DISPATCH_TIME_NOW, 3.0f * NSEC_PER_SEC);
    // thread 1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"线程1开始等待");
        dispatch_semaphore_wait(signal, overTime);
        NSLog(@"线程1");
        dispatch_semaphore_signal(signal);
        NSLog(@"线程1发送信号");
        NSLog(@"-----------------------");
    });
    
    // thread 2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"线程2开始等待");
        dispatch_semaphore_wait(signal, overTime);
        NSLog(@"线程2");
        dispatch_semaphore_signal(signal);
        NSLog(@"线程2发送信号");
    });
}


@end
