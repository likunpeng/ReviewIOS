//
//  WelcomeViewController.h
//  runLoop
//
//  Created by lkp on 2019/5/23.
//  Copyright © 2019 CFS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickCallBack)();

@interface WelcomeViewController : UIViewController

@property (nonatomic, copy) ClickCallBack callBack;

@end

NS_ASSUME_NONNULL_END
