//
//  HXMenuBarItem.m
//  HXFoundation
//
//  Created by Ye Yang on 2018/3/13.
//  Copyright © 2018年 HuaXia Mobile. All rights reserved.
//

#import "HXMenuBarItem.h"

@interface HXMenuBarItem ()

@property (nonatomic, strong) UILabel *badgeLabel;

@end

@implementation HXMenuBarItem

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _titleFont = [UIFont systemFontOfSize:16.0f];
        _titleColor = [UIColor colorWithRed:(51.0f/255.0f) green:(51.0f/255.0f) blue:(51.0f/255.0f) alpha:1.0f];
        _titleSelectedColor = [UIColor colorWithRed:(255.0f/255.0f) green:(76.0f/255.0f) blue:(59.0f/255.0f) alpha:1.0f];
        _titleBackgroundColor = [UIColor whiteColor];

        _badgeColor = [UIColor redColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self resizeImageTitle];
}

#pragma mark - image
- (void)setImage:(UIImage *)image {
    _image = image;
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.center = self.center;
        [self addSubview:_imageView];
    }
    if (![self isSelected]) {
        _imageView.image = _image;
    }
    [self resizeImageTitle];
}

- (void)setImageSelected:(UIImage *)imageSelected {
    _imageSelected = imageSelected;
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.center = self.center;
        [self addSubview:_imageView];
    }
    if ([self isSelected]) {
        _imageView.image = _image;
    }
    [self resizeImageTitle];
}

#pragma mark - title
- (void)setTitle:(NSString *)title {
    _title = title;
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = _titleFont;
        _titleLabel.textColor = _titleColor;
        _titleLabel.backgroundColor = _titleBackgroundColor;
        _titleLabel.center = self.center;
        [self addSubview:_titleLabel];
    }
    _titleLabel.text = _title;
    [self resizeImageTitle];
}

- (void)setTitleFont:(UIFont *)font {
    _titleFont = font;
    if (_titleFont) {
        _titleLabel.font = font;
        [self resizeImageTitle];
    }
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    if (_titleLabel && ![self isSelected]) {
        _titleLabel.textColor = _titleColor;
    }
}

- (void)setTitleSelectedColor:(UIColor *)selectedTitleColor {
    _titleSelectedColor = selectedTitleColor;
    if (_titleLabel && [self isSelected]) {
        _titleLabel.textColor = _titleSelectedColor;
    }
}

- (void)setTitleBackgroundColor:(UIColor *)titleBackgroundColor {
    _titleBackgroundColor = titleBackgroundColor;
    if (_titleBackgroundColor) {
        _titleLabel.backgroundColor = titleBackgroundColor;
    }
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    if (_imageView) {
        if (_selected) {
            if (_imageSelected) {
                _imageView.image = _imageSelected;
            } else if (_image) {
                _imageView.image = _image;
            } else {
                _imageView.image = nil;
            }
        } else {
            if (_image) {
                _imageView.image = _image;
            } else {
                _imageView.image = nil;
            }
        }
    }
    if (_titleLabel) {
        if (_selected) {
            _titleLabel.textColor = _titleSelectedColor;
        } else {
            _titleLabel.textColor = _titleColor;
        }
    }
    [self resizeImageTitle];
}

- (void)resizeImageTitle {
    BOOL imageExist = (_imageView && _imageView.image);
    BOOL titleExist = (_titleLabel && _titleLabel.text && ![_titleLabel.text isEqualToString:@""]);

    if (imageExist && titleExist) {
        CGSize imageSize = _imageView.image.size;
        CGSize titleSize = [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];

        CGFloat imageTitleWidth = imageSize.width + 2.0f + titleSize.width;

        [_imageView setFrame:CGRectMake(CGRectGetMidX(self.bounds) - imageTitleWidth / 2.0f,
                                        CGRectGetMidY(self.bounds) - imageSize.height / 2.0f,
                                        imageSize.width, imageSize.height)];

        [_titleLabel setFrame:CGRectMake(CGRectGetMaxX(_imageView.frame) + 2.0f,
                                         CGRectGetMidY(self.bounds) - titleSize.height / 2.0f,
                                         titleSize.width, titleSize.height)];
    } else {
        if (_imageView) {
//            _imageView.center = self.center;
            CGSize imageSize = _imageView.image.size;
            [_imageView setFrame:CGRectMake(CGRectGetMidX(self.bounds) - imageSize.width / 2.0f,
                                            CGRectGetMidY(self.bounds) - imageSize.height / 2.0f,
                                            imageSize.width, imageSize.height)];
        }

        if (_titleLabel) {
//            _titleLabel.center = self.center;
            CGSize titleSize = [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
            [_titleLabel setFrame:CGRectMake(CGRectGetMidX(self.bounds) - titleSize.width / 2.0f,
                                             CGRectGetMidY(self.bounds) - titleSize.height / 2.0f,
                                             titleSize.width, titleSize.height)];
        }
    }

    [self resizeBadge];
}

//- (void)resizeTitle {
//    if (_titleLabel) {
//        CGSize titleSize = [_titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
//        [_titleLabel setFrame:CGRectMake(CGRectGetMidX(self.bounds) - titleSize.width / 2.0f,
//                                         CGRectGetMidY(self.bounds) - titleSize.height / 2.0f,
//                                         titleSize.width, titleSize.height)];
//    }
//    [self resizeBadge];
//}

#pragma mark - badge
- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = badgeValue;
    if (!_badgeValue || [_badgeValue isEqualToString:@""]) {
        if (_badgeLabel) {
            [_badgeLabel removeFromSuperview];
            _badgeLabel = nil;
        }
    } else {
        if (!_badgeLabel) {
            _badgeLabel = [[UILabel alloc] init];
            _badgeLabel.textAlignment = NSTextAlignmentCenter;
            _badgeLabel.font = [UIFont systemFontOfSize:12.0f];
            _badgeLabel.textColor = [UIColor whiteColor];
            _badgeLabel.backgroundColor = _badgeColor;
            _badgeLabel.layer.masksToBounds = YES;
            [self addSubview:_badgeLabel];
        }
        _badgeLabel.text = _badgeValue;
        [self resizeBadge];
    }
}

- (void)setBadgeColor:(UIColor *)badgeColor {
    _badgeColor = badgeColor;
    if (_badgeLabel) {
        _badgeLabel.backgroundColor = badgeColor;
    }
}

- (void)resizeBadge {
    if (_badgeLabel) {
        CGSize badgeSize = [_badgeLabel sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
        CGFloat realBadgeHeight = badgeSize.height + 1.6f;
        CGFloat realBadgeWidth = MAX(badgeSize.width + 6.0f, badgeSize.height + 1.6f);  // 确保Badge最小是个圆形
        [_badgeLabel setFrame:CGRectMake(CGRectGetMaxX(_titleLabel.frame) - 4.0f,
                                         CGRectGetMinY(_titleLabel.frame) - badgeSize.height + 4.0f,
                                         realBadgeWidth, realBadgeHeight)];
        _badgeLabel.layer.cornerRadius = realBadgeHeight / 2.0f;
    }
}

@end
