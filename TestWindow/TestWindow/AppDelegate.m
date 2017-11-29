//
//  AppDelegate.m
//  TestWindow
//
//  Created by lkp on 2017/11/29.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    UIViewController *home = [[UIViewController alloc] init];
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
    product.view.backgroundColor = [UIColor greenColor];
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
    [tabBarController addChildViewController:product];
    
    self.window.rootViewController = tabBarController;
    return YES;
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
