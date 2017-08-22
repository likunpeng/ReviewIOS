//
//  AnimalProtocal.h
//  ReviewProtocal
//
//  Created by lkp on 2017/8/22.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AnimalProtocal <NSObject>
@required
- (void) fly;
@optional
- (void) run;
@end
