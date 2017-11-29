//
//  main.m
//  ReviewBlock
//
//  Created by lkp on 2017/8/22.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import <Foundation/Foundation.h>



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSString *serchText = @"hi";
        NSRegularExpression *regu = [NSRegularExpression regularExpressionWithPattern:@"\\bhi\\b" options:NSRegularExpressionCaseInsensitive error:NULL];
        NSTextCheckingResult *result = [regu firstMatchInString:serchText options:0 range:NSMakeRange(0, [serchText length])];
        if (result) {
            NSLog(@"success");
        } else {
            NSLog(@"fail oh no!");
        }
        
    }
    
    
    return 0;
}

//(void) testBlock {
//    NSLog(@"Hello, World!");
//    typedef int(^block)(int) ;
//
//    void (^MyBlock)(int) = ^(int n){
//        for (int i = 0; i < n; i++) {
//            NSLog(@"i = %d",i);
//        }
//    };
//    MyBlock(3);
//
//    int outerNum = 13;
//
//    //        outerNum = outerNum + 2;
//
//    int (^Calu)(int,int) = ^(int m, int n){
//        NSLog(@"outer number = %D", outerNum);
//        return m + n;
//    };
//
//    //        int (^TestChangeValue)(int a, int b)
//
//    int result = Calu(2,8);
//    NSLog(@"reuslt = %D",result);
//    NSLog(@"outer = %D", outerNum);
//
//}


