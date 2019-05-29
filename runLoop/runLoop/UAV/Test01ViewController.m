//
//  Test01ViewController.m
//  runLoop
//
//  Created by lkp on 2019/5/27.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "Test01ViewController.h"
#import "UIImage+Image.h"

@interface Test01ViewController ()<UITextFieldDelegate>

@end

@implementation Test01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self create04];

}

- (void)create04 {
    self.view.backgroundColor = HEXRGB(0xEED077);
    UILabel *label = [[UILabel alloc] init];
    label.font = fontBoldAuto(24);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"YOUR REQUEST HAS\n\nBEEN CACNELLED";
    label.textColor = COLOR_WHITE;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(S(177.0f));
        make.left.equalTo(self.view).offset(S(102.0f));
    }];

    UILabel *label02 = [[UILabel alloc] init];
    label02.font = fontBoldAuto(14);
    label02.numberOfLines = 0;
    label02.textAlignment = NSTextAlignmentCenter;
    label02.text = @"Arrival Time\n 14:33 AM";
    label02.textColor = COLOR_WHITE;
    [self.view addSubview:label02];
    [label02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(S(117.0f));
        make.centerX.equalTo(label);
    }];

    UILabel *label03 = [[UILabel alloc] init];
    label03.font = fontBoldAuto(14);
    label03.numberOfLines = 0;
    label03.textAlignment = NSTextAlignmentCenter;
    label03.text = @"Live Stream Durantion\n00:12:22";
    label03.textColor = COLOR_WHITE;
    [self.view addSubview:label03];
    [label03 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label02.mas_bottom).offset(S(20.0f));
        make.centerX.equalTo(label);
    }];

    UIButton *confirmBtn = [[UIButton alloc] init];
    [confirmBtn setBackgroundImage:[UIImage imageWithColor:HEXRGB(0xFBF5E4)] forState:UIControlStateNormal];
    [confirmBtn setTitle:@"ALARM HISTORY" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:COLOR_BLACK forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = fontAuto(13.0f);
    [self.view addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(label);
        make.bottom.equalTo(self.view).offset(-S(24.0f));
        make.width.mas_equalTo(S(268.0f));
        make.height.mas_equalTo(S(33.0f));
    }];
    [confirmBtn addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)createUI03 {
    //TODO
    self.view.backgroundColor = HEXRGB(0xEED077);
    UILabel *label = [[UILabel alloc] init];
    label.font = fontBoldAuto(24);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"PAYMENT";
    label.textColor = COLOR_WHITE;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(S(72.0f));
        make.left.equalTo(self.view).offset(S(103.0f));
    }];

    UIImageView *welcomeImgView = [[UIImageView alloc] init];
    welcomeImgView.image = [UIImage imageNamed:@"payment"];
    [self.view addSubview:welcomeImgView];
    [welcomeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(S(76.0f));
        make.left.equalTo(label).offset(S(2.0f));;
    }];

    UILabel *label02 = [[UILabel alloc] init];
    label02.font = fontBoldAuto(13);
    label02.numberOfLines = 0;
    label02.textAlignment = NSTextAlignmentCenter;
    label02.text = @"Name on Card";
    label02.textColor = COLOR_WHITE;
    [self.view addSubview:label02];
    [label02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(welcomeImgView.mas_bottom).offset(S(44.0f));
        make.left.equalTo(label).offset(S(6.0f));
    }];

    UITextField *textField = [[UITextField alloc] init];
    textField.font = fontAuto(16);
    textField.backgroundColor = HEXRGB(0x708490);
    textField.delegate = self;
    [self.view addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label02.mas_bottom).offset(S(74.0f));
        make.left.equalTo(label);
        make.width.mas_equalTo(S(216.0f));
        make.height.mas_equalTo(S(26.0f));
    }];

    UILabel *label03 = [[UILabel alloc] init];
    label03.font = fontBoldAuto(13);
    label03.numberOfLines = 0;
    label03.textAlignment = NSTextAlignmentCenter;
    label03.text = @"Name on Card";
    label03.textColor = COLOR_WHITE;
    [self.view addSubview:label03];
    [label03 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textField.mas_bottom).offset(S(11.0f));
        make.left.equalTo(label).offset(S(6.0f));
    }];

    UITextField *textField02 = [[UITextField alloc] init];
    textField02.font = fontAuto(16);
    textField02.backgroundColor = HEXRGB(0x708490);
    textField02.delegate = self;
    [self.view addSubview:textField02];
    [textField02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label03.mas_bottom).offset(S(74.0f));
        make.left.equalTo(label);
        make.width.mas_equalTo(S(216.0f));
        make.height.mas_equalTo(S(26.0f));
    }];

}

- (void)createUI02 {
    self.view.backgroundColor = HEXRGB(0xA5D8D1);
    UIImageView *welcomeImgView = [[UIImageView alloc] init];
    welcomeImgView.image = [UIImage imageNamed:@"yes"];
    [self.view addSubview:welcomeImgView];
    [welcomeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(S(189.0f));
        make.left.equalTo(self.view).offset(S(129.0f));;
        make.width.mas_equalTo(S(182.0f));
        make.height.mas_equalTo(S(158.0f));
    }];

    UILabel *label = [[UILabel alloc] init];
    label.font = fontBoldAuto(24);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"YOU’RE\nREADY TO GO!";
    label.textColor = COLOR_WHITE;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(welcomeImgView.mas_bottom).offset(S(85.0f));
        make.centerX.equalTo(welcomeImgView);
    }];

}

- (void)createUI {
    self.view.backgroundColor = HEXRGB(0xEED077);
    UIImageView *welcomeImgView = [[UIImageView alloc] init];
    welcomeImgView.image = [UIImage imageNamed:@"big-cross"];
    [self.view addSubview:welcomeImgView];
    [welcomeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(S(183.0f));
        make.left.equalTo(self.view).offset(S(136.0f));;
        make.width.height.mas_equalTo(S(150.0f));
    }];
    //不在服务区
    NSString *str = @"WE’RE SORRY WE\nDON’T COVER\nYOUR AREA YET!";
    NSString *str02 = @"We’re working on\nexpanding our services\nand hope to be with you soon";
    CGFloat size = 14.0f;

    UILabel *label = [[UILabel alloc] init];
    label.font = fontBoldAuto(22);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"SORRY!\nYOU’VE FORGOTTEN\nSOMETHING";
    label.textColor = COLOR_WHITE;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(welcomeImgView.mas_bottom).offset(S(33.0f));
        make.centerX.equalTo(welcomeImgView);
    }];

    UILabel *label01 = [[UILabel alloc] init];
    label01.font = fontBoldAuto(18);
    label01.numberOfLines = 0;
    label01.textAlignment = NSTextAlignmentCenter;
    label01.text = @"Please, agree\nto Terms&Conditions";
    label01.textColor = COLOR_WHITE;
    [self.view addSubview:label01];
    [label01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(S(35.0f));
        make.centerX.equalTo(label);
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
