//
//  WaveViewEx.h
//  HuaXiaLoan
//
//  Created by Ye Yang on 2017/5/2.
//  Copyright © 2017年 花虾金融. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WaveViewColorStyle) {
    WaveViewColorStyleDark, // 深色系(底部过渡至纯白色)
    WaveViewColorStyleLight // 浅色系(底部过渡至半透明白色)
};

// 水波效果View
@interface WaveViewEx : UIView

- (instancetype)initWithAmplitude:(CGFloat)amplitude colorStyle:(WaveViewColorStyle)colorStyle;

- (void)start;
- (void)stop;

@end
