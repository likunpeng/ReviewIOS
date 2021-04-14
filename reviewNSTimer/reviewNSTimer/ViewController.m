//
//  ViewController.m
//  reviewNSTimer
//
//  Created by 李坤鹏 on 2020/12/4.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "LMBadgeShareView.h"
#import "LKPOperation.h"

#define H5QuestionAssetZipPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:@"webQuestionAssetZip"]

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addOperationToQueue];
    
//    [self useInvocationOperation];
//    [self customOperation];
    
    
//    NSString *str = [NSString stringWithFormat:@"%d", 0];
//    NSString *str = @"";
    
//    if (0 == str.intValue) {
//        NSLog(@"kongkong");
//    } else {
//        NSLog(@"not kong");
//    }
//
//    NSString *str01;
//    if (true) {
//        NSLog(@"hhhh");
//    } else {
//        NSLog(@"wuwuwu");
//    }
//    NSLog(@"viewDidLoad");
//    NSDictionary *test = @{
//        @"key1":@"",
//        @"key2":@"value",
//        @"key3":@"value",
//        @"key4":@"value",
//        @"key5":@"value",
//        @"key6":@"value",
//    };
    
//    NSDictionary *test02 = @{};
//    NSLog(@"hhh = %@", [test02 objectForKey:@"id"]);
//
//    BOOL t = 23;
//    NSLog(@"%d", t);
//    NSLog(@"test = %@", test[@"key1"][@"23"]);
//    test = nil;
//    NSNumber *a = [NSNumber numberWithInt:1];
//    NSLog(@"%d",[@"www02" intValue]);
//    if ([@"1www02" intValue] == 000000) {
//        NSLog(@"hahahah");
//    }
//    NSString *str;
//    if (str.integerValue > 0) {
//        NSLog(@"1111111");
//    }
    
//    NSDictionary *dict = (NSDictionary *)test;
    
//    NSLog(@"str = %@", test[@"key9"][@"value1"]);
//    NSLog(@"-----------%@", test[@"key9"][@"value1"]);
//    for (int i = 0; i < 2; i++) {
//        NSString *url = @"";
//        NSString *zipName = [url lastPathComponent];
//        if (!H5QuestionAssetZipPath) {
//            NSString *zipFilePath = [H5QuestionAssetZipPath stringByAppendingPathComponent:zipName];
//            NSLog(@"------%@", zipFilePath);
//        } else {
//            NSString *str = @"111111";
//            NSString *zipFilePath = [str stringByAppendingPathComponent:zipName];
//            NSLog(@"====%@", zipFilePath);
//        }
//    }
    
//    NSMutableArray *classIdArray = @[].mutableCopy;
//    for(int i = 0; i < 3; i ++) {
//        NSString *classId = [[NSNull alloc] init];
//        [classIdArray addObject:classId];
//    }
    
//    LMBadgeShareView *view = [[LMBadgeShareView alloc] initWithData: test];
//    [self.view addSubview:view];
    
    self.view.backgroundColor = [UIColor redColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 200, 40)];
    [button setTitle:@"第二个页面" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor yellowColor]];
    [button addTarget:self action:@selector(gotoSecondVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
//    [NSThread detachNewThreadSelector:@selector(task1) toTarget:self withObject:nil];
//    NSMutableDictionary *md = [NSMutableDictionary new];
//    md[@"hah"] = nil;
//    [[NSUserDefaults standardUserDefaults] setValue:md forKey:@"test"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//
//    NSMutableDictionary *testDic = [[NSMutableDictionary alloc] init];
//    [testDic setValue:@"111" forKey:@"first"];
//    [testDic setValue:nil forKey:@"hhh"];
//    [testDic setValue:@"hhha" forKey:@"second"];
//    NSLog(@"%@", testDic);
    
    
//    NSDictionary *ud = [[NSUserDefaults standardUserDefaults] objectForKey:@"test"];
//    if (ud) {
//        NSLog(@"ud = %@", ud);
//    }
//
//    NSArray *test = @[@"1", @"2", @"3"];
//    [test enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"0--------");
//        if ([@"1" isEqualToString:obj]) {
//            *stop = YES;
//        }
//        NSLog(@"022222222222");
//    }];
//    for (int i = 0; i < 2; i++) {
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//         NSLog(@"11111111111111111111");
//         sleep(2);
//            NSLog(@"3333333333333");
//            dispatch_async(dispatch_get_main_queue(), ^{
//                NSLog(@"0000000000000000000");
//            });
//        });
//    }
    
    [self testDemo4];
}


- (void)testDemo4 {
    __block int a = 0;
    while (a < 5) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            a++;
            NSLog(@"%d", a);
        });
    }
//    NSLog(@"--------%d", a);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"--------%d", a);
    });
    
}


- (void)testDemo3 {
    dispatch_queue_t queue = dispatch_queue_create("cocoi", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"1");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"2");
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"3");
    });
    
    NSLog(@"0");
    
    dispatch_async(queue, ^{
        NSLog(@"7");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"8");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"9");
    });
}

// 死锁
- (void)testDemo2 {
    dispatch_queue_t queue = dispatch_queue_create("cooci", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1");
    dispatch_async(queue, ^{
        NSLog(@"2");
        dispatch_sync(queue, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    
    NSLog(@"5");
    
}




- (void)addOperationToQueue {
    // 1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 1;
    
    //2.创建操作
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task1) object:nil];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task2) object:nil];
    
    [queue addOperation:op];
    [queue addOperation:op2];
}

- (void)customOperation {
    LKPOperation *op = [[LKPOperation alloc] init];
    [op start];
}

- (void)useInvocationOperation {
    // 1.创建NSInvocationOperation对象 不开启线程
//    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task1) object:nil];
//    [op start];
    
    //NSBlockOperation 开启线程
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1.block --- %@", [NSThread currentThread]);
        }
    }];
    
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2.block --- %@", [NSThread currentThread]);
        }
    }];
    
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3.block --- %@", [NSThread currentThread]);
        }
    }];
    
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"4.block --- %@", [NSThread currentThread]);
        }
    }];
    
    [op addExecutionBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"5.block --- %@", [NSThread currentThread]);
        }
    }];
    [op start];
}

- (void)task1 {
    for (int i = 0; i < 2; i++) {
        [NSThread sleepForTimeInterval:2];
        NSLog(@"1----%@", [NSThread currentThread]);
    }
}

- (void)task2 {
    for (int i = 0; i < 2; i++) {
        [NSThread sleepForTimeInterval:2];
        NSLog(@"2----%@", [NSThread currentThread]);
    }
}


- (void)gotoSecondVC {
    NSLog(@"gotoSecondVC");
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
        NSLog(@"had goto secondvc");
    }];
}

- (void)dealloc {
   
}


@end
