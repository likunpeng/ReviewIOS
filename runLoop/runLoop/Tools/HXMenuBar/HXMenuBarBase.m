//
//  HXMenuBarBase.m
//  HXFoundation
//
//  Created by Ye Yang on 2018/4/13.
//  Copyright © 2018年 HuaXia Mobile. All rights reserved.
//

#import "HXMenuBarBase.h"

@interface HXMenuBarBase ()

@property (nonatomic, strong) UIScrollView *menuBarView;        // 菜单栏View
@property (nonatomic, strong) UIView *menuBarItemView;          // 菜单按钮View
@property (nonatomic, assign, readonly) CGFloat menuBarItemFixedWidth;      // 菜单按钮固定宽度(只在动态宽度关闭时有效)

@property (nonatomic, strong) UIView *selectionBarView;         // 选项条View
@property (nonatomic, copy) UIColor *selectionBarStartColor;    // 选项条渐变色起始颜色
@property (nonatomic, copy) UIColor *selectionBarEndColor;      // 选项条渐变色结束颜色

@property (nonatomic, strong) UIView *shadowView;               // 阴影条View

@end

@implementation HXMenuBarBase

- (instancetype)initWithHeight:(CGFloat)menuBarHeight {
    if (self = [super init]) {
        _menuBarHeight = menuBarHeight;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor whiteColor]];

        // 默认显示阴影条
        _showShadow = YES;

        // MenuBarView
        _menuBarHeight = 45.0f; // 默认高度
        _menuBarView = [[UIScrollView alloc] init];
        _menuBarView.bounces = YES;
        _menuBarView.showsHorizontalScrollIndicator = NO;
        _menuBarView.showsVerticalScrollIndicator = NO;
        [self addSubview:_menuBarView];

        // MenuBarItem
        _menuBarItemUseDynamicWidth = NO;   // 默认菜单按钮不使用动态宽度
        _menuBarItemMinWidth = 80.0f;       // 默认菜单按钮最小宽度(动态宽度关闭时有效，用于指定按钮宽度)
        _menuBarItemExtendWidth = 36.0f;    // 默认菜单按钮延伸宽度(动态宽度开启时有效)
        _menuBarItemView = [[UIView alloc] init];
        [_menuBarView addSubview:_menuBarItemView];

        // SelectionBar
        _selectionBarHeight = 2.5f;
        _selectionBarUseDynamicWidth = YES; // 默认选项条使用动态宽度
        _selectionBarWidth = 40.0f;         // 默认选项条宽度(动态宽度开启时宽度设置无效)
        _selectionBarExtendWidth = 20.0f;   // 默认选项条延伸宽度(动态宽度开启时有效)
        _selectionBarUseRoundedRect = NO;   // 默认选项条不使用圆角
        _selectionBarView = [[UIView alloc] init];
        [_menuBarView addSubview:_selectionBarView];

        _selectionBarColor = [UIColor colorWithRed:(255.0f / 255.0f)
                                             green:(76.0f / 255.0f)
                                              blue:(59.0f / 255.0f)
                                             alpha:1.0f];
        _selectionBarLayer = [CAShapeLayer layer];
        _selectionBarLayer.fillColor = _selectionBarColor.CGColor;
        [_selectionBarView.layer addSublayer:_selectionBarLayer];

        // SelectionBar Action
        UITapGestureRecognizer *itemSelectionGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleItemSelectionAction:)];
        [_selectionBarView addGestureRecognizer:itemSelectionGesture];

        // ShadowView
        if (!_shadowView) {
            _shadowView = [[UIView alloc] init];
            [_shadowView setBackgroundColor:[UIColor colorWithRed:(233.0f / 255.0f)
                                                            green:(236.0f / 255.0f)
                                                             blue:(236.0f / 255.0f)
                                                            alpha:1.0f]];
            [self addSubview:_shadowView];
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self repositionViews];
}

