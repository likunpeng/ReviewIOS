//
//  TestLoginViewController.m
//  runLoop
//
//  Created by lkp on 2019/6/19.
//  Copyright © 2019 CFS. All rights reserved.
//

#import "TestLoginViewController.h"
#import "AccountManager.h"
#import "ViewController.h"

@interface TestLoginViewController ()

@end

@implementation TestLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_RED;
    // Do any additional setup after loading the view.
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 100.0f, 200.0f, 300.0f)];
    btn.backgroundColor = COLOR_BLUE;
    [btn setTitle:@"Login" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark click method
- (void)loginAction:(UIButton *)sender {
    NSLog(@"login click !!!");
    [AccountManager saveToken:@"1223"];
//    ViewController *vc = [[ViewController alloc] init];
//    [self dismissViewControllerAnimated:NO completion:^{
//        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
//        [UIApplication sharedApplication].keyWindow.rootViewController = nc;
//    }];
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
