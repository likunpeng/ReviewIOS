//
//  HXMenuBarItem.h
//  HXFoundation
//
//  Created by Ye Yang on 2018/3/13.
//  Copyright © 2018年 HuaXia Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXMenuBarItem : UIView

@property (nonatomic, strong) UIImageView *imageView;           // 图标ImageView
@property (nonatomic, strong) UIImage *image;                   // 一般状态图片
@property (nonatomic, strong) UIImage *imageSelected;           // 选中状态图片

@property (nonatomic, strong) UILabel *titleLabel;              // 标题Label
@property (nonatomic, copy) NSString *title;                    // 标题内容
@property (nonatomic, strong) UIFont *titleFont;                // 标题字体
@property (nonatomic, strong) UIColor *titleColor;              // 标题颜色
@property (nonatomic, strong) UIColor *titleSelectedColor;      // 标题选中时颜色
@property (nonatomic, strong) UIColor *titleBackgroundColor;    // 标题背景色
@property (nonatomic, assign, getter=isSelected) BOOL selected; // 是否选中

@property (nonatomic, copy) NSString *badgeValue;               // 红点内容
@property (nonatomic, strong) UIColor *badgeColor;              // 红点颜色

@end
