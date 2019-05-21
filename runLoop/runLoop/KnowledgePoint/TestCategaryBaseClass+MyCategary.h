//
//  TestCategaryBaseClass+MyCategary.h
//  runLoop
//
//  Created by lkp on 2018/6/11.
//  Copyright © 2018 CFS. All rights reserved.
//

#import "TestCategaryBaseClass.h"

@interface TestCategaryBaseClass (MyCategary)

//@property (nonatomic, strong) NSString *testStr;

- (void)baseMethod;

- (void)setTestStr:(NSString *)testStr;

- (NSString *)testStr;
@end
