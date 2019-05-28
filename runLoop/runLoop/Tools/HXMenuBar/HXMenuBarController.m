//
//  HXMenuBarController.m
//  HXFoundation
//
//  Created by Ye Yang on 2018/3/9.
//  Copyright © 2018年 HuaXia Mobile. All rights reserved.
//

#import "HXMenuBarController.h"
#import <objc/runtime.h>

@interface HXMenuBarController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollableContentView;  // 内容页滚动视图
@property (nonatomic, assign) CGFloat pageWidth;                    // 内容页宽度
@property (nonatomic, assign) CGFloat lastScrollContentOffsetX;     // 内容页滑动起始X坐标
@property (nonatomic, assign) BOOL hostingTransition;               // 转页动画已托管，不需要scrollViewDidScroll触发

@property (nonatomic) dispatch_source_t timer;
@property (nonatomic) dispatch_once_t instanceOnceToken;

@end

@implementation HXMenuBarController

@synthesize menuBar = _menuBar;

- (instancetype)initWithMenuBarHeight:(CGFloat)height style:(HXMenuBarStyle)style {
    if (self = [super init]) {
        if (style == HXMenuBarStyleBounceSlide) {
            // 弹性滑动菜单栏
            _menuBar = [[HXMenuBarSlide alloc] initWithHeight:height];
            _menuBar.delegate = self;
        } else if (style == HXMenuBarStyleSlide) {
            // 线性滑动菜单栏
            _menuBar = [[HXMenuBarSlide alloc] initWithHeight:height];
            ((HXMenuBarSlide*)_menuBar).bounces = NO;
            _menuBar.delegate = self;
        } else {
            // 默认使用弹性滑动菜单栏
            _menuBar = [[HXMenuBarSlide alloc] initWithHeight:height];
            _menuBar.delegate = self;
        }
        _pageWidth = [UIScreen mainScreen].bounds.size.width;
        _viewControllers = [NSArray array];
        _selectedIndex = 0;
    }
    return self;
}

- (instancetype)initWithMenuBar:(HXMenuBarBase*)menuBar {
    if (self = [super init]) {
        if (menuBar) {
            _menuBar = menuBar;
            _menuBar.delegate = self;
        } else {
            // 默认使用弹性滑动菜单栏
            _menuBar = [[HXMenuBarSlide alloc] init];
            _menuBar.delegate = self;
        }
        _pageWidth = [UIScreen mainScreen].bounds.size.width;
        _viewControllers = [NSArray array];
        _selectedIndex = 0;
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        if (!_menuBar) {
            // 默认使用弹性滑动菜单栏
            _menuBar = [[HXMenuBarSlide alloc] init];
            _menuBar.delegate = self;
        }
        _pageWidth = [UIScreen mainScreen].bounds.size.width;
        _viewControllers = [NSArray array];
        _selectedIndex = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;   // 若存在NavigationController，在其下面开始布局
    [self addMenuBarView];                          // 添加菜单栏
    [self addContentView];                          // 添加内容栏
    [self showContent];                             // 添加内容
    [self setSelectedIndex:_selectedIndex];         // 设置初始选中状态
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    // 只有首次执行需要调整布局
    dispatch_once(&_instanceOnceToken, ^{
        // 如果在@selector(viewWillAppear:)中对NavigationController进行显示或隐藏设置，
        // 在iOS11以上，因为self.view.safeAreaInsets.top的变化，上边距发生改变；
        // 在iOS11以下，如果statusBar处于显示状态，需要增加上边距；
        // 所以在@selector(viewDidAppear:)中重设MenuBar及ContentView的frame，并通知ChildVC。
        [self repositionMenuBarView];
        [self repositionContentView];

        // 将ContentView改变后的尺寸通知各VC
        [_viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull vc, NSUInteger idx, BOOL * _Nonnull stop) {
            if (@available(iOS 11.0, *)) {
                if (self.view.safeAreaInsets.top > 0) {
                    if (_scrollableContentView && [vc respondsToSelector:@selector(menuContentViewInsetsDidChange:)]) {
                        [vc menuContentViewInsetsDidChange:UIEdgeInsetsMake(self.view.safeAreaInsets.top, 0.0f, 0.0f, 0.0f)];
                    }
                }
            } else {
                if (!self.navigationController || [self.navigationController isNavigationBarHidden]) {
                    if (!self.prefersStatusBarHidden) {
                        if (_scrollableContentView && [vc respondsToSelector:@selector(menuContentViewInsetsDidChange:)]) {
                            [vc menuContentViewInsetsDidChange:UIEdgeInsetsMake([UIApplication sharedApplication].statusBarFrame.size.height, 0.0f, 0.0f, 0.0f)];
                        }
                    }
                }
            }
        }];
    });
}

- (void)dealloc {
    [self invalidateTimer];
}

- (void)addMenuBarView {
    // 菜单栏
    [self repositionMenuBarView];
    [self.view addSubview:_menuBar];
}

- (void)repositionMenuBarView {
    // 菜单栏
    if (_menuBar) {
        if (@available(iOS 11.0, *)) {
            [_menuBar setFrame:CGRectMake(0.0f, self.view.safeAreaInsets.top, _pageWidth, _menuBar.menuBarHeight)];
        } else {
            CGFloat topInset = 0.0f;
            if (self.view.window && (!self.navigationController || [self.navigationController isNavigationBarHidden])) {
                if (!self.prefersStatusBarHidden) {
                    topInset = [UIApplication sharedApplication].statusBarFrame.size.height;
                }
            }
            [_menuBar setFrame:CGRectMake(0.0f, topInset, _pageWidth, _menuBar.menuBarHeight)];
        }
    }
}

