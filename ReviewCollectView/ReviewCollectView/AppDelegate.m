//
//  AppDelegate.m
//  ReviewCollectView
//
//  Created by lkp on 2017/8/28.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

enum HXConnectionState {
    ConnectionStateDisconnected,
    ConnectionStateConnecting,
    ConnectionStateConnected,
};

enum HXConnectionState01 : NSInteger {
    ConnectionStateDisconnected01,
    ConnectionStateConnecting01,
    ConnectionStateConnected01,
};

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /*NSArray *arr  = [NSArray arrayWithObjects:@"cat",@"dog",@"tiger" ,nil];
    NSArray *arr1 = @[@"cat",@"dog",@"tiger"];
    
    NSDictionary *personData =
    [NSDictionary dictionaryWithObjectsAndKeys:@"li",@"firstName" ,@"kunpeng",@"lastName",[NSNumber numberWithInt:31],@"age",nil];
    NSDictionary *pData = @{@"firstName":@"li",
                            @"lastName":@"kunpeng",
                            @"age":@31};
    
    enum HXConnectionState state = ConnectionStateDisconnected;
    
    typedef enum HXConnectionState ConnectionState;
    
    ConnectionState state02 = ConnectionStateConnected;
    

    switch (state) {
        case ConnectionStateConnected:;
    
            
            break;
        case ConnectionStateConnecting:
            
            break;

//        case ConnectionStateConnected:
            
//            break;


        
    }
    */

    
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
