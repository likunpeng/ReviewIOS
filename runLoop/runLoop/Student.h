//
//  Student.h
//  runLoop
//
//  Created by lkp on 2018/1/13.
//  Copyright © 2018年 CFS. All rights reserved.
//

#import "Person.h"

struct testStruct {
    int day;
    int monty;
    int year;
};

@interface Student : Person

@property (nonatomic, getter=isRight) BOOL right;

@property(nonatomic,strong) NSString *theStrongStr; //strong 字符串
@property(nonatomic,copy) NSString *theCopyStr;     //copy 字符串

- (void)testStrongAndCopy;
- (void)testMutabelString;

@end
