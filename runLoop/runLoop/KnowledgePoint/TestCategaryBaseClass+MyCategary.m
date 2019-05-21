//
//  TestCategaryBaseClass+MyCategary.m
//  runLoop
//
//  Created by lkp on 2018/6/11.
//  Copyright © 2018 CFS. All rights reserved.
//

#import "TestCategaryBaseClass+MyCategary.h"
#import "objc/runtime.h"

@interface TestCategaryBaseClass ()

@property (nonatomic, strong) NSString *testStr02;

@end

static void *testStr01 = &testStr01;
@implementation TestCategaryBaseClass (MyCategary)

- (void)baseMethod {
    NSLog(@"category Method");
//    NSLog(@"test str02 = %@", self.testStr02);
}

- (void)setTestStr:(NSString *)testStr {
    objc_setAssociatedObject(self, &testStr01, testStr, OBJC_ASSOCIATION_COPY);
}

- (NSString *)testStr {
    return objc_getAssociatedObject(self, &testStr01);
}

@end
