//
//  Student.m
//  runLoop
//
//  Created by lkp on 2018/1/13.
//  Copyright © 2018年 CFS. All rights reserved.
//

#import "Student.h"

@interface Student() <PersonProtocol>

@end

@implementation Student

- (void)eat {
    NSLog(@"student eat");
}

- (void)testStrongAndCopy {
        NSLog(@"-------------NString--------------");
        //创建一个不可变源字符串
        NSString *originStr = @"iOS";
        //初始化strong字符串
        self.theStrongStr = originStr;
        //初始化copy字符串
        self.theCopyStr = originStr;
        
        //打印字符串指向的地址,已经对应的内存地址
        NSLog(@"the origin string:%p, %p",originStr,&originStr);
        
        NSLog(@"the strong string:%p, %p",_theStrongStr,&_theStrongStr);
        
        NSLog(@"the copy string:%p, %p",_theCopyStr,&_theCopyStr);
}

-(void)testMutabelString {
    NSLog(@"-------------NSMutableString--------------");
    //创建一个可变源字符串
    NSMutableString *originStr = [NSMutableString stringWithFormat:@"iOS"];
    //初始化strong字符串
    self.theStrongStr = originStr;
    //初始化copy字符串
    self.theCopyStr = originStr;
    
    //打印字符串指向的地址,已经对应的内存地址
    NSLog(@"the origin string:%p, %p",originStr,&originStr);
    
    NSLog(@"the strong string:%p, %p",_theStrongStr,&_theStrongStr);
    
    NSLog(@"the copy string:%p, %p",_theCopyStr,&_theCopyStr);
}

@end
