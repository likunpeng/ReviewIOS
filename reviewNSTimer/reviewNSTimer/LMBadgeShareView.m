//
//  LMBadgeShareView.m
//  limiVideo
//
//  Created by 李坤鹏 on 2021/2/3.
//  Copyright © 2021 LIMI Technology. All rights reserved.
//

#import "LMBadgeShareView.h"

@interface LMBadgeShareView()

@property (nonatomic, strong) UIImageView *bgImageView;
@end

static int topDistance = 64;
@implementation LMBadgeShareView

- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0.0, 64.0, 375, 603.5);
        self.backgroundColor = [UIColor clearColor];
        [self initBG];
        [self createUIWithData:data];
    }
    return self;
}

- (void)initBG {
    _bgImageView  = [[UIImageView alloc] initWithFrame:self.bounds];
    _bgImageView.image = [UIImage imageNamed:@"fenxiang"];
    [self addSubview:_bgImageView];
}


- (NSInteger)getReturnBack {
    return  0;
}

//- (NSTimeInterval)getReturnBack {
//    return  0.0;
//}
/**
 直接使用frame布局 快速构建UI
 */
- (void)createUIWithData:(NSDictionary *)data {
    if (data.count == 1) { // 一张徽章图片
        UIImageView *badgeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(125, 174 - topDistance, 277 / 2, 277 / 2)];
        badgeImageView.image = [UIImage imageNamed:@"one"];
        [self addSubview:badgeImageView];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(125, 322.5 - topDistance, 277 / 2, 45);
        label.numberOfLines = 0;
        label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
        label.textColor = UIColor.blackColor;
        label.text = @"狸米小学员";
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
    } else if (data.count == 2) { //两张徽章图片
        [self createTwoImg];
    } else if (data.count == 3 ) { // 三张徽章图片
        [self createThreeImg];
    } else if (data.count > 3) { // 大于三张徽章图片
        [self createMoreImgWithCount:data.count];
    }
    
    UIView *commonTextAreaView = [[UIView alloc] initWithFrame:CGRectMake(38, 380 - 64, 299.5, 108.5)];
    [self addSubview:commonTextAreaView];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 15.0, 300, 30)];
    nameLabel.numberOfLines = 0;
    nameLabel.text = @"亲爱的宝贝：";
    nameLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
    nameLabel.textColor = UIColor.blackColor;
    [commonTextAreaView addSubview:nameLabel];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 40, 300, 70)];
    contentLabel.numberOfLines = 0;
    contentLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    contentLabel.textColor = UIColor.blackColor;
    contentLabel.text = @"恭喜你！本学期，你已经在“狸米课堂”累计学习3次。聪明出于勤奋，天才在于积累，为你出色的表现点赞！";
    [commonTextAreaView addSubview:contentLabel];

    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(375 - 135, 1207/2 - 80, 100, 20)];
    timeLabel.numberOfLines = 0;
    timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    timeLabel.textColor = UIColor.blackColor;
    timeLabel.text = @"2021年1月03日";
    [self addSubview:timeLabel];
}

- (void)createTwoImg {
    int firstX = 48;
    int firstY = 185.5;
    int imgWidth = 120;
    int imgHeight = 120;
    int hDistance = 44;// 水平间隔
    int vDistance = 0;// 垂直间隔
    for (int i = 0; i < 2; i++) {
        int x = firstX + i * imgWidth + hDistance * i;
        int y = firstY - topDistance + (vDistance + imgHeight) * (i / 3); // 大于三换行
        UIImageView *badgeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, imgWidth, imgHeight)];
        badgeImageView.image = [UIImage imageNamed:@"one"];
        [self addSubview:badgeImageView];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(x, y + 7 + imgHeight, imgWidth, 30);
        label.numberOfLines = 0;
        label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
        label.textColor = UIColor.blackColor;
        label.text = @"狸米小学员";
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
}

- (void)createThreeImg {
    int firstX = 39.5;
    int firstY = 219.5;
    int imgWidth = 75;
    int imgHeight = 75;
    int hDistance = 39;// 水平间隔
    int vDistance = 0;// 垂直间隔
    for (int i = 0; i < 3; i++) {
        int x = firstX + i * imgWidth + hDistance * i;
        int y = firstY - topDistance + (vDistance + imgHeight) * ((i - 1) / 3); // 大于三换行
        UIImageView *badgeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, imgWidth, imgHeight)];
        badgeImageView.image = [UIImage imageNamed:@"one"];
        [self addSubview:badgeImageView];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(x, y + 5 + imgHeight, imgWidth, 30);
        label.numberOfLines = 0;
        label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        label.textColor = UIColor.blackColor;
        label.text = @"狸米小学员";
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
}

- (void)createMoreImgWithCount:(NSInteger)count {
    int firstX = 39.5;
    int firstY = 157;
    int imgWidth = 75;
    int imgHeight = 75;
    int hDistance = 39;// 水平间隔
    int vDistance = 40;// 垂直间隔
    for (int i = 0; i < count; i++) {
        int x = firstX + (imgWidth + hDistance) * (i % 3);
        int y = firstY - topDistance + (vDistance + imgHeight) * (i / 3); // 大于三换行
        UIImageView *badgeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, imgWidth, imgHeight)];
        badgeImageView.image = [UIImage imageNamed:@"one"];
        [self addSubview:badgeImageView];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(x, y + 5 + imgHeight, imgWidth, 30);
        label.numberOfLines = 0;
        label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
        label.textColor = UIColor.blackColor;
        label.text = @"狸米小学员";
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
}






@end
