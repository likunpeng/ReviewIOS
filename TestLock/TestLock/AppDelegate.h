//
//  AppDelegate.h
//  TestLock
//
//  Created by 邹婉玉 on 2020/9/10.
//  Copyright © 2020 lkp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