- (void)repositionViews {
    if (CGRectEqualToRect(self.bounds, CGRectZero)) {
        return;
    }

    CGFloat shadowHeight = _showShadow ? 0.5f : 0.0f;
    CGFloat x = 0.0f;
    if (self.distanceToLeft) {
        x = self.distanceToLeft;
    }
    // MenuBarView
    if (@available(iOS 11.0, *)) {
    } else {
        // iOS11.x以下，忽略MenuBarView做为VC首个加入的subview时被自动加入的contentInset.top
        [_menuBarView setContentInset:UIEdgeInsetsZero];
    }
    [_menuBarView setFrame:CGRectMake(x, 0.0f, CGRectGetWidth(self.bounds) - x,
                                      CGRectGetHeight(self.bounds) - shadowHeight)];

    // MenuBarItems
    [self repositionMenuBarItems];

    // SelectionBar
    [self repositionSelectionBar];

    // ShadowView
    if (_showShadow) {
        [_shadowView setFrame:CGRectMake(x, CGRectGetHeight(self.bounds) - shadowHeight,
                                         CGRectGetWidth(self.bounds), shadowHeight)];
    }
}

- (void)repositionMenuBarItems {
    if (CGRectEqualToRect(self.bounds, CGRectZero)) {
        return;
    }

    if (_menuBarItems.count > 0) {
        if (!_menuBarItemUseDynamicWidth) {
            _menuBarItemFixedWidth = MAX(_menuBarItemMinWidth, [UIScreen mainScreen].bounds.size.width / _menuBarItems.count);
            for (int i = 0; i < _menuBarItems.count; i++) {
                [_menuBarItems[i] setFrame:CGRectMake(i * _menuBarItemFixedWidth, 0.0f, _menuBarItemFixedWidth, CGRectGetHeight(_menuBarView.bounds))];
            }
        } else {
            for (int i = 0; i < _menuBarItems.count; i++) {
                CGFloat menuBarItemWidth = _menuBarItems[i].titleLabel.intrinsicContentSize.width + _menuBarItemExtendWidth;
                if (i == 0) {
                    [_menuBarItems[i] setFrame:CGRectMake(0.0f, 0.0f, menuBarItemWidth, CGRectGetHeight(_menuBarView.bounds))];
                } else {
                    [_menuBarItems[i] setFrame:CGRectMake(CGRectGetMaxX(_menuBarItems[i - 1].frame), 0.0f, menuBarItemWidth, CGRectGetHeight(_menuBarView.bounds))];
                }
            }
        }
        [_menuBarView setContentSize:CGSizeMake(CGRectGetMaxX(_menuBarItems.lastObject.frame), CGRectGetHeight(_menuBarView.bounds))];
    } else {
        [_menuBarView setContentSize:CGSizeZero];
    }

    [_menuBarItemView setFrame:CGRectMake(0.0f, 0.0f, _menuBarView.contentSize.width, _menuBarView.contentSize.height)];

    if (_selectedIndex < _menuBarItems.count) {
        // 更新选中状态
        [self resetMenuBarContentOffset];
    }
}

- (void)repositionSelectionBar {
    if (CGRectEqualToRect(self.bounds, CGRectZero)) {
        return;
    }
    
    CGFloat shadowHeight = _showShadow ? 0.5f : 0.0f;
    [_selectionBarView setFrame:CGRectMake(0.0f, 0.0f, _menuBarView.contentSize.width, _menuBarView.contentSize.height)];
    [_selectionBarLayer setFrame:CGRectMake(0.0f, CGRectGetHeight(_selectionBarView.bounds) - shadowHeight - _selectionBarHeight + _selectionBarOffsetY,
                                            CGRectGetWidth(_selectionBarView.bounds),
                                            _selectionBarHeight)];

    if (_selectionBarForegroundLayer) {
        _selectionBarForegroundLayer.cornerRadius = _selectionBarUseRoundedRect ? _selectionBarHeight / 2.0f : 0.0f;
    }

    [self transitionBetween:_selectedIndex and:_selectedIndex percent:0.0];
}

- (void)selectMenuBarItem:(BOOL)selected atIndex:(NSUInteger)index {
    if (index >= _menuBarItems.count) {
        return;
    }
    [_menuBarItems[index] setSelected:selected];
    if (selected) {
        _selectedIndex = index;
        if (!CGSizeEqualToSize(_menuBarView.bounds.size, CGSizeZero)) {
            [self resetMenuBarContentOffset];
        }
    }
}

