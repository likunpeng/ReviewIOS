//
//  Test03ViewController.m
//  runLoop
//
//  Created by lkp on 2019/5/27.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "Test03ViewController.h"
#import "UIImage+Image.h"

@interface Test03ViewController ()<UITextFieldDelegate>

@end

@implementation Test03ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HEXRGB(0x275062);
    // Do any additional setup after loading the view.
    [self createUI];
}

- (void)createUI {
    UILabel *label = [[UILabel alloc] init];
    label.font = fontBoldAuto(20);
    label.numberOfLines = 0;
    label.text = @"REPORT AN ISSUE";
    label.textColor = COLOR_WHITE;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(S(69.0f));
        make.left.equalTo(self.view).offset(S(83.0f));
    }];

    UILabel *label01 = [[UILabel alloc] init];
    label01.font = fontBoldAuto(13);
    label01.numberOfLines = 0;
    label01.text = @"SUBJECT";
    label01.textColor = COLOR_WHITE;
    [self.view addSubview:label01];
    [label01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(S(53.0f));
        make.left.equalTo(label);
    }];

    UITextField *textField = [[UITextField alloc] init];
    textField.font = fontAuto(16);
    textField.backgroundColor = HEXRGB(0x708490);
    textField.delegate = self;
    [self.view addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label01.mas_bottom).offset(S(17.0f));
        make.left.equalTo(label);
        make.width.mas_equalTo(S(251.0f));
        make.height.mas_equalTo(S(39.0f));
    }];

    UILabel *label02 = [[UILabel alloc] init];
    label02.font = fontBoldAuto(13);
    label02.numberOfLines = 0;
    label02.text = @"MESSAGE";
    label02.textColor = COLOR_WHITE;
    [self.view addSubview:label02];
    [label02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textField.mas_bottom).offset(S(30.0f));
        make.left.equalTo(label);
    }];

    UITextField *textField02 = [[UITextField alloc] init];
    textField02.font = fontAuto(16);
    textField02.backgroundColor = HEXRGB(0x708490);
    textField02.delegate = self;
    [self.view addSubview:textField02];
    [textField02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label02.mas_bottom).offset(S(17.0f));
        make.left.equalTo(label);
        make.width.mas_equalTo(S(251.0f));
        make.height.mas_equalTo(S(181.0f));
    }];

    UIButton *confirmBtn = [[UIButton alloc] init];
    [confirmBtn setBackgroundImage:[UIImage imageWithColor:HEXRGB(0xFBF5E4)] forState:UIControlStateNormal];
    [confirmBtn setTitle:@"CONFIRM" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:HEXRGB(0xEEC856) forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = fontAuto(13.0f);
    [self.view addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-S(48.0f));
        make.width.mas_equalTo(S(268.0f));
        make.height.mas_equalTo(S(33.0f));
    }];
    [confirmBtn addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)confirmAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
