//
//  EOCNetworkFetcher.h
//  runLoop
//
//  Created by lkp on 2018/1/28.
//  Copyright © 2018年 CFS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ECONetworkFetcherDelegate.h"


@interface EOCNetworkFetcher : NSObject

@property (nonatomic, weak) id<ECONetworkFetcherDelegate> delegate;

@end
