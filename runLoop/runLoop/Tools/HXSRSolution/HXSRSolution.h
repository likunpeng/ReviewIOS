//
//  HXSRSolution.h
//  HXFoundation
//
//  Created by Ye Yang on 17/2/21.
//  Copyright © 2017年 HuaXia Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define S(v)    ((v) * [HXSRSolution Scale])
#define NS(v)   @(S(v))

#define Z(s)    [HXSRSolution ScaledSize:s] // scaled size
#define ZW(s)   Z(s).width                  // width of scaled size
#define NZW(s)  @(ZW(s))                    // NSNumber width of scaled size
#define ZH(s)   Z(s).height                 // height of scaled size
#define NZH(s)  @(ZH(s))                    // NSNumber height of scaled size

#define FH(s, w)    [HXSRSolution ScaledSize:s fixedScaledWidth:w].height // scaled height with fixed width
#define NFH(s, w)   @(FH(s, w)) // NSNumber scaled height with fixed width
#define FW(s, h)    [HXSRSolution ScaledSize:s fixedScaledHeight:h].width // scaled width with fixed height
#define NFW(s, h)   @(FW(s, h)) // NSNumber scaled width with fixed height

typedef NS_ENUM(NSInteger, SRSDevice) {
    iPhone4,
    iPhone5,
    iPhone6,
    iPhone6p,
    iPhoneX,
    iPhoneXR,
    iPhoneXSMax
};

@interface HXSRSolution : NSObject

+ (void)setDesignDevice:(SRSDevice)designDevice;
+ (CGFloat)Scale;
+ (CGSize)ScaledSize:(CGSize)originSize;  // usually used for UIImage.size
+ (CGSize)ScaledSize:(CGSize)originSize fixedScaledWidth:(CGFloat)fixedScaledWidth;
+ (CGSize)ScaledSize:(CGSize)originSize fixedScaledHeight:(CGFloat)fixedScaledHeight;

@end
