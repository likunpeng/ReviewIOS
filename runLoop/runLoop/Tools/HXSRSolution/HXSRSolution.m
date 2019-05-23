//
//  HXSRSolution.m
//  HXFoundation
//
//  Created by Ye Yang on 17/2/21.
//  Copyright © 2017年 HuaXia Mobile. All rights reserved.
//

#import "HXSRSolution.h"

@implementation HXSRSolution

static CGFloat Scale = 1.0f;
static NSDictionary *DeviceScreenInfo = nil;

+ (void)initialize {
    DeviceScreenInfo = @{/* device      : width,      height,   scale */
                         @(iPhone4)     : @[@640.0f,  @960.0f,  @2.0f],
                         @(iPhone5)     : @[@640.0f,  @1136.0f, @2.0f],
                         @(iPhone6)     : @[@750.0f,  @1334.0f, @2.0f],
                         @(iPhone6p)    : @[@1242.0f, @2208.0f, @3.0f],
                         @(iPhoneX)     : @[@1125.0f, @2436.0f, @3.0f],
                         @(iPhoneXR)    : @[@828.0f,  @1792.0f, @2.0f],
                         @(iPhoneXSMax) : @[@1242.0f, @2688.0f, @3.0f]};
    [HXSRSolution setDesignDevice:iPhone6p]; // set default design device to 'iPhone6'
}

+ (void)makeScale:(SRSDevice)designDevice {
    CGFloat designWidth = 0.0f;
    CGFloat designScale = 0.0f;
    switch (designDevice) {
        case iPhone4:
            designWidth = [[DeviceScreenInfo objectForKey:@(iPhone4)][0] floatValue];
            designScale = [[DeviceScreenInfo objectForKey:@(iPhone4)][2] floatValue];
            break;
        case iPhone5:
            designWidth = [[DeviceScreenInfo objectForKey:@(iPhone5)][0] floatValue];
            designScale = [[DeviceScreenInfo objectForKey:@(iPhone5)][2] floatValue];
            break;
        case iPhone6p:
            designWidth = [[DeviceScreenInfo objectForKey:@(iPhone6p)][0] floatValue];
            designScale = [[DeviceScreenInfo objectForKey:@(iPhone6p)][2] floatValue];
            break;
        case iPhoneX:
            designWidth = [[DeviceScreenInfo objectForKey:@(iPhoneX)][0] floatValue];
            designScale = [[DeviceScreenInfo objectForKey:@(iPhoneX)][2] floatValue];
            break;
        case iPhoneXR:
            designWidth = [[DeviceScreenInfo objectForKey:@(iPhoneXR)][0] floatValue];
            designScale = [[DeviceScreenInfo objectForKey:@(iPhoneXR)][2] floatValue];
            break;
        case iPhoneXSMax:
            designWidth = [[DeviceScreenInfo objectForKey:@(iPhoneXSMax)][0] floatValue];
            designScale = [[DeviceScreenInfo objectForKey:@(iPhoneXSMax)][2] floatValue];
            break;
        case iPhone6:
        default:
            designWidth = [[DeviceScreenInfo objectForKey:@(iPhone6)][0] floatValue];
            designScale = [[DeviceScreenInfo objectForKey:@(iPhone6)][2] floatValue];
            break;
    }
    Scale = [[UIScreen mainScreen] bounds].size.width * designScale / designWidth;
}

+ (void)setDesignDevice:(SRSDevice)designDevice {
    [HXSRSolution makeScale:designDevice];
}

+ (CGFloat)Scale {
    return Scale;
}

+ (CGSize)ScaledSize:(CGSize)originSize {
    return CGSizeMake(originSize.width * Scale, originSize.height * Scale);
}

+ (CGSize)ScaledSize:(CGSize)originSize fixedScaledWidth:(CGFloat)fixedScaledWidth {
    CGFloat scaledHeight = fixedScaledWidth / originSize.width * originSize.height;
    return CGSizeMake(fixedScaledWidth, scaledHeight);
}

+ (CGSize)ScaledSize:(CGSize)originSize fixedScaledHeight:(CGFloat)fixedScaledHeight {
    CGFloat scaledWidth = fixedScaledHeight / originSize.height * originSize.width;
    return CGSizeMake(scaledWidth, fixedScaledHeight);
}

@end
