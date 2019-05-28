//
//  HXMenuBarView.m
//  HXFoundation
//
//  Created by Ye Yang on 2018/3/23.
//  Copyright © 2018年 HuaXia Mobile. All rights reserved.
//

#import "HXMenuBarView.h"
#import <objc/runtime.h>

@interface HXMenuBarView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollableContentView;  // 内容页滚动视图
@property (nonatomic, assign) CGFloat pageWidth;                    // 内容页宽度
@property (nonatomic, assign) CGFloat lastScrollContentOffsetX;     // 内容页滑动起始X坐标
@property (nonatomic, assign) BOOL hostingTransition;               // 转页动画已托管，不需要scrollViewDidScroll触发

@property (nonatomic) dispatch_source_t timer;

@end

@implementation HXMenuBarView

@synthesize menuBar = _menuBar;

- (instancetype)initWithMenuBarHeight:(CGFloat)height style:(HXMenuBarStyle)style {
    if (self = [super init]) {
        if (style == HXMenuBarStyleBounceSlide) {
            // 弹性滑动菜单栏
            _menuBar = [[HXMenuBarSlide alloc] initWithHeight:height];
        } else if (style == HXMenuBarStyleSlide) {
            // 线性滑动菜单栏
            _menuBar = [[HXMenuBarSlide alloc] initWithHeight:height];
            ((HXMenuBarSlide*)_menuBar).bounces = NO;
        } else {
            // 默认使用弹性滑动菜单栏
            _menuBar = [[HXMenuBarSlide alloc] initWithHeight:height];
        }
        [self addViews];
    }
    return self;
}

- (instancetype)initWithMenuBar:(HXMenuBarBase*)menuBar {
    if (self = [super init]) {
        if (menuBar) {
            _menuBar = menuBar;
        } else {
            // 默认使用弹性滑动菜单栏
            _menuBar = [[HXMenuBarSlide alloc] init];
        }
        [self addViews];
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        if (!_menuBar) {
            // 默认使用弹性滑动菜单栏
            _menuBar = [[HXMenuBarSlide alloc] init];
        }
        [self addViews];
    }
    return self;
}

- (void)addViews {
    _pageWidth = 0.0f;
    _selectedIndex = 0;
    _contentViews = [NSArray array];

    // 菜单栏
    _menuBar.delegate = self;
    [self addSubview:_menuBar];

    // 内容栏
    _scrollableContentView = [[UIScrollView alloc] init];
    _scrollableContentView.delegate = self;
    _scrollableContentView.bounces = NO;
    _scrollableContentView.pagingEnabled = YES;
    _scrollableContentView.showsHorizontalScrollIndicator = NO;
    _scrollableContentView.showsVerticalScrollIndicator = NO;
    [self addSubview:_scrollableContentView];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    _pageWidth = self.bounds.size.width;
    [self repositionViews];
}

- (void)dealloc {
    [self invalidateTimer];
}

- (void)repositionViews {
    // 菜单栏
    [_menuBar setFrame:CGRectMake(0.0f, 0.0f, _pageWidth, _menuBar.menuBarHeight)];

    // 内容栏
    [_scrollableContentView setFrame:CGRectMake(0.0f, _menuBar.menuBarHeight, _pageWidth, CGRectGetHeight(self.bounds) - _menuBar.menuBarHeight)];
    for (int i = 0; i < _contentViews.count; i++) {
        [_contentViews[i] setFrame:CGRectMake(i * _pageWidth, 0.0f, _pageWidth, CGRectGetHeight(_scrollableContentView.bounds))];
    }
    [_scrollableContentView setContentSize:CGSizeMake(_contentViews.count * _pageWidth, 0.0f)];   // 禁止垂直方向滚动
    [_scrollableContentView setContentOffset:CGPointMake(_selectedIndex * _pageWidth, 0.0f)]; // 刷新当前显示页面
}

- (void)show {
    [self setSelectedIndex:_selectedIndex]; // 设置初始选中状态
}

- (void)showContent {
    [_scrollableContentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSMutableArray *menuBarItems = [NSMutableArray array];
    for (int i = 0; i < _contentViews.count; i++) {
        [_contentViews[i] setFrame:CGRectMake(i * _pageWidth, 0.0f, _pageWidth, CGRectGetHeight(_scrollableContentView.bounds))];
        [_scrollableContentView addSubview:_contentViews[i]];
        [menuBarItems addObject:_contentViews[i].menuBarItem];
    }
    [_scrollableContentView setContentSize:CGSizeMake(_contentViews.count * _pageWidth, 0.0f)];   // 禁止垂直方向滚动
    [_menuBar setMenuBarItems:menuBarItems];
}

- (void)scheduleTimerWithInterval:(NSTimeInterval)interval eventHandler:(dispatch_block_t)eventHandler {
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), interval * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        //        dispatch_async(dispatch_get_main_queue(), ^() {
        eventHandler();
        //        });
    });
    dispatch_resume(_timer);
}

- (void)invalidateTimer {
    if (_timer) {
        //        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        //        dispatch_async(queue, ^{
        dispatch_source_cancel(_timer);
        _timer = nil;
        //        });
    }
}

