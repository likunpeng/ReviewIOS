//
//  HXMenuBarSlide.m
//  HXFoundation
//
//  Created by Ye Yang on 2018/4/13.
//  Copyright © 2018年 HuaXia Mobile. All rights reserved.
//

#import "HXMenuBarSlide.h"

@implementation HXMenuBarSlide

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _bounces = YES;
    }
    return self;
}

#pragma mark - transition
- (void)transitionBetween:(NSUInteger)leftIndex and:(NSUInteger)rightIndex percent:(double)percent {
    [super transitionBetween:leftIndex and:rightIndex percent:percent];

    if (_bounces) {
        // 弹性动画
        CGFloat leftSelectionBarWidth = self.selectionBarUseDynamicWidth ? self.menuBarItems[leftIndex].titleLabel.intrinsicContentSize.width + self.selectionBarExtendWidth : self.selectionBarWidth;
        CGFloat rightSelectionBarWidth = self.selectionBarUseDynamicWidth ? self.menuBarItems[rightIndex].titleLabel.intrinsicContentSize.width + self.selectionBarExtendWidth : self.selectionBarWidth;
        HXMenuBarItem *leftMenuBarItem = self.menuBarItems[leftIndex];
        HXMenuBarItem *rightMenuBarItem = self.menuBarItems[rightIndex];

        CGRect currentSelectionBarFrame = CGRectZero;
        if (leftIndex == rightIndex) {
            // 滑动至页面边界
            currentSelectionBarFrame = CGRectMake(CGRectGetMidX(leftMenuBarItem.frame) - (leftSelectionBarWidth * 0.5f),
                                                  0.0f,
                                                  leftSelectionBarWidth,
                                                  self.selectionBarHeight);
        } else if (percent <= 0.5) {
            // 前半程滑动中
            currentSelectionBarFrame = CGRectMake(CGRectGetMidX(leftMenuBarItem.frame) - (leftSelectionBarWidth * 0.5f),
                                                  0.0f,
                                                  leftSelectionBarWidth + (((CGRectGetMidX(rightMenuBarItem.frame) + (rightSelectionBarWidth * 0.5f)) - (CGRectGetMidX(leftMenuBarItem.frame) + (leftSelectionBarWidth * 0.5f))) * percent * 2.0),
                                                  self.selectionBarHeight);
        } else if (percent <= 1.0) {
            // 后半程滑动中
            CGFloat offsetX = (((CGRectGetMidX(rightMenuBarItem.frame) - (rightSelectionBarWidth * 0.5f)) - (CGRectGetMidX(leftMenuBarItem.frame) - (leftSelectionBarWidth * 0.5f))) * (percent - 0.5f) * 2.0f);
            currentSelectionBarFrame = CGRectMake(CGRectGetMidX(leftMenuBarItem.frame) - (leftSelectionBarWidth * 0.5f) + offsetX,
                                                  0.0f,
                                                  ((CGRectGetMidX(rightMenuBarItem.frame) + (rightSelectionBarWidth * 0.5f)) - (CGRectGetMidX(leftMenuBarItem.frame) - (leftSelectionBarWidth * 0.5f))) - offsetX,
                                                  self.selectionBarHeight);
        }
        UIBezierPath *barPath = [UIBezierPath bezierPathWithRoundedRect:currentSelectionBarFrame cornerRadius:self.selectionBarUseRoundedRect ? self.selectionBarHeight / 2.0f : 0.0f];
        self.selectionBarLayer.path = barPath.CGPath;
        if (self.selectionBarUseGradientColor) {
            [CATransaction begin];
            [CATransaction setDisableActions:YES];
            self.selectionBarForegroundLayer.frame = currentSelectionBarFrame;
            [CATransaction commit];
        }
    } else {
        // 非弹性动画
        CGFloat selectionBarWidth = self.selectionBarWidth;
        HXMenuBarItem *leftMenuBarItem = self.menuBarItems[leftIndex];
        HXMenuBarItem *rightMenuBarItem = self.menuBarItems[rightIndex];

        CGRect currentSelectionBarFrame = CGRectZero;
        if (leftIndex == rightIndex) {
            // 滑动至页面边界
            currentSelectionBarFrame = CGRectMake(CGRectGetMidX(leftMenuBarItem.frame) - (selectionBarWidth * 0.5f),
                                                  0.0f,
                                                  self.selectionBarWidth,
                                                  self.selectionBarHeight);
        } else if (percent <= 1.0) {
            // 前半程滑动中
            currentSelectionBarFrame = CGRectMake(CGRectGetMidX(leftMenuBarItem.frame) - (selectionBarWidth * 0.5f) + ((CGRectGetMidX(rightMenuBarItem.frame) - CGRectGetMidX(leftMenuBarItem.frame)) * percent),
                                                  0.0f,
                                                  self.selectionBarWidth,
                                                  self.selectionBarHeight);
        }
        UIBezierPath *barPath = [UIBezierPath bezierPathWithRoundedRect:currentSelectionBarFrame cornerRadius:self.selectionBarUseRoundedRect ? self.selectionBarHeight / 2.0f : 0.0f];
        self.selectionBarLayer.path = barPath.CGPath;
        if (self.selectionBarUseGradientColor) {
            [CATransaction begin];
            [CATransaction setDisableActions:YES];
            self.selectionBarForegroundLayer.frame = currentSelectionBarFrame;
            [CATransaction commit];
        }
    }
}

@end
