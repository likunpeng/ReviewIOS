//
//  HXMenuBarView.h
//  HXFoundation
//
//  Created by Ye Yang on 2018/3/23.
//  Copyright © 2018年 HuaXia Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXMenuBarBase.h"
#import "HXMenuBarSlide.h"
@protocol HXMenuBarViewDelegate;

@interface HXMenuBarView : UIView <HXMenuBarDelegate>

@property (nonatomic, weak) id<HXMenuBarViewDelegate> delegate;
@property (nonatomic, copy) NSArray<UIView*> *contentViews; // 内容子页面
@property (nonatomic, assign) NSUInteger selectedIndex;     // 当前选中页面索引
@property (nonatomic, readonly) HXMenuBarBase *menuBar;     // 菜单栏视图

- (instancetype)initWithMenuBarHeight:(CGFloat)height style:(HXMenuBarStyle)style;
- (instancetype)initWithMenuBar:(HXMenuBarBase*)menuBar;

- (void)show;

@end

@interface UIView (HXMenuBarView)

@property (nonatomic, strong) HXMenuBarItem *menuBarItem;   // View所对应的HXMenuBarItem

@end

@protocol HXMenuBarViewDelegate <NSObject>

@required
- (void)menuBarView:(HXMenuBarView*)menuBarView didSelectItemAtIndex:(NSUInteger)selectedIndex;

@end