#pragma mark - getter/setter
- (void)setContentViews:(NSArray<UIView *> *)contentViews {
    _contentViews = [contentViews copy];
    [self showContent]; // 添加内容
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if (selectedIndex < _contentViews.count) {
        _selectedIndex = selectedIndex;
    } else {
        _selectedIndex = 0;
    }

    if (_menuBar) {
        [_menuBar transitionBetween:_selectedIndex and:_selectedIndex percent:0.0];
    }

    if (_scrollableContentView) {
        [_scrollableContentView setContentOffset:CGPointMake(_selectedIndex * _pageWidth, 0.0f)];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!_hostingTransition) {
        NSUInteger fromIndex = scrollView.contentOffset.x / _pageWidth;
        NSUInteger toIndex = fromIndex;
        if (scrollView.contentOffset.x == fromIndex * _pageWidth) {
            // 正好滑到页面中间
            if (_selectedIndex != toIndex) {
                _selectedIndex = toIndex;
                if (_delegate && [_delegate respondsToSelector:@selector(menuBarView:didSelectItemAtIndex:)]) {
                    [_delegate menuBarView:self didSelectItemAtIndex:_selectedIndex];
                }
            }
        } else if (scrollView.contentOffset.x > _lastScrollContentOffsetX) {
            // 右滑趋势
            toIndex = fromIndex + 1;
        } else if (scrollView.contentOffset.x < _lastScrollContentOffsetX) {
            // 左滑趋势
            toIndex = fromIndex - 1;
        }

        NSUInteger transitionLeftIndex = scrollView.contentOffset.x / _pageWidth;
        NSUInteger transitionRightIndex = transitionLeftIndex;
        if (scrollView.contentOffset.x != transitionLeftIndex * _pageWidth) {
            transitionRightIndex = transitionLeftIndex + 1;
        }
        CGFloat transitionPercent = (scrollView.contentOffset.x - (transitionLeftIndex * _pageWidth)) / _pageWidth;
        [_menuBar transitionBetween:transitionLeftIndex and:transitionRightIndex percent:transitionPercent];
    }

    _lastScrollContentOffsetX = scrollView.contentOffset.x;
}

#pragma mark - HXMenuBarDelegate
- (void)menuBar:(HXMenuBarBase*)menuBar didSelectItemAtIndex:(NSUInteger)selectedIndex fromIndex:(NSUInteger)fromIndex {
    if (menuBar == _menuBar) {
        if (_selectedIndex != selectedIndex) {
            _selectedIndex = selectedIndex;
            if (_delegate && [_delegate respondsToSelector:@selector(menuBarView:didSelectItemAtIndex:)]) {
                [_delegate menuBarView:self didSelectItemAtIndex:_selectedIndex];
            }
        }
//        [_scrollableContentView setContentOffset:CGPointMake(selectedIndex * _pageWidth, 0.0f)];

        if (fromIndex < selectedIndex) {
            NSTimeInterval interval = 0.01;
            __block NSInteger percent100Times = 0; // 进度百分比的100倍(0 < 进度 < 1)
            _hostingTransition = YES;
            [self scheduleTimerWithInterval:interval eventHandler:^{
                if (percent100Times > 100) {
                    [self invalidateTimer];
                    _hostingTransition = NO;
                    return;
                }
                [_menuBar transitionBetween:fromIndex and:selectedIndex percent:(percent100Times / 100.0)];
                if (selectedIndex - fromIndex <= 1) {
                    [_scrollableContentView setContentOffset:CGPointMake(fromIndex * _pageWidth + (selectedIndex * _pageWidth - fromIndex * _pageWidth) * (percent100Times / 100.0), 0.0f)];
                }
                percent100Times += (interval / 0.2) * 100;   // (间隔0.01 / 总时长0.2) x 100
            }];
            if (selectedIndex - fromIndex > 1) {
                [_scrollableContentView setContentOffset:CGPointMake(selectedIndex * _pageWidth, 0.0f)];
            }
        } else if (fromIndex > selectedIndex) {
            __block NSInteger percent100Times = 100;
            NSTimeInterval interval = 0.01;
            _hostingTransition = YES;
            [self scheduleTimerWithInterval:interval eventHandler:^{
                if (percent100Times < 0) {
                    [self invalidateTimer];
                    _hostingTransition = NO;
                    return;
                }
                [_menuBar transitionBetween:selectedIndex and:fromIndex percent:(percent100Times / 100.0)];
                if (fromIndex - selectedIndex <= 1) {
                    [_scrollableContentView setContentOffset:CGPointMake(selectedIndex * _pageWidth + (fromIndex * _pageWidth - selectedIndex * _pageWidth) * (percent100Times / 100.0), 0.0f)];
                }
                percent100Times -= (interval / 0.2) * 100;  // (间隔0.01 / 总时长0.2) x 100
            }];
            if (fromIndex - selectedIndex > 1) {
                [_scrollableContentView setContentOffset:CGPointMake(selectedIndex * _pageWidth, 0.0f)];
            }
        } else {
            // do nothing~
        }
    }
}

@end

#pragma mark - UIView (HXMenuBarView)
@implementation UIView (HXMenuBarView)

- (HXMenuBarItem*)menuBarItem {
    HXMenuBarItem *menuBarItem = objc_getAssociatedObject(self, _cmd);
    if (!menuBarItem) {
        menuBarItem = [[HXMenuBarItem alloc] init];
    }
    return menuBarItem;
}

- (void)setMenuBarItem:(HXMenuBarItem*)menuBarItem {
    objc_setAssociatedObject(self, @selector(menuBarItem), menuBarItem, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
