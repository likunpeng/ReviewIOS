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
    /*
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
    }];*/
    
    //http://www.cocoachina.com/ios/20141219/10702.html
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(weakSelf.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
//    UIView *s1 = [UIView new];
//    s1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:s1];
//    [s1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
    
//    UIView *s2 = [UIView new];
//    s2.backgroundColor = [UIColor redColor];
//    [self.view addSubview:s2];
//    
//    UIView *s3 = [UIView new];
//    s3.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:s3];
//    int padding = 10;
//    [s2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(sv.mas_centerY);
//        make.left.equalTo(sv.mas_left).offset(padding);
//        make.right.equalTo(s3.mas_left).offset(-padding);
//        make.width.equalTo(s3.mas_width);
//        make.height.mas_equalTo(@150);
//    }];
//    
//    [s3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(sv.mas_centerY);
//        make.left.equalTo(s2.mas_right).offset(padding);
//        make.right.equalTo(sv.mas_right).offset(-padding);
//        make.width.equalTo(s3.mas_width);
//        make.height.mas_equalTo(@150);
//    }];
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [sv addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(5,5,5,5));
    }];
    
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    int count = 10;
    UIView *lastView = nil;
    for ( int i = 1 ; i <= count ; ++i )
    {
        UIView *subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            
            if ( lastView )
            {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        
        lastView = subv;
    }
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
