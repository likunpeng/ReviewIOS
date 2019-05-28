//
//  HomrProductMenuBarItem.m
//  runLoop
//
//  Created by lkp on 2019/5/28.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "HomrProductMenuBarItem.h"

@implementation HomrProductMenuBarItem

- (instancetype)initWithSeperator:(BOOL)showSeperator {
    if (self = [super init]) {
        self.titleFont = fontAuto(14.0f);
        self.titleColor = COLOR_DARKGRAY;
        self.titleSelectedColor = COLOR_RED;
        self.titleBackgroundColor = COLOR_WHITE;
        self.badgeColor = COLOR_RED;

        if (showSeperator) {
            UIImageView *seperator = [[UIImageView alloc] init];
            seperator.backgroundColor = COLOR_LINE;
            [self addSubview:seperator];
            [seperator mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self).offset(S(25.0f));
                make.left.equalTo(self);
                make.bottom.equalTo(self).offset(S(-25.0f));
                make.width.mas_equalTo(S(30.0f));
            }];
        }
    }
    return self;
}

@end
