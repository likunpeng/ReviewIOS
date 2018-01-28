//
//  ECONetworkFetcherDelegate.h
//  runLoop
//
//  Created by lkp on 2018/1/28.
//  Copyright © 2018年 CFS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EOCNetworkFetcher;

@protocol ECONetworkFetcherDelegate <NSObject>

- (void)networkFetcher:(EOCNetworkFetcher *)fetcher didReveiceData:(NSData*)data;

@end
