//
//  main.m
//  ReviewProtocal
//
//  Created by lkp on 2017/8/22.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Swallow.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        Swallow *swallow = [[Swallow alloc] init];
        [swallow fly];
        [swallow run];
    }
    return 0;
}
