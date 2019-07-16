//
//  MyExtern.m
//  runLoop
//
//  Created by lkp on 2019/7/16.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "MyExtern.h"

NSString *myExternStr = @"abcd";

@implementation MyExtern

+ (void)testExtern {
    NSLog(@"myExternStr init = %@", myExternStr);
}

@end
