//
//  WelcomeViewController.m
//  runLoop
//
//  Created by lkp on 2019/5/23.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_WHITE;
    [self createUI];
}

- (void)createUI {
    UIImageView *welcomeImgView = [[UIImageView alloc] init];
    welcomeImgView.image = [UIImage imageNamed:@"welcome_hello"];
    [self.view addSubview:welcomeImgView];
    [welcomeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view).offset(S(12.0f));
        make.centerY.equalTo(self.view).offset(-S(46.0f));
    }];

    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureCallBack)];
    [self.view addGestureRecognizer:recognizer];
}

- (void)gestureCallBack {
    [self dismissViewControllerAnimated:YES completion:nil];
    if (self.callBack) {
        self.callBack();
    }
}

@end
