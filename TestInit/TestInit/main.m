//
//  main.m
//  TestInit
//
//  Created by lkp on 2017/12/28.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Child.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        Child *child = [[Child alloc] init];
//        [child setName:@"child"];
        NSLog(@"child name = %@", child.name);
    }
    return 0;
}
