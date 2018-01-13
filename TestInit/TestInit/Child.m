//
//  Child.m
//  TestInit
//
//  Created by lkp on 2017/12/28.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "Child.h"

@implementation Child

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"child init");
    }
    return self;
}

- (void)setName:(NSString *)name {
    NSLog(@"child overwrite");
//    super.name = name;
    _age = @"10";
}

@end
