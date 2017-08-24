//
//  main.m
//  ReviewFoundation
//
//  Created by lkp on 2017/8/23.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 */
void TestStruction()
{
    struct Date {
        int year;
        int month;
        int day;
    };
    
    struct Date d1 = {2017,8,22};
    
    struct Date d2 = {.year=2017,.month=2,.day=23};
    NSLog(@"%@",[NSString stringWithFormat:@"year = %d,month = %d,day = %d",d1.year,d1.month,d1.day]);
    NSLog(@"%@",[NSString stringWithFormat:@"year = %d,month = %d,day = %d",d2.year,d2.month,d2.day]);
    
    NSRange range = NSMakeRange(3, 4);
    NSLog(@"rang location= %ld,length = %ld", range.location,range.length);
    
    //        NSString *str = [NSString stringWithUTF8String:<#(nonnull const char *)#>]
    
    
    //        NSLog(@"%s",d2);

};
/**
review array init method
 */
void ArrayTest()
{
    NSArray *arr1 = [NSArray array];//创建一个长度为零的数组
    NSLog(@"%lu",(unsigned long)[arr1 count]);
    
    int arr2[4] = {1,2.4};
    NSLog(@"%p", arr2);
    
    NSArray *arr3 = [NSArray arrayWithObjects:@"hhi", nil];
    NSLog(@"%lu",(unsigned long)[arr3 count]);
    
    //3快速创建一个naarray对象
    NSArray *arr4 = @[@"zhang",@"guan",@"li",@"dai"];
    NSLog(@"%ld",[arr4 count]);
    NSLog(@"arr4[0] = %@",arr4[0]);
    NSLog(@"arr4[0] = %@",arr4[3]);
    
    long  length = [arr4 count];
    for (int i = 0; i < length; i++) {
        NSLog(@"value[%d] = %@",i,arr4[i]);
    }
    
    [arr4 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"block idex = %ld value = %@", idx, obj);
    }];
};

//NSDictionary

void TestDictionary()
{
    NSDictionary *dic = [NSDictionary dictionaryWithObject:@"lkp" forKey:@"name"];
    NSLog(@"%@",dic[@"name"]);
    NSLog(@"%ld", [dic count]);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        TestStruction();
//        ArrayTest();
        TestDictionary();
    }
    
    return 0;
    
}
