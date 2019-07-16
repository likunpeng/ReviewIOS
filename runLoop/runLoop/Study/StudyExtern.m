//
//  StudyExtern.m
//  runLoop
//
//  Created by lkp on 2019/7/16.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "StudyExtern.h"

extern NSString *myExternStr;

@implementation StudyExtern
+ (void)testExtern {
    myExternStr = @"12122";
    NSLog(@"myExternStr = %@", myExternStr);
}
@end