- (void)addContentView {
    // 内容栏
    _scrollableContentView = [[UIScrollView alloc] init];
    [self repositionContentView];
    _scrollableContentView.delegate = self;
    _scrollableContentView.bounces = NO;
    _scrollableContentView.pagingEnabled = YES;
    _scrollableContentView.showsHorizontalScrollIndicator = NO;
    _scrollableContentView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollableContentView];
}

- (void)repositionContentView {
    // 内容栏
    if (_scrollableContentView) {
        CGFloat scrollableContentViewHeight = [UIScreen mainScreen].bounds.size.height - _menuBar.menuBarHeight;
        if (self.navigationController && ![self.navigationController isNavigationBarHidden]) {
            scrollableContentViewHeight = scrollableContentViewHeight - ([UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height);
        } else {
            if (@available(iOS 11.0, *)) {
                scrollableContentViewHeight = scrollableContentViewHeight - self.view.safeAreaInsets.top;
            } else {
                if (!self.prefersStatusBarHidden) {
                    scrollableContentViewHeight = scrollableContentViewHeight - [UIApplication sharedApplication].statusBarFrame.size.height;
                }
            }
        }
        if (!self.hidesBottomBarWhenPushed && self.tabBarController) {
            scrollableContentViewHeight = scrollableContentViewHeight - self.tabBarController.tabBar.bounds.size.height;
        }
        if (@available(iOS 11.0, *)) {
            [_scrollableContentView setFrame:CGRectMake(0.0f, self.view.safeAreaInsets.top + _menuBar.menuBarHeight, _pageWidth, scrollableContentViewHeight)];
        } else {
            CGFloat topInset = 0.0f;
            if (self.view.window && (!self.navigationController || [self.navigationController isNavigationBarHidden])) {
                if (!self.prefersStatusBarHidden) {
                    topInset = [UIApplication sharedApplication].statusBarFrame.size.height;
                }
            }
            [_scrollableContentView setFrame:CGRectMake(0.0f, topInset + _menuBar.menuBarHeight, _pageWidth, scrollableContentViewHeight)];
        }
    }
}

//- (void)viewSafeAreaInsetsDidChange {
//    [super viewSafeAreaInsetsDidChange];
//
//    [self repositionMenuBarView];
//    [self repositionContentView];
//
//    // 将ContentView改变后的尺寸通知各VC
//    [_viewControllers enumerateObjectsUsingBlock:^(UIViewController * _Nonnull vc, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (@available(iOS 11.0, *)) {
//            if (_scrollableContentView && [vc respondsToSelector:@selector(menuContentViewInsetsDidChange:)]) {
//                [vc menuContentViewInsetsDidChange:UIEdgeInsetsMake(self.view.safeAreaInsets.top, 0.0f, 0.0f, 0.0f)];
//            }
//        }
//    }];
//}

- (void)showContent {
    NSMutableArray *menuBarItems = [NSMutableArray array];
    for (int i = 0; i < _viewControllers.count; i++) {
        [_viewControllers[i].view setFrame:CGRectMake(i * _pageWidth, 0.0f, _pageWidth, CGRectGetHeight(_scrollableContentView.bounds))];
        [_scrollableContentView addSubview:_viewControllers[i].view];
        [menuBarItems addObject:_viewControllers[i].menuBarItem];
    }
    [_scrollableContentView setContentSize:CGSizeMake(_viewControllers.count * _pageWidth, 0.0f)];   // 禁止垂直方向滚动
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
- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers {
    _viewControllers = viewControllers;
    for (int i = 0; i < _viewControllers.count; i++) {
        [self addChildViewController:_viewControllers[i]];
        [_viewControllers[i] setMenuBarController:self];
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    _selectedIndex = selectedIndex;
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
        _selectedIndex = selectedIndex;
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

#pragma mark - UIViewController (HXMenuBarController)
@implementation UIViewController (HXMenuBarController)

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

- (HXMenuBarController*)menuBarController {
    return [self _menuBarWeakWrapper]._menuBarController;
}

- (void)setMenuBarController:(HXMenuBarController *)menuBarController {
    [self _menuBarWeakWrapper]._menuBarController = menuBarController;
}

- (_MenuBarWeakWrapper*)_menuBarWeakWrapper {
    _MenuBarWeakWrapper *menuBarWeakWrapper = objc_getAssociatedObject(self, _cmd);
    if (!menuBarWeakWrapper) {
        menuBarWeakWrapper = [[_MenuBarWeakWrapper alloc] init];
        [self _setMenuBarWeakWrapper:menuBarWeakWrapper];
    }
    return menuBarWeakWrapper;
}

- (void)_setMenuBarWeakWrapper:(_MenuBarWeakWrapper*)menuBarWeakWrapper {
    objc_setAssociatedObject(self, @selector(_menuBarWeakWrapper), menuBarWeakWrapper, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)menuContentViewInsetsDidChange:(UIEdgeInsets)insets {
    // do nothing in here.
}

@end

@implementation _MenuBarWeakWrapper

@end
