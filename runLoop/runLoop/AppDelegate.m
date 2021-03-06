//
//  AppDelegate.m
//  runLoop
//
//  Created by CFS on 2017/6/20.
//  Copyright © 2017年 CFS. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TestLoginViewController.h"
#import "AccountManager.h"
#define LOCK_SCREEN_NOTIFY @"LockScreenNotify"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"----willFinishLaunchingWithOptions ---------");
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"------- didFinishLaunchingWithOptions -------");
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blueColor];
    [self.window makeKeyAndVisible];
    
//    ViewController *vc = [[ViewController alloc] init];
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController  = nc;

    return YES;
}


- (void) applicationProtectedDataDidBecomeAvailable:(UIApplication *)application {
//    [[NSNotificationCenter defaultCenter] postNotificationName:UN_LOCK_SCREEN_NOTIFY
//                                                        object:nil];
    NSLog(@"UnLock screen.");
}

- (void)applicationProtectedDataWillBecomeUnavailable:(UIApplication *)application {
//    [[NSNotificationCenter defaultCenter] postNotificationName:UN_LOCK_SCREEN_NOTIFY
//                                                        object:nil];
    NSLog(@"Lock screen.");
}


- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"------- applicationWillResignActive -------");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"------- applicationDidEnterBackground -------");
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"------- applicationWillEnterForeground -------");
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"------- applicationDidBecomeActive -------");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"------- applicationWillTerminate -------");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
