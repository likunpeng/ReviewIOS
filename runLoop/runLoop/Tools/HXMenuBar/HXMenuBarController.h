//
//  HXMenuBarController.h
//  HXFoundation
//
//  Created by Ye Yang on 2018/3/9.
//  Copyright © 2018年 HuaXia Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXMenuBarBase.h"
#import "HXMenuBarSlide.h"

@interface HXMenuBarController : UIViewController <HXMenuBarDelegate>

@property (nonatomic, copy) NSArray<UIViewController*> *viewControllers;    // 内容子页面
@property (nonatomic, assign) NSUInteger selectedIndex;                     // 当前选中页面索引
@property (nonatomic, readonly) HXMenuBarBase *menuBar;                     // 菜单栏视图

- (instancetype)initWithMenuBarHeight:(CGFloat)height style:(HXMenuBarStyle)style;
- (instancetype)initWithMenuBar:(HXMenuBarBase*)menuBar;

@end

@interface UIViewController (HXMenuBarController)

@property (nonatomic, weak) HXMenuBarController *menuBarController; // VC所属的HXMenuBarController
@property (nonatomic, strong) HXMenuBarItem *menuBarItem;           // VC所对应的HXMenuBarItem
- (void)menuContentViewInsetsDidChange:(UIEdgeInsets)insets;        // HXMenuBarController因SafeAreaInsets改变而造成可视范围改变后对VC的回调，用于调整VC内部的布局 (only be called after iOS11.x)

@end

@interface _MenuBarWeakWrapper : NSObject

@property (nonatomic, weak) HXMenuBarController *_menuBarController;

@end
