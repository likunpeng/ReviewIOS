//
//  TestCustomMenuBar.m
//  runLoop
//
//  Created by lkp on 2019/5/28.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "TestCustomMenuBar.h"

@implementation TestCustomMenuBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.menuBarItemUseDynamicWidth = YES;
        self.selectionBarOffsetY = S(-8.0f);
        self.selectionBarUseRoundedRect = YES;
        self.selectionBarExtendWidth = 1.0f;
        [self setSelectionBarStartColor:COLOR_GRADIENT_START endColor:COLOR_GRADIENT_END];
        self.showShadow = NO;

        UIView *seperator = [[UIView alloc] init];
        seperator.backgroundColor = COLOR_LINE;
        [self addSubview:seperator];
        [seperator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(S(20.0f));
            make.right.equalTo(self).offset(S(-20.0f));
            make.bottom.equalTo(self);
            make.height.equalTo(@0.5f);
        }];
    }
    return self;
}

@end
