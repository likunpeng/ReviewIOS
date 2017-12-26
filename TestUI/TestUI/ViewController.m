//
//  ViewController.m
//  TestUI
//
//  Created by lkp on 2017/12/26.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *btn02;
@end
CGFloat distance = 10;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createView];
}

- (void)createView {
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(30);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
    [btn setTitle:@"right move" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _btn02 = [[UIButton alloc] init];
    _btn02.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_btn02];
    [_btn02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btn).offset(10);
        make.top.equalTo(btn).offset(30);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
    [_btn02 setTitle:@"test" forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark click method

- (void)BtnClick {
    distance += 10;
    [_btn02 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(distance);
    }];
}

@end
