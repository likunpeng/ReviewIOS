//
//  HXMenuBarBase.h
//  HXFoundation
//
//  Created by Ye Yang on 2018/4/13.
//  Copyright © 2018年 HuaXia Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXMenuBarItem.h"
@protocol HXMenuBarDelegate;

typedef NS_ENUM(NSInteger, HXMenuBarStyle) {
    HXMenuBarStyleSlide,        // 线性滑动菜单栏
    HXMenuBarStyleBounceSlide   // 弹性滑动菜单栏
};

@interface HXMenuBarBase : UIView

@property (nonatomic, weak) id<HXMenuBarDelegate> delegate;
@property (nonatomic, assign) CGFloat menuBarHeight;                        // 菜单栏高度
@property (nonatomic, assign) NSUInteger selectedIndex;                     // 当前选中菜单索引
@property (nonatomic, assign) CGFloat distanceToLeft;                       // MenuView距离左边的距离

@property (nonatomic, copy) NSArray<HXMenuBarItem *> *menuBarItems;         // 菜单按钮列表
@property (nonatomic, assign) CGFloat menuBarItemMinWidth;                  // 菜单按钮最小宽度(只在动态宽度关闭时有效，用于指定按钮宽度)
@property (nonatomic, assign) CGFloat menuBarItemExtendWidth;               // 菜单按钮宽度相对title宽度延伸的长度(只在动态宽度开启时有效)
@property (nonatomic, assign) BOOL menuBarItemUseDynamicWidth;              // 菜单按钮是否使用动态宽度

@property (nonatomic, strong) CAShapeLayer *selectionBarLayer;              // 选项条背景
@property (nonatomic, strong) CAGradientLayer *selectionBarForegroundLayer; // 选项条前景
@property (nonatomic, strong) UIColor *selectionBarColor;                   // 选项条颜色
@property (nonatomic, assign) BOOL selectionBarUseGradientColor;            // 选项条是否使用渐变色
@property (nonatomic, assign) CGFloat selectionBarHeight;                   // 选项条高度
@property (nonatomic, assign) CGFloat selectionBarWidth;                    // 选项条宽度(动态宽度开启时宽度设置无效)
@property (nonatomic, assign) CGFloat selectionBarExtendWidth;              // 选项条宽度相对title宽度延伸的长度(只在动态宽度开启时有效)
@property (nonatomic, assign) BOOL selectionBarUseDynamicWidth;             // 选项条是否使用动态宽度
@property (nonatomic, assign) CGFloat selectionBarOffsetY;                  // 选项条纵向偏移
@property (nonatomic, assign) BOOL selectionBarUseRoundedRect;              // 选项条是否使用圆角

@property (nonatomic, assign) BOOL showShadow;                              // 是否显示阴影条

- (instancetype)initWithHeight:(CGFloat)menuBarHeight;
- (void)setSelectionBarStartColor:(UIColor*)startColor endColor:(UIColor*)endColor;
- (void)transitionBetween:(NSUInteger)leftIndex and:(NSUInteger)rightIndex percent:(double)percent;

@end

@protocol HXMenuBarDelegate <NSObject>

- (void)menuBar:(HXMenuBarBase*)menuBar didSelectItemAtIndex:(NSUInteger)selectedIndex fromIndex:(NSUInteger)fromIndex;

@end
