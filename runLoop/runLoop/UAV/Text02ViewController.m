//
//  Text02ViewController.m
//  runLoop
//
//  Created by lkp on 2019/5/27.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "Text02ViewController.h"

@interface Text02ViewController ()

@end

@implementation Text02ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = HEXRGB(0x275062);
    [self createUI];
}

- (void)createUI {
    UILabel *label = [[UILabel alloc] init];
    label.font = fontBoldAuto(28);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"HELP";
    label.textColor = COLOR_WHITE;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(S(114.0f));
        make.left.equalTo(self.view).offset(S(77.0f));
    }];

    UILabel *label01 = [[UILabel alloc] init];
    label01.font = fontAuto(17);
    label01.numberOfLines = 0;
    label01.text = @"FAQ";
    label01.textColor = COLOR_WHITE;
    [self.view addSubview:label01];
    [label01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(S(61.0f));
        make.left.equalTo(self.view).offset(S(89.0f));
    }];

    UILabel *label02 = [[UILabel alloc] init];
    label02.font = fontAuto(17);
    label02.numberOfLines = 0;
    label02.text = @"REPORT AN ISSUE";
    label02.textColor = COLOR_WHITE;
    [self.view addSubview:label02];
    [label02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label01.mas_bottom).offset(S(15.0f));
        make.left.equalTo(label01);
    }];

    UILabel *label03 = [[UILabel alloc] init];
    label03.font = fontAuto(17);
    label03.numberOfLines = 0;
    label03.text = @"LEGAL";
    label03.textColor = COLOR_WHITE;
    [self.view addSubview:label03];
    [label03 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label02.mas_bottom).offset(S(15.0f));
        make.left.equalTo(label01);
    }];
    label03.userInteractionEnabled = YES;

    UITapGestureRecognizer *re = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
    [label03 addGestureRecognizer:re];
}

- (void)gestureAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