// 更新选中状态
- (void)resetMenuBarContentOffset {
    if (!_menuBarItemUseDynamicWidth) {
        if ((_menuBarView.contentOffset.x + _menuBarView.bounds.size.width - _menuBarItemFixedWidth) < CGRectGetMinX(_menuBarItems[_selectedIndex].frame)) {
            // 选中的按钮在当前页右侧
            [_menuBarView setContentOffset:CGPointMake(CGRectGetMinX(_menuBarItems[_selectedIndex].frame) - (_menuBarView.bounds.size.width - _menuBarItemFixedWidth), 0.0f) animated:YES];
        } else if (_menuBarView.contentOffset.x > CGRectGetMinX(_menuBarItems[_selectedIndex].frame)) {
            // 选中的按钮在当前页左侧
            [_menuBarView setContentOffset:CGPointMake(CGRectGetMinX(_menuBarItems[_selectedIndex].frame), 0.0f) animated:YES];
        }
    } else {
        if ((_menuBarView.contentOffset.x + _menuBarView.bounds.size.width - CGRectGetWidth(_menuBarItems[_selectedIndex].frame)) < CGRectGetMinX(_menuBarItems[_selectedIndex].frame)) {
            // 选中的按钮在当前页右侧
            if (CGRectGetWidth(_menuBarItems[_selectedIndex].frame) >= _menuBarView.bounds.size.width) {
                // 按钮宽度大于页面宽度
                [_menuBarView setContentOffset:CGPointMake(CGRectGetMinX(_menuBarItems[_selectedIndex].frame), 0.0f) animated:YES];
            } else {
                [_menuBarView setContentOffset:CGPointMake(CGRectGetMinX(_menuBarItems[_selectedIndex].frame) - (_menuBarView.bounds.size.width - CGRectGetWidth(_menuBarItems[_selectedIndex].frame)), 0.0f) animated:YES];
            }
        } else if (_menuBarView.contentOffset.x > CGRectGetMinX(_menuBarItems[_selectedIndex].frame)) {
            // 选中的按钮在当前页左侧
            [_menuBarView setContentOffset:CGPointMake(CGRectGetMinX(_menuBarItems[_selectedIndex].frame), 0.0f) animated:YES];
        }
    }
}

