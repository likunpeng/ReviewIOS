//
//  AppDelegate.m
//  TestWindow
//
//  Created by lkp on 2017/11/29.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "AppDelegate.h"
#import "Masonry.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
    
    self.window.windowLevel = 100;
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    UIViewController *home = [[UIViewController alloc] init];
    home.title = @"home";
    home.view.backgroundColor = [UIColor blueColor];
    
    UITabBarItem *item01 = [[UITabBarItem alloc] init];
    [item01 setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f],
                                     NSForegroundColorAttributeName:[UIColor grayColor]
                                     }
                              forState:UIControlStateNormal];
    [item01 setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f],
                                         NSForegroundColorAttributeName:[UIColor redColor]}
                              forState:UIControlStateSelected];
    [item01 setTitlePositionAdjustment:UIOffsetMake(0, -16)];
    [item01 setTitle:@"首页"];
    
    home.tabBarItem = item01;
    [tabBarController addChildViewController:home];
    
    UIViewController *product = [[UIViewController alloc] init];
    product.title = @"product";
    product.view.backgroundColor = [UIColor greenColor];
    
    UIButton *pButton = [[UIButton alloc] init];
    [pButton setTitle:@"show v1" forState:UIControlStateNormal];
    pButton.backgroundColor = [UIColor blueColor];
    pButton.tag = 100;
    [pButton addTarget:self action:@selector(showView:) forControlEvents:UIControlEventTouchUpInside];
    [product.view addSubview:pButton];
    [pButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(product.view).offset(50);
        make.centerX.equalTo(product.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
    }];
    
    UIButton *pButton02 = [[UIButton alloc] init];
    [pButton02 setTitle:@"show v2" forState:UIControlStateNormal];
    pButton02.tag = 200;
    pButton02.backgroundColor = [UIColor blueColor];
    [pButton02 addTarget:self action:@selector(showView:) forControlEvents:UIControlEventTouchUpInside];
    [product.view addSubview:pButton02];
    [pButton02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(product.view).offset(-50);
        make.centerX.equalTo(product.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
    }];
    
    UIButton *pButton03 = [[UIButton alloc] init];
    [pButton03 setTitle:@"show all" forState:UIControlStateNormal];
    pButton03.tag = 300;
    pButton03.backgroundColor = [UIColor blueColor];
    [pButton03 addTarget:self action:@selector(showView:) forControlEvents:UIControlEventTouchUpInside];
    [product.view addSubview:pButton03];
    [pButton03 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(product.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
    }];
    
    UITabBarItem *item02 = [[UITabBarItem alloc] init];
    [item02 setTitle:@"产品"];
    [item02 setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f],
                                     NSForegroundColorAttributeName:[UIColor grayColor]}
                          forState:UIControlStateNormal];
    [item02 setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f],
                                     NSForegroundColorAttributeName:[UIColor redColor]}
                          forState:UIControlStateSelected];
    [item02 setTitlePositionAdjustment:UIOffsetMake(0, -16)];
    product.tabBarItem = item02;
    
    UINavigationController *uiNav01 = [[UINavigationController alloc] initWithRootViewController:home];
    uiNav01.tabBarItem = item01;
    UINavigationController *uiNav02 = [[UINavigationController alloc] initWithRootViewController:product];
    uiNav02.tabBarItem = item02;
    tabBarController.viewControllers = @[uiNav01,uiNav02];
    self.window.rootViewController = tabBarController;
    
    UIWindow *alertWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    alertWindow.windowLevel = 120;
    alertWindow.backgroundColor = [UIColor clearColor];
    self.alertWindlow = alertWindow;
//    [self.alertWindlow setHidden:YES];
    UIViewController *alertViewController = [[UIViewController alloc] init];
    alertViewController.view.backgroundColor = [UIColor clearColor];
    
    self.view1 = [[UIView alloc] init];
    _view1.backgroundColor = [UIColor yellowColor];
    [alertViewController.view addSubview:_view1];
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(alertViewController.view);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(200);
    }];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"close alert Window" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(closeAlertWindow) forControlEvents:UIControlEventTouchUpInside];
    [_view1 addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_view1);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
    }];
    
    self.view2 = [[UIView alloc] init];
    _view2.backgroundColor = [UIColor redColor];
    [alertViewController.view addSubview:_view2];
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(alertViewController.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(180);
    }];
    
    UIButton *v2Button = [[UIButton alloc] init];
    [v2Button setTitle:@"view2" forState:UIControlStateNormal];
    v2Button.backgroundColor = [UIColor blueColor];
    [v2Button addTarget:self action:@selector(hideViewAction) forControlEvents:UIControlEventTouchUpInside];
    [_view2 addSubview:v2Button];
    [v2Button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_view2);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(60);
    }];
    
    alertWindow.rootViewController = alertViewController;
    
    return YES;
}

- (void)closeAlertWindow {
    [self.alertWindlow setHidden:YES];
}

- (void)hideViewAction {
    [self.alertWindlow setHidden:YES];
}

- (void)showView:(UIButton *)sender {
    [self.alertWindlow setHidden:NO];
    if (sender.tag == 100) {
        [self.view1 setHidden:NO];
        [self.view2 setHidden:YES];
    } else if (sender.tag == 200) {
        [self.view1 setHidden:YES];
        [self.view2 setHidden:NO];
    } else if (sender.tag == 300) {
        [self.view1 setHidden:NO];
        [self.view2 setHidden:NO];
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
