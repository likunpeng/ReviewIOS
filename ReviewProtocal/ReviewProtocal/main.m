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
//        Swallow *swallow = [[Swallow alloc] init];
//        [swallow fly];
//        [swallow run];
        double d2             = 8.32222222222;
        NSString *d2Str       = [NSString stringWithFormat:@"%lf", d2];
        NSLog(@"%@",d2Str);
        NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:d2Str];
        NSString *strD2       = [num1 stringValue];
        NSLog(@"d2: %@", strD2);
    }
    return 0;
}
