//
//  StudyRuntime.m
//  runLoop
//
//  Created by 李坤鹏 on 2019/7/24.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "StudyRuntime.h"
#import <objc/runtime.h>

@implementation StudyRuntime

- (void)testMSGForword {
    [self performSelector:@selector(foo:)];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(foo:)) {
        class_addMethod([self class], sel, (IMP)fooMethod, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void fooMethod(id obj, SEL _cmd) {
    NSLog(@"Doing foo!");
}
@end
