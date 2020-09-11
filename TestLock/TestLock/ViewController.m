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
//    [self testPthreadMutex];
    [self testRecursiveLock];
    
}
/**
 实现递归锁
 */
- (void)testRecursiveLock {
    static pthread_mutex_t pLock;
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr); //初始化attr并且给它赋予默认
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE); //设置锁类型，这边是设置为递归锁
    pthread_mutex_init(&pLock, &attr);
    pthread_mutexattr_destroy(&attr);//销毁一个属性对象，在重新进行初始化之前该结构不能重新使用
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        static void (^RecuisiveBlock)(int);
        RecuisiveBlock = ^(int value) {
            pthread_mutex_lock(&pLock);
            if (value > 0) {
                NSLog(@"value = %d", value);
                RecuisiveBlock(value - 1);
            };
            pthread_mutex_unlock(&pLock);
        };
        RecuisiveBlock(5);
    });
    
}

- (void)testPthreadMutex {
    static pthread_mutex_t plock;
    pthread_mutex_init(&plock, NULL);
    // thread 1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"enter thread 01");
        pthread_mutex_lock(&plock);
        sleep(3);
        NSLog(@"thread 01");
        pthread_mutex_unlock(&plock);
    });
    
    // thread 2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"enter thread 02");
        pthread_mutex_lock(&plock);
        NSLog(@"thread 02");
        pthread_mutex_unlock(&plock);
    });
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
