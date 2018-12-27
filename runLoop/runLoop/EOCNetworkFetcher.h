//
//  EOCNetworkFetcher.h
//  runLoop
//
//  Created by lkp on 2018/12/10.
//  Copyright © 2018 CFS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class EOCNetworkFetcher;
@protocol EOCNetworkFetcherDelegate <NSObject>

- (void)newworkFetcher:(EOCNetworkFetcher *)networkFetcher didFinishWithData:(NSData *)data;

@end

@interface EOCNetworkFetcher : NSObject

@property (nonatomic, weak) id <EOCNetworkFetcherDelegate> delegate;

- (id)initWithURL:(NSURL *) url;
- (void)start;

@end

NS_ASSUME_NONNULL_END
