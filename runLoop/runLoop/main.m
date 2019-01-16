//
//  main.m
//  runLoop
//
//  Created by CFS on 2017/6/20.
//  Copyright © 2017年 CFS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//@interface XXObject :NSObject
//
//@end
//
//@implementation XXObject
//+ (void)load {
//    NSLog(@"XXObject load!");
//}
//
//@end

@interface Test : NSObject {
    NSString *name;
}
@end

@implementation Test
+ (BOOL)accessInstanceVariablesDirectly {
    return YES;
}

- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"出现不存在的key = %@",key);
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"出现异常 设置不存在的key = %@", key);
}

- (NSInteger)isAge {
    return 10;
}

@end

@interface Test1 : NSObject {
    Test *test1;
}
@end

@implementation Test1


@end

@interface Book : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) CGFloat price;
@end

@implementation Book

@end

@interface Address : NSObject
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *district;
@end

@implementation Address

@end

@interface Target : NSObject
@property (nonatomic, copy) NSString *name;

- (int)age;
- (void)setAge:(int)theAge;
@end

//@implementation Target

//- (instancetype)init {
//    self  = [super init];
//    if (nil != self) {
//        age = 10;
//    }
//    return self;
//}

//- (int)age {
//    return age;
//}
//
//- (void)setAge:(int)theAge {
//    [self willChangeValueForKey:@"age"];
//    age = theAge;
//    [self didChangeValueForKey:@"age"];
//}

//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
//    if ([key isEqualToString:@"age"]) {
//        return NO;
//    }
//    return [super automaticallyNotifiesObserversForKey:key];
//}

//- (void)speak {
//    NSLog(@"speak name = %@", self.name);
//}
//@end


@interface BaseClass : NSObject
@property (nonatomic, copy) NSString *info;
@end

@implementation BaseClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.info = @"baseInfo";
    }
    return self;
}

@end

@interface SubClass : BaseClass
@property (nonatomic, copy) NSString *subInfo;
@end

@implementation SubClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.info = @"subInfo";
    }
    return self;
}

- (void)setInfo:(NSString *)info {
    [super setInfo:info];
//    NSString *copyString = [NSString stringWithString:self.subInfo];
//    NSLog(@"copyString = %@", copyString);
}

@end

int main(int argc, char * argv[]) {
    @autoreleasepool {
        //--------------------------start----------------------------------------
//        id cls = [Target class];
//        void *obj = &cls;
//        [(__bridge id)obj speak];
        //--------------------------end------------------------------------------
        //--------------------------start----------------------------------------
        //--------------------------end------------------------------------------
        //--------------------------start----------------------------------------
        //--------------------------end------------------------------------------
        //--------------------------start----------------------------------------
        //--------------------------end------------------------------------------
        //--------------------------start----------------------------------------
            //测试不能再init里面进行调用set方法
//        SubClass *subClass = [[SubClass alloc] init];
        //--------------------------end------------------------------------------
        
        //--------------------------start----------------------------------------
        /*
        NSArray *arrStr = @[@"englist", @"franch", @"chinese"];
        NSArray *arrCapStr = [arrStr valueForKey:@"capitalizedString"];
        
        [arrCapStr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"str = %@", obj);
        }];
        
        NSArray *arrCapStrLength = [arrCapStr valueForKeyPath:@"capitalizedString.length"];
        [arrCapStrLength enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@" length = %@", obj);
        }];*/
        //--------------------------end------------------------------------------
        
        
        //------------------------------------------------------------------
        /*
        //模型转字典
        Address *add = [[Address alloc] init];
        add.country = @"China";
        add.province = @"Guang Dong";
        add.city = @"shen zhen";
        add.district = @"Nan Shan";
        
        NSArray *arr = @[@"country",@"province",@"city",@"district"];
        
        NSDictionary *dict = [add dictionaryWithValuesForKeys:arr];
        NSLog(@"dict = %@", dict);
        
        //字典转模型
        NSDictionary *modifyDict = @{@"country":@"USA", @"province":@"California", @"city":@"Los Angle"};
        [add setValuesForKeysWithDictionary:modifyDict];
        NSLog(@"country = %@, province = %@, city = %@", add.country, add.province, add.city);*/
        
        //------------------------------------------------------------------
//        Book *book1 = [Book new];
//        book1.name = @"The Great Gastby";
//        book1.price = 10;
//        Book *book2 = [Book new];
//        book2.name = @"Time History";
//        book2.price = 30;
//        Book *book3 = [Book new];
//        book3.name = @"Wrong Hole";
//        book3.price = 30;
//
//        Book *book4 = [Book new];
//        book4.name = @"Wrong Hole";
//        book4.price = 40;
//
//        NSArray *arrBooks = @[book1, book2, book3, book4];
//
//        NSNumber* sum = [arrBooks valueForKeyPath:@"@sum.price"];
//        NSLog(@"sum = %f", sum.floatValue);
//
//        NSNumber *avg = [arrBooks valueForKeyPath:@"@avg.price"];
//        NSLog(@"avg = %f", avg.floatValue);
//
//        NSNumber *count = [arrBooks valueForKeyPath:@"@count"];
//        NSLog(@"count = %f", count.floatValue);
//
//        NSNumber *min = [arrBooks valueForKeyPath:@"@min.price"];
//        NSLog(@"min = %f", min.floatValue);
//
//        NSNumber *max = [arrBooks valueForKeyPath:@"@max.price"];
//        NSLog(@"max = %f", max.floatValue);
        
        //练习下集合的运算
//        NSLog(@"distinctUnionOfObjects");
//        NSArray* arrDistinct = [arrBooks valueForKeyPath:@"@distinctUnionOfObjects.price"];
//        for (NSNumber *price in arrDistinct) {
//            NSLog(@"%f",price.floatValue);
//        }
//        NSLog(@"unionOfObjects");
//        NSArray* arrUnion = [arrBooks valueForKeyPath:@"@unionOfObjects.price"];
//        for (NSNumber *price in arrUnion) {
//            NSLog(@"%f",price.floatValue);
//        }
        
        
//        Test *test = [[Test alloc] init];
//        [test setValue:@"xiaoming" forKey:@"name"];
//        NSLog(@"name = %@", [test valueForKey:@"name"]);
//
//        NSLog(@"age = %@", [test valueForKey:@"age"]);
//
//        Test1 *test1 = [[Test1 alloc] init];
//        [test1 setValue:test forKey:@"test1"];
//        NSLog(@"name01 = %@", [test1 valueForKeyPath:@"test1.name"]);
//        [test1 setValue:@"xiaoming01" forKeyPath:@"test1.name"];
//        NSLog(@"name01 = %@", [test1 valueForKeyPath:@"test1.name"]);
        NSLog(@"start main");
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
