//
//  StudyBock.m
//  runLoop
//
//  Created by 李坤鹏 on 2019/7/23.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "StudyBlock.h"

@implementation StudyBlock

- (void)testBlock {//捕获变量
    int age=10;
    void (^Block)(void) = ^{
        NSLog(@"age:%d",age);
    };
    age = 20;
    Block();
}

- (void)testCaptureValueBlock {
    auto int age = 10;
    static int num = 25;
    void (^Block)(void) = ^{
        NSLog(@"age:%d,num:%d",age,num);
    };
    age = 20;
    num = 11;
    Block();
}

- (void)testBaseOjectOfBlock {
    void (^block1)(void) = ^{
        NSLog(@"block1");
    };
    NSLog(@"%@",[block1 class]);
    NSLog(@"%@",[[block1 class] superclass]);
    NSLog(@"%@",[[[block1 class] superclass] superclass]);
    NSLog(@"%@",[[[[block1 class] superclass] superclass] superclass]);
    NSLog(@"%@",[[[[[block1 class] superclass] superclass] superclass] superclass]);
}

- (void)testTypeOfBlock {
    int age = 1;
    void (^block1)(void) = ^{
        NSLog(@"block1");
    };
    
    void (^block2)(void) = ^{
        NSLog(@"block2:%d",age);
    };
    
    NSLog(@"%@/%@/%@",[block1 class],[block2 class],[^{
        NSLog(@"block3:%d",age);
    } class]);
}


@end
