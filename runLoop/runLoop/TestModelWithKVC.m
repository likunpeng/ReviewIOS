//
//  TestModelWithKVC.m
//  runLoop
//
//  Created by lkp on 2019/4/18.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "TestModelWithKVC.h"

@implementation TestModelWithKVC

//具体实现
+ (__kindof TestModelWithKVC *)statusModelWithDic:(NSDictionary *)dic {
    TestModelWithKVC *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}

//覆盖系统方法，解决KVC错误
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    //这个方法会在没有找到key的时候进入
    if ([key isEqualToString:@"id"]) {

    }
}

@end
