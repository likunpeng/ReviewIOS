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

    NSString *imageName = @"business";//home
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:imageName];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(S(80.0f));
        make.left.equalTo(self.view).offset(S(175.0f));
    }];

    UITextField *textField = [[UITextField alloc] init];
    textField.font = fontAuto(16);
    textField.backgroundColor = HEXRGB(0xD6DCDF);
    textField.delegate = self;
    [self.view addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(S(74.0f));
        make.centerX.equalTo(imageView);
        make.width.mas_equalTo(S(156.0f));
        make.height.mas_equalTo(S(33.0f));
    }];

    UILabel *label = [[UILabel alloc] init];
    label.font = fontBoldAuto(14);
    label.numberOfLines = 0;
    label.text = @"Post Code";
    label.textColor = COLOR_WHITE;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(textField);
        make.bottom.equalTo(textField.mas_top).offset(S(-11.0f));
    }];

    UILabel *label02 = [[UILabel alloc] init];
    label02.font = fontBoldAuto(10);
    label02.numberOfLines = 0;
    label02.textAlignment = NSTextAlignmentRight;
    label02.text = @" FIND ADDRESS ∧";
    label02.textColor = HEXRGB(0xEEC856);
    [self.view addSubview:label02];
    [label02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textField.mas_bottom).offset(S(7.0f));
        make.right.equalTo(textField);
    }];

//    UIButton *confirmBtn = [[UIButton alloc] init];
//    [confirmBtn setBackgroundImage:[UIImage imageWithColor:HEXRGB(0xFBF5E4)] forState:UIControlStateNormal];
//    [confirmBtn setTitle:@"CONFIRM" forState:UIControlStateNormal];
//    [confirmBtn setTitleColor:HEXRGB(0xEEC856) forState:UIControlStateNormal];
//    confirmBtn.titleLabel.font = fontAuto(13.0f);
//    [self.view addSubview:confirmBtn];
//    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        make.bottom.equalTo(self.view).offset(-S(48.0f));
//        make.width.mas_equalTo(S(268.0f));
//        make.height.mas_equalTo(S(33.0f));
//    }];
//    [confirmBtn addTarget:self action:@selector(confirmAction:) forControlEvents:UIControlEventTouchUpInside];
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
