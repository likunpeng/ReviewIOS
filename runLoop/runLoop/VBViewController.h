//
//  VBViewController.h
//  runLoop
//
//  Created by lkp on 2018/3/6.
//  Copyright © 2018年 CFS. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol VBDelegate
@required
- (void)showName:(NSString *) name;
@end

@interface VBViewController : UIViewController
@property (nonatomic, strong) NSString *name;
@end
