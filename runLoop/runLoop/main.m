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


int main(int argc, char * argv[]) {
    @autoreleasepool {
        Test *test = [[Test alloc] init];
        [test setValue:@"xiaoming" forKey:@"name"];
        NSLog(@"name = %@", [test valueForKey:@"name"]);
        
        NSLog(@"age = %@", [test valueForKey:@"age"]);
        
        Test1 *test1 = [[Test1 alloc] init];
        [test1 setValue:test forKey:@"test1"];
        NSLog(@"name01 = %@", [test1 valueForKeyPath:@"test1.name"]);
        [test1 setValue:@"xiaoming01" forKeyPath:@"test1.name"];
        NSLog(@"name01 = %@", [test1 valueForKeyPath:@"test1.name"]);
        NSLog(@"start main");
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
