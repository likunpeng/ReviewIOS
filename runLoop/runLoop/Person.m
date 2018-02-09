//
//  Person.m
//  runLoop
//
//  Created by lkp on 2018/1/9.
//  Copyright © 2018年 CFS. All rights reserved.
//

#import "Person.h"

#define printx(n) printf("%i\n",2 ## n)

@interface Person() <PersonProtocol>

@end

@implementation Person
- (void)test {
    NSLog(@"success success-------");
    [self eat];
    printx(101);
}

+ (void)testStaticMethod {
    NSLog(@"hhh");
}

#pragma mark personProtocol
- (void)eat {
    NSLog(@"person eat");
}

@end
