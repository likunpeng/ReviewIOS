//
//  EOCNetworkFetcher.m
//  runLoop
//
//  Created by lkp on 2018/1/28.
//  Copyright © 2018年 CFS. All rights reserved.
//

#import "EOCNetworkFetcher.h"

@interface EOCNetworkFetcher() <ECONetworkFetcherDelegate>

@property (nonatomic, weak) id<ECONetworkFetcherDelegate> customDelegate;

@end

@implementation EOCNetworkFetcher

+ (void)initialize {
    [NSRunLoop currentRunLoop];
    NSLog(@"2222222222222");
}

- (void)customCreate {
    _customDelegate = self;
    [self networkFetcher:self didReveiceData:nil];
}

#pragma mark delegate
- (void)networkFetcher:(EOCNetworkFetcher *)fetcher didReveiceData:(NSData *)data {
    NSLog(@"network fetcher!!!");
}

@end
