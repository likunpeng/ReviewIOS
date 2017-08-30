//
//  ViewController.m
//  ReviewCollectView
//
//  Created by lkp on 2017/8/28.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "ViewController.h"

//#import "UserNotification"
#define IS_IOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 60, 30)];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor brownColor]];
    [btn addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) onClick {
    if (IS_IOS8) {
        UIUserNotificationType myType = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
        UIUserNotificationSettings *mySetting = [UIUserNotificationSettings settingsForTypes:myType categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:mySetting];
    }else{
        UIRemoteNotificationType myType = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:myType];
    }
    NSLog(@"11111111111111");
    UIApplication *app = [UIApplication sharedApplication];
    app.applicationIconBadgeNumber = 22;
    NSLog(@"2222222222");
};


@end