#pragma mark - getter/setter
- (void)setMenuBarItems:(NSArray<HXMenuBarItem *> *)menuBarItems {
    [_menuBarItemView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _menuBarItems = [menuBarItems copy];
    if (_menuBarItems.count > 0) {
        for (int i = 0; i < _menuBarItems.count; i++) {
            [_menuBarItemView addSubview:_menuBarItems[i]];
        }
        [self repositionMenuBarItems];
        [self repositionSelectionBar];
    }
}

- (void)setMenuBarItemMinWidth:(CGFloat)menuBarItemMinWidth {
    if (_menuBarItemMinWidth != menuBarItemMinWidth) {
        _menuBarItemMinWidth = menuBarItemMinWidth;
        [self repositionMenuBarItems];
        [self repositionSelectionBar];
    }
}

- (void)setSelectionBarHeight:(CGFloat)menuBarSelectionBarHeight {
    if (_selectionBarHeight != menuBarSelectionBarHeight) {
        _selectionBarHeight = menuBarSelectionBarHeight;
        [self repositionSelectionBar];
    }
}

- (void)setSelectionBarColor:(UIColor *)selectionBarColor {
    _selectionBarColor = selectionBarColor;
    if (_selectionBarLayer) {
        _selectionBarLayer.fillColor = selectionBarColor.CGColor;
    }
}

- (void)setSelectionBarStartColor:(UIColor*)startColor endColor:(UIColor*)endColor {
    if (CGColorEqualToColor(startColor.CGColor, endColor.CGColor)) {
        _selectionBarLayer.fillColor = startColor.CGColor;
        _selectionBarUseGradientColor = NO;
    } else {
        if (!_selectionBarForegroundLayer) {
            _selectionBarForegroundLayer = [CAGradientLayer layer];
            _selectionBarForegroundLayer.frame = CGRectZero;
            [_selectionBarForegroundLayer setStartPoint:CGPointMake(0.0f, 0.5f)];
            [_selectionBarForegroundLayer setEndPoint:CGPointMake(1.0f, 0.5f)];
            _selectionBarForegroundLayer.cornerRadius = _selectionBarUseRoundedRect ? _selectionBarHeight / 2.0f : 0.0f;
            [_selectionBarLayer addSublayer:_selectionBarForegroundLayer];
        }
        [_selectionBarForegroundLayer setColors:@[(id)startColor.CGColor,
                                                  (id)endColor.CGColor]];
        _selectionBarUseGradientColor = YES;
    }
}

- (void)setSelectionBarOffsetY:(CGFloat)selectionBarOffsetY {
    if (_selectionBarOffsetY != selectionBarOffsetY) {
        _selectionBarOffsetY = selectionBarOffsetY;
        [self repositionSelectionBar];
    }
}

- (void)setSelectionBarUseRoundedRect:(BOOL)selectionBarUseRoundedRect {
    if (_selectionBarUseRoundedRect != selectionBarUseRoundedRect) {
        _selectionBarUseRoundedRect = selectionBarUseRoundedRect;
        [self repositionSelectionBar];
    }
}

- (void)setShowShadow:(BOOL)showShadow {
    if (_showShadow != showShadow) {
        _showShadow = showShadow;
        if (!_shadowView) {
            _shadowView = [[UIView alloc] init];
            [_shadowView setBackgroundColor:[UIColor colorWithRed:(233.0f / 255.0f)
                                                            green:(236.0f / 255.0f)
                                                             blue:(236.0f / 255.0f)
                                                            alpha:1.0f]];
            [self addSubview:_shadowView];
        }
        [self repositionViews];
    }
}

#pragma mark - Action
- (void)handleItemSelectionAction:(UITapGestureRecognizer *)recognizer {
    CGPoint touchPoint = [recognizer locationInView:_selectionBarView];
    NSUInteger touchIndex = 0;
    if (!_menuBarItemUseDynamicWidth) {
        touchIndex = touchPoint.x / _menuBarItemFixedWidth;
    } else {
        for (int i = 0; i < _menuBarItems.count; i++) {
            if (CGRectGetMinX(_menuBarItems[i].frame) <= touchPoint.x && touchPoint.x <= CGRectGetMaxX(_menuBarItems[i].frame)) {
                touchIndex = i;
                break;
            }
        }
    }
    if (_delegate && [_delegate respondsToSelector:@selector(menuBar:didSelectItemAtIndex:fromIndex:)]) {
        [_delegate menuBar:self didSelectItemAtIndex:touchIndex fromIndex:_selectedIndex];
        _selectedIndex = touchIndex;
    }
}

#pragma mark - transition
- (void)transitionBetween:(NSUInteger)leftIndex and:(NSUInteger)rightIndex percent:(double)percent {
    // 动画
    if (leftIndex == rightIndex) {
        // 滑动至页面边界
        if (![_menuBarItems[leftIndex] isSelected]) {
            for (int i = 0; i < _menuBarItems.count; i++) {
                if (i == leftIndex) {
                    [self selectMenuBarItem:YES atIndex:i];
                } else {
                    [self selectMenuBarItem:NO atIndex:i];
                }
            }
        }
    } else if (percent <= 0.5) {
        // 前半程滑动中
        if (![_menuBarItems[leftIndex] isSelected]) {
            for (int i = 0; i < _menuBarItems.count; i++) {
                if (i == leftIndex) {
                    [self selectMenuBarItem:YES atIndex:i];
                } else {
                    [self selectMenuBarItem:NO atIndex:i];
                }
            }
        }
    } else if (percent <= 1.0) {
        // 后半程滑动中
        if (![_menuBarItems[rightIndex] isSelected]) {
            for (int i = 0; i < _menuBarItems.count; i++) {
                if (i == rightIndex) {
                    [self selectMenuBarItem:YES atIndex:i];
                } else {
                    [self selectMenuBarItem:NO atIndex:i];
                }
            }
        }
    }
}

@end
