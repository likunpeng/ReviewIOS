//
//  Test01ViewController.m
//  runLoop
//
//  Created by lkp on 2019/5/27.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "Test01ViewController.h"
#import "UIImage+Image.h"

@interface Test01ViewController ()

@end

@implementation Test01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = HEXRGB(0xEED077);
    [self createUI];
}

- (void)createUI {
    
    UIImageView *welcomeImgView = [[UIImageView alloc] init];
    welcomeImgView.image = [UIImage imageNamed:@"big-cross"];
    [self.view addSubview:welcomeImgView];
    [welcomeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view).offset(S(10.0f));
        make.centerY.equalTo(self.view).offset(-S(183.0f));
        make.width.height.mas_equalTo(S(150.0f));
    }];

    UILabel *label = [[UILabel alloc] init];
    label.font = fontBoldAuto(24);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"OOOH...\nWE’RE SORRY\nTO HEAR YOU’RE\nLEAVING";
    label.textColor = COLOR_WHITE;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(welcomeImgView.mas_bottom).offset(S(33.0f));
        make.centerX.equalTo(welcomeImgView);
    }];

    UIButton *exitBtn = [[UIButton alloc] init];
    [exitBtn setBackgroundImage:[UIImage imageWithColor:HEXRGB(0xFBF5E4)] forState:UIControlStateNormal];
    [exitBtn setTitle:@"CANCEL" forState:UIControlStateNormal];
    [exitBtn setTitleColor:HEXRGB(0xEEC856) forState:UIControlStateNormal];
    exitBtn.titleLabel.font = fontAuto(13.0f);
    [self.view addSubview:exitBtn];
    [exitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-S(71.0f));
        make.width.mas_equalTo(S(243.0f));
        make.height.mas_equalTo(S(26.0f));
    }];
    [exitBtn addTarget:self action:@selector(exitAction:) forControlEvents:UIControlEventTouchUpInside];

    UIButton *confirmBtn = [[UIButton alloc] init];
    [confirmBtn setBackgroundImage:[UIImage imageWithColor:HEXRGB(0xFBF5E4)] forState:UIControlStateNormal];
    [confirmBtn setTitle:@"CONFIRM" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:HEXRGB(0xEEC856) forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = fontAuto(13.0f);
    [self.view addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(exitBtn.mas_top).offset(-S(7.0f));
        make.width.mas_equalTo(S(243.0f));
        make.height.mas_equalTo(S(26.0f));
    }];
    [confirmBtn addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)exitAction:(UIButton *)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)confirmAction:(UIButton *)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}
    

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
