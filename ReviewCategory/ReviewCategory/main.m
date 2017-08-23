//
//  main.m
//  ReviewCategory
//
//  Created by lkp on 2017/8/23.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
#import "Animal+Animal_Action.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        Animal *a = [[Animal alloc] init];
        [a fly];
    }
    return 0;
}
