//
//  TestSmsCodeViewController.m
//  runLoop
//
//  Created by lkp on 2019/5/23.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "TestSmsCodeViewController.h"
#import "KKValidationCodeView.h"

@interface TestSmsCodeViewController ()

@end

@implementation TestSmsCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self createUI];
}

- (void)createUI {
    KKValidationCodeView *view = [[KKValidationCodeView alloc] initWithFrame:CGRectMake(80, 100, 300, 45) andLabelCount:4 andLabelDistance:10];
    [self.view addSubview:view];
    //    view.changedColor = [UIColor yellowColor];
    view.codeBlock = ^(NSString *codeString) {
        NSLog(@"验证码:%@", codeString);
    };
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
