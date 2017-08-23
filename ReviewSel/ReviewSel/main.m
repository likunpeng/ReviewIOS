//
//  main.m
//  ReviewSel
//
//  Created by lkp on 2017/8/23.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (nonatomic, assign) int age;
@property (nonatomic, strong) NSString *name;

@end

@implementation Animal

//重写-description 实现打印类里面的所有属性和方法
- (NSString *) description
{
    return [NSString stringWithFormat:@"age=%d, name=%@",_age,_name];
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
        Animal *a = [[Animal alloc] init];
        a.age  = 2;
        a.name = @"dog";
        NSLog(@"%@",a);
        
        
        Class a1 = [Animal class];
        NSLog(@"%@",a1);
        
        //打印当前行号
        NSLog(@"line number = %d",__LINE__);
        //打印当前文件路径
        NSLog(@"file path = %s",__FILE__);
        //打印所属的方法或函数名
        NSLog(@"func name = %s",__func__);
    }
    return 0;
}
