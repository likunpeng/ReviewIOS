//
//  Person.m
//  TestInit
//
//  Created by lkp on 2017/12/28.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"Person";
        NSLog(@"person init");
    }
    return self;
}

- (void)setName:(NSString *)name {
    NSLog(@"111");
}

@end
