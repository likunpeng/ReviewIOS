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
//    [self testRecursiveLock];
//    [self testNSLock];
//    [self testConditionLock];
//    [self testConditionLock02];
//    [self testRecursiveLock02];
//    [self testSynchronized];
    [self testConditionLockX];
}
// 条件锁 看看后面跟的相关条件
- (void)testConditionLockX {
    NSConditionLock *ncLock = [[NSConditionLock alloc] initWithCondition:0];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if ([ncLock tryLockWhenCondition:0]) {
            NSLog(@"11111111");
            [ncLock unlockWithCondition:1];
        } else {
            NSLog(@"fail");
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [ncLock lockWhenCondition:3];
        NSLog(@"Ï22222222");
        [ncLock unlockWithCondition:2];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [ncLock lockWhenCondition:1];
        NSLog(@"33333333333");
        [ncLock unlockWithCondition:3];
    });
}

- (void)testSynchronized {
    // thread 01
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized (self) {
            NSLog(@"11 enter ");
            sleep(3);
            NSLog(@"11111111");
        };
    });
    
    // thread 02
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized (self) {
            NSLog(@"222222");
        };
    });
}

//练习递归锁
- (void)testRecursiveLock02 {
    //先使用一种锁看看是否可以递归
//    NSLock *nLock = [[NSLock alloc] init];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        static void (^RecursiveBlock)(int);
//        RecursiveBlock = ^(int value) {
//            [nLock lock];
//            if (value > 0) {
//                NSLog(@"value = %d", value);
//                RecursiveBlock(value - 1);
//            }
//            [nLock unlock];
//        };
//        RecursiveBlock(4);
//    });
    // 上面这种循环会导致死锁一直不释放相关的资源 如何解决这个问题 我们可以使用递归锁
    NSRecursiveLock *rLock = [[NSRecursiveLock alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        static void (^RecursiveBlock)(int);
        RecursiveBlock = ^(int value) {
            [rLock lock];
            if (value > 0) {
                NSLog(@"value = %d", value);
                RecursiveBlock(value - 1);
            }
        };
        RecursiveBlock(4);
    });
}

// 练习下如何使用NSConfition的唤醒
- (void)testConditionLock02 {
    //Thread 01
    NSCondition *cLock = [[NSCondition alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"Thread 01");
        [cLock lock];
        [cLock wait];
        NSLog(@"Thread 01 content");
        [cLock unlock];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"Thread 02");
        [cLock lock];
        [cLock wait];
        NSLog(@"Thread 02 content");
        [cLock unlock];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(2);
//        NSLog(@"唤醒一个等待的线程");
//        [cLock signal];
        NSLog(@"唤醒所有等待的线程");
        [cLock broadcast];
        
    });
}

- (void)testConditionLock {
    NSCondition *cLock = [[NSCondition alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"running");
        [cLock lock];
//        sleep(3);
        [cLock waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
        NSLog(@"1111111");
        [cLock unlock];
    });
}

- (void)testNSLock {
    NSLock *lock = [[NSLock alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"---- 准备加锁----");
        [lock lock];
        sleep(3);
        NSLog(@"thread 01 ing");
        [lock unlock];
        NSLog(@"thread 01 unlock success");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"thread start to locking");
        BOOL x = [lock lockBeforeDate:[NSDate dateWithTimeIntervalSinceNow:2]];
        if (x) {
            NSLog(@"tread 2 ing");
            [lock unlock];
        } else {
            NSLog(@"fail");
        }
    });
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
