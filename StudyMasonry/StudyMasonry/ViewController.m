//
//  ViewController.m
//  StudyMasonry
//
//  Created by 李坤鹏 on 2017/8/13.
//  Copyright © 2017年 李坤鹏. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //防止block中的循环引用
    __weak typeof(self) weakSelf = self;
    //初始化view并设置背景
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    //使用mas_makeConstraints添加约束
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        //添加大小约束
        make.size.mas_equalTo(CGSizeMake(100, 100));
        //添加居中约束
        make.center.equalTo(weakSelf.view);
    }];
    
    //黑色的view 无论在什么尺寸的设备上（包括横竖屏切换），黑色view的左、上边距、大小都不变  灰色view的右边距不变
    UIView *blackView = [UIView new];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    
    //给黑色的view添加约束
//    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(100, 100));
//        make.left.and.top.mas_equalTo(20);
//    }];
    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.mas_equalTo(20);
        make.right.mas_equalTo(-20);
    }];
    
    
    UIView *grayView = [UIView new];
    grayView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:grayView];
    
//    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.and.top.equalTo(blackView);
//        make.right.mas_equalTo(-20);
//    }];
    
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.and.right.mas_equalTo(-20);
        make.height.equalTo(blackView);
        make.top.equalTo(blackView.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.view.mas_centerX).offset(0);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
