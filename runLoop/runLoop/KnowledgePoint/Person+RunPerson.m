//
//  Person+RunPerson.m
//  runLoop
//
//  Created by lkp on 2018/1/31.
//  Copyright © 2018年 CFS. All rights reserved.
//

#import "Person+RunPerson.h"
#import <objc/runtime.h>

@implementation Person (RunPerson)

- (NSString *) height {
//    return self.height;
    return objc_getAssociatedObject(self, @"height");
}

- (void)setHeight:(NSString *)height {
    objc_setAssociatedObject(self, @"height", height, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
