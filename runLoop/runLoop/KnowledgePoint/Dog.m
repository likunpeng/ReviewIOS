//
//  Dog.m
//  runLoop
//
//  Created by lkp on 2018/2/5.
//  Copyright © 2018年 CFS. All rights reserved.
//

#import "Dog.h"

@implementation Dog
{
    NSString* toSetName;
    NSString* isName;
    //NSString* name;
    NSString* _name;
    NSString* _isName;
}

-(void)setName:(NSString*)name{
     toSetName = name;
 }

-(NSString*)getName{
    return toSetName;
}

+(BOOL)accessInstanceVariablesDirectly{
    return NO;
}

-(id)valueForUndefinedKey:(NSString *)key{
    NSLog(@"出现异常，该key不存在%@",key);
    return nil;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"出现异常，该key不存在%@",key);
}
@end
