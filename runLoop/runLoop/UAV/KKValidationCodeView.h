//
//  KKValidationCodeView.h
//  runLoop
//
//  Created by lkp on 2019/5/23.
//  Copyright © 2019 CFS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^KKCodeDidChangeBlock)(NSString *codeString);

@interface KKValidationCodeView : UIView

- (instancetype)initWithFrame:(CGRect)frame andLabelCount:(NSInteger)labelCount andLabelDistance:(CGFloat)labelDistance;
/// 回调的 block , 获取输入的数字
@property (nonatomic, copy) KKCodeDidChangeBlock codeBlock;
/// 默认颜色 不设置的话是黑色
@property (nonatomic, strong) UIColor *defaultColor;
/// 改变后的颜色 不设置的话是红色
@property (nonatomic, strong) UIColor *changedColor;

@end

@interface KKTextField : UITextField

@end

NS_ASSUME_NONNULL_END
