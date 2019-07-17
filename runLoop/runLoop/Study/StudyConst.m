//
//  StudyConst.m
//  runLoop
//
//  Created by lkp on 2019/7/17.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "StudyConst.h"

@implementation StudyConst

// const放*前面约束参数，表示*a只读
// 只能修改地址a,不能通过a修改访问的内存空间
- (void)test:(const int * )a {
    int b = 1;
//        *a = 20;
    a = &b;
}

// const放*后面约束参数，表示a只读
// 不能修改a的地址，只能修改a访问的值
- (void)test1:(int * const)a {
    int b;
    // 会报错
//    a = &b;

    *a = 2;
}

@end
