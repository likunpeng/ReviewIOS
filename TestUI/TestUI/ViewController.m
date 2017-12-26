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
@property (nonatomic, strong) UIButton *btn;
@end
CGFloat distance = 10;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createView];
}

- (void)createView {
    _btn = [[UIButton alloc] init];
    _btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:_btn];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(30);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
    [_btn setTitle:@"right move" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _btn02 = [[UIButton alloc] init];
    _btn02.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_btn02];
    [_btn02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_btn).offset(10);
        make.top.equalTo(_btn).offset(30);
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
        make.right.equalTo(_btn).offset(distance);
    }];
}

@end
